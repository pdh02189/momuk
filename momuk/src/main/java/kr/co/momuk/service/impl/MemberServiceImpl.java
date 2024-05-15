package kr.co.momuk.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.momuk.domain.MemberDTO;
import kr.co.momuk.mapper.MemberMapper;
import kr.co.momuk.service.IMemberService;

@Service
public class MemberServiceImpl implements IMemberService{
	@Autowired
	private MemberMapper memberMapper;
	
	private final PasswordEncoder bcryptPasswordEncoder;
	
	public MemberServiceImpl(SqlSession sqlSession, PasswordEncoder bcryptPasswordEncoder) {
		this.memberMapper = memberMapper;
        this.bcryptPasswordEncoder = bcryptPasswordEncoder;
    }
	
	@Override
    public void register(MemberDTO member) {
		member.setPw(bcryptPasswordEncoder.encode(member.getPw()));
        memberMapper.registerMember(member);
    }
	
	@Override
    public MemberDTO read(String id){
        return memberMapper.getMemberById(id);
    }


}

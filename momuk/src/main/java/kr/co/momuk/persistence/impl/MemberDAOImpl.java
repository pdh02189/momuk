package kr.co.momuk.persistence.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.momuk.domain.MemberDTO;
import kr.co.momuk.persistence.IMemberDAO;

@Repository 	// 인터페이스 구현 시 필수로 작성해야함
public class MemberDAOImpl implements IMemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "kr.co.momuk.memberMapper";
	
	@Override
	public String getTime() {
		
		return sqlSession.selectOne(namespace + ".getTime");
	}

	@Override
	public void insertMember(MemberDTO mDto) {
		sqlSession.insert(namespace + ".insertMember", mDto);
		
	}
	
}

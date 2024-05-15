package kr.co.momuk.mapper;

import kr.co.momuk.domain.MemberDTO;

public interface MemberMapper {
	public void registerMember(MemberDTO member);
	 public MemberDTO getMemberById(String id);
}

package kr.co.momuk.service;

import kr.co.momuk.domain.MemberDTO;

public interface IMemberService {
	public void register(MemberDTO memberDTO);
	public MemberDTO read(String id);
}

package kr.co.momuk.persistence;

import kr.co.momuk.domain.MemberDTO;

public interface IMemberDAO {
	public String getTime();
	public void insertMember(MemberDTO mDto);
}

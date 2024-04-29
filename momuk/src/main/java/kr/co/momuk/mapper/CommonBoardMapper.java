package kr.co.momuk.mapper;

import java.util.List;

import kr.co.momuk.domain.CommonBoardDTO;

public interface CommonBoardMapper {
	
	public void insertCommonBoard(CommonBoardDTO commonBoard);
	public CommonBoardDTO selectCommonBoardByno(int bno);
	public int updateCommonBoard(CommonBoardDTO commonBoard);
	public int deleteCommonBoard(int bno);
	
	public void updateViewCnt(int bno);
	
}

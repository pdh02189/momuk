package kr.co.momuk.service;

import java.util.List;

import kr.co.momuk.domain.CommonBoardDTO;
import kr.co.momuk.domain.Criteria;
import kr.co.momuk.domain.DetailDTO;
import kr.co.momuk.domain.EventBoardDTO;

public interface IEventBoardService {
	public void insertEventBoard(CommonBoardDTO commonBoard, EventBoardDTO event);
	public DetailDTO detailEventBoard(int bno);
	public boolean updateEventBoard(CommonBoardDTO commonBoard, EventBoardDTO event);
	public boolean removeEventBoard(int bno);
	public List<DetailDTO> selectAllEvent(Criteria cri);
	
	public int getTotalCnt(Criteria cri);
}

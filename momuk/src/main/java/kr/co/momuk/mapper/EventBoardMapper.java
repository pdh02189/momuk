package kr.co.momuk.mapper;

import java.util.List;

import kr.co.momuk.domain.Criteria;
import kr.co.momuk.domain.DetailDTO;
import kr.co.momuk.domain.EventBoardDTO;

public interface EventBoardMapper {
	public void insertEvent(EventBoardDTO event);	 
	 public DetailDTO selectEventByBno(int bno);
	 public int updateEvent(EventBoardDTO event);
	 public int deleteEvent(int bno);
	 
	 public List<DetailDTO> selectAllCookingtip(Criteria cri);
	 public int getTotalCnt(Criteria cri);
}

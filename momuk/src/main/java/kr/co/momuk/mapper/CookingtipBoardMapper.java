package kr.co.momuk.mapper;

import java.util.List;

import kr.co.momuk.domain.CookingtipBoardDTO;
import kr.co.momuk.domain.Criteria;
import kr.co.momuk.domain.DetailDTO;

public interface CookingtipBoardMapper {
	
	 public void insertCookingtip(CookingtipBoardDTO cookingTip);	 
	 public DetailDTO selectCookingtipByBno(int bno);
	 public int updateCookingtip(CookingtipBoardDTO cookingTip);
	 public int deleteCookingtip(int bno);
	 
	 public List<DetailDTO> selectAllCookingtip(Criteria cri);
	 public int getTotalCnt(Criteria cri);
	 
}

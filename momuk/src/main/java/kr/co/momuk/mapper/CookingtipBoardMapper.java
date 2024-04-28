package kr.co.momuk.mapper;

import java.util.List;

import kr.co.momuk.domain.CookingtipBoardDTO;

public interface CookingtipBoardMapper {
	
	 public void insertCookingtip(CookingtipBoardDTO cookingTip);	 
	 public CookingtipBoardDTO selectCookingtipById(int bno);
	 public void updateCookingtip(CookingtipBoardDTO cookingTip);
	 public void deleteCookingtip(int bno);
	 
	 public List<CookingtipBoardDTO> selectAllCookingtip();
	 
}

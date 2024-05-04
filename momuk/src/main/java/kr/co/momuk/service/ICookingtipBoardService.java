package kr.co.momuk.service;

import java.util.List;



import kr.co.momuk.domain.CommonBoardDTO;
import kr.co.momuk.domain.CookingtipBoardDTO;
import kr.co.momuk.domain.Criteria;
import kr.co.momuk.domain.DetailDTO;

public interface ICookingtipBoardService {
	public void insertCookingTipBoard(CommonBoardDTO commonBoard, CookingtipBoardDTO cookingtip);
	public DetailDTO detailCookingTipBoard(int bno);
	public boolean updateCookingTipBoard(CommonBoardDTO commonBoard, CookingtipBoardDTO cookingtip);
	public boolean removeCookingTipBoard(int bno);
	public List<DetailDTO> selectAllCookingtip(Criteria cri);
	public int getTotalCnt(Criteria cri);
}

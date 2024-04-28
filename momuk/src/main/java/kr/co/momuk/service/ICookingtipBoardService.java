package kr.co.momuk.service;

import kr.co.momuk.domain.CommonBoardDTO;
import kr.co.momuk.domain.CookingtipBoardDTO;

public interface ICookingtipBoardService {
	public void insertCookingTipBoard(CommonBoardDTO commonBoard, CookingtipBoardDTO cookingtip);
	public void updateCookingTipBoard(CommonBoardDTO commonBoard, CookingtipBoardDTO cookingtip);
}

package kr.co.momuk.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.momuk.domain.CommonBoardDTO;
import kr.co.momuk.domain.CookingtipBoardDTO;
import kr.co.momuk.mapper.CommonBoardMapper;
import kr.co.momuk.mapper.CookingtipBoardMapper;
import kr.co.momuk.service.ICommonBoardService;
import kr.co.momuk.service.ICookingtipBoardService;

@Service
public class CookingtipBoardServiceImpl implements ICookingtipBoardService{
	@Autowired
	private CookingtipBoardMapper cookingtipMapper;
	
	@Autowired
	private CommonBoardMapper commonMapper;

	// 요리꿀팁 등록
	@Transactional
	@Override
	public void insertCookingTipBoard(CommonBoardDTO commonBoard, CookingtipBoardDTO cookingtip) {
		commonBoard.setBoardId(3);
		commonMapper.insertCommonBoard(commonBoard);
		int bno = commonBoard.getBno();
		cookingtip.setBno(bno);
		cookingtipMapper.insertCookingtip(cookingtip);
	}
	
	//요리꿀팁 수정
	@Transactional
	@Override
	public void updateCookingTipBoard(CommonBoardDTO commonBoard, CookingtipBoardDTO cookingtip) {
		commonMapper.updateCommonBoard(commonBoard);
		cookingtipMapper.updateCookingtip(cookingtip);
	}
	
}

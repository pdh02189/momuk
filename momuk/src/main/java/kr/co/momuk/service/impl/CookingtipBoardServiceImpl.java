package kr.co.momuk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.momuk.domain.CommonBoardDTO;
import kr.co.momuk.domain.CookingtipBoardDTO;
import kr.co.momuk.domain.DetailDTO;
import kr.co.momuk.mapper.CommonBoardMapper;
import kr.co.momuk.mapper.CookingtipBoardMapper;
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
	
	// 요리꿀팁 상세
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public DetailDTO detailCookingTipBoard(int bno) {
		commonMapper.updateViewCnt(bno);
		
		return cookingtipMapper.selectCookingtipByBno(bno);
	}
	
	
	//요리꿀팁 수정
	@Transactional
	@Override
	public boolean updateCookingTipBoard(CommonBoardDTO commonBoard, CookingtipBoardDTO cookingtip) {
		boolean cookingResult = commonMapper.updateCommonBoard(commonBoard) == 1;
		boolean commonResult = cookingtipMapper.updateCookingtip(cookingtip) == 1;
		boolean totalResult = cookingResult == commonResult;
		
		return totalResult;
	}
	
	// 요리꿀팁 삭제
	@Transactional
	@Override
	public boolean removeCookingTipBoard(int bno) {
		boolean cookingResult = cookingtipMapper.deleteCookingtip(bno) == 1;
		boolean commonResult = commonMapper.deleteCommonBoard(bno) == 1;
		boolean totalResult = cookingResult == commonResult;
		
		return totalResult;
	}

	// 요리꿀팁 목록 전체 조회
	@Override
	public List<DetailDTO> selectAllCookingtip() {
		return cookingtipMapper.selectAllCookingtip();
	}
	
}

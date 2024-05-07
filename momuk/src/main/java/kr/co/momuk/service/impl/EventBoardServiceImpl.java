package kr.co.momuk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.momuk.domain.CommonBoardDTO;
import kr.co.momuk.domain.Criteria;
import kr.co.momuk.domain.DetailDTO;
import kr.co.momuk.domain.EventBoardDTO;
import kr.co.momuk.mapper.CommonBoardMapper;
import kr.co.momuk.mapper.CookingtipBoardMapper;
import kr.co.momuk.mapper.EventBoardMapper;
import kr.co.momuk.service.IEventBoardService;
import lombok.extern.log4j.Log4j;

@Service
public class EventBoardServiceImpl implements IEventBoardService {
	@Autowired
	private EventBoardMapper eventMapper;
	
	@Autowired
	private CommonBoardMapper commonMapper;
	
	// 이벤트 등록
	@Transactional
	@Override
	public void insertEventBoard(CommonBoardDTO commonBoard, EventBoardDTO event) {
		commonBoard.setBoardId(4);
		commonMapper.insertCommonBoard(commonBoard);
		int bno = commonBoard.getBno();
		event.setBno(bno);
		eventMapper.insertEvent(event);
	}

	// 이벤트 상세
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public DetailDTO detailEventBoard(int bno) {
		commonMapper.updateViewCnt(bno);
		
		return eventMapper.selectEventByBno(bno);
	}

	//이벤트 수정
	@Transactional
	@Override
	public boolean updateEventBoard(CommonBoardDTO commonBoard, EventBoardDTO event) {
		boolean evnetResult = eventMapper.updateEvent(event) == 1;
		boolean commonResult = commonMapper.updateCommonBoard(commonBoard) == 1;
		boolean totalResult = evnetResult == commonResult;
		
		return totalResult;
	}

	// 이벤트 삭제
	@Transactional
	@Override
	public boolean removeEventBoard(int bno) {
		boolean evnetResult = eventMapper.deleteEvent(bno) == 1;
		boolean commonResult = commonMapper.deleteCommonBoard(bno) == 1;
		boolean totalResult = evnetResult == commonResult;
		
		return totalResult;
	}

	// 이벤트 목록 전체 조회
	@Override
	public List<DetailDTO> selectAllEvent(Criteria cri) {
		return eventMapper.selectAllEvent(cri);
	}

	// 게시물 수
	@Override
	public int getTotalCnt(Criteria cri){
	    return eventMapper.getTotalCnt(cri);
	}

}

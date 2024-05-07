package kr.co.momuk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.momuk.domain.Criteria;
import kr.co.momuk.domain.ReplyDTO;
import kr.co.momuk.domain.ReplyPageDTO;
import kr.co.momuk.mapper.CommonBoardMapper;
import kr.co.momuk.mapper.ReplyMapper;
import kr.co.momuk.service.IReplyService;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements IReplyService{
	@Autowired
	private ReplyMapper mapper;
	
	@Autowired
	private CommonBoardMapper commonMapper;

	@Transactional
	@Override
	public int register(ReplyDTO rDto) {
	    log.info("reply register .................." + rDto);

	    try {
	        int result = mapper.insert(rDto); // 댓글 등록
	        commonMapper.plusReplyCnt(rDto.getBno()); // 댓글 수 업데이트
	        return result;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return 0; // 등록 실패
	    }
	}

	@Override
	public ReplyDTO read(int rno) {
		log.info("reply read .................." + rno);
		
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyDTO rDto) {
		log.info("reply modify .................." + rDto);
		
		return mapper.update(rDto);
	}

	@Transactional
	@Override
	public int remove(int rno) {
	    log.info("reply remove .................." + rno);
	    ReplyDTO rDto = mapper.read(rno);

	    try {
	        int result = mapper.delete(rno); // 댓글 삭제
	        commonMapper.minusReplyCnt(rDto.getBno()); // 댓글 수 감소
	        return result;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return 0; // 삭제 실패
	    }
	}

	@Override
	public List<ReplyDTO> getList(Criteria cri, int bno) {
		log.info("getList .................." + bno);
		
		return mapper.getListWithPaging(cri, bno);
	}
	
	@Override
	public ReplyPageDTO getListPage(Criteria cri, int bno) {

	    return new ReplyPageDTO(
	            mapper.getCountByBno(bno),
	            mapper.getListWithPaging(cri, bno));
	}
}

package kr.co.momuk.service;

import java.util.List;

import kr.co.momuk.domain.Criteria;
import kr.co.momuk.domain.ReplyDTO;
import kr.co.momuk.domain.ReplyPageDTO;

public interface IReplyService {

	public int register(ReplyDTO rDto);
	public ReplyDTO read(int rno);
	public int modify(ReplyDTO rDto);
	public int remove(int rno);
	public List<ReplyDTO> getList(Criteria cri, int bno);
	
	public ReplyPageDTO getListPage(Criteria cri, int bno);
	
}

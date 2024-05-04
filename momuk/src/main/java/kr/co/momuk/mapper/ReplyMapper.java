package kr.co.momuk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.momuk.domain.Criteria;
import kr.co.momuk.domain.ReplyDTO;

public interface ReplyMapper {

	public String getTime2();
	public int insert(ReplyDTO replDto);
	public ReplyDTO read(int rno);
	public int update(ReplyDTO replDto);
	public int delete(int rno);
	
	public List<ReplyDTO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") int bno);
	public int getCountByBno(int bno);
}

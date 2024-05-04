package kr.co.momuk;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.momuk.domain.Criteria;
import kr.co.momuk.domain.ReplyDTO;
import kr.co.momuk.mapper.ReplyMapper;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTest {

	@Autowired
	private ReplyMapper mapper;
	
	private int[] bnoArr = {29, 28, 27, 26, 25};
	
//	@Test
//	public void testMapper() {
//		log.info("mapper ===> " + mapper.getTime2());
//	}
//	
//	@Test
//	public void testInsert() {
//	    IntStream.rangeClosed(1, 10).forEach(i -> {
//	        ReplyDTO rDto = new ReplyDTO();
//
//	        rDto.setBno(bnoArr[i%5]);
//	        rDto.setReplytext("댓글 테스트" + i);
//	        rDto.setReplyer("replyer" + i);
//
//	        mapper.insert(rDto);
//	    });
//
//	}
	
//	@Test
//	public void testRead() {
//	    int targetRno = 1;
//
//	    ReplyDTO rDto = mapper.read(targetRno);
//
//	    log.info(rDto);
//	}
	
//	@Test
//	public void testDelete() {
//	    int targetRno = 1;
//
//	    mapper.delete(targetRno);
//	}
	
//	@Test
//	public void testUpdate() {
//	    int targetRno = 2;
//
//	    ReplyDTO rDto = mapper.read(targetRno);
//	    rDto.setReplytext("댓글 수정테스트");
//
//	    int result = mapper.update(rDto);
//
//	    if (result > 0) {
//	        log.info("정상적으로 수정이 되었습니다.");
//	    } else {
//	        log.info("데이터 수정에 실패하였습니다.");
//	    }
//	}
	
	@Test
	public void testList() {
	    Criteria cri = new Criteria();
	    List<ReplyDTO> replies = mapper.getListWithPaging(cri, bnoArr[0]);

	    replies.forEach(reply -> log.info(reply));
	}

}
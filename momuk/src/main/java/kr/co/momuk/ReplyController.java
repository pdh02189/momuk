package kr.co.momuk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.momuk.domain.Criteria;
import kr.co.momuk.domain.ReplyDTO;
import kr.co.momuk.domain.ReplyPageDTO;
import kr.co.momuk.service.IReplyService;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies")
@Log4j
public class ReplyController {

	@Autowired
	private IReplyService service;
	
	// 등록
	@PostMapping(value = "/new",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyDTO rDto) {
		log.info("rDto : " + rDto);
		
		int insertCount = service.register(rDto);
		
		log.info("Reply insert count : " + insertCount);
		
		return insertCount == 1 
							? new ResponseEntity<>("success", HttpStatus.OK) 
							: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//  목록 전체조회
	@GetMapping(value = "/pages/{bno}/{page}",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("bno") int bno) {
	    Criteria cri = new Criteria(page, 10);
	    log.info("get reply list bno : " + bno);
	    log.info("cri : " + cri);
	
	    return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
	}
	
	// 상세
	@GetMapping(value = "/{rno}",
	        produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyDTO> read(@PathVariable("rno") int rno) {
	    log.info("rno : " + rno);

	    return new ResponseEntity<>(service.read(rno), HttpStatus.OK);
	}
	
	// 삭제
	@DeleteMapping(value = "/{rno}",
	        produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") int rno) {
	    log.info("remove rno : " + rno);

	    return service.remove(rno) == 1
	                                ? new ResponseEntity<>("success", HttpStatus.OK)
	                                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 수정
	@RequestMapping(value = "/{rno}",
	        method = {RequestMethod.PUT, RequestMethod.PATCH},
	        consumes = "application/json",
	        produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyDTO rDto, @PathVariable("rno") int rno) {
	    rDto.setRno(rno);

	    log.info("rno : " + rno);
	    log.info("modify : " + rDto);

	    return service.modify(rDto) == 1
	                                ? new ResponseEntity<>("success", HttpStatus.OK)
	                                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}

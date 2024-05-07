package kr.co.momuk;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.momuk.domain.CommonBoardDTO;
import kr.co.momuk.domain.Criteria;
import kr.co.momuk.domain.EventBoardDTO;
import kr.co.momuk.domain.PageDTO;
import kr.co.momuk.service.IEventBoardService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/event")
@Log4j
public class EventController {
	@Autowired
	private IEventBoardService eventService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, false));
	}
	
	// 등록
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void registerGET() throws Exception {
		log.info("write get........................");
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String addEvent(@ModelAttribute("commonBoard") CommonBoardDTO commonBoard,
            					@ModelAttribute("event") EventBoardDTO event,
            					Model model,
            					RedirectAttributes rttr,
            					HttpSession session) throws Exception {
		log.info("write post.....................");
		
		// 세션에서 UUID 값 가져오기
	    String uuid = (String) session.getAttribute("uuid");
	    // 세션에서 UPLOADPATH 값 가져오기
	    String uploadpath = (String) session.getAttribute("uploadpath");
	    // 세션에서 FILENAME 값 가져오기
	    String filename = (String) session.getAttribute("filename");
	    
	    // commonBoard 객체에 UUID 설정
	    commonBoard.setUuid(uuid);
	    // commonBoard 객체에 UPLOADPATH 설정
	    commonBoard.setUploadpath(uploadpath);
	    // commonBoard 객체에 FILENAME 설정
	    commonBoard.setFilename(filename);
	    
	    Date startDate = event.getStartdate();
	    Date endDate = event.getEnddate();

	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String formattedStartDate = sdf.format(startDate);
	    String formattedEndDate = sdf.format(endDate);

	    // 변환된 날짜를 다시 설정합니다.
	    event.setStartdate(sdf.parse(formattedStartDate));
	    event.setEnddate(sdf.parse(formattedEndDate));
		
	    eventService.insertEventBoard(commonBoard, event);
		
        return "redirect:/event/list"; // 리다이렉트 경로로 수정해야 함
	}
	
	// 상세
	@RequestMapping(value={"/detail", "/modify"}, method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		log.info("show detail.....................");
		
		model.addAttribute("event", eventService.detailEventBoard(bno));
	}
	
	// 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String updateEvent(@ModelAttribute("commonBoard") CommonBoardDTO commonBoard,
            					@ModelAttribute("event") EventBoardDTO event,
            					@ModelAttribute("cri") Criteria cri,
            					RedirectAttributes rttr,
            					Model model,
            					HttpSession session) {
		log.info("modify.....................");
		
		// 세션에서 UUID 값 가져오기
	    String uuid = (String) session.getAttribute("uuid");
	    // 세션에서 UPLOADPATH 값 가져오기
	    String uploadpath = (String) session.getAttribute("uploadpath");
	    // 세션에서 FILENAME 값 가져오기
	    String filename = (String) session.getAttribute("filename");
	    
	    // commonBoard 객체에 UUID 설정
	    commonBoard.setUuid(uuid);
	    // commonBoard 객체에 UPLOADPATH 설정
	    commonBoard.setUploadpath(uploadpath);
	    // commonBoard 객체에 FILENAME 설정
	    commonBoard.setFilename(filename);
		eventService.updateEventBoard(commonBoard, event);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
	    rttr.addAttribute("amount", cri.getAmount());
	    
        return "redirect:/event/list"; // 리다이렉트 경로로 수정해야 함
	}
	
	// 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String removeEvent(@RequestParam("bno") int bno,
			@ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		log.info("remove.....................");
		
		eventService.removeEventBoard(bno);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
	    rttr.addAttribute("amount", cri.getAmount());
	    
		return "redirect:/event/list";
	}
	
	// 목록 전체
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void selectAllEvent(Criteria cri, Model model) throws Exception {
		log.info("show all list.....................");
		
		model.addAttribute("list", eventService.selectAllEvent(cri));
		
		int total = eventService.getTotalCnt(cri);
	    log.info("total : " + total);
	    model.addAttribute("total", total); // 총 게시물 수를 모델에 추가

	    model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
}

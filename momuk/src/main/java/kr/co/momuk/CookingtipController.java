package kr.co.momuk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.momuk.domain.CommonBoardDTO;
import kr.co.momuk.domain.CookingtipBoardDTO;
import kr.co.momuk.service.ICookingtipBoardService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cookingtip")
@Log4j
public class CookingtipController {
	@Autowired
	private ICookingtipBoardService cookingtipService;
	
	// 등록
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void registerGET() throws Exception {
		log.info("write get........................");
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String addCookingtip(@ModelAttribute("commonBoard") CommonBoardDTO commonBoard,
            					@ModelAttribute("cookingTip") CookingtipBoardDTO cookingTip,
            					Model model) {
		log.info("write post.....................");
		
		cookingtipService.insertCookingTipBoard(commonBoard, cookingTip);
		
        return "redirect:/cookingtip/list"; // 리다이렉트 경로로 수정해야 함
	}
	
	// 상세
	@RequestMapping(value="/detail", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, Model model) throws Exception {
		log.info("show detail.....................");
		
		model.addAttribute("cookingtip", cookingtipService.detailCookingTipBoard(bno));
	}
	
	// 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String updateCookingtip(@ModelAttribute("commonBoard") CommonBoardDTO commonBoard,
            					@ModelAttribute("cookingTip") CookingtipBoardDTO cookingTip,
            					Model model) {
		log.info("modify.....................");
		
		cookingtipService.updateCookingTipBoard(commonBoard, cookingTip);
		
        return "redirect:/cookingtip/list"; // 리다이렉트 경로로 수정해야 함
	}
	
	// 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String removeCookingtip(@RequestParam("bno") int bno) {
		log.info("remove.....................");
		
		cookingtipService.removeCookingTipBoard(bno);
		
		return "redirect:/cookingtip/list";
	}
	
	// 목록 전체
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void selectAllCookingtip(Model model) throws Exception {
		log.info("show all list.....................");
		
		model.addAttribute("list", cookingtipService.selectAllCookingtip());
	}
}

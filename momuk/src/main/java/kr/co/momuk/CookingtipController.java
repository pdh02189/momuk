package kr.co.momuk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@PostMapping("/register")
	public String addCookingtip(@ModelAttribute("commonBoard") CommonBoardDTO commonBoard,
            					@ModelAttribute("cookingTip") CookingtipBoardDTO cookingTip,
            					Model model) {
		cookingtipService.insertCookingTipBoard(commonBoard, cookingTip);
		
        return "redirect:/cookingtip/list"; // 리다이렉트 경로로 수정해야 함
	}
	
	@PostMapping("/modify")
	public String updateCookingtip(@ModelAttribute("commonBoard") CommonBoardDTO commonBoard,
            					@ModelAttribute("cookingTip") CookingtipBoardDTO cookingTip,
            					Model model) {
		cookingtipService.updateCookingTipBoard(commonBoard, cookingTip);
		
        return "redirect:/cookingtip/list"; // 리다이렉트 경로로 수정해야 함
	}
}

package kr.co.momuk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.momuk.domain.MemberDTO;
import kr.co.momuk.service.IMemberService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/")
@Log4j
public class MemberController {
	@Autowired
	private IMemberService memberService;

	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void getLoginView() {}
	
    
	// 회원가입
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public void joinGET() throws Exception {
		log.info("join get........................");
	}
	
    @PostMapping("join")
    public String register(@ModelAttribute("member") MemberDTO member, 
    										Model model,
    										RedirectAttributes rttr) throws Exception {
    	log.info("join post........................");
    	
//    	// 생년월일이 null이 아닌 경우에만 포맷 변환을 수행합니다.
//        Date birth = member.getBirth();
//        if (birth != null) {
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//            String formattedBirth = sdf.format(birth);
//
//            // 변환된 날짜를 다시 설정합니다.
//            member.setBirth(sdf.parse(formattedBirth));
//        } else {
//            // 생년월일이 비어있을 경우에는 null로 설정합니다.
//            member.setBirth(null);
//        }
//	    
        // 회원가입 로직 처리
        memberService.register(member);
        
        // 회원가입 성공 시 로그 출력
        log.info("회원가입 요청: " + member.toString());
        
        // 회원가입 성공 시 홈페이지로 이동
        return "redirect:/";
    }
}

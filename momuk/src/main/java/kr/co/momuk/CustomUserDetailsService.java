package kr.co.momuk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.co.momuk.domain.MemberDTO;
import kr.co.momuk.service.IMemberService;
import lombok.Setter;

public class CustomUserDetailsService implements UserDetailsService{

	@Setter(onMethod_ = @Autowired)
    private IMemberService memberService;
    
    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
        try {
            MemberDTO member = memberService.read(id);
            return member == null ? null : new CustomUser(member);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } 
    }
    
}

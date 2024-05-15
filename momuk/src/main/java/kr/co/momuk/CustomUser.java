package kr.co.momuk;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.co.momuk.domain.MemberDTO;
import lombok.Getter;

public class CustomUser extends User {
	 @Getter
	    private MemberDTO member;
	    
	    public CustomUser(MemberDTO member) {
	        super(
	            member.getId(), 
	            member.getPw(), 
	            new ArrayList<GrantedAuthority>(
	                Arrays.asList(
	                    new SimpleGrantedAuthority(member.getGradeKey())
	                )
	            )
	        );
	        this.member = member;
	    }
}

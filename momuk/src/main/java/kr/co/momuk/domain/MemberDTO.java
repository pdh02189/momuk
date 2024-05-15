package kr.co.momuk.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import lombok.Data;

@Data
public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private String zipcode;
	private String streetAddress;
	private String detailAddress;
	private String tel;
	private String gender;
//    private Date birth;
    private Date regdate;
    private String gradeKey;
    
} 

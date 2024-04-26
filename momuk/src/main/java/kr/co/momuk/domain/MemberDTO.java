package kr.co.momuk.domain;

import java.util.Date;

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
    private Date birth;
    private Date regdate;
    private String gradeKey;
} 

package kr.co.momuk.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {
	private int rno;
	private int bno;
    private String replytext;
    private String replyer;
    private Date regdate;
}
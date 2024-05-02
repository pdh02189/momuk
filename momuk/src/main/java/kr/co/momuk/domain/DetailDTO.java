package kr.co.momuk.domain;

import java.util.Date;

import lombok.Data;

@Data
public class DetailDTO {
	private int bno;
	private String title;
	private String writer;
	private Date regdate;
	private int viewcnt;
	private int replycnt;
    private String category;
    private String content;
}

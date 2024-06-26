package kr.co.momuk.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommonBoardDTO {
	private int bno;
	private int boardId;
	private String title;
	private String writer;
	private Date regdate;
	private int viewcnt;
	private int replycnt;
    private String uuid;
    private String uploadpath;
    private String filename;
    
    
}

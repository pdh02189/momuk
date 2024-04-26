package kr.co.momuk.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EventBoardDTO {
	private int bno;
	private int boardId;
    private Date startdate;
    private Date enddate;
    private String content;
}

package kr.co.momuk.domain;

import lombok.Data;

@Data
public class CookingtipBoardDTO {
	private int bno;
	private int boardId;
    private String category;
    private String content;
}

package kr.co.momuk.domain;

import lombok.Data;

@Data
public class RecipeBoardDTO {
	private int bno;
    private String infotext;
    private String category;
    private String serving;
    private String difficulty;
    private String cookingtime;
    private int heartcnt;
}

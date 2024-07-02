package kr.co.momuk.domain;

import lombok.Data;

@Data
public class RecipeStepDTO {
	private int stepId;
	private int stepOrder;
	private int bno;
    private String instruction;
    private String uuid;
    private String uploadpath;
    private String filename;
}

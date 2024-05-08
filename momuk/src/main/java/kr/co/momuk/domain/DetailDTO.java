package kr.co.momuk.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class DetailDTO {
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
    
    private String category;
    
    private Date startdate;
    private Date enddate;
    
    private String content;
    
    private String infotext;
    private String serving;
    private String difficulty;
    private String cookingtime;
    private int heartcnt;
    
    private List<IngredientDTO> ingredientList;
    private List<RecipeStepDTO> recipestepList;
}

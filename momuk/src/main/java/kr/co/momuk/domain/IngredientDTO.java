package kr.co.momuk.domain;

import lombok.Data;

@Data
public class IngredientDTO {
	private int ingredientId;
	private int ingredientOrder;
	private int bno;
    private String name;
    private String measurement;
}

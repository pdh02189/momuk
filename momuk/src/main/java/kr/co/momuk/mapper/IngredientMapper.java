package kr.co.momuk.mapper;

import java.util.List;

import kr.co.momuk.domain.DetailDTO;
import kr.co.momuk.domain.IngredientDTO;

public interface IngredientMapper {
	public void insertIngredient(IngredientDTO ingredient);	 
	public List<IngredientDTO> selectIngredientByBno(int bno);
	public int updateIngredient(IngredientDTO ingredient);
	public int deleteIngredient(int bno);
}

package kr.co.momuk.mapper;

import java.util.List;

import kr.co.momuk.domain.DetailDTO;
import kr.co.momuk.domain.RecipeStepDTO;

public interface RecipeStepMapper {
	public void insertRecipeStep(RecipeStepDTO recipestep);	 
	public List<RecipeStepDTO> selectRecipeStepByBno(int bno);
	public int updateRecipeStep(RecipeStepDTO recipestep);
	public int deleteRecipeStep(int bno);
}

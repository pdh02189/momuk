package kr.co.momuk.service;

import java.util.List;

import kr.co.momuk.domain.CommonBoardDTO;
import kr.co.momuk.domain.Criteria;
import kr.co.momuk.domain.DetailDTO;
import kr.co.momuk.domain.IngredientDTO;
import kr.co.momuk.domain.RecipeBoardDTO;
import kr.co.momuk.domain.RecipeStepDTO;

public interface IRecipeBoardService {
	public void insertRecipeBoard(CommonBoardDTO commonBoard, RecipeBoardDTO recipe, List<IngredientDTO> ingredients, List<RecipeStepDTO> recipesteps);
	public DetailDTO detailRecipeBoard(int bno);
	public boolean updateRecipeBoard(CommonBoardDTO commonBoard, RecipeBoardDTO recipe, List<IngredientDTO> ingredients, List<RecipeStepDTO> recipesteps);
	public boolean removeRecipeBoard(int bno);
	public List<DetailDTO> selectAllRecipe(Criteria cri);
	
	public int getTotalCnt(Criteria cri);
}

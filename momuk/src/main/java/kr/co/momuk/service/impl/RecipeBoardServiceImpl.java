package kr.co.momuk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.momuk.domain.CommonBoardDTO;
import kr.co.momuk.domain.Criteria;
import kr.co.momuk.domain.DetailDTO;
import kr.co.momuk.domain.IngredientDTO;
import kr.co.momuk.domain.RecipeBoardDTO;
import kr.co.momuk.domain.RecipeStepDTO;
import kr.co.momuk.mapper.CommonBoardMapper;
import kr.co.momuk.mapper.IngredientMapper;
import kr.co.momuk.mapper.RecipeBoardMapper;
import kr.co.momuk.mapper.RecipeStepMapper;
import kr.co.momuk.service.IRecipeBoardService;

@Service
public class RecipeBoardServiceImpl implements IRecipeBoardService{

	@Autowired
	private RecipeBoardMapper recipeMapper;
	@Autowired
	private IngredientMapper ingredientMapper;
	@Autowired
	private RecipeStepMapper stepMapper;
	@Autowired
	private CommonBoardMapper commonMapper;
	
	// 레시피 등록
	@Transactional
	@Override
	public void insertRecipeBoard(CommonBoardDTO commonBoard, RecipeBoardDTO recipe, List<IngredientDTO> ingredients,
			List<RecipeStepDTO> recipesteps) {
		commonBoard.setBoardId(2);
		commonMapper.insertCommonBoard(commonBoard);
		int bno = commonBoard.getBno();
		recipe.setBno(bno);
		recipeMapper.insertRecipe(recipe);
		
		 for (IngredientDTO ingredient : ingredients) {
	        ingredient.setBno(bno);
	        ingredientMapper.insertIngredient(ingredient);
	    }

	    for (RecipeStepDTO recipeStep : recipesteps) {
	        recipeStep.setBno(bno);
	        stepMapper.insertRecipeStep(recipeStep);
	    }
	}

	// 레시피 상세
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public DetailDTO detailRecipeBoard(int bno) {
		commonMapper.updateViewCnt(bno);
		
		// 레시피 상세 정보 가져오기
	    DetailDTO detailDTO = recipeMapper.selectRecipeByBno(bno);
	    
	    // 레시피 상세 정보에 재료 리스트 설정
	    List<IngredientDTO> ingredientList = ingredientMapper.selectIngredientByBno(bno);
	    detailDTO.setIngredientList(ingredientList);
	    
	    // 레시피 상세 정보에 조리순서 리스트 설정
	    List<RecipeStepDTO> recipestepList = stepMapper.selectRecipeStepByBno(bno);
	    detailDTO.setRecipestepList(recipestepList);
	    
	    return detailDTO;
	}

	//레시피 수정
	@Transactional
	@Override
	public boolean updateRecipeBoard(CommonBoardDTO commonBoard, RecipeBoardDTO recipe, List<IngredientDTO> ingredients,
			List<RecipeStepDTO> recipesteps) {
		boolean recipeResult = recipeMapper.updateRecipe(recipe) == 1;
	    boolean commonResult = commonMapper.updateCommonBoard(commonBoard) == 1;

	    // 재료 업데이트
	    for (IngredientDTO ingredient : ingredients) {
	        int result = ingredientMapper.updateIngredient(ingredient);
	        if (result <= 0) {
	            return false; // 업데이트 실패 시 종료
	        }
	    }

	    // 조리 순서 업데이트
	    for (RecipeStepDTO recipeStep : recipesteps) {
	        int result = stepMapper.updateRecipeStep(recipeStep);
	        if (result <= 0) {
	            return false; // 업데이트 실패 시 종료
	        }
	    }

	    // 모든 업데이트 결과를 종합하여 반환
	    return recipeResult && commonResult;
	}

	// 레시피 삭제
	@Transactional
	@Override
	public boolean removeRecipeBoard(int bno) {
		boolean ingredientResult = ingredientMapper.deleteIngredient(bno) == 1;
		boolean recipeStepResult = stepMapper.deleteRecipeStep(bno) == 1;
		boolean recipeResult = recipeMapper.deleteRecipe(bno) == 1;
	    boolean commonResult = commonMapper.deleteCommonBoard(bno) == 1;

	    // 모든 삭제 결과를 종합하여 반환
	    return recipeResult && ingredientResult && recipeStepResult && commonResult;
	}

	// 레시피 목록 전체 조회
	@Override
	public List<DetailDTO> selectAllRecipe(Criteria cri) {
		return recipeMapper.selectAllRecipe(cri);
	}

	// 게시물 수
	@Override
	public int getTotalCnt(Criteria cri){
	    return recipeMapper.getTotalCnt(cri);
	}

}

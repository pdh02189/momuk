package kr.co.momuk.mapper;

import java.util.List;

import kr.co.momuk.domain.Criteria;
import kr.co.momuk.domain.DetailDTO;
import kr.co.momuk.domain.RecipeBoardDTO;

public interface RecipeBoardMapper {
	public void insertRecipe(RecipeBoardDTO Recipe);	 
	public DetailDTO selectRecipeByBno(int bno);
	public int updateRecipe(RecipeBoardDTO Recipe);
	public int deleteRecipe(int bno);
	 
	public List<DetailDTO> selectAllRecipe(Criteria cri);
	public int getTotalCnt(Criteria cri);
}

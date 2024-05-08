package kr.co.momuk;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.momuk.domain.CommonBoardDTO;
import kr.co.momuk.domain.IngredientDTO;
import kr.co.momuk.domain.RecipeBoardDTO;
import kr.co.momuk.domain.RecipeStepDTO;
import kr.co.momuk.service.IRecipeBoardService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/recipe")
@Log4j
public class RecipeController {
	@Autowired
	private IRecipeBoardService recipeService;
	
	// 등록
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void registerGET() throws Exception {
		log.info("write get........................");
	}
		
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String addRecipe(HttpServletRequest request,
	                        CommonBoardDTO commonBoard,
	                        RecipeBoardDTO recipe,
	                        Model model,
	                        RedirectAttributes rttr,
	                        HttpSession session) throws Exception {
	    // 세션에서 UUID 값 가져오기
	    String uuid = (String) session.getAttribute("uuid");
	    // 세션에서 UPLOADPATH 값 가져오기
	    String uploadpath = (String) session.getAttribute("uploadpath");
	    // 세션에서 FILENAME 값 가져오기
	    String filename = (String) session.getAttribute("filename");
	    
	    // commonBoard 객체에 UUID, UPLOADPATH, FILENAME 설정
	    commonBoard.setUuid(uuid);
	    commonBoard.setUploadpath(uploadpath);
	    commonBoard.setFilename(filename);
	    
	    // 재료 정보 수집
	    List<IngredientDTO> ingredients = new ArrayList<>();
	    Enumeration<String> parameterNames = request.getParameterNames();
	    while (parameterNames.hasMoreElements()) {
	        String paramName = parameterNames.nextElement();
	        if (paramName.startsWith("ingredient_name_")) {
	            String ingredientName = request.getParameter(paramName);
	            // 재료 이름에서 번호 추출
	            int ingredientOrder = Integer.parseInt(paramName.replace("ingredient_name_", ""));
	            // IngredientDTO 객체 생성하여 리스트에 추가
	            IngredientDTO ingredient = new IngredientDTO();
	            ingredient.setName(ingredientName);
	            ingredient.setIngredientOrder(ingredientOrder);
	            ingredients.add(ingredient);
	        }
	    }
	    
	    // 조리순서 정보 수집
	    List<RecipeStepDTO> recipesteps = new ArrayList<>();
	    
	    // 등록 서비스 호출
	    recipeService.insertRecipeBoard(commonBoard, recipe, ingredients, recipesteps);
	    
	    return "redirect:/recipe/list"; // 리다이렉트 경로로 수정해야 함
	}
}

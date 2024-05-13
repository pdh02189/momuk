package kr.co.momuk;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.momuk.domain.CommonBoardDTO;
import kr.co.momuk.domain.Criteria;
import kr.co.momuk.domain.IngredientDTO;
import kr.co.momuk.domain.PageDTO;
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
	public String addRecipe(@ModelAttribute CommonBoardDTO commonBoard,
	                        @ModelAttribute RecipeBoardDTO recipe,
	                        @RequestParam Map<String, String> params,
	                        @RequestParam("uploadFile") MultipartFile[] uploadFiles,
	                        Model model,
	                        RedirectAttributes rttr,
	                        HttpSession session) throws Exception {
	    log.info("write post.....................");

	    // 세션에서 UUID 값 가져오기
	    String uuid = (String) session.getAttribute("uuid");
	    // 세션에서 UPLOADPATH 값 가져오기
	    String uploadpath = (String) session.getAttribute("uploadpath");
	    // 세션에서 FILENAME 값 가져오기
	    String filename = (String) session.getAttribute("filename");

	    // commonBoard 객체에 UUID 설정
	    commonBoard.setUuid(uuid);
	    // commonBoard 객체에 UPLOADPATH 설정
	    commonBoard.setUploadpath(uploadpath);
	    // commonBoard 객체에 FILENAME 설정
	    commonBoard.setFilename(filename);

	    // 공통 게시판 정보 등록
	    recipeService.insertRecipeBoard(commonBoard, recipe, extractIngredients(params), extractRecipeSteps(params, uploadFiles));

	    // 세션 정보 삭제
	    session.removeAttribute("uuid");
	    session.removeAttribute("uploadpath");
	    session.removeAttribute("filename");

	    return "redirect:/recipe/list"; // 등록 후 게시판 목록 페이지로 이동
	}
		
	private List<IngredientDTO> extractIngredients(Map<String, String> params) {
		List<IngredientDTO> ingredients = new ArrayList<>();
		// 파라미터에서 재료 정보 추출
		for (Map.Entry<String, String> entry : params.entrySet()) {
			if (entry.getKey().startsWith("ingredient_name")) {
				String indexStr = entry.getKey().substring("ingredient_name_".length());
				int index = Integer.parseInt(indexStr);
				String name = entry.getValue();
				String measurement = params.get("ingredient_measurement_" + index);
				IngredientDTO ingredient = new IngredientDTO();
				ingredient.setName(name);
				ingredient.setMeasurement(measurement);
				ingredient.setIngredientOrder(index);
				ingredients.add(ingredient);
			}
		}
		return ingredients;
	}
	
	private List<RecipeStepDTO> extractRecipeSteps(Map<String, String> params, MultipartFile[] uploadFiles) {
	    List<RecipeStepDTO> recipeSteps = new ArrayList<>();
	    // 파라미터에서 조리 순서 정보 추출
	    for (Map.Entry<String, String> entry : params.entrySet()) {
	        if (entry.getKey().startsWith("step_instruction")) {
	            String indexStr = entry.getKey().substring("step_instruction_".length());
	            int index = Integer.parseInt(indexStr);
	            String instruction = entry.getValue();

	            // 해당 단계의 이미지 파일 추출
	            MultipartFile uploadFile = null;
	            if (uploadFiles != null && index < uploadFiles.length) {
	                uploadFile = uploadFiles[index];
	            }

	            RecipeStepDTO recipeStep = new RecipeStepDTO();
	            recipeStep.setInstruction(instruction);
	            recipeStep.setStepOrder(index);
	            recipeStep.setUploadFile(uploadFile); // 이미지 파일 설정
	            recipeSteps.add(recipeStep);
	        }
	    }
	    return recipeSteps;
	}
	
	// 목록 전체
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void selectAllEvent(Criteria cri, Model model) throws Exception {
		log.info("show all list.....................");
		
		model.addAttribute("list", recipeService.selectAllRecipe(cri));
		
		int total = recipeService.getTotalCnt(cri);
	    log.info("total : " + total);
	    model.addAttribute("total", total); // 총 게시물 수를 모델에 추가

	    model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
}

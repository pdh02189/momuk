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
import kr.co.momuk.domain.DetailDTO;
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

	    // 대표 이미지 정보
	    String uuid = (String) session.getAttribute("uuid");
	    String uploadpath = (String) session.getAttribute("uploadpath");
	    String filename = (String) session.getAttribute("filename");

	    commonBoard.setUuid(uuid);
	    commonBoard.setUploadpath(uploadpath);
	    commonBoard.setFilename(filename);

	    // 세션에서 조리 순서 이미지 관련 정보 가져오기
	    List<CommonBoardDTO> recipeStepImages = (List<CommonBoardDTO>) session.getAttribute("recipeStepImages");

	    // 조리 순서 이미지가 첨부되었는지 여부 확인
	    boolean stepImagesAttached = false;
	    if (recipeStepImages != null && !recipeStepImages.isEmpty()) {
	        for (CommonBoardDTO image : recipeStepImages) {
	            if (image.getUuid() != null) {
	                stepImagesAttached = true;
	                break;
	            }
	        }
	    }

	    // 조리 순서 이미지가 첨부되지 않은 경우 대표 이미지 정보 사용하지 않도록 수정
	    if (!stepImagesAttached) {
	        session.removeAttribute("uuid");
	        session.removeAttribute("uploadpath");
	        session.removeAttribute("filename");
	    }

	    recipeService.insertRecipeBoard(commonBoard, recipe, extractIngredients(params), extractRecipeSteps(params, recipeStepImages));

	    // 대표 이미지 정보 세션에서 삭제
	    session.removeAttribute("uuid");
	    session.removeAttribute("uploadpath");
	    session.removeAttribute("filename");
	    session.removeAttribute("recipeStepImages");

	    return "redirect:/recipe/list";
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
	
	private List<RecipeStepDTO> extractRecipeSteps(Map<String, String> params, List<CommonBoardDTO> recipeStepImages) {
	    List<RecipeStepDTO> recipeSteps = new ArrayList<>();
	    for (Map.Entry<String, String> entry : params.entrySet()) {
	        if (entry.getKey().startsWith("step_instruction")) {
	            String indexStr = entry.getKey().substring("step_instruction_".length());
	            int index = Integer.parseInt(indexStr);
	            String instruction = entry.getValue();

	            RecipeStepDTO recipeStep = new RecipeStepDTO();
	            recipeStep.setInstruction(instruction);
	            recipeStep.setStepOrder(index);

	            // 해당 단계의 이미지 파일 설정
	            if (recipeStepImages != null && index - 1 < recipeStepImages.size()) {
	                CommonBoardDTO stepImage = recipeStepImages.get(index - 1);
	                recipeStep.setUuid(stepImage.getUuid());
	                recipeStep.setUploadpath(stepImage.getUploadpath());
	                recipeStep.setFilename(stepImage.getFilename());
	            }

	            recipeSteps.add(recipeStep);
	        }
	    }
	    return recipeSteps;
	}
	
	// 상세
	@RequestMapping(value={"/detail", "/modify"}, method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		log.info("show detail.....................");
		
		// 서비스에서 상세 정보를 가져옴
	    DetailDTO detailDTO = recipeService.detailRecipeBoard(bno);
	    
	    // 모델에 데이터 추가
	    model.addAttribute("recipe", detailDTO);
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

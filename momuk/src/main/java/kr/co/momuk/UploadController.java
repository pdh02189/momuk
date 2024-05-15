package kr.co.momuk;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import kr.co.momuk.domain.CommonBoardDTO;
import kr.co.momuk.domain.RecipeStepDTO;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@Log4j
public class UploadController {
	
	private String uploadPath
		= "C:\\Users\\pdh02\\git\\momuk\\momuk\\src\\main\\webapp\\resources\\fileUpload";
//		= "C:\\Users\\hanul\\git\\momuk\\momuk\\src\\main\\webapp\\resources\\fileUpload";
	
	public void uploadForm() {
		log.info("upload form..........................");
	}
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax..........................");
	}
	
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		for (MultipartFile multipartFile : uploadFile) {
			log.info("--------------------------");
			log.info("Upload file name : " + multipartFile.getOriginalFilename());
			log.info("Upload file size : " + multipartFile.getSize());
			
			File saveFile = new File(uploadPath, multipartFile.getOriginalFilename());
			
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}
	
	// 년,월,일 폴더 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		
		Date date = new Date();
		String str = sdf.format(date);
		
		return str.replace(".", File.separator);
	}
	
	// 이미지 파일인지 체크
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
//	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	public ResponseEntity<List<CommonBoardDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
//		log.info("update ajax post.......................");
//		List<CommonBoardDTO> attachList = new ArrayList<>();
//		
//		String uploadFolderPath = getFolder();
//		
//		File uploadFolder = new File(uploadPath, getFolder());
//		log.info("uploadForder path : " + uploadFolder);
//		
//		if(uploadFolder.exists() == false) {
//			uploadFolder.mkdirs();
//		}
//		
//		for (MultipartFile multipartFile : uploadFile) {
//			log.info("--------------------------");
//			log.info("Upload file name : " + multipartFile.getOriginalFilename());
//			log.info("Upload file size : " + multipartFile.getSize());
//			log.info("Upload file content type : " + multipartFile.getContentType());
//			
//			CommonBoardDTO attachFileDTO = new CommonBoardDTO();
//			
//			String uploadFileName = multipartFile.getOriginalFilename();
//			
//			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
//			log.info("only file name : " + uploadFileName);
//			
//			attachFileDTO.setFilename(uploadFileName);
//			
//			UUID uuid = UUID.randomUUID();
//			
//			uploadFileName = uuid.toString() + "_" + uploadFileName;
//			
//			try {
//				File saveFile = new File(uploadFolder, uploadFileName);
//				multipartFile.transferTo(saveFile);
//				
//				// UUID와 업로드 경로 설정
//	            attachFileDTO.setUuid(uuid.toString());
//	            attachFileDTO.setUploadpath(uploadFolderPath);
//				
//				if(checkImageType(saveFile)) {	
//					File thumbnail = new File(uploadFolder, "s_" + uploadFileName);
//					Thumbnails.of(saveFile).size(300, 300).toFile(thumbnail);
//				}
//				
//				attachList.add(attachFileDTO);
//			} catch (Exception e) {
//				log.error(e.getMessage());
//			}
//		}
//		return new ResponseEntity<>(attachList, HttpStatus.OK);
//	}	
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public RedirectView uploadAjaxPost(MultipartFile[] uploadFile, HttpSession session, @RequestParam("redirectPath") String redirectPath) {
	    log.info("update ajax post.......................");
	    List<CommonBoardDTO> attachList = new ArrayList<>();

	    String uploadFolderPath = getFolder();

	    File uploadFolder = new File(uploadPath, getFolder());
	    log.info("uploadForder path : " + uploadFolder);

	    if (!uploadFolder.exists()) {
	        uploadFolder.mkdirs();
	    }

	    for (MultipartFile multipartFile : uploadFile) {
	        log.info("--------------------------");
	        log.info("Upload file name : " + multipartFile.getOriginalFilename());
	        log.info("Upload file size : " + multipartFile.getSize());
	        log.info("Upload file content type : " + multipartFile.getContentType());

	        CommonBoardDTO attachFileDTO = new CommonBoardDTO();

	        String uploadFileName = multipartFile.getOriginalFilename();

	        uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
	        log.info("only file name : " + uploadFileName);

	        attachFileDTO.setFilename(uploadFileName);

	        UUID uuid = UUID.randomUUID();

	        uploadFileName = uuid.toString() + "_" + uploadFileName;

	        try {
	            File saveFile = new File(uploadFolder, uploadFileName);
	            multipartFile.transferTo(saveFile);

	            // UUID와 업로드 경로 설정
	            attachFileDTO.setUuid(uuid.toString());
	            attachFileDTO.setUploadpath(uploadFolderPath.replace("\\", "/"));

	            if (checkImageType(saveFile)) {
	                File thumbnail = new File(uploadFolder, "s_" + uploadFileName);
	                Thumbnails.of(saveFile).size(300, 300).toFile(thumbnail);
	            }

	            attachList.add(attachFileDTO);
	        } catch (Exception e) {
	            log.error(e.getMessage());
	        }
	    }

	    // 세션에 UUID, UPLOADPATH, FILENAME 저장
	    session.setAttribute("uuid", attachList.get(0).getUuid());
	    session.setAttribute("uploadpath", attachList.get(0).getUploadpath());
	    session.setAttribute("filename", attachList.get(0).getFilename());

	    // 조리순서 이미지 관련 정보 세션에 저장
	    session.setAttribute("recipeStepImages", attachList);

	    // 리다이렉트 경로 생성
	    String redirectUrl = "/" + redirectPath + "/write";

	    // 글 등록 페이지로 리다이렉트
	    return new RedirectView(redirectUrl);
	}

	// 파일 삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		log.info("deleteFile : " + fileName);
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "text/html; charset=UTF-8");
		
		File file;
		
		try {
			file = new File(uploadPath + "\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			if(type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				log.info("largeFileName : " + largeFileName);
				
				file = new File(largeFileName);
				
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>("deleted", headers, HttpStatus.OK);
	}

	


//    private final WebApplicationContext context;
//    
//    public UploadController(ServletContext servletContext) {
//        this.context = WebApplicationContextUtils.getWebApplicationContext(servletContext);
//    }
    
    @PostMapping(value = "/uploadSummernoteImageFile")
    // @RequestParam은 자바스크립트에서 설정한 이름과 반드시 같아야합니다.
    public ResponseEntity<?> uploadSummernoteImageFile(@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
    	try {
    		// 서버에 저장할 경로
//    		String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/images/upload"); 
    		String uploadDirectory = "C:\\Users\\pdh02\\git\\momuk\\momuk\\src\\main\\webapp\\resources\\assets\\images\\upload"; 
//    		String uploadDirectory = "C:\\Users\\hanul\\git\\momuk\\momuk\\src\\main\\webapp\\resources\\assets\\images\\upload"; 
    		
    		// 업로드 된 파일의 이름
    		String originalFileName = file.getOriginalFilename();
    		
    		// 업로드 된 파일의 확장자
    		String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
    		
    		// 업로드 될 파일의 이름 재설정 (중복 방지를 위해 UUID 사용)
    		String uuidFileName = UUID.randomUUID().toString() + fileExtension;
    		
    		// 위에서 설정한 서버 경로에 이미지 저장
    		file.transferTo(new File(uploadDirectory, uuidFileName));
    		
    		System.out.println("************************ 업로드 컨트롤러 실행 ************************");
    		System.out.println(uploadDirectory);
    		
    		// Ajax에서 업로드 된 파일의 이름을 응답 받을 수 있도록 해줍니다.
    		return ResponseEntity.ok(uuidFileName);
    	} catch (Exception e) {
    		return ResponseEntity.badRequest().body("이미지 업로드 실패");
    	}
    	
    }
    
    @PostMapping(value = "/uploadRecipeStepImage", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public String uploadRecipeStepImage(@RequestParam("uploadFile") MultipartFile[] uploadFiles, HttpSession session, RedirectAttributes redirectAttributes) {
        List<RecipeStepDTO> recipeStepImages = new ArrayList<>();

        // 이미지 업로드 폴더 생성
        String uploadFolderPath = getFolder();
        File uploadFolder = new File(uploadPath, uploadFolderPath);
        if (!uploadFolder.exists()) {
            uploadFolder.mkdirs();
        }

        // 업로드된 각 이미지 처리
        for (MultipartFile uploadFile : uploadFiles) {
            RecipeStepDTO recipeStepDTO = new RecipeStepDTO();
            String originalFilename = uploadFile.getOriginalFilename();
            String uuid = UUID.randomUUID().toString();
            String uploadFileName = uuid + "_" + originalFilename;

            try {
                // 업로드된 이미지 저장
                File saveFile = new File(uploadFolder, uploadFileName);
                uploadFile.transferTo(saveFile);

                // DTO에 이미지 정보 설정
                recipeStepDTO.setFilename(originalFilename);
                recipeStepDTO.setUuid(uuid);
                recipeStepDTO.setUploadpath(uploadFolderPath.replace("\\", "/"));
                recipeStepImages.add(recipeStepDTO);
            } catch (IOException e) {
                e.printStackTrace();
                // 업로드 중 오류 발생 시, 오류 메시지 전달
                redirectAttributes.addFlashAttribute("error", "이미지 업로드 중 오류가 발생했습니다.");
                return "redirect:/recipe/write";
            }
        }

        // 조리순서 이미지 관련 정보 세션에 저장
        session.setAttribute("recipeStepImages", recipeStepImages);

        // 글 작성 페이지로 리다이렉트
        return "redirect:/recipe/write";
    }
    
}

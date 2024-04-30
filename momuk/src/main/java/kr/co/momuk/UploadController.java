package kr.co.momuk;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.JsonObject;

import kr.co.momuk.domain.CommonBoardDTO;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@Log4j
public class UploadController {
	
	private String uploadPath
		= "C:\\Users\\hanul\\git\\momuk\\momuk\\src\\main\\webapp\\resources\\fileUpload";
	
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
	public RedirectView uploadAjaxPost(MultipartFile[] uploadFile, HttpSession session) {
	    log.info("update ajax post.......................");
	    List<CommonBoardDTO> attachList = new ArrayList<>();

	    String uploadFolderPath = getFolder();

	    File uploadFolder = new File(uploadPath, getFolder());
	    log.info("uploadForder path : " + uploadFolder);

	    if(uploadFolder.exists() == false) {
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
	            attachFileDTO.setUploadpath(uploadFolderPath);

	            if(checkImageType(saveFile)) {
	                File thumbnail = new File(uploadFolder, "s_" + uploadFileName);
	                Thumbnails.of(saveFile).size(300, 300).toFile(thumbnail);
	            }

	            attachList.add(attachFileDTO);
	        } catch (Exception e) {
	            log.error(e.getMessage());
	        }
	    }

	    // 세션에 UUID 저장
	    session.setAttribute("uuid", attachList.get(0).getUuid());
	    // 세션에 UPLOADPATH 저장
	    session.setAttribute("uploadpath", attachList.get(0).getUploadpath());
	    // 세션에 FILENAME 저장
	    session.setAttribute("filename", attachList.get(0).getFilename());

	    // 글 등록 페이지로 리다이렉트
	    return new RedirectView("/cookingtip/write");
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
//	@PostMapping("/deleteFile")
//	@ResponseBody
//	public ResponseEntity<String> deleteFile(String fileName, String type) {
//	    log.info("deleteFile : " + fileName);
//	    
//	    HttpHeaders headers = new HttpHeaders();
//	    headers.add("Content-type", "text/html; charset=UTF-8");
//	    
//	    // 파일 이름이 null이면 에러를 반환
//	    if (fileName == null) {
//	        log.error("File name is null");
//	        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//	    }
//	    
//	    File file;
//	    
//	    try {
//	        // 파일 이름을 UTF-8로 디코딩하여 파일 객체 생성
//	        file = new File(uploadPath + File.separator + URLDecoder.decode(fileName, "UTF-8"));
//	        
//	        // 파일 삭제
//	        boolean deleted = file.delete();
//	        
//	        if (!deleted) {
//	            log.error("Failed to delete file: " + fileName);
//	            return new ResponseEntity<>("Failed to delete file", headers, HttpStatus.INTERNAL_SERVER_ERROR);
//	        }
//	        
//	        // 이미지 타입인 경우 썸네일 파일도 삭제
//	        if (type.equals("image")) {
//	            String thumbnailFileName = file.getAbsolutePath().replace("s_", "");
//	            File thumbnailFile = new File(thumbnailFileName);
//	            if (!thumbnailFile.delete()) {
//	                log.error("Failed to delete thumbnail file: " + thumbnailFileName);
//	                // 에러 처리 필요
//	            }
//	        }
//	    } catch (UnsupportedEncodingException e) {
//	        e.printStackTrace();
//	        return new ResponseEntity<>("UnsupportedEncodingException: " + e.getMessage(), headers, HttpStatus.INTERNAL_SERVER_ERROR);
//	    }
//	    
//	    return new ResponseEntity<>("deleted", headers, HttpStatus.OK);
//	}
	
	// 썸머노트 사진 저장
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernote/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
}

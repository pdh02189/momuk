package kr.co.momuk.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RecipeStepDTO {
	private int stepId;
	private int stepOrder;
	private int bno;
    private String instruction;
    private String uuid;
    private String uploadpath;
    private String filename;
    private MultipartFile uploadFile;
    
    public void setUploadFile(MultipartFile uploadFile) {
        this.uploadFile = uploadFile;
        if (uploadFile != null) {
            this.filename = uploadFile.getOriginalFilename();
            // 실제 파일 저장 경로와 UUID 생성 등은 서비스 로직에서 처리
        }
    }
}

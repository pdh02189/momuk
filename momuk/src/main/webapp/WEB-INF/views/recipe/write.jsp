<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${ctx}/resources/css/recipe.css">
<link rel="stylesheet" href="${ctx}/resources/summernote/summernote-lite.css">
<script src="${ctx}/resources/js/writeform.js"></script>
<script src="${ctx}/resources/summernote/summernote-lite.js"></script>
<script src="${ctx}/resources/summernote/summernote-ko-KR.js"></script>
<script>
$(document).ready(function() {
	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click", function(e){
		 e.preventDefault();

		// 폼 유효성 검사 함수 호출
	    var isValid = validateForm();

	    if (isValid) {
	        console.log("submit clicked");
	        formObj.submit();
	    }
	});
	
	// 폼 유효성 검사 함수
	function validateForm() {
	    // 카테고리 선택 확인
	    var category = $("select[name='category']").val();
	    if (category === "") {
	        alert("카테고리를 선택하세요.");
	        return false;
	    }

	    // 제목 입력 확인
	    var title = $("input[name='title']").val();
	    if (title.trim() === "") {
	        alert("제목을 입력하세요.");
	        return false;
	    }



	 	// 대표사진 첨부 확인
	    var photoSrc = $(".importantimg .thumb img").attr("src");
	    if (photoSrc === "") {
	        alert("대표사진을 첨부하세요.");
	        return false;
	    }

	    return true; // 폼 유효성 검사 통과 시 true 반환
	}
		  
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB
		  
	function checkExtension(fileName, fileSize) {
		if(fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		    
		if(regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;
	}
	
	$("input[type='file']").change(function(e){

		var formData = new FormData();
		    
		var inputFile = $("input[name='uploadFile']");
		    
		var files = inputFile[0].files;
		    
		// 이미지가 선택되지 않았을 경우 경고 메시지 표시
		if (files.length === 0) {
		    alert("이미지를 선택해주세요.");
		    return false;
		}

		// 첫 번째 이미지만 formData에 추가
		var firstFile = files[0];
		if (!checkExtension(firstFile.name, firstFile.size)) {
		    return false;
		}
		formData.append("uploadFile", firstFile);

		// redirectPath 값 설정
	    var redirectPath = "recipe"; 
	    formData.append("redirectPath", redirectPath);
		    
		    
		$.ajax({
			url: "${contextPath}/uploadAjaxAction",
			processData: false, 
			contentType: false,
			data: formData,
			type: "POST",
			dataType:"json",
			success: function(result){
				console.log(result); 
			}
		}); //$.ajax
	});  

	$(".thumb").on("click", "button", function(e) {
		    
		console.log("delete file");
		      
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		    
		$.ajax({
			url: "${contextPath}/deleteFile",
			data: {fileName: targetFile, type:type},
			dataType:"text",
			type: "POST",
			success: function(result){
				alert(result);
		           			}
		}); //$.ajax
	});
});
</script>
            <div class="main_content">
                <div class="sub_nav">
                    <a href="${ctx}/" class="font_gray">홈</a>
                    <a href="${ctx}/recipe/list">레시피</a>
                </div>
                <div class="sub_tit">
                    <h3>레시피 작성</h3>
                </div>
                <div class="write_box">
                    <form role="form" action="${contextPath}/recipe/write" method="post" enctype="multipart/form-data">
                        <div class="write_tit">
                            <p>표시는 반드시 입력하셔야 합니다.</p>
                        </div>
                        <div class="comm_write_con">                           
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">제목</h3>
                                </div>
                                <div class="cont_box">
                                    <input type="text" class="w700" placeholder="제목을 입력하세요" name="title">
                                </div>
                            </div>
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3>요리소개</h3>
                                </div>
                                <div class="cont_box">
                                    <textarea placeholder="요리소개를 입력하세요" class="w100p h80" name="infotext"></textarea>
                                </div>
                            </div>
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">카테고리</h3>
                                </div>
                                <div class="cont_box">
                                    <select class="w220" name="category">
                                        <option value="0">카테고리 선택</option>
                                        <option value="1">신선식품</option>
                                        <option value="2">간편식</option>
                                        <option value="3">가공식품</option>
                                        <option value="4">주방용품</option>
                                        <option value="5">주방가전</option>
                                    </select>
                                </div>
                            </div>
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">요리정보</h3>
                                </div>
                                <div class="cont_box recipe_info">
                                    <select class="w220" name="serving">
                                        <option value="0">분량 선택</option>
                                        <option value="1">1인분</option>
                                        <option value="2">2인분</option>
                                        <option value="3">3인분</option>
                                        <option value="4">4인분</option>
                                        <option value="5">5인분</option>
                                        <option value="6">6인분 이상</option>
                                    </select>
                                    <select class="w220" name="difficulty">
                                        <option value="0">난이도 선택</option>
                                        <option value="1">아무나</option>
                                        <option value="2">초급</option>
                                        <option value="3">중급</option>
                                        <option value="4">고급</option>
                                        <option value="5">요리왕</option>
                                    </select>
                                    <select class="w220" name="cookingtime">
                                        <option value="0">소요시간 선택</option>
                                        <option value="1">5분이내</option>
                                        <option value="2">10분이내</option>
                                        <option value="3">15분이내</option>
                                        <option value="4">20분이내</option>
                                        <option value="5">30분이내</option>
                                        <option value="6">60분이내</option>
                                        <option value="7">90분이내</option>
                                        <option value="8">2시간이내</option>
                                        <option value="9">2시간이상</option>
                                    </select>
                                </div>
                            </div>
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">재료</h3>
                                </div>
                                <div class="cont_box">
                                    <ul class="ingredient_list">
                                        <li>
                                            <input type="text" class="w400" name="ingredient_name_1" placeholder="예&#41; 돼지고기">
                                            <input type="text" class="w220" name="ingredient_measurement_1" placeholder="예&#41; 600g">
                                            <button type="button" class="btn_list_del"></button>
                                        </li>
                                        <li>
                                            <input type="text" class="w400" name="ingredient_name_2" placeholder="예&#41; 돼지고기">
                                            <input type="text" class="w220" name="ingredient_measurement_2" placeholder="예&#41; 600g">
                                            <button type="button" class="btn_list_del"></button>
                                        </li>
                                        <li>
                                            <input type="text" class="w400" name="ingredient_name_3" placeholder="예&#41; 돼지고기">
                                            <input type="text" class="w220" name="ingredient_measurement_3" placeholder="예&#41; 600g">
                                            <button type="button" class="btn_list_del"></button>
                                        </li>
                                    </ul>
                                    <button type="button" class="btn_list_plus">재료 추가</button>
                                </div>
                            </div>
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">조리순서</h3>
                                </div>
                                <div class="cont_box">
                                    <ul class="recipe_step">
                                        <li>
                                            <textarea placeholder="조리순서를 단계별로 입력하세요" class="h120" name="step_instruction_1"></textarea>
                                            <div class="imgBox">
		                                        <input class="upload-photo" value="" placeholder="">
		                                        <label>
		                                            <img src="${ctx}/resources/images/ic_cam.png" alt="사진 첨부">
		                                            사진 첨부
		                                            <input type="file" class="imageSelector" name="uploadFile step_uploadFile_1" accept="image/jpeg, image/jpg, image/png" multiple="">
		                                        </label>
		                                        <div class="thumb d_none">
		                                            <img src="">
		                                            <button type="button" class="dellink"></button>
		                                        </div>
		                                    </div>
		                                    <button type="button" class="btn_step_del"></button>
                                        </li>
                                    </ul>
                                    <button type="button" class="btn_step_plus">조리순서 추가</button>
                                </div>
                            </div>
                            <div class="comm_write_box importantimg">
                                <div class="tit_box">
                                    <h3 class="important">레시피 대표사진</h3>
                                </div>
                                <div class="cont_box">
                                    <div class="imgBox">
                                        <input class="upload-photo" value="" placeholder="">
                                        <label>
                                            <img src="${ctx}/resources/images/ic_cam.png" alt="사진 첨부">
                                            사진 첨부
                                            <input type="file" class="imageSelector" name="uploadFile" accept="image/jpeg, image/jpg, image/png" multiple="">
                                        </label>
                                        <div class="thumb d_none">
                                            <img src="">
                                            <button type="button" class="dellink"></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="comm_write_btn_wrap">
                            <button type="button" class="btn_white">취소</button>
                            <button type="submit" class="btn_red">등록</button>
                        </div>
                    </form>
                </div>
            </div>

<script>
$(document).ready(function() {
    // 재료 입력란 추가
    $(".btn_list_plus").click(function() {
        let newIndex = $(".ingredient_list li").length + 1;
        let newIngredientHtml = `
            <li>
                <input type="text" class="w400" name="ingredient_name_${newIndex}" placeholder="예&#41; 돼지고기">
                <input type="text" class="w220" name="ingredient_measurement_${newIndex}" placeholder="예&#41; 600g">
                <button type="button" class="btn_list_del"></button>
            </li>
        `;
        $(".ingredient_list").append(newIngredientHtml);

        // 추가된 입력란의 이름 업데이트
        updateIngredientNames();
    });

    // 재료 입력란 삭제
    $(document).on("click", ".btn_list_del", function() {
        $(this).closest("li").remove();
        // 삭제된 입력란 이후의 모든 입력란의 이름 업데이트
        updateIngredientNames();
    });

    // 모든 입력란의 이름 업데이트 함수
    function updateIngredientNames() {
        $(".ingredient_list li").each(function(index) {
            let num = index + 1;
            $(this).find("input[type='text']").eq(0).attr("name", "ingredient_name_" + num);
            $(this).find("input[type='text']").eq(1).attr("name", "ingredient_measurement_" + num);
        });
    }
    
 // 조리순서 입력란 추가
    $(".btn_step_plus").click(function() {
        let newIndex = $(".recipe_step li").length + 1;
        let newStepHtml = `
            <li>
                <textarea placeholder="조리순서를 단계별로 입력하세요" class="h120" name="step_instruction_${newIndex}"></textarea>
                <div class="imgBox">
                    <input class="upload-photo" value="" placeholder="">
                    <label>
                        <img src="${ctx}/resources/images/ic_cam.png" alt="사진 첨부">
                        사진 첨부
                        <input type="file" class="imageSelector" name="uploadFile step_uploadFile_${newIndex}" accept="image/jpeg, image/jpg, image/png" multiple="">
                    </label>
                    <div class="thumb d_none">
                        <img src="">
                        <button type="button" class="dellink"></button>
                    </div>
                </div>
                <button type="button" class="btn_step_del"></button>
            </li>
        `;
        $(".recipe_step").append(newStepHtml);
        // 추가된 입력란의 이름 업데이트
        updateStepNames();
        
     // 추가된 입력란에 이미지 첨부 스크립트 다시 실행
        $(".imageSelector").off("change").on("change", function(e) {
            var imageSelector = $(this);
            var file = e.target.files[0];
            if (isImageFile(file)) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    imageSelector.parent().siblings(".thumb").children("img").attr("src", e.target.result);
                    imageSelector.parent().siblings(".thumb").removeClass("d_none");
                }
                reader.readAsDataURL(file);
            } else {
                alert("이미지 파일만 첨부 가능합니다.");
                imageSelector.val("");
                imageSelector.parent().siblings(".thumb").children("img").attr("src", "");
            }
        });
    });

    // 조리순서 입력란 삭제
    $(document).on("click", ".btn_step_del", function() {
        $(this).closest("li").remove();
        // 삭제된 입력란 이후의 모든 입력란의 이름 업데이트
        updateStepNames();
    });

    // 모든 입력란의 이름 업데이트 함수
    function updateStepNames() {
    $(".recipe_step li").each(function(index) {
        let num = index + 1;
        $(this).find("textarea").attr("name", "step_instruction_" + num);
        $(this).find("input[type='file']").attr("name", "uploadFile step_uploadFile_" + num);
    });
}
});
</script>


<%@ include file="../include/footer.jsp" %>
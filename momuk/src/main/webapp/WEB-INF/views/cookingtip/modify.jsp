<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${ctx}/resources/summernote/summernote-lite.css">
<script src="${ctx}/resources/js/writeform.js"></script>
<script src="${ctx}/resources/summernote/summernote-lite.js"></script>
<script src="${ctx}/resources/summernote/summernote-ko-KR.js"></script>
<script>
$(document).ready(function() {
	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click", function(e){
		e.preventDefault();
		    
		console.log("submit clicked");
		    
		formObj.submit();
	});
	$(".comm_write_btn_wrap .btn_white").on("click", function(e){
	    e.preventDefault(); // 기본 동작 방지

	    // 사용자에게 확인 메시지 표시
	    if (confirm("취소하시겠습니까?")) {
	    	history.back();
	    } 
	    // 취소를 선택한 경우는 아무 동작도 하지 않음
	});
		  
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
<script>
$(document).ready(function() {

	// summernote
	$('#summernote').summernote({
	    // 에디터 크기 설정
	    height: 635,
	    // 에디터 한글 설정
	    lang: 'ko-KR',
	    // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
	    toolbar: [
	        ['fontname', ['fontname']],
	        // 글자 크기 설정
	        ['fontsize', ['fontsize']],
	        // 글자 [굵게, 기울임, 밑줄, 취소 선, 지우기]
	        ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	        // 글자색 설정
	        ['color', ['color']],
	        // 표 만들기
	        ['table', ['table']],
	        // 서식 [글머리 기호, 번호매기기, 문단정렬]
	        ['para', ['ul', 'ol', 'paragraph']],
	        // 줄간격 설정
	        ['height', ['height']],
	        // 이미지 첨부
	        ['insert',['picture', 'link']]
	        ],
	        // 추가한 글꼴
	    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
	    // 추가한 폰트사이즈
	    fontSizes: ['8','9','10','11','12','14','15','16','18','20','22','24','28','30','36','50','72','96'],
	    // focus는 작성 페이지 접속시 에디터에 커서를 위치하도록 하려면 설정해주세요.
	    focus : true,
		 // callbacks은 이미지 업로드 처리입니다.
		callbacks : {                                                    
			onImageUpload : function(files, editor, welEditable) {   
                // 다중 이미지 처리를 위해 for문을 사용했습니다.
				for (var i = 0; i < files.length; i++) {
					imageUploader(files[i], this);
				}
			}
		}
	});
	function imageUploader(file, el) {
		var formData = new FormData();
		formData.append('file', file);
	  
		$.ajax({                                                              
			data : formData,
			type : "POST",
	        // url은 자신의 이미지 업로드 처리 컨트롤러 경로로 설정해주세요.
			url : '${ctx}/uploadSummernoteImageFile',  
			contentType : false,
			processData : false,
			enctype : 'multipart/form-data',                                  
			success : function(data) {   
				setTimeout(function() {
				$(el).summernote('insertImage', "${ctx}/resources/assets/images/upload/"+data);
				console.log(data);
				}, 3000);
			}
		});
	}
   
});

</script>
            <div class="main_content">
                <div class="sub_nav">
                    <a href="${ctx }" class="font_gray">홈</a>
                    <a href="${ctx }/cookingtip/list">요리 꿀팁</a>
                </div>
                <div class="sub_tit">
                    <h3>요리꿀팁 수정</h3>
                </div>
                <div class="write_box">
                    <form role="form" action="${ctx}/cookingtip/modify" method="post" enctype="multipart/form-data">
                    	<input type="hidden" id="bno" name="bno" value="${cookingtip.bno}">
                    	<input type="hidden" name="pageNum" value="${cri.pageNum}">
					  	 <input type="hidden" name="amount" value="${cri.amount}">
                        <div class="write_tit">
                            <p>표시는 반드시 입력하셔야 합니다.</p>
                        </div>
                        <div class="comm_write_con">
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">카테고리</h3>
                                </div>
                                <div class="cont_box">
                                    <select class="w220" name="category" value="${cookingtip.category}">
                                        <option>카테고리 선택</option>
                                        <option value="손질법">손질법</option>
                                        <option value="보관법">보관법</option>
                                        <option value="요리정보">요리정보</option>
                                        <option value="기타정보">기타정보</option>
                                     </select>
                                </div>
                            </div>
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">제목</h3>
                                </div>
                                <div class="cont_box">
                                    <input type="text" class="w100p" placeholder="제목을 입력하세요" name="title" value="${cookingtip.title}">
                                </div>
                            </div>
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">내용</h3>
                                </div>
                                <div class="cont_box">
                                    <textarea id="summernote" class="summernote_txt w100p" name="content">
                                    	${cookingtip.content}
                                    </textarea>
                                </div>
                            </div>
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">대표사진</h3>
                                </div>
                                <div class="cont_box">
                                    <div class="imgBox">
                                        <input class="upload-photo" value="" placeholder="">
                                        <label>
                                            <img src="${ctx}/resources/images/ic_cam.png" alt="사진 첨부">
                                            사진 첨부
                                            <input type="file" class="imageSelector" name="uploadFile" accept="image/jpeg, image/jpg, image/png" multiple="">
                                        </label>
                                        <div class="thumb">
                                            <img src="${ctx}/resources/fileUpload/${cookingtip.uploadpath}/${cookingtip.uuid}_${cookingtip.filename}">
                                            <button type="button" class="dellink"></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="comm_write_btn_wrap">
                            <button type="button" class="btn_white">취소</button>
                            <button type="submit" class="btn_red">수정</button>
                        </div>
                    </form>
                </div>
            </div>
<%@ include file="../include/footer.jsp" %>
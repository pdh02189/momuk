<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
            <div class="main_content">
                <div class="sub_nav">
                    <a href="../index.html" class="font_gray">홈</a>
                    <a href="../cookingtip/index.html">요리 꿀팁</a>
                </div>
                <div class="comm_detail_top">
                    <!-- 글쓴이만 보이는 버튼 -->
                    <div class="writer_btn_wrap">
                        <button type="button" class="btn_edit">수정</button>
                        <button type="button" class="btn_del">삭제</button>
                    </div>
                    <div class="comm_detail_tit">
                        <h4>${cookingtip.title}</h4>
                        <ul class="tit_info">
                            <li class="writer"><p>${cookingtip.writer}</p></li>
                            <li class="date font_gray"><p>${cookingtip.regdate}</p></li>
                            <li class="view font_gray"><p>${cookingtip.viewcnt}</p></li>
                            <li class="comment font_gray"><p>${cookingtip.replycnt}</p></li>
                        </ul>
                    </div>
                </div>
                <div class="comm_detail_con">
                    ${cookingtip.content}
                </div>
                <div class="comm_detail_act">
                    <div class="comm_act_btn">
                        <button type="button" class="btn_share">공유하기</button>
                    </div>
                </div>
                <div class="comm_detail_comment_write">
                    <h4>댓글 <span class="font_red">${cookingtip.replycnt}</span></h4>
                    <div class="comm_box_write mt25 pa20">
                        <textarea placeholder="댓글을 입력하세요" name="replytext" maxlength="500"></textarea>
                        <div class="write_info mt10">
                            <p class="font_gray"><span class="current_length">0</span>/500</p>
                            <button type="submit" class="comm_write_button btn_red" id="addReplyBtn">등록</button>
                        </div>
                    </div>
                </div>
                <div class="comm_detail_comment_list">
                    <ul id="replyList">
<!--                         <li> -->
<!--                             <div class="comm_box_list"> -->
<!--                                 <div class="info01"> -->
<!--                                     <p class="name">자취요리어려웡</p> -->
<!--                                     <p class="font_gray">2024.04.13 09:00</p> -->
<!--                                     <a href="#" class="font_gray">수정</a> -->
<!--                                     <a href="#" class="font_gray">삭제</a> -->
<!--                                 </div> -->
<!--                                 <h5> -->
<!--                                     애호박 껍질이 항상 중간에서부터 안벗겨졌는데 이거 보고 쉽게 해결했어요! 꿀팁 감사합니다~   -->
<!--                                 </h5> -->
<!--                             </div> -->
<!--                             <div class="comm_box_write"> -->
<!--                                 <textarea placeholder="댓글을 입력하세요">애호박 껍질이 항상 중간에서부터 안벗겨졌는데 이거 보고 쉽게 해결했어요! 꿀팁 감사합니다~ </textarea> -->
<!--                                 <div class="write_info"> -->
<!--                                     <p class="font_gray">0/500</p> -->
<!--                                     <div> -->
<!--                                         <button type="button" class="comm_write_button small_btn btn_white mr5">취소</button> -->
<!--                                         <button type="button" class="comm_write_button small_btn btn_red">수정</button> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             <div class="comm_box_list"> -->
<!--                                 <div class="info01"> -->
<!--                                     <p class="name">자취요리어려웡</p> -->
<!--                                     <p class="font_gray">2024.04.13 09:00</p> -->
<!--                                     <a href="#" class="font_gray">수정</a> -->
<!--                                     <a href="#" class="font_gray">삭제</a> -->
<!--                                 </div> -->
<!--                                 <h5> -->
<!--                                     애호박 껍질이 항상 중간에서부터 안벗겨졌는데 이거 보고 쉽게 해결했어요! 꿀팁 감사합니다~   -->
<!--                                 </h5> -->
<!--                             </div> -->
<!--                             <div class="comm_box_write" style="display: none;"> -->
<!--                                 <textarea placeholder="댓글을 입력하세요">애호박 껍질이 항상 중간에서부터 안벗겨졌는데 이거 보고 쉽게 해결했어요! 꿀팁 감사합니다~ </textarea> -->
<!--                                 <div class="write_info"> -->
<!--                                     <p class="font_gray">0/500</p> -->
<!--                                     <div> -->
<!--                                         <button type="button" class="comm_write_button small_btn btn_white">취소</button> -->
<!--                                         <button type="button" class="comm_write_button small_btn btn_red">수정</button> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </li> -->
                    </ul>
                    <div class="paging1" style="margin-top: 0; margin-bottom: 40px;"></div>
                </div>
                <div class="comm_detail_btn">
                    <button type="button" class="btn_back">목록으로</button>
                </div>
                <form id="operForm" action="${ctx}/cookingtip/modify" method="get">
			  		 <input type="hidden" id="bno" name="bno" value="${cookingtip.bno}">
			  		 <input type="hidden" id="pageNum" name="pageNum" value="${cri.pageNum}">
			  		 <input type="hidden" id="amount" name="amount" value="${cri.amount}">
				 </form>
            </div>
<script src="${ctx }/resources/js/reply.js"></script>
<script>
$(document).ready(function() {
	
	// 텍스트 영역의 입력 이벤트를 감지하여 글자 수를 확인하고 표시하는 함수
    $("textarea[name='replytext']").on("input", function() {
        var maxLength = $(this).attr("maxlength");
        var currentLength = $(this).val().length;
        $(".current_length").text(currentLength);
    });
	
	var bnoValue = "${cookingtip.bno}";
	var replyUL = $("#replyList");
	
	showList(1);
	
	// 댓글 목록
	function showList(page) {
		console.log("show list " + page);
		   
		replyService.getList(
				{bno:bnoValue, contextPath:"${ctx}", page: page || 1 }, 
				function(replyCnt, list) {
					console.log("replyCnt: "+ replyCnt );
					console.log("list: " + list);
					console.log(list);
					
					if(page == -1){
						pageNum = Math.ceil(replyCnt/10.0);
						showList(pageNum);
						return;
					}
					  
					var str="";
					 
					if(list == null || list.length == 0){
						return;
					}
					 
					for (var i = 0, len = list.length || 0; i < len; i++) {
						str += "<li data-rno='" + list[i].rno + "'><div class='comm_box_list'><div class='info01'>";
		                str += "<p class='name'>"+list[i].replyer+"</p>";
		                str += "<p class='font_gray'>"+replyService.displayTime(list[i].regdate)+"</p>";
		                str += "<a href='javascript:void(0);' class='font_gray reply_edit'>수정</a><a href='javascript:void(0);' class='font_gray reply_del'>삭제</a></div>";
		                str += "<h5>"+list[i].replytext+"</h5>";
		                str += "<div class='comm_box_write' style='display: none;'>";
		                str += "<textarea placeholder='댓글을 입력하세요' name='replytext' maxlength='500'>"+list[i].replytext+"</textarea>";
		                str += "<div class='write_info'><p class='font_gray'><span class='current_length'>0</span>/500</p><div><button type='button' class='comm_write_button small_btn btn_white mr5 edit_close'>취소</button><button type='button' class='comm_write_button small_btn btn_red edit_submit'>수정</button></div></div></div></li>";
		            }
					 
					replyUL.html(str);
					 
					showReplyPage(replyCnt);
		});//end function
	}//end showList
	
	// 댓글 페이징
	var pageNum = 1;
	var replyPageFooter = $(".paging1");

	function showReplyPage(replyCnt) {
	    var endNum = Math.ceil(pageNum / 5.0) * 5;
	    var startNum = endNum - 4;

	    var prev = startNum != 1;
	    var next = false;

	    if (endNum * 10 >= replyCnt) {
	        endNum = Math.ceil(replyCnt / 10.0);
	    }

	    if (endNum * 10 < replyCnt) {
	        next = true;
	    }

	    var str = "<p>";

	    if (prev) {
	        str += "<span class='numPN over left'><a href='" + (startNum - 1) + "' data-page='1' title='이전 페이지로 이동하기'><img src='${ctx}/resources/images/ic_prev.png' alt='이전 페이지'></a></span>";
	    }

	    for (var i = startNum; i <= endNum; i++) {
	        var active = pageNum == i ? "Present" : "";
	        str += "<span class='" + active + "'><a class='" + (pageNum == i ? 'on' : '') + "' href='" + i + "' data-page='" + i + "'>" + i + "</a></span>";
	    }

	    if (next) {
	        str += "<span class='numPN  over right'><a href='" + (endNum + 1) + "' data-page='6' title='다음 페이지로 이동하기'><img src='${ctx}/resources/images/ic_next.png' alt='다음 페이지'></a></span>";
	    }

	    str += "</p>";

	    console.log(str);

	    replyPageFooter.html(str);
	}

	replyPageFooter.on("click", "span a", function (e) {
	    e.preventDefault();
	    console.log("page click");

	    var targetPageNum = $(this).attr("href");

	    console.log("targetPageNum: " + targetPageNum);

	    pageNum = targetPageNum;

	    showList(pageNum);
	});
	
	// 댓글 등록
	$("#addReplyBtn").on("click", function(e) {
    	var reply = {
    			replytext: $(".comm_box_write").find("textarea[name='replytext']").val(),
    			//replyer:modalInputReplyer.val(),
    			contextPath:"${ctx}",
    			bno:bnoValue
    		};
    	
    	 replyService.add(reply, function(result){
    	        if(result.result === "success") {
    	            // 댓글 등록 성공 시 댓글 수 업데이트
    	            var replyCount = result.replyCount;
    	            // 화면에 댓글 수를 업데이트하는 코드 작성
    	            $(".comm_detail_comment_write h4 .font_red").text(replyCount);
    	            console.log(replyCount);
    	        }
    	        
    	        // 댓글 입력창 초기화
    	        $(".comm_box_write").find("textarea[name='replytext']").val("");
    	        $(".current_length").text("0");
    	        
    	        // 댓글 목록 갱신
    	        showList(-1);
   	    });
	});
	
	// 댓글 수정 버튼 클릭 시 수정 영역 표시
	$("#replyList").on("click", ".reply_edit", function(){
	    var $replyArea = $(this).closest("li").find(".comm_box_write");
	    $replyArea.css("display", "block");
	});
	$("#replyList").on("click", ".edit_close", function(){
	    var $replyArea = $(this).closest("li").find(".comm_box_write");
	    $replyArea.css("display", "none");
	});

	// 수정 완료 버튼 클릭 시
	$("#replyList").on("click", ".edit_submit", function (e) {
	    var rno = $(this).parents("li").data("rno");
	    var $replyArea = $(this).closest("li").find(".comm_box_write");
	    var replytext = $replyArea.find("textarea[name='replytext']").val(); // 해당 댓글의 수정된 내용 가져오기
	    
	    var reply = {
	        rno: rno,
	        replytext: replytext,
	        contextPath: "${ctx}"
	    };

	    replyService.update(reply, function(result) {
	        alert(result);
	        
	        showList(pageNum);
	    });
	});

	// 댓글 삭제
    $("#replyList").on("click", ".reply_del", function(e) {
        var rno = $(this).parents("li").data("rno"); // 삭제할 댓글의 rno 가져오기

        // 확인을 누르면 댓글 삭제 수행
        if (confirm("댓글을 삭제하시겠습니까?")) {
            var reply = {
                rno: rno,
                contextPath: "${ctx}"
            };

            replyService.remove(reply, function(result) {
                alert(result);
                showList(pageNum);
            });
        }
    });
	
});
</script>
<script>
$(document).ready(function() {
	var operForm = $("#operForm"); 
	$(".btn_edit").on("click", function(e){
	  	operForm.attr("action","${ctx}/cookingtip/modify").submit();
	});
	
	$(".btn_del").on("click", function(e){
	    e.preventDefault(); // 기본 동작 방지

	    // 사용자에게 확인 메시지 표시
	    if (confirm("정말로 삭제하시겠습니까?")) {
	        // 확인을 선택한 경우
	        operForm.attr("action", "${ctx}/cookingtip/remove").attr("method", "post").submit();
	    } 
	    // 취소를 선택한 경우는 아무 동작도 하지 않음
	});

	
	$(".btn_back").on("click", function(e){
		operForm.find("#bno").remove();
		operForm.attr("action","${ctx}/cookingtip/list")
		operForm.submit();
	});
});
</script>
<%@ include file="../include/footer.jsp" %>
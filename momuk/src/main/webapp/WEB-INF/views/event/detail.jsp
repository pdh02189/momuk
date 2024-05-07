<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

            <div class="main_content">
                <div class="sub_nav">
                    <a href="${ctx }/" class="font_gray">홈</a>
                    <a href="${ctx }/event/list">이벤트</a>
                </div>
                <div class="comm_detail_top">
                    <!-- 글쓴이만 보이는 버튼 -->
                    <div class="writer_btn_wrap">
                        <button type="button" class="btn_edit">수정</button>
                        <button type="button" class="btn_del">삭제</button>
                    </div>
                    <div class="comm_detail_tit">
                        <h4>${event.title }</h4>
                        <ul class="tit_info">
                            <li class="date font_gray"><p><fmt:formatDate pattern="yyyy.MM.dd" value="${event.startdate }" /> ~ <fmt:formatDate pattern="yyyy.MM.dd" value="${event.enddate }" /></p></li>
                        </ul>
                    </div>
                </div>
                <div class="comm_detail_con">
                    ${event.content }
                </div>
        
                <div class="comm_detail_btn">
                    <button type="button" class="btn_back">목록으로</button>
                </div>
                <form id="operForm" action="${ctx}/event/modify" method="get">
			  		 <input type="hidden" id="bno" name="bno" value="${event.bno}">
			  		 <input type="hidden" id="pageNum" name="pageNum" value="${cri.pageNum}">
			  		 <input type="hidden" id="amount" name="amount" value="${cri.amount}">
				 </form>
            </div>
<script>
$(document).ready(function() {
	var operForm = $("#operForm"); 
	$(".btn_edit").on("click", function(e){
	  	operForm.attr("action","${ctx}/event/modify").submit();
	});
	
	$(".btn_del").on("click", function(e){
	    e.preventDefault(); // 기본 동작 방지

	    // 사용자에게 확인 메시지 표시
	    if (confirm("정말로 삭제하시겠습니까?")) {
	        // 확인을 선택한 경우
	        operForm.attr("action", "${ctx}/event/remove").attr("method", "post").submit();
	    } 
	    // 취소를 선택한 경우는 아무 동작도 하지 않음
	});

	
	$(".btn_back").on("click", function(e){
		operForm.find("#bno").remove();
		operForm.attr("action","${ctx}/event/list")
		operForm.submit();
	});
});
</script>
<%@ include file="../include/footer.jsp" %>
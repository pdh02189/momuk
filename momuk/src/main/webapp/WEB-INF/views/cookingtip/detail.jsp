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
                        <textarea placeholder="댓글을 입력하세요"></textarea>
                        <div class="write_info mt10">
                            <p class="font_gray">0/500</p>
                            <button type="button" class="comm_write_button btn_red">등록</button>
                        </div>
                    </div>
                </div>
                <div class="comm_detail_comment_list">
                    <ul>
                        <li>
                            <div class="comm_box_list">
                                <div class="info01">
                                    <p class="name">자취요리어려웡</p>
                                    <p class="font_gray">2024.04.13 09:00</p>
                                    <a href="#" class="font_gray">수정</a>
                                    <a href="#" class="font_gray">삭제</a>
                                </div>
                                <h5>
                                    애호박 껍질이 항상 중간에서부터 안벗겨졌는데 이거 보고 쉽게 해결했어요! 꿀팁 감사합니다~  
                                </h5>
                            </div>
                            <div class="comm_box_write">
                                <textarea placeholder="댓글을 입력하세요">애호박 껍질이 항상 중간에서부터 안벗겨졌는데 이거 보고 쉽게 해결했어요! 꿀팁 감사합니다~ </textarea>
                                <div class="write_info">
                                    <p class="font_gray">0/500</p>
                                    <div>
                                        <button type="button" class="comm_write_button small_btn btn_white mr5">취소</button>
                                        <button type="button" class="comm_write_button small_btn btn_red">수정</button>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="comm_box_list">
                                <div class="info01">
                                    <p class="name">자취요리어려웡</p>
                                    <p class="font_gray">2024.04.13 09:00</p>
                                    <a href="#" class="font_gray">수정</a>
                                    <a href="#" class="font_gray">삭제</a>
                                </div>
                                <h5>
                                    애호박 껍질이 항상 중간에서부터 안벗겨졌는데 이거 보고 쉽게 해결했어요! 꿀팁 감사합니다~  
                                </h5>
                            </div>
                            <div class="comm_box_write" style="display: none;">
                                <textarea placeholder="댓글을 입력하세요">애호박 껍질이 항상 중간에서부터 안벗겨졌는데 이거 보고 쉽게 해결했어요! 꿀팁 감사합니다~ </textarea>
                                <div class="write_info">
                                    <p class="font_gray">0/500</p>
                                    <div>
                                        <button type="button" class="comm_write_button small_btn btn_white">취소</button>
                                        <button type="button" class="comm_write_button small_btn btn_red">수정</button>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="comm_detail_btn">
                    <button type="button" class="btn_back">목록으로</button>
                </div>
                <form id="operForm" action="${ctx}/cookingtip/modify" method="get">
			  		 <input type="hidden" id="bno" name="bno" value="${cookingtip.bno}">
			  		 <input type="hidden" id="pageNum" name="pageNum" value="${cri.pageNum}">
			  		 <input type="hidden" id="amount" name="amount" value="${cri.amount}">
					 <input type="hidden" name="type" value="${cri.type}">
					 <input type="hidden" name="keyword" value="${cri.keyword}">
				 </form>
            </div>
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
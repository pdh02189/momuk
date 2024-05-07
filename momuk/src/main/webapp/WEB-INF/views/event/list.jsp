<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${ctx }/resources/css/event.css">
            <div class="main_content">
                <div class="sub_nav">
                    <a href="${ctx }/" class="font_gray">홈</a>
                    <a href="${ctx }/event/list">이벤트</a>
                </div>
                <div class="sub_tit">
                    <h3>이벤트</h3>
                    <button type="button" class="btn_write btn_red" onclick="location.href='write.html'"><span>이벤트 등록</span></button>
                </div>
                <ul class="event_list">
                	<c:forEach items="${list }" var="board">
	                    <li>
	                        <a href="${board.bno }">
	                            <div class="list_img">
	                                <img src="${ctx}/resources/fileUpload/${board.uploadpath}/${board.uuid}_${board.filename}" alt="이벤트 대표 이미지">
	                            </div>
	                            <div class="list_txt">
	                                <!-- 진행예정 state01 진행중 state02 종료 state03 클래스-->
	                                <span class="state01"></span>
	                                <span class="date font_gray">${board.startdate } ~ ${board.enddate }</span>
	                            </div>
	                        </a>
	                    </li>
                    </c:forEach>
                </ul>
                <div class="paging1">
                    <p>
<%--                         <span class="numPN m_ar"><a href="#" data-page="1" title="처음 페이지로 이동하기"><img src="${ctx}/resources/images/ic_prev2.png" alt="처음 페이지"></a></span> --%>
                        <c:if test="${pageMaker.prev }">
                        	<span class="numPN over left"><a href="${pageMaker.startPage - 1 }" data-page="1" title="이전 페이지로 이동하기"><img src="${ctx}/resources/images/ic_prev.png" alt="이전 페이지"></a></span>
                        </c:if>
                        <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
	                        <span class="${pageMaker.cri.pageNum == num ? 'Present' : '' }"><a class="${pageMaker.cri.pageNum == num ? 'on' : '' }" href="${num}" data-page="${num}">${num}</a></span>
<!-- 	                        <span><a href="#" data-page="2">2</a></span> -->
<!-- 	                        <span><a href="#" data-page="3">3</a></span> -->
<!-- 	                        <span><a href="#" data-page="4">4</a></span> -->
<!-- 	                        <span><a href="#" data-page="5">5</a></span> -->
                        </c:forEach>
                        <c:if test="${pageMaker.next }">
                        	<span class="numPN  over right"><a href="${pageMaker.endPage + 1 }" data-page="6" title="다음 페이지로 이동하기"><img src="${ctx}/resources/images/ic_next.png" alt="다음 페이지"></a></span>
                        </c:if>
<%--                         <span class="numPN m_ar"><a href="#" data-page="14" title="마지막 페이지로 이동하기"><img src="${ctx}/resources/images/ic_next2.png" alt="마지막 페이지"></a></span> --%>
                    </p>
                </div>
            </div>
            
            <form id="actionForm" action="${ctx }/event/list" method="get">
            	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
            	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
            </form>
<script>
$(function() {
	$(".btn_write").on("click", function() {
		self.location = "${ctx}/event/write";
	});
	
	var actionForm = $("#actionForm");
	$(".comm_list li a").on("click", function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
		actionForm.attr("action", "${ctx}/event/detail");
		actionForm.submit();
	});
	
	var actionForm = $("#actionForm");
	$(".paging1 span a").on("click", function(e) {
		e.preventDefault();
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});

});
</script>
<%@ include file="../include/footer.jsp" %>
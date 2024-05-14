<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

            <div class="main_content">
                <div class="sub_nav">
                    <a href="${ctx }/" class="font_gray">홈</a>
                    <a href="${ctx }/recipe/list">레시피</a>
                </div>
                <div class="sub_tit">
                    <h3>레시피</h3>
                    <button type="button" class="btn_write btn_red"><span>레시피 작성</span></button>
                </div>
                <div class="comm_list_top">
                    <ul class="list_category nowrap">
                        <li>
                            <p>
                                <input type="radio" id="l_cate01" name="list_category" checked="">
                                <label for="l_cate01">
                                    전체
                                </label>
                            </p>
                        </li>
                        <li>
                            <p>
                                <input type="radio" id="l_cate02" name="list_category">
                                <label for="l_cate02">
                                    메인요리
                                </label>
                            </p>
                        </li>
                        <li>
                            <p>
                                <input type="radio" id="l_cate03" name="list_category">
                                <label for="l_cate03">
                                    밑반찬
                                </label>
                            </p>
                        </li>
                        <li>
                            <p>
                                <input type="radio" id="l_cate04" name="list_category">
                                <label for="l_cate04">
                                    국/탕
                                </label>
                            </p>
                        </li>
                        <li>
                            <p>
                                <input type="radio" id="l_cate05" name="list_category">
                                <label for="l_cate05">
                                    찌개
                                </label>
                            </p>
                        </li>
                        <li>
                            <p>
                                <input type="radio" id="l_cate06" name="list_category">
                                <label for="l_cate06">
                                    디저트
                                </label>
                            </p>
                        </li>
                        <li>
                            <p>
                                <input type="radio" id="l_cate07" name="list_category">
                                <label for="l_cate07">
                                    면/만두
                                </label>
                            </p>
                        </li>
                        <li>
                            <p>
                                <input type="radio" id="l_cate08" name="list_category">
                                <label for="l_cate08">
                                    밥/죽/떡
                                </label>
                            </p>
                        </li>
                        <li>
                            <p>
                                <input type="radio" id="l_cate09" name="list_category">
                                <label for="l_cate09">
                                    양식
                                </label>
                            </p>
                        </li>
                        <li>
                            <p>
                                <input type="radio" id="l_cate10" name="list_category">
                                <label for="l_cate10">
                                    빵/과자
                                </label>
                            </p>
                        </li>
                        <li>
                            <p>
                                <input type="radio" id="l_cate11" name="list_category">
                                <label for="l_cate11">
                                    기타
                                </label>
                            </p>
                        </li>
                    </ul>
                    <div class="list_total_wrap">
                        <div class="list_total">
                            <p>총 <span>${total}</span>개<strong class="mobile_none">의 레시피가 있습니다.</strong></p>
                        </div>
                        <ul class="list_sort">
                            <li>
                                <p>
                                    <input type="radio" id="act01" name="act" checked="">
                                    <label for="act01">
                                        <span></span>최신순
                                    </label>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <input type="radio" id="act02" name="act">
                                    <label for="act02">
                                        <span></span>조회순
                                    </label>
                                </p>
                            </li>
                        </ul>
                    </div>
                </div>
                <ul class="comm_list">
	                <c:forEach items="${list }" var="board">
	                    <li>
	                        <a href="${board.bno }">
	                            <div class="list_img">
	                                <img src="${ctx}/resources/fileUpload/${board.uploadpath}/${board.uuid}_${board.filename}" alt="레시피 대표 이미지">
	                            </div>
	                            <div class="list_txt">
	                                <p class="list_tit txt_cut2">${board.title }</p>
	                                <div class="list_info">
	                                    <span class="name">${board.writer }</span>
	                                    <span class="date font_gray"><fmt:formatDate pattern="yyyy.MM.dd HH:mm" value="${board.regdate }" /></span>
	                                </div>
	                                <div class="list_ic">
	                                    <span class="view font_gray">${board.viewcnt }</span>
	                                    <span class="heart font_gray">${board.heartcnt }</span>
	                                    <span class="comment font_gray">${board.replycnt }</span>
	                                </div>
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
            
            <form id="actionForm" action="${ctx }/recipe/list" method="get">
            	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
            	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
            </form>
<script>
$(function() {
	$(".btn_write").on("click", function() {
		self.location = "${ctx}/recipe/write";
	});
	
	var actionForm = $("#actionForm");
	$(".comm_list li a").on("click", function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
		actionForm.attr("action", "${ctx}/recipe/detail");
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
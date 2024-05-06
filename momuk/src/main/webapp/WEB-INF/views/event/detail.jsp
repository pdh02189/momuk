<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

            <div class="main_content">
                <div class="sub_nav">
                    <a href="../index.html" class="font_gray">홈</a>
                    <a href="../event/index.html">이벤트</a>
                </div>
                <div class="comm_detail_top">
                    <!-- 글쓴이만 보이는 버튼 -->
                    <div class="writer_btn_wrap">
                        <button type="button" class="btn_edit">수정</button>
                        <button type="button" class="btn_del">삭제</button>
                    </div>
                    <div class="comm_detail_tit">
                        <h4>신규 회원이라면 누구나 1만원 할인</h4>
                        <ul class="tit_info">
                            <li class="date font_gray"><p>2024.03.20 ~ 2024.05.16</p></li>
                        </ul>
                    </div>
                </div>
                <div class="comm_detail_con">
                    <img src="../images/event_test_img03.jpg" alt="게시물 이미지">
                    <p>
                        <br>
                        이벤트 상세페이지 글이 있을수도 없을수도 있음!~!!
                    </p>
                </div>
        
                <div class="comm_detail_btn">
                    <button type="button" class="btn_back">목록으로</button>
                </div>
            </div>
<%@ include file="../include/footer.jsp" %>
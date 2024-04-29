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
                        <h4>애호박 비닐 쉽게 벗기는 법</h4>
                        <ul class="tit_info">
                            <li class="writer"><p>요리조아</p></li>
                            <li class="date font_gray"><p>2024.03.23</p></li>
                            <li class="view font_gray"><p>24</p></li>
                            <li class="comment font_gray"><p>2</p></li>
                        </ul>
                    </div>
                </div>
                <div class="comm_detail_con">
                    <p>
                        여름철 뙤약볕 아래서도 말라 죽지 않는 강인한 생명력을 가진 애호박!<br>
                        가격도 저렴하고 맛도 좋아 찌개류는 물론 전, 볶음 등 <br>
                        다양한 요리에 많이 쓰이는데요. <br>
                        <br>
                        일상 속 친숙한 재료인 만큼 자주 사용할 일이 많은데, <br>
                        애호박에 꽉 끼워진 비닐 때문에 불편할 때가 많죠? <br>
                        비닐을 벗기다가 매번 중간에 끊어져서 <br>
                        반복해서 또 가위질을 해야 하니까 번거로움이 만만치 않은데요.<br>
                        <br>
                        위험하지 않으면서 아주 쉽고 속시원하게 <br>
                        애호박 비닐 벗기는 방법 알려 드릴게요~
                    </p>
                    <img src="${ctx}/resources/images/tip_test_img01.jpg" alt="게시물 이미지">
                    <p>
                        <br>
                        여름철 뙤약볕 아래서도 말라 죽지 않는 강인한 생명력을 가진 애호박!<br>
                        가격도 저렴하고 맛도 좋아 찌개류는 물론 전, 볶음 등 <br>
                        다양한 요리에 많이 쓰이는데요. <br>
                        <br>
                        일상 속 친숙한 재료인 만큼 자주 사용할 일이 많은데, <br>
                        애호박에 꽉 끼워진 비닐 때문에 불편할 때가 많죠? <br>
                        비닐을 벗기다가 매번 중간에 끊어져서 <br>
                        반복해서 또 가위질을 해야 하니까 번거로움이 만만치 않은데요.<br>
                        <br>
                        위험하지 않으면서 아주 쉽고 속시원하게 <br>
                        애호박 비닐 벗기는 방법 알려 드릴게요~
                    </p>
                    <img src="${ctx}/resources/images/tip_test_img01.jpg" alt="게시물 이미지">
                </div>
                <div class="comm_detail_act">
                    <div class="comm_act_btn">
                        <button type="button" class="btn_share">공유하기</button>
                    </div>
                </div>
                <div class="comm_detail_comment_write">
                    <h4>댓글 <span class="font_red">2</span></h4>
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
            </div>
<%@ include file="../include/footer.jsp" %>
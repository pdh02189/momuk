<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${ctx}/resources/css/recipe.css">

            <div class="main_content">
                <div class="sub_nav">
                    <a href="${ctx}/" class="font_gray">홈</a>
                    <a href="${ctx}/recipe/list">레시피</a>
                </div>
                <div class="comm_detail_top">
                    <div class="recipe_detail_left">
                        <img src="../images/recipe_test_img05.jpg" alt="레시피 이미지">
                    </div>
                    <div class="recipe_detail_right">
                        <!-- 글쓴이만 보이는 버튼 -->
                        <div class="writer_btn_wrap">
                            <button type="button" class="btn_edit">수정</button>
                            <button type="button" class="btn_del">삭제</button>
                        </div>
                        <div class="recipe_detail_tit">
                            <div class="recipe_tit_info">
                                <div class="list_info">
                                    <span class="name">요리조아</span>
                                    <span class="date font_gray">2024.03.23</span>
                                </div>
                                <div class="list_ic">
                                    <span class="view font_gray">24</span>
                                    <span class="heart font_gray">11</span>
                                    <span class="comment font_gray">2</span>
                                </div>
                            </div>
                           <h4>매콤 된장찌개, 채소와 두부만 넣은 초간단 초스피드 된장찌개</h4>
                           <p class="tit_txt font_gray">고기와 곁들여 먹으면 좋은 가벼운 느낌의 된장찌개 입니다.</p>
                           <ul class="list_info2">
                                <li>
                                    <span class="font_gray">분량</span>
                                    <span>2인분</span>
                                </li>
                                <li>
                                    <span class="font_gray">난이도</span>
                                    <span>초급</span>
                                </li>
                                <li>
                                    <span class="font_gray">소요시간</span>
                                    <span>15분 이내</span>
                                </li>
                           </ul>
                        </div>
                        <div class="comm_detail_con_tit">
                            <div class="cont_tit">
                                <h4>재료</h4>
                            </div>
                            <ul class="ingredient">
                                <li>
                                    <span>느타리버섯</span>
                                    <span class="font_gray">1줌</span>
                                </li>
                                <li>
                                    <span>양파</span>
                                    <span class="font_gray">1/2개</span>
                                </li>
                                <li>
                                    <span>애호박</span>
                                    <span class="font_gray">1/4개</span>
                                </li>
                                <li>
                                    <span>청양고추</span>
                                    <span class="font_gray">2개</span>
                                </li>
                                <li>
                                    <span>두부</span>
                                    <span class="font_gray">1/4모</span>
                                </li>
                                <li>
                                    <span>물</span>
                                    <span class="font_gray">1.5컵</span>
                                </li>
                                <li>
                                    <span>진간장</span>
                                    <span class="font_gray">1큰술</span>
                                </li>
                                <li>
                                    <span>고춧가루</span>
                                    <span class="font_gray">1.5큰술</span>
                                </li>
                                <li>
                                    <span>다진마늘</span>
                                    <span class="font_gray">0.5큰술</span>
                                </li>
                                <li>
                                    <span>설탕</span>
                                    <span class="font_gray">0.5작은술</span>
                                </li>
                                <li>
                                    <span>소금</span>
                                    <span class="font_gray">약간 </span>
                                </li>
                            </ul>
                        </div>
                        <div class="comm_detail_act">
                            <div class="comm_act_btn">
                                <p>
                                    <input type="checkbox" id="act01" name="act">
                                    <label for="act01">
                                        <span></span>찜하기
                                    </label>
                                </p>
                                <button type="button" class="btn_share">공유하기</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="comm_detail_con_tit">
                    <div class="cont_tit">
                        <h4>조리순서</h4>
                    </div>
                    <div class="recipe_detail_con">
                        <!-- 조리순서에 이미지가 없으면 noimg 클래스 붙음 -->
                        <div class="steps">
                            <div class="step_txt">
                                <span class="font_red">Step 1</span>
                                <p>물1.5종이컵에 된장,고추가루,다진마늘,설탕,간장을 한데넣고 한소끔 끓여줍니다.</p>
                            </div>
                            <div class="step_img">
                                <img src="../images/recipe_test_img06.jpg" alt="조리순서 이미지">
                            </div>
                        </div>
                        <div class="steps">
                            <div class="step_txt">
                                <span class="font_red">Step 2</span>
                                <p>그사이 양파,버섯,애호박,청양고추,두부는 적당한 크기로 썰어줍니다.</p>
                            </div>
                            <div class="step_img">
                                <img src="../images/recipe_test_img07.jpg" alt="조리순서 이미지">
                            </div>
                        </div>
                        <div class="steps">
                            <div class="step_txt">
                                <span class="font_red">Step 3</span>
                                <p>한소끔 끓은 된장물에 양파,버섯,애호박,청양고추,두부를 넣어 줍니다.</p>
                            </div>
                            <div class="step_img">
                                <img src="../images/recipe_test_img08.jpg" alt="조리순서 이미지">
                            </div>
                        </div>
                        <div class="steps">
                            <div class="step_txt">
                                <span class="font_red">Step 4</span>
                                <p>애호박이 익을때까지 끓여주어 간을보아 부족한간은 소금으로 해주어 완성. 저는 부족한간이 없어 소금은 넣지 않았습니다.</p>
                            </div>
                            <div class="step_img">
                                <img src="../images/recipe_test_img05.jpg" alt="조리순서 이미지">
                            </div>
                        </div>
                        <div class="steps noimg">
                            <div class="step_txt">
                                <span class="font_red">Step 5</span>
                                <p>이미지 없이 글만 있을때 예시</p>
                            </div>
                            <div class="step_img">
                                <img src="../images/recipe_test_img06.jpg" alt="조리순서 이미지">
                            </div>
                        </div>
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
                                    저 진짜 요리 똥손인데 이거보고 된장찌개 만들었더니 성공했어요!! 된장두스푼에 쌈장 조금 넣었더니 더 맛있네용!! 
                                </h5>
                            </div>
                            <div class="comm_box_write">
                                <textarea placeholder="댓글을 입력하세요">저 진짜 요리 똥손인데 이거보고 된장찌개 만들었더니 성공했어요!! 된장두스푼에 쌈장 조금 넣었더니 더 맛있네용!! </textarea>
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
                                    저 진짜 요리 똥손인데 이거보고 된장찌개 만들었더니 성공했어요!! 된장두스푼에 쌈장 조금 넣었더니 더 맛있네용!! 
                                </h5>
                            </div>
                            <div class="comm_box_write" style="display: none;">
                                <textarea placeholder="댓글을 입력하세요">저 진짜 요리 똥손인데 이거보고 된장찌개 만들었더니 성공했어요!! 된장두스푼에 쌈장 조금 넣었더니 더 맛있네용!! </textarea>
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
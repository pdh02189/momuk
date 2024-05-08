<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

            <div class="main_content">
                <div class="sub_nav">
                    <a href="../index.html" class="font_gray">홈</a>
                    <a href="../recipe/index.html">레시피</a>
                </div>
                <div class="sub_tit">
                    <h3>레시피</h3>
                    <button type="button" class="btn_write btn_red" onclick="location.href='write.html'"><span>레시피 작성</span></button>
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
                            <p>총 <span>140</span>개<strong class="mobile_none">의 레시피가 있습니다.</strong></p>
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
                    <li>
                        <a href="../recipe/detail.html">
                            <div class="list_img">
                                <img src="../images/recipe_test_img01.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">매콤 된장찌개, 채소와 두부만 넣은 초간단 초스피드 된장찌개</p>
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
                        </a>
                    </li>
                    <li>
                        <a href="../recipe/detail.html">
                            <div class="list_img">
                                <img src="../images/recipe_test_img02.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">파김치 황금레시피, 파김치 담그는 법</p>
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
                        </a>
                    </li>
                    <li>
                        <a href="../recipe/detail.html">
                            <div class="list_img">
                                <img src="../images/recipe_test_img03.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">절대 실패없는 제육볶음 황금레시피 감칠맛과 매운맛이 좋아요~!!</p>
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
                        </a>
                    </li>
                    <li>
                        <a href="../recipe/detail.html">
                            <div class="list_img">
                                <img src="../images/recipe_test_img04.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">마지막 한 젓가락까지 바삭하고 고소한 간장 멸치볶음(아이밑반찬,간단반찬) </p>
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
                        </a>
                    </li>
                    <li>
                        <a href="../recipe/detail.html">
                            <div class="list_img">
                                <img src="../images/recipe_test_img01.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">매콤 된장찌개, 채소와 두부만 넣은 초간단 초스피드 된장찌개</p>
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
                        </a>
                    </li>
                    <li>
                        <a href="../recipe/detail.html">
                            <div class="list_img">
                                <img src="../images/recipe_test_img02.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">파김치 황금레시피, 파김치 담그는 법</p>
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
                        </a>
                    </li>
                    <li>
                        <a href="../recipe/detail.html">
                            <div class="list_img">
                                <img src="../images/recipe_test_img03.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">절대 실패없는 제육볶음 황금레시피 감칠맛과 매운맛이 좋아요~!!</p>
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
                        </a>
                    </li>
                    <li>
                        <a href="../recipe/detail.html">
                            <div class="list_img">
                                <img src="../images/recipe_test_img04.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">마지막 한 젓가락까지 바삭하고 고소한 간장 멸치볶음(아이밑반찬,간단반찬) </p>
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
                        </a>
                    </li>
                    <li>
                        <a href="../recipe/detail.html">
                            <div class="list_img">
                                <img src="../images/recipe_test_img01.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">매콤 된장찌개, 채소와 두부만 넣은 초간단 초스피드 된장찌개</p>
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
                        </a>
                    </li>
                    <li>
                        <a href="../recipe/detail.html">
                            <div class="list_img">
                                <img src="../images/recipe_test_img02.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">파김치 황금레시피, 파김치 담그는 법</p>
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
                        </a>
                    </li>
                    <li>
                        <a href="../recipe/detail.html">
                            <div class="list_img">
                                <img src="../images/recipe_test_img03.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">절대 실패없는 제육볶음 황금레시피 감칠맛과 매운맛이 좋아요~!!</p>
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
                        </a>
                    </li>
                    <li>
                        <a href="../recipe/detail.html">
                            <div class="list_img">
                                <img src="../images/recipe_test_img04.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">마지막 한 젓가락까지 바삭하고 고소한 간장 멸치볶음(아이밑반찬,간단반찬) </p>
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
                        </a>
                    </li>
                </ul>
                <div class="paging1">
                    <p>
                        <span class="numPN m_ar"><a href="#" data-page="1" title="처음 페이지로 이동하기"><img src="../images/ic_prev2.png" alt="처음 페이지"></a></span>
                        <span class="numPN over left"><a href="#" data-page="1" title="이전 페이지로 이동하기"><img src="../images/ic_prev.png" alt="이전 페이지"></a></span>
                        <span class="Present"><a class="on" href="#" data-page="1">1</a></span>
                        <span><a href="#" data-page="2">2</a></span>
                        <span><a href="#" data-page="3">3</a></span>
                        <span><a href="#" data-page="4">4</a></span>
                        <span><a href="#" data-page="5">5</a></span>
                        <span class="numPN  over right"><a href="#" data-page="11" title="다음 페이지로 이동하기"><img src="../images/ic_next.png" alt="다음 페이지"></a></span>
                        <span class="numPN m_ar"><a href="#" data-page="14" title="마지막 페이지로 이동하기"><img src="../images/ic_next2.png" alt="마지막 페이지"></a></span>
                    </p>
                </div>
            </div>
<%@ include file="../include/footer.jsp" %>
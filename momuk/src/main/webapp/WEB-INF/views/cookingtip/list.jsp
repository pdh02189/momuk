<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
            <div class="main_content">
                <div class="sub_nav">
                    <a href="../index.html" class="font_gray">홈</a>
                    <a href="../cookingtip/index.html">요리 꿀팁</a>
                </div>
                <div class="sub_tit">
                    <h3>요리 꿀팁</h3>
                    <button type="button" class="btn_write btn_red" onclick="location.href='write.html'"><span>꿀팁 작성</span></button>
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
                                    손질법
                                </label>
                            </p>
                        </li>
                        <li>
                            <p>
                                <input type="radio" id="l_cate03" name="list_category">
                                <label for="l_cate03">
                                    보관법
                                </label>
                            </p>
                        </li>
                        <li>
                            <p>
                                <input type="radio" id="l_cate04" name="list_category">
                                <label for="l_cate04">
                                    요리정보
                                </label>
                            </p>
                        </li>
                        <li>
                            <p>
                                <input type="radio" id="l_cate05" name="list_category">
                                <label for="l_cate05">
                                    기타정보
                                </label>
                            </p>
                        </li>
                    </ul>
                    <div class="list_total_wrap">
                        <div class="list_total">
                            <p>총 <span>201</span>개<strong class="mobile_none">의 꿀팁이 있습니다.</strong></p>
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
                        <a href="../cookingtip/detail.html">
                            <div class="list_img">
                                <img src="${ctx}/resources/images/tip_test_img01.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">애호박 비닐 쉽게 벗기는 법</p>
                                <div class="list_info">
                                    <span class="name">요리조아</span>
                                    <span class="date font_gray">2024.03.23</span>
                                </div>
                                <div class="list_ic">
                                    <span class="view font_gray">24</span>
                                    <span class="comment font_gray">2</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../cookingtip/detail.html">
                            <div class="list_img">
                                <img src="${ctx}/resources/images/tip_test_img02.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">옥수수 알맹이 예쁘게 써는 법</p>
                                <div class="list_info">
                                    <span class="name">요리조아</span>
                                    <span class="date font_gray">2024.03.23</span>
                                </div>
                                <div class="list_ic">
                                    <span class="view font_gray">24</span>
                                    <span class="comment font_gray">2</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../cookingtip/detail.html">
                            <div class="list_img">
                                <img src="${ctx}/resources/images/tip_test_img03.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">밥 맛있게 짓는 법</p>
                                <div class="list_info">
                                    <span class="name">요리조아</span>
                                    <span class="date font_gray">2024.03.23</span>
                                </div>
                                <div class="list_ic">
                                    <span class="view font_gray">24</span>
                                    <span class="comment font_gray">2</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../cookingtip/detail.html">
                            <div class="list_img">
                                <img src="${ctx}/resources/images/tip_test_img04.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">칼에 버터 안 묻히고 소분하는 법</p>
                                <div class="list_info">
                                    <span class="name">요리조아</span>
                                    <span class="date font_gray">2024.03.23</span>
                                </div>
                                <div class="list_ic">
                                    <span class="view font_gray">24</span>
                                    <span class="comment font_gray">2</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../cookingtip/detail.html">
                            <div class="list_img">
                                <img src="${ctx}/resources/images/tip_test_img01.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">애호박 비닐 쉽게 벗기는 법</p>
                                <div class="list_info">
                                    <span class="name">요리조아</span>
                                    <span class="date font_gray">2024.03.23</span>
                                </div>
                                <div class="list_ic">
                                    <span class="view font_gray">24</span>
                                    <span class="comment font_gray">2</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../cookingtip/detail.html">
                            <div class="list_img">
                                <img src="${ctx}/resources/images/tip_test_img02.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">옥수수 알맹이 예쁘게 써는 법</p>
                                <div class="list_info">
                                    <span class="name">요리조아</span>
                                    <span class="date font_gray">2024.03.23</span>
                                </div>
                                <div class="list_ic">
                                    <span class="view font_gray">24</span>
                                    <span class="comment font_gray">2</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../cookingtip/detail.html">
                            <div class="list_img">
                                <img src="${ctx}/resources/images/tip_test_img03.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">밥 맛있게 짓는 법</p>
                                <div class="list_info">
                                    <span class="name">요리조아</span>
                                    <span class="date font_gray">2024.03.23</span>
                                </div>
                                <div class="list_ic">
                                    <span class="view font_gray">24</span>
                                    <span class="comment font_gray">2</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../cookingtip/detail.html">
                            <div class="list_img">
                                <img src="${ctx}/resources/images/tip_test_img04.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">칼에 버터 안 묻히고 소분하는 법</p>
                                <div class="list_info">
                                    <span class="name">요리조아</span>
                                    <span class="date font_gray">2024.03.23</span>
                                </div>
                                <div class="list_ic">
                                    <span class="view font_gray">24</span>
                                    <span class="comment font_gray">2</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../cookingtip/detail.html">
                            <div class="list_img">
                                <img src="${ctx}/resources/images/tip_test_img01.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">애호박 비닐 쉽게 벗기는 법</p>
                                <div class="list_info">
                                    <span class="name">요리조아</span>
                                    <span class="date font_gray">2024.03.23</span>
                                </div>
                                <div class="list_ic">
                                    <span class="view font_gray">24</span>
                                    <span class="comment font_gray">2</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../cookingtip/detail.html">
                            <div class="list_img">
                                <img src="${ctx}/resources/images/tip_test_img02.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">옥수수 알맹이 예쁘게 써는 법</p>
                                <div class="list_info">
                                    <span class="name">요리조아</span>
                                    <span class="date font_gray">2024.03.23</span>
                                </div>
                                <div class="list_ic">
                                    <span class="view font_gray">24</span>
                                    <span class="comment font_gray">2</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../cookingtip/detail.html">
                            <div class="list_img">
                                <img src="${ctx}/resources/images/tip_test_img03.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">밥 맛있게 짓는 법</p>
                                <div class="list_info">
                                    <span class="name">요리조아</span>
                                    <span class="date font_gray">2024.03.23</span>
                                </div>
                                <div class="list_ic">
                                    <span class="view font_gray">24</span>
                                    <span class="comment font_gray">2</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../cookingtip/detail.html">
                            <div class="list_img">
                                <img src="${ctx}/resources/images/tip_test_img04.jpg" alt="레시피 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <p class="list_tit txt_cut2">칼에 버터 안 묻히고 소분하는 법</p>
                                <div class="list_info">
                                    <span class="name">요리조아</span>
                                    <span class="date font_gray">2024.03.23</span>
                                </div>
                                <div class="list_ic">
                                    <span class="view font_gray">24</span>
                                    <span class="comment font_gray">2</span>
                                </div>
                            </div>
                        </a>
                    </li>
                </ul>
                <div class="paging1">
                    <p>
                        <span class="numPN m_ar"><a href="#" data-page="1" title="처음 페이지로 이동하기"><img src="${ctx}/resources/images/ic_prev2.png" alt="처음 페이지"></a></span>
                        <span class="numPN over left"><a href="#" data-page="1" title="이전 페이지로 이동하기"><img src="${ctx}/resources/images/ic_prev.png" alt="이전 페이지"></a></span>
                        <span class="Present"><a class="on" href="#" data-page="1">1</a></span>
                        <span><a href="#" data-page="2">2</a></span>
                        <span><a href="#" data-page="3">3</a></span>
                        <span><a href="#" data-page="4">4</a></span>
                        <span><a href="#" data-page="5">5</a></span>
                        <span class="numPN  over right"><a href="#" data-page="11" title="다음 페이지로 이동하기"><img src="${ctx}/resources/images/ic_next.png" alt="다음 페이지"></a></span>
                        <span class="numPN m_ar"><a href="#" data-page="14" title="마지막 페이지로 이동하기"><img src="${ctx}/resources/images/ic_next2.png" alt="마지막 페이지"></a></span>
                    </p>
                </div>
            </div>
<%@ include file="../include/footer.jsp" %>
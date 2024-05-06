<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${ctx }/resources/css/event.css">
            <div class="main_content">
                <div class="sub_nav">
                    <a href="../index.html" class="font_gray">홈</a>
                    <a href="../event/index.html">이벤트</a>
                </div>
                <div class="sub_tit">
                    <h3>이벤트</h3>
                    <button type="button" class="btn_write btn_red admin_btn" onclick="location.href='write.html'"><span>이벤트 등록</span></button>
                </div>
                <ul class="event_list">
                    <li>
                        <a href="../event/detail.html">
                            <div class="list_img">
                                <img src="../images/event_test_img01.jpg" alt="이벤트 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <!-- 진행예정 state01 진행중 state02 종료 state03 클래스-->
                                <span class="state01"></span>
                                <span class="date font_gray">2024.03.20 ~ 2024.05.16</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../event/detail.html">
                            <div class="list_img">
                                <img src="../images/event_test_img01.jpg" alt="이벤트 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <!-- 진행예정 state01 진행중 state02 종료 state03 클래스-->
                                <span class="state02"></span>
                                <span class="date font_gray">2024.03.20 ~ 2024.05.16</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../event/detail.html">
                            <div class="list_img">
                                <img src="../images/event_test_img01.jpg" alt="이벤트 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <!-- 진행예정 state01 진행중 state02 종료 state03 클래스-->
                                <span class="state02"></span>
                                <span class="date font_gray">2024.03.20 ~ 2024.05.16</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../event/detail.html">
                            <div class="list_img">
                                <img src="../images/event_test_img01.jpg" alt="이벤트 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <!-- 진행예정 state01 진행중 state02 종료 state03 클래스-->
                                <span class="state02"></span>
                                <span class="date font_gray">2024.03.20 ~ 2024.05.16</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../event/detail.html">
                            <div class="list_img">
                                <img src="../images/event_test_img01.jpg" alt="이벤트 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <!-- 진행예정 state01 진행중 state02 종료 state03 클래스-->
                                <span class="state02"></span>
                                <span class="date font_gray">2024.03.20 ~ 2024.05.16</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../event/detail.html">
                            <div class="list_img">
                                <img src="../images/event_test_img02.jpg" alt="이벤트 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <!-- 진행예정 state01 진행중 state02 종료 state03 클래스-->
                                <span class="state03"></span>
                                <span class="date font_gray">2024.03.20 ~ 2024.05.16</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../event/detail.html">
                            <div class="list_img">
                                <img src="../images/event_test_img02.jpg" alt="이벤트 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <!-- 진행예정 state01 진행중 state02 종료 state03 클래스-->
                                <span class="state03"></span>
                                <span class="date font_gray">2024.03.20 ~ 2024.05.16</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../event/detail.html">
                            <div class="list_img">
                                <img src="../images/event_test_img02.jpg" alt="이벤트 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <!-- 진행예정 state01 진행중 state02 종료 state03 클래스-->
                                <span class="state03"></span>
                                <span class="date font_gray">2024.03.20 ~ 2024.05.16</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../event/detail.html">
                            <div class="list_img">
                                <img src="../images/event_test_img02.jpg" alt="이벤트 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <!-- 진행예정 state01 진행중 state02 종료 state03 클래스-->
                                <span class="state03"></span>
                                <span class="date font_gray">2024.03.20 ~ 2024.05.16</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../event/detail.html">
                            <div class="list_img">
                                <img src="../images/event_test_img02.jpg" alt="이벤트 대표 이미지">
                            </div>
                            <div class="list_txt">
                                <!-- 진행예정 state01 진행중 state02 종료 state03 클래스-->
                                <span class="state03"></span>
                                <span class="date font_gray">2024.03.20 ~ 2024.05.16</span>
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
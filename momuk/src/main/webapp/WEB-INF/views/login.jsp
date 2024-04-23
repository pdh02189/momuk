<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${ctx}/resources/css/login.css">
<%@ include file="include/header.jsp" %>

            <div class="main_content">
                <div class="sub_nav">
                    <a href="index.jsp" class="font_gray">홈</a>
                    <a href="login.jsp">로그인</a>
                </div>
                <div class="sub_tit">
                    <h3>로그인</h3>
                </div>
                <div class="login_box">
                    <form>
                        <div class="write_box input_id">
                            <input type="text" placeholder="아이디">
                        </div>
                        <div class="write_box input_pw">
                            <input type="password" placeholder="비밀번호">
                        </div>
                        <div class="id_save">
                            <input type="checkbox" id="id_check">
                            <label for="id_check" class="font_gray">
                                아이디 저장
                            </label>
                        </div>
                        <div class="login_btn_wrap">
                            <button type="submit" class="btn_red">로그인</button>
                            <button type="button" class="btn_red2" onclick="location.href='join.jsp'">회원가입</button>
                        </div>
                    </form>

                    <div class="sns_login">
                        <div class="sns_login_tit">
                            <span>SNS 계정으로 로그인</span> 
                        </div>
                        <ul class="sns_login_con">
                            <li>
                                <a href="#" class="btn_kakao"></a>
                            </li>
                            <li>
                                <a href="#" class="btn_naver"></a>
                            </li>
                            <li>
                                <a href="#" class="btn_google"></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
<%@ include file="include/footer.jsp" %>
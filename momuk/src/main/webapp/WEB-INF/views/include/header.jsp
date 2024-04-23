<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오늘뭐먹지?</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/variable/pretendardvariable.css" />
    <link href="https://webfontworld.github.io/sandbox/SBAggro.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/resources/css/reset.css">
    <link rel="stylesheet" href="${ctx}/resources/css/layout.css">
    <link rel="stylesheet" href="${ctx}/resources/css/common.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="${ctx}/resources/js/main.js"></script>
</head>
<body>
	<c:set var="ctx" value="${pageContext.request.contextPath == '/' ? '': pageContext.request.contextPath}" scope="application"/>
    <div id="wrapper"> <!-- 로그인 시 login 관리자 로그인 시 admin 클래스 붙음 -->
        <!-- 모바일 검색 팝업 -->
        <div class="m_search_popup">
            <div class="m_search_popup_inner">
                <form>
                    <fieldset>
                        <legend class="d_none">검색</legend>
                        <input type="text" placeholder="검색어를 입력하세요">
                        <button type="button" class="btn_search" onclick="location.href='searchresult.jsp'">검색</button>
                    </fieldset>
                </form>
            </div>
        </div>
        <header>
            <h2 class="d_none">헤더 영역</h2>
            <div class="header_inner">
                <a href="index.jsp" class="header_logo"></a>
                <div class="search_box">
                    <form>
                        <fieldset>
                            <legend class="d_none">검색</legend>
                            <input type="text" placeholder="검색어를 입력하세요">
                            <button type="button" class="btn_search" onclick="location.href='searchresult.jsp'">검색</button>
                        </fieldset>
                    </form>
                </div>
                <div class="my_wrap">
                    <ul class="top">
                        <li class="join">
                            <a href="join.jsp">회원가입</a>
                        </li>
                        <li class="login">
                            <a href="login.jsp">로그인</a>
                        </li>
                        <li class="logout">
                            <a href="#">로그아웃</a>
                        </li>
                    </ul>
                    <ul class="my">
                        <li class="mypage">
                            <a href="mypage/myinfo.jsp">마이페이지</a>
                        </li>
                        <li class="cart">
                            <a href="mypage/cart.jsp">장바구니</a>
                        </li>
                        <li class="delivery">
                            <a href="mypage/delivery.jsp">배송조회</a>
                        </li>
                    </ul>
                </div>
                <div class="mobile_menu">
                    <div class="search_btn"></div>
                    <div class="header_btn">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </div>
            </div>
            <nav class="gnb">
                <h3 class="d_none">글로벌 네비게이션 영역</h3>
                <ul>
                    <li>
                        <a href="store/index.jsp">스토어</a>
                    </li>
                    <li>
                        <a href="recipe/index.jsp">레시피</a>
                    </li>
                    <li>
                        <a href="cookingtip/index.jsp">요리 꿀팁</a>
                    </li>
                    <li>
                        <a href="ranking/index.jsp">랭킹</a>
                    </li>
                    <li>
                        <a href="event/index.jsp">이벤트</a>
                    </li>
                </ul>
            </nav>
            <div class="mobile_menu">
                <div class="side_menu">
                    <div class="menu_wrap">
                        <ul class="menu_list">
                            <li>
                                <a href="store/index.jsp" class="menu_depth1">스토어</a>
                            </li>
                            <li>
                                <a href="recipe/index.jsp" class="menu_depth1">레시피</a>
                            </li>
                            <li>
                                <a href="cookingtip/index.jsp" class="menu_depth1">요리 꿀팁</a>
                            </li>
                            <li>
                                <a href="ranking/index.jsp" class="menu_depth1">랭킹</a>
                            </li>
                            <li>
                                <a href="event/index.jsp" class="menu_depth1">이벤트</a>
                            </li>
                            <li class="btn_zone">
                                <a href="login.jsp" class="login btn_red">로그인</a>
                                <a href="join.jsp" class="join btn_white">회원가입</a>
                                <a href="mypage/myinfo.jsp" class="mypage btn_red">마이페이지</a>
                                <a href="#" class="logout btn_white">로그아웃</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
        <div class="m_dim"></div>

        <main>
            <h2 class="d_none">메인 영역</h2>
            
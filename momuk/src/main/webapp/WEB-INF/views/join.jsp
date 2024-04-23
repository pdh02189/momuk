<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${ctx}/resources/css/join.css">
<%@ include file="include/header.jsp" %>

            <div class="main_content">
                <div class="sub_nav">
                    <a href="index.jsp" class="font_gray">홈</a>
                    <a href="join.jsp">회원가입</a>
                </div>
                <div class="sub_tit">
                    <h3>회원가입</h3>
                </div>
                <div class="join_box">
                    <form>
                        <div class="basic_info">
                            <div class="join_tit">
                                <h4>기본정보</h4>
                                <p>표시는 반드시 입력하셔야 합니다.</p>
                            </div>
                            <div class="comm_write_con">
                                <div class="comm_write_box">
                                    <div class="tit_box">
                                        <h3 class="important">아이디</h3>
                                    </div>
                                    <div class="cont_box">
                                        <input type="text" class="w500" placeholder="영문소문자/숫자, 4~16자">
                                        <span class="idcheck"><strong>asdfasdf</strong>(은)는 사용 가능한 아이디 입니다.</span>
                                    </div>
                                </div>
                                <div class="comm_write_box">
                                    <div class="tit_box">
                                        <h3 class="important">비밀번호</h3>
                                    </div>
                                    <div class="cont_box">
                                        <input type="password" class="w500" placeholder="영문(대소문자구분)/숫자/특수문자 중 2가지 이상조합, 8자~16자">
                                    </div>
                                </div>
                                <div class="comm_write_box">
                                    <div class="tit_box">
                                        <h3 class="important">비밀번호 확인</h3>
                                    </div>
                                    <div class="cont_box">
                                        <input type="password" class="w500">
                                        <span class="pwcheck font_red">비밀번호가 일치하지 않습니다.</span>
                                    </div>
                                </div>
                                <div class="comm_write_box">
                                    <div class="tit_box">
                                        <h3 class="important">이름</h3>
                                    </div>
                                    <div class="cont_box">
                                        <input type="text" class="w500">
                                    </div>
                                </div>
                                <div class="comm_write_box">
                                    <div class="tit_box">
                                        <h3>주소</h3>
                                    </div>
                                    <div class="cont_box">
                                        <div class="address">
                                            <div class="address_box w500">
                                                <input type="text" class="w390">
                                                <button type="button" class="w100">우편번호</button>
                                            </div>
                                            <input type="text" class="w500" placeholder="기본주소">
                                            <input type="text" class="w500" placeholder="나머지주소">
                                        </div>
                                    </div>
                                </div>
                                <div class="comm_write_box">
                                    <div class="tit_box">
                                        <h3>휴대전화</h3>
                                    </div>
                                    <div class="cont_box tel">
                                        <select class="w100">
                                            <option value="1">010</option>
                                            <option value="2">011</option>
                                            <option value="3">016</option>
                                            <option value="4">017</option>
                                            <option value="5">018</option>
                                            <option value="6">019</option>
                                        </select>
                                        <span class="ml10 mr10">-</span>
                                        <input type="text" class="w100">
                                        <span class="ml10 mr10">-</span>
                                        <input type="text" class="w100">
                                    </div>
                                </div>
                                <div class="comm_write_box">
                                    <div class="tit_box">
                                        <h3>성별</h3>
                                    </div>
                                    <div class="cont_box">
                                        <p class="state">
                                            <label>
                                                <input type="radio" name="gender" checked="">
                                                <span>선택안함</span>
                                            </label>
                                        </p>
                                        <p class="state">
                                            <label>
                                                <input type="radio" name="gender">
                                                <span>남성</span>
                                            </label>
                                        </p>
                                        <p class="state">
                                            <label>
                                                <input type="radio" name="gender">
                                                <span>여성</span>
                                            </label>
                                        </p>
                                    </div>
                                </div>
                                <div class="comm_write_box">
                                    <div class="tit_box">
                                        <h3>생년월일</h3>
                                    </div>
                                    <div class="cont_box">
                                        <input type="date" class="w390" max="9999-12-31">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="check_info">
                            <div class="join_tit">
                                <h4>약관동의</h4>
                            </div>
                            <div class="comm_write_con">
                                <div class="comm_write_box">
                                    <label for="check1-1">
                                        <input type="checkbox" id="check1-1">
                                        <span>이용약관 및 개인정보수집 및 이용에 모두 동의합니다.</span>
                                    </label>
                                </div>
                                <div class="comm_write_box">
                                    <label for="check1-2">
                                        <input type="checkbox" id="check1-2">
                                        <span>[필수] 이용약관 동의</span>
                                    </label>
                                    <div class="arrow_btn">
                                        <img src="${ctx}/resources/images/ic_arrow2.png" alt="접고 펼치기 버튼">
                                    </div>
                                    <div class="terms_cont">
                                        <p>
                                            제 1장 총 칙<br>
                                            <br>
                                            1. 개인정보란 생존하는 개인에 관한 정보로서 당해 정보에 포함 되어 있는 성명, 주민등록번호 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보 (당해 정</p>
                                    </div>
                                </div>
                                <div class="comm_write_box">
                                    <label for="check1-3">
                                        <input type="checkbox" id="check1-3">
                                        <span>[필수] 개인정보 수집 및 이용 동의</span>
                                    </label>
                                    <div class="arrow_btn">
                                        <img src="${ctx}/resources/images/ic_arrow2.png" alt="접고 펼치기 버튼">
                                    </div>
                                    <div class="terms_cont">
                                        <p>
                                            제 1장 총 칙<br>
                                            <br>
                                            1. 개인정보란 생존하는 개인에 관한 정보로서 당해 정보에 포함 되어 있는 성명, 주민등록번호 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보 (당해 정</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="joinbtn">
                            <button type="submit" class="btn_red">회원가입</button>
                        </div>
                    </form>
                </div>
            </div>
<%@ include file="include/footer.jsp" %>
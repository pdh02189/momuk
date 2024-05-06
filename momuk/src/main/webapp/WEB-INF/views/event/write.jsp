<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${ctx}/resources/summernote/summernote-lite.css">
<script src="${ctx}/resources/js/writeform.js"></script>
<script src="${ctx}/resources/summernote/summernote-lite.js"></script>
<script src="${ctx}/resources/summernote/summernote-ko-KR.js"></script>
            <div class="main_content">
                <div class="sub_nav">
                    <a href="../index.html" class="font_gray">홈</a>
                    <a href="../event/index.html">이벤트</a>
                </div>
                <div class="sub_tit">
                    <h3>이벤트 등록</h3>
                </div>
                <div class="write_box">
                    <form>
                        <div class="write_tit">
                            <p>표시는 반드시 입력하셔야 합니다.</p>
                        </div>
                        <div class="comm_write_con">
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">제목</h3>
                                </div>
                                <div class="cont_box">
                                    <input type="text" class="w100p" placeholder="제목을 입력하세요">
                                </div>
                            </div>
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">기간</h3>
                                </div>
                                <div class="cont_box period nowrap">
                                    <input type="date" class="w390" max="9999-12-31">
                                    <span class="ml10 mr10">~</span> 
                                    <input type="date" class="w390" max="9999-12-31">
                                </div>
                            </div>
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">내용</h3>
                                </div>
                                <div class="cont_box">
                                    <textarea id="summernote" class="summernote_txt w100p">
                                    </textarea>
                                </div>
                            </div>
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">대표사진</h3>
                                </div>
                                <div class="cont_box">
                                    <div class="imgBox">
                                        <input class="upload-photo" value="" placeholder="">
                                        <label>
                                            <img src="../images/ic_cam.png" alt="사진 첨부">
                                            사진 첨부
                                            <input type="file" class="imageSelector" name="imageSelector" accept="image/*">
                                        </label>
                                        <div class="thumb">
                                            <img src="">
                                            <button type="button" class="dellink"></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="comm_write_btn_wrap">
                            <button type="button" class="btn_white">취소</button>
                            <button type="submit" class="btn_red">등록</button>
                        </div>
                    </form>
                </div>
            </div>
<%@ include file="../include/footer.jsp" %>
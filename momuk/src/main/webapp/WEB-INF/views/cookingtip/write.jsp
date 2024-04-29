<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${ctx}/resources/summernote/summernote-lite.css">
<script src="${ctx}/resources/js/writeform.js"></script>
<script src="${ctx}/resources/summernote/summernote-lite.js"></script>
<script src="${ctx}/resources/summernote/summernote-ko-KR.js"></script>
            <div class="main_content">
                <div class="sub_nav">
                    <a href="../index.html" class="font_gray">홈</a>
                    <a href="../cookingtip/index.html">요리 꿀팁</a>
                </div>
                <div class="sub_tit">
                    <h3>요리꿀팁 작성</h3>
                </div>
                <div class="write_box">
                    <form action="${contextPath}/board/register" method="post">
                        <div class="write_tit">
                            <p>표시는 반드시 입력하셔야 합니다.</p>
                        </div>
                        <div class="comm_write_con">
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">카테고리</h3>
                                </div>
                                <div class="cont_box">
                                    <select class="w220" name="category">
                                        <option>카테고리 선택</option>
                                        <option value="손질법">손질법</option>
                                        <option value="보관법">보관법</option>
                                        <option value="요리정보">요리정보</option>
                                        <option value="기타정보">기타정보</option>
                                     </select>
                                </div>
                            </div>
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">제목</h3>
                                </div>
                                <div class="cont_box">
                                    <input type="text" class="w100p" placeholder="제목을 입력하세요" name="title">
                                </div>
                            </div>
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">내용</h3>
                                </div>
                                <div class="cont_box">
                                    <textarea id="summernote" class="summernote_txt w100p" name="content">
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
                                            <img src="${ctx}/resources/images/ic_cam.png" alt="사진 첨부">
                                            사진 첨부
                                            <input type="file" class="imageSelector" name="uploadFile" accept="image/jpeg, image/jpg, image/png" multiple="">
                                        </label>
                                        <div class="thumb d_none">
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${ctx}/resources/css/recipe.css">
<link rel="stylesheet" href="${ctx}/resources/summernote/summernote-lite.css">
<script src="${ctx}/resources/js/writeform.js"></script>
<script src="${ctx}/resources/summernote/summernote-lite.js"></script>
<script src="${ctx}/resources/summernote/summernote-ko-KR.js"></script>

            <div class="main_content">
                <div class="sub_nav">
                    <a href="${ctx}/" class="font_gray">홈</a>
                    <a href="${ctx}/recipe/list">레시피</a>
                </div>
                <div class="sub_tit">
                    <h3>레시피 작성</h3>
                </div>
                <div class="write_box">
                    <form role="form" action="${contextPath}/recipe/write" method="post" enctype="multipart/form-data">
                        <div class="write_tit">
                            <p>표시는 반드시 입력하셔야 합니다.</p>
                        </div>
                        <div class="comm_write_con">                           
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">제목</h3>
                                </div>
                                <div class="cont_box">
                                    <input type="text" class="w700" placeholder="제목을 입력하세요" name="title">
                                </div>
                            </div>
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3>요리소개</h3>
                                </div>
                                <div class="cont_box">
                                    <textarea placeholder="요리소개를 입력하세요" class="w100p h80" name="infotext"></textarea>
                                </div>
                            </div>
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">카테고리</h3>
                                </div>
                                <div class="cont_box">
                                    <select class="w220" name="category">
                                        <option value="0">카테고리 선택</option>
                                        <option value="1">신선식품</option>
                                        <option value="2">간편식</option>
                                        <option value="3">가공식품</option>
                                        <option value="4">주방용품</option>
                                        <option value="5">주방가전</option>
                                    </select>
                                </div>
                            </div>
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">요리정보</h3>
                                </div>
                                <div class="cont_box recipe_info">
                                    <select class="w220" name="serving">
                                        <option value="0">분량 선택</option>
                                        <option value="1">1인분</option>
                                        <option value="2">2인분</option>
                                        <option value="3">3인분</option>
                                        <option value="4">4인분</option>
                                        <option value="5">5인분</option>
                                        <option value="6">6인분 이상</option>
                                    </select>
                                    <select class="w220" name="difficulty">
                                        <option value="0">난이도 선택</option>
                                        <option value="1">아무나</option>
                                        <option value="2">초급</option>
                                        <option value="3">중급</option>
                                        <option value="4">고급</option>
                                        <option value="5">요리왕</option>
                                    </select>
                                    <select class="w220" name="cookingtime">
                                        <option value="0">소요시간 선택</option>
                                        <option value="1">5분이내</option>
                                        <option value="2">10분이내</option>
                                        <option value="3">15분이내</option>
                                        <option value="4">20분이내</option>
                                        <option value="5">30분이내</option>
                                        <option value="6">60분이내</option>
                                        <option value="7">90분이내</option>
                                        <option value="8">2시간이내</option>
                                        <option value="9">2시간이상</option>
                                    </select>
                                </div>
                            </div>
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">재료</h3>
                                </div>
                                <div class="cont_box">
                                    <ul class="ingredient_list">
                                        <li>
                                            <input type="text" class="w400" name="ingredient_name_1" placeholder="예&#41; 돼지고기">
                                            <input type="text" class="w220" name="ingredient_measurement_1" placeholder="예&#41; 600g">
                                            <button type="button" class="btn_list_del"></button>
                                        </li>
                                        <li>
                                            <input type="text" class="w400" name="ingredient_name_2" placeholder="예&#41; 돼지고기">
                                            <input type="text" class="w220" name="ingredient_measurement_2" placeholder="예&#41; 600g">
                                            <button type="button" class="btn_list_del"></button>
                                        </li>
                                        <li>
                                            <input type="text" class="w400" name="ingredient_name_3" placeholder="예&#41; 돼지고기">
                                            <input type="text" class="w220" name="ingredient_measurement_3" placeholder="예&#41; 600g">
                                            <button type="button" class="btn_list_del"></button>
                                        </li>
                                    </ul>
                                    <button type="button" class="btn_list_plus">재료 추가</button>
                                </div>
                            </div>
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">조리순서</h3>
                                </div>
                                <div class="cont_box">
                                    <ul class="recipe_step">
                                        <li>
                                            <textarea placeholder="조리순서를 단계별로 입력하세요" class="h120"></textarea>
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
                                        </li>
                                    </ul>
                                    <button type="button" class="btn_step_plus">조리순서 추가</button>
                                </div>
                            </div>
                            <div class="comm_write_box">
                                <div class="tit_box">
                                    <h3 class="important">레시피 대표사진</h3>
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

<script>
$(document).ready(function() {
    let ingredientCount = 3; // 초기 입력란 개수

    // 재료 입력란 추가
    $(".btn_list_plus").click(function() {
        ingredientCount++;
        let newIngredientHtml = `
            <li>
                <input type="text" class="w400" name="ingredient_name_${ingredientCount}" placeholder="예&#41; 돼지고기">
                <input type="text" class="w220" name="ingredient_measurement_${ingredientCount}" placeholder="예&#41; 600g">
                <button type="button" class="btn_list_del"></button>
            </li>
        `;
        $(".ingredient_list").append(newIngredientHtml);
    });

    // 재료 입력란 삭제
    $(document).on("click", ".btn_list_del", function() {
        $(this).closest("li").remove();
        // 삭제된 입력란 이후의 모든 입력란의 이름 업데이트
        let inputs = $(".ingredient_list input[type='text']");
        inputs.each(function(index) {
            let num = index + 1;
            $(this).attr("name", `ingredient_name_${num}`);
            $(this).next().attr("name", `ingredient_measurement_${num}`);
        });
        ingredientCount--; // 재료 개수 업데이트
    });
});
</script>


<%@ include file="../include/footer.jsp" %>
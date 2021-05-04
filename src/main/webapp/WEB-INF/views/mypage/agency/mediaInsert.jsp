<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/mypage/agency/mediaInsert.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
	<section class="media-form-container pop-up">
		<div class="black-back"></div>
        <form id="mediaForm" class="media-form pop-up-form" onsubmit="return check();"
        action="${ contextPath }/mypage/insertMedia" method="POST" enctype="multipart/form-data">
        	<span class="pop-up-text nanumsquare">미디어 등록</span>
        	<br><br>
        	<div class="center">
	        	<table class="media-insert-table" class="nanumsquare">
	            	<colgroup>
	                    <col width="40%"/>
	                    <col width="60%"/>
	                </colgroup>
	                <tr class="nanumsquare">
	                	<td>소속 아티스트&nbsp;&nbsp;</td>
	                	<td>
	                		<span class="arti-name-span">${ artiName }</span>
	                		<input type="hidden" name="artiNameEn" value="${ artiName }">
	                	</td>
	                </tr>
	                <tr class="nanumsquare">
	                	<td>카테고리&nbsp;&nbsp;</td>
	                	<td>
	                		<select id="insertMediaCategory" class="category-box nanumsquare" name="cateName">
                                <option value="">카테고리 선택</option>
                                <c:forEach var="cate" items="${ cate }">
                                <option value="${ cate.cateName }">${ cate.cateName }</option>
                                </c:forEach>
                            </select>
	                	</td>
	                </tr>
	                <tr class="nanumsquare">
	                	<td>카테고리 추가&nbsp;&nbsp;</td>
	                	<td>
	                		<input id="addCate" type="text" name="addCate">
	                	</td>
	                </tr>
	                <tr class="nanumsquare">
	                	<td>제목&nbsp;&nbsp;</td>
	                	<td>
	                		<input type="text" name="mediaTtl">
	                	</td>
	                </tr>
	                <tr class="nanumsquare">
	                	<td>가격&nbsp;&nbsp;</td>
	                	<td>
	                		<input type="number" name="mediaPay" value=0>
	                	</td>
	                </tr>
	                <tr class="nanumsquare">
	                	<td>썸네일&nbsp;&nbsp;</td>
	                	<td>
	                		<input id="thumbLabel" type="text" disabled="disabled">
							<label class="upload-label nanumsqure" for="thumbnail">찾아보기</label>
	                		<input id="thumbnail" type="file" class="file-input" name="picName">
	                	</td>
	                </tr>
	                <tr class="nanumsquare">
	                	<td>첨부영상&nbsp;&nbsp;</td>
	                	<td>
	                		<input id="videoLabel" type="text" disabled="disabled">
							<label class="upload-label nanumsqure" for="video">찾아보기</label>
	                		<input id="video" type="file" class="file-input" name="vidName">
	                	</td>
	                </tr>
	                <tr class="nanumsquare">
	                	<td>세부 설명&nbsp;&nbsp;</td>
	                	<td>
	                		<textarea name="mediaCtt" class="media-text nanumsquare" style="resize:none;"></textarea>
                            <span class="count-num count-right">/1000</span><span class="text-count count-num">0</span>
	                	</td>
	                </tr>
	            </table>
            </div>
            <div class="btn-area">
                <button id="mediaInsertBtn" class="enroll-cancel-btn pink-btn nanumsquare">등록하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
                <input id="mediaInsertCancelBtn" class="enroll-cancel-btn blue-btn nanumsquare" type="reset" value="취소하기">
            </div>
        </form>
    </section>
    
    <script>
 	// 글자수 제한
	$(document).ready(function() {
	    $(".media-text").keyup(function() {
	        var inputLength = $(this).val().length;
	        $(".text-count").html(inputLength);
	        var remain = 1000 - inputLength;
	
	        if(remain >= 0) {
	            $(".text-count").css("color", "#ACACAC");
	        } else {
	            $(".text-count").css("color", "red");
	        }
	    });
	});
 	
 	// 폼 등록에 관한 유효성 검사
 	function check() {
 		if($("#insertMediaCategory").val() == "" && $("input[name=addCate]").val() == "") {
 			alert("카테고리를 등록해주세요.");
 			return false;
 		} else if($("#insertMediaCategory").val() == $("input[name=addCate]").val()) {
 			alert("존재하는 카테고리입니다.");
 			return false;
 		} else if($("#insertMediaCategory").val() != "" && $("input[name=addCate]").val() != "") {
 			alert("카테고리를 하나만 입력해주세요.");
 			return false;
 		}
 		
 		if($("input[name=mediaTtl]").val() == "") {
 			alert("제목을 입력해주세요.");
 			$("input[name=mediaTtl]").focus();
 			return false;
 		}
 		
 		if($("input[name=picName]").val() == "") {
 			alert("썸네일을 등록해주세요.");
 			return false;
 		}
 		
 		if($("input[name=vidName]").val() == "") {
 			alert("첨부 영상을 등록해주세요.");
 			return false;
 		}
 		
 		if($(".media-text").val() == "") {
 			alert("세부 설명을 입력해주세요.");
 			return false;
 		}
 		
 		alert("미디어가 정상적으로 등록되었습니다");
 	}
	
	// 미디어 등록하기 팝업 취소하기 버튼 클릭할 때
	$("#mediaInsertCancelBtn").click(function() {
		$(".media-form-container").css("display", "none");
	});
    </script>
</body>
</html>
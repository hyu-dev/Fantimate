<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/mypage/agency/mediaInsert.css">
</head>
<body>
	<section class="media-form-container pop-up">
		<div class="black-back"></div>
        <form id="mediaForm" class="media-form pop-up-form" action="${ contextPath }/mypage/insertMedia" method="POST" enctype="multipart/form-data">
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
                                <c:forEach var="mc" items="${ media }">
                                <option value="${ mc.category.cateName }">${ mc.category.cateName }</option>
                                </c:forEach>
                            </select>
	                	</td>
	                </tr>
	                <tr class="nanumsquare">
	                	<td>카테고리 추가&nbsp;&nbsp;</td>
	                	<td>
	                		<input type="text" name="addCate">
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
	                		<input type="number" name="mediaPay" placeholder="0">
	                	</td>
	                </tr>
	                <tr class="nanumsquare">
	                	<td>썸네일&nbsp;&nbsp;</td>
	                	<td>
	                		<input class="sub-button" type="text" disabled="disabled">
							<label class="upload-label nanumsqure" for="thumbnail">찾아보기</label>
	                		<input id="thumbnail" type="file" class="file-input" name="picName">
	                	</td>
	                </tr>
	                <tr class="nanumsquare">
	                	<td>첨부영상&nbsp;&nbsp;</td>
	                	<td>
	                		<input class="sub-button" type="text" disabled="disabled">
							<label class="upload-label nanumsqure" for="video">찾아보기</label>
	                		<input id="video" type="file" class="file-input" name="vidName">
	                	</td>
	                </tr>
	                <tr class="nanumsquare">
	                	<td>세부 설명&nbsp;&nbsp;</td>
	                	<td>
	                		<textarea onkeyup="chkword(this, 1000)" name="mediaCtt" class="media-text" style="resize:none;"></textarea>
                            <div class="limit-text">0 / 1000</div>
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
	 function chkword(obj, maxlength) {
	     let str = obj.value; // 이벤트가 일어난 컨트롤의 value 값
	     let str_length = str.length; // 전체길이
	     // 변수초기화     
	     let max_length = maxlength; // 제한할 글자수 크기
	     let i = 0; // for문에 사용     
	     let ko_byte = 0; // 한글일경우는 2 그밗에는 1을 더함     
	     let li_len = 0; // substring하기 위해서 사용     
	     let one_char = ""; // 한글자씩 검사한다 
	     let str2 = ""; // 글자수를 초과하면 제한할수 글자전까지만 보여준다.
	     for (i = 0; i < str_length; i++) {
	         // 한글자추출 
	         one_char = str.charAt(i);             
	         ko_byte++;
	         $('.limit-text').text(ko_byte + " / 1000");
	     }           
	     // 전체 크기가 max_length를 넘지않으면         
	     if (ko_byte <= max_length) {             
	         li_len = i + 1;         
	     }            
	     // 전체길이를 초과하면     
	     if (ko_byte > max_length) {         
	         alert(max_length + " 글자 이상 입력할 수 없습니다. \n 초과된 내용은 자동으로 삭제 됩니다. ");         
	         str2 = str.substr(0, max_length);         
	         obj.value = str2;     
	         $('.limit-text').text("1000 / 1000");
	     }     
	     obj.focus(); 
	 }  
    </script>
</body>
</html>
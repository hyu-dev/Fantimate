<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <form id="mediaForm" class="media-form pop-up-form" action="${ contextPath }/mypage/agency/media" method="POST" enctype="multipart/form-data">
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
	                		<input type="text" name="soloId">
	                	</td>
	                </tr>
	                <tr class="nanumsquare">
	                	<td>카테고리&nbsp;&nbsp;</td>
	                	<td>
	                		<input type="text" name="soloPwd">
	                	</td>
	                </tr>
	                <tr class="nanumsquare">
	                	<td>카테고리 추가&nbsp;&nbsp;</td>
	                	<td>
	                		<input type="text" name="soloRePwd">
	                	</td>
	                </tr>
	                <tr class="nanumsquare">
	                	<td>제목&nbsp;&nbsp;</td>
	                	<td>
	                		<input type="text" name="soloArtiName">
	                	</td>
	                </tr>
	                <tr class="nanumsquare">
	                	<td>썸네일&nbsp;&nbsp;</td>
	                	<td>
	                		<input class="sub-button" type="text" disabled="disabled">
							<label class="upload-label nanumsqure" for="thumbnail">찾아보기</label>
	                		<input id="thumbnail" type="file" class="file-input" name="soloName">
	                	</td>
	                </tr>
	                <tr class="nanumsquare">
	                	<td>첨부영상&nbsp;&nbsp;</td>
	                	<td>
	                		<input class="sub-button" type="text" disabled="disabled">
							<label class="upload-label nanumsqure" for="video">찾아보기</label>
	                		<input id="video" type="file" class="file-input" name="soloArtiNickname">
	                	</td>
	                </tr>
	                <tr class="nanumsquare">
	                	<td>세부 설명&nbsp;&nbsp;</td>
	                	<td>
	                		<input type="text" name="soloAttClName">
	                	</td>
	                </tr>
	            </table>
            </div>
            <div class="btn-area">
                <button id="mediaInsertBtn" class="enroll-cancel-btn pink-btn nanumsquare" type="button">등록하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
                <input id="mediaInsertCancelBtn" class="enroll-cancel-btn blue-btn nanumsquare" type="reset" value="취소하기">
            </div>
        </form>
    </section>
</body>
</html>
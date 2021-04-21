<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
 <div class="post-outer">
                <div class="introArea">
                    <p class="post-intro">포스트 쓰기</p>    
                </div>
                
                
                
                <!-- 포스트 작성 -->
                <form action="${ contextPath }/fanfeed/insert" method="post" enctype="multipart/form-data">
                    <c:forEach var="at" items="${ atlist }">
                    <c:if test="${ loginUser.id eq at.id }">
                    <div class="postArea">
                    <input type="hidden" name="writer" value="${ loginUser.id }">
                    <input type="hidden" name="artiName" value="${ param.artNameEn }"> 
                     
                   	<!-- 로그인한 유저의 프로필 불러오기 -->
                    <img src="${ contextPath }/resources/uploadFiles/${ at.attSvName }" class="post-icon" alt="이미지">
                     
                    <textarea class="textArea" placeholder="FANTIMATE에 남겨보세요" name="fcontent"></textarea>
                    <img src="../resources/icon/photo-icon.png" class="photo-icon">
                    </div>
                    </c:if>
                    </c:forEach>
                    <!-- 이미지 미리보기 영역 -->
                     <div class="my-photo">
                        
                        <label for="mainPhoto" class="main-photo" style="display: none;">
                        <input id="mainPhoto" class="photo" type="file" name="uploadFile1" style="display: none;">
                        <input type="hidden" name="oneClName" value="${ at.attClName }">
						<input type="hidden" name="oneSvName" value="${ at.attSvName }">
                        </label>
                        
                        <label for="addPhoto" class="add-photo click-btn" style="display: none;">
                        <input id='addPhoto' class='photo' type='file' name='uploadFile2' style='display: none;'>
                        <input type="hidden" name="twoClName" value="${ at.attClName }">
						<input type="hidden" name="twoSvName" value="${ at.attSvName }">
                        <p class="plus">+</p>
                        </label>
                        
                        
                        <label for="addPhoto1" class="add-photo1 click-btn" style="display: none;">
                        <input id='addPhoto1' class='photo' type='file' name='uploadFile3' style='display: none;'>
                        <input type="hidden" name="threeClName" value="${ at.attClName }">
						<input type="hidden" name="threeSvName" value="${ at.attSvName }">
                        <p class="plus">+</p>
                        </label>
                        
                        <label for="addPhoto2" class="add-photo2 click-btn" style="display: none;">
                        <input id='addPhoto2' class='photo' type='file' name='uploadFile4' style='display: none;'>
                        <input type="hidden" name="fourClName" value="${ at.attClName }">
						<input type="hidden" name="fourSvName" value="${ at.attSvName }">
                        <p class="plus">+</p>
                        </label>
                    </div> 
                    
                
                    
                    <hr width="85%">
                    <br>
                    <div class="btnArea">
                    <button type="submit" class="post-insert-btn">등록하기</button>
                    </div>
                    <br>
                </form>
                 
             </div>
</body>
</html>
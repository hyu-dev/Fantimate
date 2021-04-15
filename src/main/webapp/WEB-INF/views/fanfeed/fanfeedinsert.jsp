<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div class="post-outer">
                <div class="introArea">
                    <p class="post-intro">포스트 쓰기</p>    
                </div>
                
                
                <c:forEach var="fc" items="${ flist }">
                <!-- 포스트 작성 -->
                <form action="${ contextPath }/fanfeed/insert" method="post" enctype="multipart/form-data">
                    <div class="postArea">
                    <input type="hidden" name="writer" value="${ loginUser.id }">
                    <input type="hidden" name="artiName" value="${ param.artNameEn }"> 
                     
                   	
                    <img src="${ contextPath }/resources/uploadFiles/${ fc.attachment.attSvName }" class="post-icon" alt="이미지">
                     
                    <textarea class="textArea" placeholder="FANTIMATE에 남겨보세요" name="fcontent"></textarea>
                    <img src="../resources/icon/photo-icon.png" class="photo-icon">
                    </div>
                    <!-- 이미지 미리보기 영역 -->
                     <div class="my-photo">
                        
                        <label for="mainPhoto" class="main-photo" style="display: none;">
                        <input id="mainPhoto" class="photo" type="file" name="uploadFile1" style="display: none;">
                        </label>
                        
                        <label for="addPhoto" class="add-photo click-btn" style="display: none;">
                        <input id='addPhoto' class='photo' type='file' name='uploadFile2' style='display: none;'>
                        <p class="plus">+</p>
                        </label>
                        
                        
                        <label for="addPhoto1" class="add-photo1 click-btn" style="display: none;">
                        <input id='addPhoto1' class='photo' type='file' name='uploadFile3' style='display: none;'>
                        <p class="plus">+</p>
                        </label>
                        
                        <label for="addPhoto2" class="add-photo2 click-btn" style="display: none;">
                        <input id='addPhoto2' class='photo' type='file' name='uploadFile4' style='display: none;'>
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
                 </c:forEach>
             </div>
</body>
</html>
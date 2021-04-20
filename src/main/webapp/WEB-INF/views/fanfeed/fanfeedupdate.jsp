<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/feed/fanFeedUpdate.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>게시글 수정</title>
</head>
<body>
<div class="post-outer">
                <div class="introArea">
                    <p class="post-intro">포스트 수정</p>    
                </div>
                
                
                <c:forEach var="f" items="${ list }">
                <!-- 포스트 작성 -->
                <form action="${ contextPath }/fanfeed/update" method="post" enctype="multipart/form-data">
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
                    <button type="submit" class="post-insert-btn">수정하기</button>
                    </div>
                    <br>
                </form>
                 </c:forEach>
             </div>

<!-- 포스트 작성 첨부파일 아이콘 클릭 시 이벤트 -->
    <script>
    $('.photo-icon').click(function(){
        $('.main-photo').click();
        $('.main-photo').toggle();
    });
    </script>

	<script>  
    // 사진 불러오기
     $(document).on('change', ".photo", function(e) {
	     let target = $(this)
	     let files = e.target.files;
	     let filesArr = Array.prototype.slice.call(files);
	     let mainImg = $("<img class='main-photo-img'>");
	     let mainInput = $("<input id='mainPhoto' class='photo' type='file' name='uploadFile1' style='display: none;'>");
	     let addImg = $("<img class='add-photo-img'>");
	     let addInput = $("<input id='addPhoto' class='photo' type='file' name='uploadFile2' style='display: none;'>");
	     let addImg1 = $("<img class='add-photo1-img'>");
	     let addInput1 = $("<input id='addPhoto1' class='photo' type='file' name='uploadFile3' style='display: none;'>");
	     let addImg2 = $("<img class='add-photo2-img'>");
	     let addInput2 = $("<input id='addPhoto2' class='photo' type='file' name='uploadFile4' style='display: none;'>");
	     let label = $(this).parent();
	     
	     let id = $(this).attr('id');
	
	     console.log(target.prev());
	     filesArr.forEach(function(f) {
	         if(!f.type.match("image.*")) {
	             alert("확장자는 이미지 확장자만 가능합니다");
	             return;
	         }
	         
	         let reader = new FileReader();
	         if(id == 'mainPhoto') {
	             // 첫번째 사진
	             reader.onload = function(e) {
	                // label.html('');
	                // input type= file 의 name 벨류 값 받아와야 함
	                // $('uploadFile1').val();
	               // let label = $('input[name="uploadFile1"]').val();
	                 mainImg.attr("src", e.target.result);
	                 label.append(mainImg);  
	         		 $('.add-photo').toggle();
	             }
	         } else if(id == 'addPhoto') {
	             // 두번째 사진
	             reader.onload = function(e) {
	                // label.html('');
	                 addImg.attr("src", e.target.result);
	                 label.append(addImg);
	                 $('.add-photo1').toggle();
	             }
	         } else if(id == 'addPhoto1'){
	        	 // 세번째 사진
	        	 reader.onload = function(e){
	        		// label.html('');
	        		 addImg1.attr("src", e.target.result);
	        		 label.append(addImg1);
	        		 $('.add-photo2').toggle();
	        	 }
	         } else if(id == 'addPhoto2'){
	        	 // 네번째 사진
	        	 reader.onload = function(e){
	        		// label.html('');
	        		 addImg2.attr("src", e.target.result);
	        		 label.append(addImg2);
	        		 
	        	 }
	         }
	         reader.readAsDataURL(f);
	     });
	 });  
	  </script>
</body>
</html>
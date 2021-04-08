<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/main/subscribe.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Subscribe</title>
    <script type="text/javascript">
        /* 파일 미리보기 */
        function previewImage(targetObj, filePreview) {
            var preview = document.getElementById(filePreview); //div id
            var ua = window.navigator.userAgent;

        //ie일때(IE8 이하에서만 작동)
            if (ua.indexOf("MSIE") > -1) {
                targetObj.select();
                try {
                    var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
                    var ie_preview_error = document.getElementById("ie_preview_error_" + filePreview);


                    if (ie_preview_error) {
                        preview.removeChild(ie_preview_error); //error가 있으면 delete
                    }

                    var img = document.getElementById(filePreview); //이미지가 뿌려질 곳

                    //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
                    img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
                } catch (e) {
                    if (!document.getElementById("ie_preview_error_" + filePreview)) {
                        var info = document.createElement("<p>");
                        info.id = "ie_preview_error_" + filePreview;
                        info.innerHTML = e.name;
                        preview.insertBefore(info, null);
                    }
                }
        //ie가 아닐때(크롬, 사파리, FF)
            } else {
                var files = targetObj.files;
                for ( var i = 0; i < files.length; i++) {
                    var file = files[i];
                    var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
                    if (!file.type.match(imageType))
                        continue;
                    var prevImg = document.getElementById("prev_" + filePreview); //이전에 미리보기가 있다면 삭제
                    if (prevImg) {
                        preview.removeChild(prevImg);
                    }
                    var img = document.createElement("img"); 
                    img.id = "prev_" + filePreview;
                    img.classList.add("obj");
                    img.file = file;
                    img.style.width = '150px'; 
                    img.style.height = '150px';
                    img.style.borderRadius = '50%';
                    preview.appendChild(img);
                    if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                        var reader = new FileReader();
                        reader.onloadend = (function(aImg) {
                            return function(e) {
                                aImg.src = e.target.result;
                            };
                        })(img);
                        reader.readAsDataURL(file);
                    } else { // safari is not supported FileReader
                        //alert('not supported FileReader');
                        if (!document.getElementById("sfr_preview_error_"
                                + filePreview)) {
                            var info = document.createElement("p");
                            info.id = "sfr_preview_error_" + filePreview;
                            info.innerHTML = "not supported FileReader";
                            preview.insertBefore(info, null);
                        }
                    }
                }
            }
        }
    </script>
</head>
<body>
<!-- 메시지 -->
	 <c:if test="${ !empty msg }">
		 <c:choose>
			 <c:when test="${ msg eq 'success'}">
			 	<script>
				    // CONFIRM 창으로 (피드로 이동하시겠습니까? Y:FEED , N:MAINPAGE)
				  /*   $(function(){
					    var result = confirm("구독이 완료 되었습니다! 팬피드로 이동하시겠어요?");
					    if(result == true){
					 	  location.href="${ contextPath }/fanfeed/fanFeedList?artNameEn="+${artNameEn};
					    } else {
						 location.href="${ contextPath }";
					    }
				    }); */
				    
				    alert("구독이 완료 되었습니다!");
				    location.href="${ contextPath }";
			    </script>
			 </c:when>
			 <c:when test="${ msg eq 'sameNickname'}">
			 	<script>
			 		alert("구독 닉네임이 중복합니다! 다시 입력해주세요.");
			 		location.href="${ contextPath }/main/subscribe?artNameEn="+${artNameEn};
			 	</script>
			 </c:when>
			 <c:otherwise>
			 	<script>
				    alert("구독 실패!");
			    </script>
			 </c:otherwise>
		</c:choose>
	</c:if>
	
	<form action="${ contextPath }/main/subscribe" method="post" enctype="multipart/form-data">
	    <section class="subscribe-section">
	        <p class="sub-title"><span>${ artNameEn } </span>피드에 사용할 닉네임을 입력하세요.</p>
	        <input type="hidden" name="artNameEn" value="${ artNameEn }">
	        <!-- 파일 첨부-->
	            <label class="file-label">
	                <span class="file-title">
	                                   이미지 선택
	                </span>
	                <input class="file-upload" id="fileInput" name="uploadFile" type="file" onchange="previewImage(this,'filePreview')"/>
	                <div id='filePreview'></div>
	            </label>
	        
	
	        <!-- 닉네임 입력 -->
	        <div class="nickname-section">
	            <p class="nickname-title">11자 내로 입력하세요.</p>
	            <input type="text" class="nickname-input" name="nickname" placeholder="닉네임 입력" required>
	        </div>
	        <!-- 버튼 -->
	        <div class="subscribe-btn-section">
	            <button id="subscribeBtn">구독하기</button>
	            <button type="button" id="closeBtn" onclick="location.href='javascript:history.back(-1)'">닫기</button>
	        </div>
	    </section>
    </form>
</body>
</html>
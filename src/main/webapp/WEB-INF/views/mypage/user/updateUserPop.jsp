<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<%--     <link rel="stylesheet" href="${ contextPath }/resources/css/common/navbar.css"> --%>
    <link rel="stylesheet" href="${ contextPath }/resources/css/mypage/jw.css">
<%--     <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png"> --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>회원 정보 수정 팝업</title>
</head>
<body>
<%-- 
	1. 세션 
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="session" />
 --%>

	<div id="mypageUserUpdateDivWrap">
		<div id="mypageUserUpdateDiv">
			<form id="UserUpdateForm" method="post" enctype="multipart/form-data" action="${ contextPath }/mypage/user/update"
					onsubmit="return joinValidate();">
				<div id="mypageUserUpdate">
		            <h2>회원정보 수정</h2>
		            <div id="mypageUserUpdateContents">
		                <div id="mypageUserUpdateLeft">
		                	<div style="margin-bottom: 12px;">
<%-- 		                		<c:if test="${ empty uploadfile }"> --%>
			                    <img id="preview-image" src="${ contextPath }/resources/uploadFiles/${ user.get(0).attUser.attSvName }" alt="프로필사진">
<%-- 		                		</c:if> --%>
<!-- 								<div class="image-container"> -->
<!-- 								    <img style="width: 500px;" id="preview-image" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image"> -->
<!-- 								    <input style="display: block;" type="file" id="input-image"> -->
<!-- 								</div> -->
								
		                	</div>
		                	<label for="input-image">사진 변경</label>
		                    <input id="input-image" type="file" name="uploadfile">
		                </div>
		                <div id="mypageUserUpdateMiddle">
		                    <label>이름</label>
		                    <label>아이디</label>
		                    <label>비밀번호</label>
		                    <label>비밀번호 확인</label>
		                    <label>이메일</label>
<!-- 		                    <label>휴대전화</label>  -->
		                </div>
		                
		                <div id="mypageUserUpdateRight">
		                    <input type="text" name="name" value="${ loginUser.name }" readonly>
		                    <input type="text" name="id" value="${ loginUser.id }" readonly>
		                    <input type="password" name="pwd" placeholder="5~20자 영문, 숫자, 특수문자 포함하여 작성하세요">
		                    <input type="password" name="pwd2" placeholder="5~20자 영문, 숫자, 특수문자 포함하여 작성하세요">
		                    <input type="email" name="uemail" value="${ user.get(0).user.uemail }">
<%-- 		                    <input type="text" name="phone" value="${ user.phone }"> --%>
		                </div>
		            </div>
		
		            <div class="mypage-Btn-align-center">
		                <button class="mypage-pop-Btn-pink" id="userPopInUpdateBtn" >수정하기</button>
		                <button class="mypage-pop-Btn-navi" type="button" id="userPopUpdateCancelBtn">취소하기</button>
		            </div>
		        </div>
			</form>
		</div>
	</div>
<script>
function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image")
            previewImage.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
// input file에 change 이벤트 부여
const inputImage = document.getElementById("input-image")
inputImage.addEventListener("change", e => {
    readImage(e.target)
})

// 유효성 검사
		function joinValidate(){
			if(!(/^(?=.*[a-zA-Z])(?=.*\d).{5,20}$/.test($("input[name=pwd]").val()))){
				alert('비밀번호는 영어 대소문자,숫자를 포함한 5자리~20자리로 설정해 주세요.');
				$("input[name=pwd]").select();
				return false;
			}
			if($("input[name=pwd2]").val() != $("input[name=pwd]").val()){
				alert('비밀번호가 일치하지 않습니다.');
				$("input[name=pwd2]").select();
				return false;
			}
			return true;
		}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--     <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css"> --%>
<!--     <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> -->
<%--     <link rel="stylesheet" href="${ contextPath }/resources/css/common/navbar.css"> --%>
<%--     <link rel="stylesheet" href="${ contextPath }/resources/css/mypage/jw.css"> --%>
<%--     <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png"> --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>회원정보수정 창</title>
</head>
<body>
	<div id="mypageUserProfileWrap">
            <div id="mypageUserProfileImgDiv">
                <img id="mypageUserProfileImg" src="${ contextPath }/resources/images/mypage/user/mansik.png">
            </div>
            <div id="mypageUserProfileImgDivRight">
                <h3 class="font-30">만식 김</h3>
                <h4 class="font-16">&nbsp;</h4>
                <h4 class="font-16">mansik@gmail.com</h4>
            </div>
            <div id="mypageUserProfileImgDivRightRight">
                <button class="mypage-btn-pink-14" id="userProfileUpdate">수정하기</button>
                <h4 class="font-16">&nbsp;</h4>
                <button class="mypage-btn-blueblack-14" id="userWithdrawal">탈퇴하기</button>
            </div>
        </div>

<script>
	$(document).ready(function(){
		$("#userProfileUpdate").click(function(){
			console.log("정상클릭");
			//alert(Member(id=admin, pwd=1234, name=관리자, status=Y, signupDate=Tue Mar 30 17:29:18 KST 2021, classifyMem=4));
		});
		
	});
	</script>
	<script src="${ contextPath }/resources/css/mypage/jw.js"></script>        
</body>
</html>
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
    <link rel="stylesheet" href="${ contextPath }/resources/css/account/login.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>로그인</title>
	<script type="text/javascript">
		function findId() {
			if ($('.login-section').css('display') == 'none') {
				$('.login-section').show();
			} else {
				$('.login-section').hide();
				$('.search-id-section').show();
			}
		}
	
		function findPass() {
			if ($('.login-section').css('display') == 'none') {
				$('.login-section').show();
			} else {
				$('.login-section').hide();
				$('.search-pass-section').show();
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
				    alert("로그인이 완료되었습니다!");
					opener.location.href="${ contextPath }";
					window.close();
			    </script>
			 </c:when>
			 <c:otherwise>
			 	<script>
				    alert("로그인 실패!");
			    </script>
			 </c:otherwise>
		</c:choose>
	</c:if>
 <!-- 로그인 -->
 <form action="${ contextPath }/member/login" method="post">
    <section class="login-section">
        <header class="login-header">
            <p class="main-title">Fantimate Account</p>
            <p class="login-title">로그인</p>
        </header>
        <div class="login-input">
            <input type="text" class="login-input-info" name="id" placeholder="계정 ID" required>
            <input type="password" class="login-input-info" name="pwd" placeholder="비밀번호" required>
        </div>
        <div class="login-btn-section">
            <button id="loginBtn">로그인</button>
            <button type="button" id="closeBtn">닫기</button>
        </div>
        <div id="find-account">
            <a class="find-account-info" onclick="findPass()">비밀번호 찾기</a>
            <a class="find-account-info" onclick="findId()">아이디 찾기</a>
        </div>
        <hr id="line">
        <p class="otherLogintitle">또는 다른 계정으로 로그인</p>
        <div class="other-btn-section">
            <button class="other-login-btn"><img src="${ contextPath }/resources/images/account/kakao.png" alt="" class="login-btn-logo"></button>
            <button class="other-login-btn"><img src="${ contextPath }/resources/images/account/google.png" alt="" class="login-btn-logo"></button>
            <button class="other-login-btn"><img src="${ contextPath }/resources/images/account/naver.png" alt="" class="login-btn-logo"></button>
        </div>
        <p class="otherLogintitle">아직 계정이 없다면 ? <a class="get-account" href="joinPopupPage.html">Fantimate 계정으로 가입하기</a></p>
        
        <select class="lang-option">
            <option>한국어</option>
            <option>English</option>
            <option>日本語</option>
        </select>
    </section>
 </form>
 
    <!-- 아이디 찾기 -->
    <section class="search-id-section">
        <header class="search-id-header">
            <p class="join-title">Fantimate Account</p>
        </header>
        <p class="id-input-title">아이디 찾기</p>
        <div class="id-input">
            <input type="text" class="id-input-info" name="fullName" placeholder="이름 입력" required>
            <input type="email" class="id-input-info" name="email" placeholder="이메일 입력" required>
        </div>
        <div class="id-btn-section">
            <button id="searchIdBtn">아이디 찾기</button>
            <button id="backBtn">뒤로가기</button>
        </div>
    </section>

    <!-- 비밀번호 찾기 -->
    <section class="search-pass-section">
        <header class="search-pass-header">
            <p class="join-title">Fantimate Account</p>
        </header>
        <p class="pass-input-title">비밀번호 찾기</p>
        <div class="pass-input">
            <input type="text" class="pass-input-info" name="id" placeholder="아이디 입력" required>
            <input type="email" class="pass-input-info" name="email" placeholder="이메일 입력" required>
        </div>
        <div class="pass-btn-section">
            <button id="searchPassBtn">비밀번호 찾기</button>
            <button id="backBtn">뒤로가기</button>
        </div>
    </section>


</body>
</html>
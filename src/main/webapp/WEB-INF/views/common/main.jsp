<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/navbar.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Fantimate</title>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<section>
		<!-- 여기다 메인페이지 작업해주시면 되요! -->
		
<!-- 		재우 테스트 -->
		<button class="indexbtn" onclick="javascript:location.href='mypage/user/feed';">마이페이지</button>
<%-- 	<button class="indexbtn" onclick="javascript:location.href='mypage/${유저타입}/feed';">마이페이지</button> -->
		<button ></button>
<%-- 		<jsp:forward page="main"></jsp:forward> --%>
<!-- 재우테스트 -->
	</section>
</body>
</html>
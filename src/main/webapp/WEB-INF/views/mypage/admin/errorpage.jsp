<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
</head>
<style>
	.error-container{
		text-align:center;
	}
	.error-container img{
		width : 300px;
		marin-top : 100px;
	}
	.error-container h2{
		color : red;
	}
	
</style>
<body>
	<!-- 네비바 -->
	<jsp:include page="../../common/navbar.jsp"></jsp:include>
	
	<div class="error-container">
<%-- 		<img src="${ contextPath }/resources/images/error-image.png"/> --%>
		<h2>잘못된 접근입니다.<%= request.getAttribute("javax.servlet.error.message") %></h2>
		
		
<%-- 		<h2>msg : ${ msg }</h2> --%>
		<!-- 공란 -->
		
<!-- 		<h2>request.getAttribute("javax.servlet.error.message") : </h2> -->
		<!-- Request processing failed; nested exception is com.kh.spring.member.model.exception.MemberException: 로그인에 실패하였습니다. -->
		
<%-- 		<h2><%= request.getAttribute("msg") %></h2>  --%>
		<!-- null -->
		
		<!-- errormsg는 EL에서 뽑아올 수 없어서 %= 으로 출력 -->
	</div>
</body>
</html>
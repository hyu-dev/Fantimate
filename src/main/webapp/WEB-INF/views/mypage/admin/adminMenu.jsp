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
<%--     <link rel="stylesheet" href="${ contextPath }/resources/css/common/navbar.css"> --%>
    <link rel="stylesheet" href="${ contextPath }/resources/css/mypage/jw.css">
<%--     <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png"> --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>Insert Agency</title>
</head>
<body>
	<div id="mypageAdminMenuDiv">
		<!-- <h2 id="mypageUserContentDivTitle">My Subscribes</h2> -->
		<h2>Menu</h2>
		<ul>
<%-- 			<li><a onclick="javascript:location.href='${contextPath}/mypage/admin/insertAgency' 'target=_blank'">소속사등록</a></li> --%>
		<c:if test="${ loginUser.classifyMem eq '4' }">
			<li id="insertAgency"><a>소속사등록</a></li>
		</c:if>
			<li><a onclick="javascript:location.href='${contextPath}/mypage/admin/report'">신고관리</a></li>
			<li><a onclick="javascript:location.href='${contextPath}/notice/list'">공지사항</a></li>
			<li><a onclick="javascript:location.href='${contextPath}/mypage/admin/management'">회원관리</a></li>
			<li><a onclick="javascript:location.href='${contextPath}/mypage/admin/paylist'">결제내역</a></li>
		</ul>
	</div>
	
	 <!-- 메시지 -->
	 <c:if test="${ !empty msg }">
		 <c:choose>
			 <c:when test="${ msg eq 'success'}">
				<script>
					alert("회원가입이 완료되었습니다!");
					
					$(document).ready(function() {
						$(this).closest("#mypageAdminSignInWrap").fadeOut();
						//$(this).fadeOut();
						console.log("닫기버튼");
					});
				</script>
			</c:when>
			 <c:otherwise>
			 	<script>
				    alert("회원가입 실패!");
			    </script>
			 </c:otherwise>
		</c:choose>
	</c:if>
	
	<script>
	$(document).ready(function(){
// 		$("#mypageAdminMenuDiv li:eq(5)").click(function(){
// 			console.log("정상클릭");
// 			//alert(${loginUser});
// 			//alert(Member(id=admin, pwd=1234, name=관리자, status=Y, signupDate=Tue Mar 30 17:29:18 KST 2021, classifyMem=4));
// 		});
		
	});
	</script>
	<script src="${ contextPath }/resources/css/mypage/jw.js"></script>
<!-- 	<script src="../../../resources/css/mypage/jw.js"></script> -->
</body>
</html>
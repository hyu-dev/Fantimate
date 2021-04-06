<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Agency</title>
</head>
<body>
	<div id="mypageAdminMenuDiv">
		<!-- <h2 id="mypageUserContentDivTitle">My Subscribes</h2> -->
		<h2>Menu</h2>
		<ul>
			<li><a onclick="javascript:location.href='${contextPath}/mypage/admin/insertAgency'">소속사등록</a></li>
			<li><a onclick="javascript:location.href='${contextPath}/mypage/admin/report'">신고관리</a></li>
			<li><a onclick="javascript:location.href='${contextPath}/mypage/admin/notice'">공지사항</a></li>
			<li><a onclick="javascript:location.href='${contextPath}/mypage/admin/management'">회원관리</a></li>
			<li><a onclick="javascript:location.href='${contextPath}/mypage/admin/paylist'">결제내역</a></li>
		</ul>
	</div>
</body>
</html>
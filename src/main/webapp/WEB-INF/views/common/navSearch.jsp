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
	<header class="main-header">
        <nav class="main-nav">
            <p class="main-logo">FANTIMATE</p>
            <div class="main-search">
                <img src="../resource/search.svg" class="nav-icon" alt="">
                <input type="search" class="main-nav-search">
            </div>
            <div class="main-menu">
                <input type="checkbox" id="check">
                <div class="search-box">
                    <input type="text" placeholder="아티스트 검색" id="search-input">
                    <label for="check"><img src="../resource/search.svg" alt="" class="nav-icon"></label>
                </div>
                <img src="${ contextPath }/resources/icon/user.svg" alt="" class="nav-icon">
                <img src="${ contextPath }/resources/icon/alarm.svg" alt="" class="nav-icon" id="alarm-icon" onclick="alarmList()">
                <img src="${ contextPath }/resources/icon/cart.svg" alt="" class="nav-icon">
                <img src="${ contextPath }/resources/icon/email.svg" alt="" class="nav-icon" id="mail-icon" onclick="mailList()">
                <img src="${ contextPath }/resources/icon/more.svg" alt="" class="nav-icon" onclick="etcList()">
            </div>
        </nav>
    </header>
</body>
</html>
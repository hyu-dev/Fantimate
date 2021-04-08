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
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/navbar.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/mypage/jw.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>menu</title>
</head>
<body>
        <article id="mypageMenu">
            <h3 id="mypageMenuTop">MENU</h3>
            <div id="mypageMenuBtn">
                <button class="mypage-menu-Btn" onclick="javascript:location.href='${contextPath}/mypage/user/feed'">My Feed</button>
                <button class="mypage-menu-Btn" onclick="javascript:location.href='${contextPath}/mypage/user/subscribes'">My Subscribes</button>
                <button class="mypage-menu-Btn" onclick="javascript:location.href='${contextPath}/mypage/user/dibs'">My Dibs</button>
                <button class="mypage-menu-Btn" onclick="javascript:location.href='${contextPath}/mypage/user/friends'">My Friends</button>
                <button class="mypage-menu-Btn" onclick="javascript:location.href='${contextPath}/mypage/user/comments'">My Comments</button>
                <button class="mypage-menu-Btn" onclick="javascript:location.href='${contextPath}/mypage/user/bookmarks'">My Bookmarks</button>
                <button class="mypage-menu-Btn" onclick="javascript:location.href='${contextPath}/mypage/user/fanStore'">My FanStore</button>
                <button class="mypage-menu-Btn" onclick="javascript:location.href='${contextPath}/mypage/user/payments'">PayMents</button>
            </div>
        </article>
</body>
</html>
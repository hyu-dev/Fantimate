<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/mypage/artist/profile.css">
</head>
<body>
	<section class="profile-container nanumsquare">
        <div class="profile-box">
            <div class="profile-left">
                <img id="profileImg" src="${ contextPath }/resources/uploadFiles/${ arti.attachment.attSvName }">
                <table class="profile-area">
                    <colgroup>
                        <col width="15%"/>
                        <col width="85%"/>
                    </colgroup>
                    <tr>
                        <td class="info-title">아이디</td>
                        <td class="info-content">${ arti.artist.artiId }</td>
                    </tr>
                    <tr>
                        <td class="info-title">닉네임</td>
                        <td class="info-content">${ arti.artist.artiNickname }</td>
                    </tr>
                    <tr>
                        <td class="info-title">SNS 주소</td>
                        <td class="info-content">
                            <img src="${ contextPath }/resources/images/mypage/artist/페이스북.jpg">
                            <img src="${ contextPath }/resources/images/mypage/artist/인스타그램.png">
                            <img src="${ contextPath }/resources/images/mypage/artist/트위터.png">
                        </td>
                    </tr>
                    <tr>
                        <td class="info-title">상태 메세지</td>
                        <td class="info-content">${ arti.artist.artiDailymsg }</td>
                    </tr>
                </table>
            </div>
            <div class="profile-right">
                <button id="profileBtn" type="button">수정하기</button>
            </div>
        </div>
    </section>
</body>
</html>
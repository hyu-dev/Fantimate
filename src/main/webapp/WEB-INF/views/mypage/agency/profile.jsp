<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/mypage/agency/profile.css">
</head>
<body>
    <section class="profile-container nanumsquare">
        <div class="profile-box">
            <div class="profile-left">
                <table class="profile-area">
                    <colgroup>
                        <col width="40%"/>
                        <col width="60%"/>
                    </colgroup>
                    <tr>
                        <td class="info-title">소속사명</td>
                        <td class="info-content">${ agency.agName }</td>
                    </tr>
                    <tr>
                        <td class="info-title">사업자등록번호</td>
                        <td class="info-content">${ agency.agNum }</td>
                    </tr>
                    <tr>
                        <td class="info-title">연락처</td>
                        <td class="info-content">${ agency.agPhone }</td>
                    </tr>
                    <tr>
                        <td class="info-title">이메일</td>
                        <td class="info-content">${ agency.agEmail }</td>
                    </tr>
                </table>
                <button id="profileBtn" type="button">수정하기</button>
            </div>
            <div class="profile-right">
                <button id="storeBtn" class="btn-group" type="button">스토어 관리</button>
                <button id="officialBtn" class="btn-group" type="button">오피셜 관리</button>
            </div>
        </div>
    </section>
</body>
</html>
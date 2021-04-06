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
<title>insertAgency</title>
</head>
<body>
	<div id="mypageAdminSignIn">
            <h2>소속사 정보 등록</h2>
            <div id="mypageAgencySignInContents">
                <div id="mypageAgencySignIn">
                    <label>소속사명</label>
                    <label>사업자 등록번호</label>
                    <label>이메일 주소</label>
                    <label>연락처</label>
                    <label>아이디</label>
                    <label>비밀번호</label>
                    <label>비밀번호 확인</label>
                </div>
                <div id="mypageUserUpdateRight">
                    <input type="text" name="bsName" value="SM" readonly><%-- value="${}""--%>
                    <input type="text" name="bsNum" value="1438812345" readonly>
                    <input type="email" name="email" value="smenter33@sm.town" readonly>
                    <input type="text" name="tel" value="0252523333">
                    <input type="text" name="id" value="01012341234">
                    <input type="password" name="pwd1" placeholder="비밀번호는 8-20자의 영문, 숫자, 특수문자를 조합하여 설정해주세요.">
                    <input type="password" name="pwd2" placeholder="비밀번호는 8-20자의 영문, 숫자, 특수문자를 조합하여 설정해주세요.">
                </div>
            </div>
            <!-- <div class="버튼2">
                <button>등록하기</button>
                <button>취소하기</button>
            </div> -->
            <div class="mypage-Btn-align-center">
                <button class="mypage-pop-Btn-pink" >등록하기</button>
                <button class="mypage-pop-Btn-navi">취소하기</button>
            </div>
        </div>
</body>
</html>
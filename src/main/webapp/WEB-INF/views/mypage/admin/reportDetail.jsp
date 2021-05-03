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
<title>reportDetail</title>
</head>
<body>
	<div id="mypageReportDetailWrap">
        <div id="mypageReportDetail">
            <form id="reportDetailForm" method="post" action="${ contextPath }/mypage/admin/report/user">
                <!-- onsubmit="return joinValidate();"> -->
                <h2>신고 상세내역</h2>
                <div class="mypage-refund-detail">
                    <div class="mypage-refund-detail-in">
                        <label>신고한 유저 아이디
                            <input id="reportDetail1" type="text" name="rptId" readonly>
                        </label>
<!-- 오류 확인 type Date -->                        
                        <label>신고일자
                            <input id="reportDetail2" type="text" name="rptDateString" readonly>
                        </label>
                        <label>신고당한 유저 아이디
                            <input id="reportDetail3" type="text" name="id" readonly>
                        </label>
                        <label>신고한 게시물 제목
                            <input id="reportDetail4" type="text" name="rptTitle" readonly>
                        </label>
                        <label>신고 유형
                            <input id="reportDetail5" type="text" name="rptType" readonly>
                        </label>
                        <label>
                            신고 사유
                            <textarea id="reportDetail6" name="rptReason" cols="30" rows="10"></textarea>
                        </label>
                        <label>정지할 일수 입력
                        	<input type="text" name ="reportDay" placeholder="정지할 일수(반려시  0입력)">
                        </label>
                        <input id="reportDetail7" type="number" name="rptCode" readonly style="display:none;">
<!--                         <input id="reportDetail8" type="number" name="reportDay" readonly style="display:none;"> -->
                        <input id="reportDetail9" type="number" name="refId" readonly style="display:none;">
                        <input id="reportDetail10" type="text" name="isReported" readonly style="display:none;"><%-- 안쓰는거 넘기기 --%>
                    </div>
                    <div class="mypage-Btn-align-center">
                        <button class="mypage-pop-Btn-pink" id="reportThis">제재하기</button>
                        <button class="mypage-pop-Btn-navi" type="button">뒤로가기</button>
                    </div>
                </div>
        </form>
        </div>
    </div>  

</body>
</html>
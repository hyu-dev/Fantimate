<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/mypage/agency/main.css">
</head>
<body>
	<!-- 스토어 관리 팝업 -->
    <section class="store-form-container">
        <div class="black-back"></div>
        <form class="store-admin-form" action="${ contextPath }/agency/store" method="GET">
            <span class="pop-up-text nanumsquare">스토어 관리</span>
            <br><br>
            <div class="choose-artist nanumsquare">아티스트를 선택하세요</div>
            <br>
            <div class="select-area">
                <select class="artist-category" name="artiName">
                    <option>검색</option>
                    <c:forEach var="arti" items="${ artist }">
                    <option class="search-value" value="${ arti.artNameEn }">${ arti.artNameEn }</option>
                    </c:forEach>
                </select>
                <br><br><br>
                <div class="btn-area">
                    <button id="storeAdminBtn" class="nanumsquare">확인</button>&nbsp;&nbsp;
                    <button id="storeCancelBtn" class="nanumsquare" type="button">취소</button>
                </div>
            </div>
        </form>
    </section>
    
    <!-- 오피셜 관리 팝업 -->
    <section class="official-form-container">
        <div class="black-back"></div>
        <form class="official-admin-form" action="${ contextPath }/agency/official" method="GET">
            <span class="pop-up-text nanumsquare">오피셜 관리</span>
            <br><br>
            <div class="choose-artist nanumsquare">아티스트를 선택하세요</div>
            <br>
            <div class="select-area">
                <select class="artist-category" name="artiName">
                    <option>검색</option>
                    <c:forEach var="arti" items="${ artist }">
                    <option class="search-value" value="${ arti.artNameEn }">${ arti.artNameEn }</option>
                    </c:forEach>
                </select>
                <div class="move-text nanumsquare">오피셜 스케줄 페이지로 이동합니다</div>
                <br><br><br>
                <div class="btn-area">
                    <button id="mediaeAdminBtn" class="nanumsquare">미디어</button>&nbsp;&nbsp;
                    <button id="scheduleAdminBtn" class="nanumsquare" type="button" onclick="scheduleLink(${ arti.artNameEn })">스케줄</button>
                </div>
                <div class="sub-btn-area">
                    <button id="scheduleBtn" class="nanumsquare">확인</button>&nbsp;&nbsp;
                    <button id="scheduleCancelBtn" class="nanumsquare" type="button">취소</button>
                </div>
            </div>
        </form>
    </section>
    
	<!-- 네비바 인클루드 -->
	<jsp:include page="../../common/navbar.jsp"/>
	
	<!-- 아티스트 프로필 인클루드 -->
	<jsp:include page="profile.jsp"/>
	
	<!-- 본문 시작 -->
	
	<!-- 메인 -->
	<section class="main-section">
        <div class="artist-list-container">
            <div class="artist-list">
                <p class="list-title nanumsquare">My Artist List (solo)</p>
                <hr class="list-line">
                <div class="list-box">
                    <table class="solo-list nanumsquare">
                        <tbody>
                        	<c:forEach var="solo" items="${ solo }">
                            <tr>
                                <td><span>${ solo.artNameEn }</span></td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <span class="artist-plus nanumsquare">+</span>
                <span class="artist-minus nanumsquare">-</span>
            </div>
            <div class="artist-list">
                <p class="list-title nanumsquare">My Artist List (group)</p>
                <hr class="list-line">
                <div class="list-box">
                    <table class="group-list nanumsquare">
                        <tbody>
                        	<c:forEach var="team" items="${ team }">
                            <tr>
                                <td>
                                    <span>${ team.artNameEn }</span>
                                    <table class="group-member nanumsquare">
                                        <tbody>
                                            <colgroup>
                                                <col width="7%"/>
                                                <col width="93%"/>
                                            </colgroup>
                                            <c:forEach var="member" items="${ member }">
	                                            <c:if test="${ team.artNameEn eq member.artiNameEn }">
	                                            <tr>
	                                                <td>┕</td>
	                                                <td><span>${ member.artiName }</span></td>
	                                            </tr>
	                                            </c:if>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                         	</c:forEach>
                        </tbody>
                    </table>
                </div>
                <span class="artist-plus nanumsquare">+</span>
                <span class="artist-minus nanumsquare">-</span>
            </div>
        </div>
    </section>
	<!-- 본문 끝 -->
	
    <script>
    // 스토어 관리 창 눌렀을 때
    $("#storeBtn").click(function() {
    	 $(".store-form-container").css("display", "block");
    });
    
    // 스토어 관리 취소 버튼 눌렀을 때
    $("#storeCancelBtn").click(function() {
    	 $(".store-form-container").css("display", "none");
    });
    
 	// 오피셜 관리 창 눌렀을 때
    $("#officialBtn").click(function() {
    	 $(".official-form-container").css("display", "block");
    });
    
    // 오피셜 관리 스케줄 버튼 눌렀을 때
    function scheduleLink(artiName) {
    	$(".artist-category").css("display", "none");
    	$(".choose-artist").css("display", "none");
    	$(".btn-area").css("display", "none");
    	$(".move-text").css("display", "block");
    	$(".sub-btn-area").css("display", "flex");
    }
    
    // 오피셜 스케줄 취소 버튼 눌렀을 때
    $("#scheduleCancelBtn").click(function() {
    	 $(".official-form-container").css("display", "none");
    });
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>admin notice detail</title>
</head>
<body>
	<!-- 네비바 -->
	<jsp:include page="../../common/navbar.jsp"></jsp:include>
	
	<!--소속사 정보 등록창 -->
	<jsp:include page="insertAgency.jsp"/>
	
    <!-- 밑에 섹션 -->
    <section id="mypageAdminSection">
    
        <!-- 왼쪽메뉴 -->
        <article id="mypageAdminMenu">
        	<jsp:include page="adminMenu.jsp"/>
        </article>


        <!-- 오른쪽 테이블 -->
        <article id="mypageContent">
            <h3>공지사항</h3>
            <div id="NoticeDetailWrap">
<!--             <form> -->
<%-- 	            <input type="hidden" name="nid" value="${ Notice.nid }">		<!-- 컨트롤러에서 저장된 --> --%>
                <!-- <div> -->
                <h3 id="noticeDetailViewHead">${ Notice.ntitle }</h3>
                <!-- </div> -->
                <c:set var="date" value="<%= new Date() %>"/>
                <h4 id="ncountncreatedate">조회수 ${ Notice.ncount } | <fmt:formatDate type="date" value="${ Notice.ncreate }"/></h4>
                
                <div id="NoticeDetailContent">
                ${ Notice.ncontent }
                </div>

                <div id="NoticePre"><b>이전글</b>이전글이 없습니다.</div>
                <div id="NoticeNext"><b>다음글</b>카카오페이 시스템 점검으로 인한 서비스 일시중단 안내</div>

				<c:if test="${ loginUser.classifyMem eq '4' }">
                <div class="mypage-Btn-align-right">
                    <button onclick="location.href='${ contextPath }/notice/updatepage?nid=${ Notice.nid }&page=${ param.page }'">수정하기</button>
                    <button onclick="location.href='${ contextPath }/notice/delete?nid=${ Notice.nid }'">삭제하기</button>
                    <button onclick="location.href='${ contextPath }/notice/list?page=${ param.page }'">목록</button>
                </div>
                </c:if>
<!--             </form> -->
            </div>
            
        </article>
    </section>
</body>
</html>
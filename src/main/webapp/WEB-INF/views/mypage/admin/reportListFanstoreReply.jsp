<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--     <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css"> --%>
<!--     <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> -->
<%--     <link rel="stylesheet" href="${ contextPath }/resources/css/common/navbar.css"> --%>
<%--     <link rel="stylesheet" href="${ contextPath }/resources/css/mypage/jw.css"> --%>
<%--     <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png"> --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>report</title>
</head>
<body>
<c:if test="${ loginUser.classifyMem eq '4' }">
	<!-- 네비바 -->
	<jsp:include page="../../common/navbar.jsp"></jsp:include>
<%-- 	<jsp:include page="${ contextPath }'WEB-INF/views/common/navbar.jsp'"></jsp:include> --%>

	<!--소속사 정보 등록창 -->
	<jsp:include page="insertAgency.jsp"/>
	
	<!-- 신고 상세 -->
	<jsp:include page="reportDetail.jsp"/>
	
	<!-- 밑에 섹션 -->
	<section id="mypageAdminSection">
	
        <!-- 왼쪽메뉴 -->
        <article id="mypageAdminMenu">
        	<jsp:include page="adminMenu.jsp"/>
        </article>


        <!-- 오른쪽 테이블 -->
        <article id="mypageContent">
            <h3>신고관리</h3>
            <div id="mypageContentListDiv">
                <a class="mypageContentCategory"
                href="${contextPath}/mypage/admin/report">쪽지</a>
                /
                <a class="mypageContentCategory"
                href="${contextPath}/mypage/admin/report/fanstore">팬스토어</a>
                /
                <a class="mypageContentCategory"
                href="${contextPath}/mypage/admin/report/fanstoreReply" style="font-weight: 700;">팬스토어 댓글</a>
                /
                <a class="mypageContentCategory"
                href="${contextPath}/mypage/admin/report/media">미디어</a>
                /
                <a class="mypageContentCategory"
                href="${contextPath}/mypage/admin/report/feed">피드,아티스트</a>
                /
                <a class="mypageContentCategory"
                href="${contextPath}/mypage/admin/report/feedReply">피드,아티스트 댓글</a>
            </div>
            <table id="mypageAdminFanstoreRlist">
                <thead>
                    <tr>
                        <th>신고날짜</th>
                        <th>신고인</th>
                        <th>피의자</th>
                        <th>신고 게시물 정보</th>
                        <th>신고유형</th>
                        <th>주소</th>
                    </tr>
                </thead>

                <tbody>
                	<c:forEach var="r" items="${ list }">
                		<tr
<%--                 		 onclick="selectReport(${ r.rptCode })" --%>
<%--링크도 추가하기 --%>
                		 >
                		 	<!-- 쪽지번호 hidden으로 -->
                			<input type="hidden" value="${ r.report.isReported }">	<!-- 0 -->
                			<input type="hidden" value="${ r.report.rptReason }">
                			<input type="hidden" value="${ r.report.rptCode }">
                		 	<c:set var="date" value="<%= new Date() %>"/>
                			<td><fmt:formatDate type="date" value="${ r.report.rptDate }"/></td>	<!-- 3 -->
                			<td>${ r.report.rptId }</td>		<!-- 신고인 4 -->
                			<td>${ r.fanStoreR.id }</td>			<!-- 피의자 -->
                			<td>${ r.fanStoreR.frcontent }</td>		<!-- 신고 게시물 정보 -->
               				<td>${ r.report.rptType }</td>		<!-- 신고유형 7 -->
                			<td>주석
<%--                 			${ r.messCode } --%>
<%--                 				<a onclick="${contextPath}/"> --%>
                			</td>
                			<input type="hidden" value="${ r.report.rptCode }" style="display:none;">	<!-- 9 -->
                			<input type="hidden" value="${ r.report.refId }" style="display:none;">	<!-- 10 -->
                			<input type="hidden" value="RPT_FREPLY" style="display:none;">	<!-- 11 -->
                		</tr>
                	</c:forEach>
                	
                </tbody>
            </table>
            <!-- 나중에 페이징처리 따로 -->
            <div class="mypage-pagination-area">
						<!-- [이전] -->
						<c:if test="${ pi.currentPage <= 1 }">
							&lt; &nbsp;
						</c:if>
<!-- 숨기면안되나?						 -->
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="/mypage/admin/report/fanstoreReply">
								<c:param name="page" value="${ pi.currentPage - 1 }"/>
							</c:url>
							<a href="${ before }"> &lt; </a> &nbsp;
						</c:if>
						
						<!-- 페이지 숫자 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<b>[${ p }]</b>								
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="/mypage/admin/report/fanstoreReply">
									<c:param name="page" value="${ p }"/>
								</c:url>
								<a href="${ pagination }">${ p }</a>
							</c:if>
						</c:forEach>
						
						<!-- [다음] -->
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							&nbsp; &gt;
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="/mypage/admin/report/fanstoreReply">
								<c:param name="page" value="${ pi.currentPage + 1 }" />
							</c:url>
							<a href="${ after }">&gt;</a>
						</c:if>
            </div>
        </article>
    </section>
    <script>
    	function selectNotice(nid){
    		//게시판 pk값과 현재 페이지값 파라미터로 넘겨주기 
//     		location.href='${contextPath}/notice/detail?nid=' + nid + '&page=${ pi.currentPage }';
    	}
    </script>
    </c:if>
    <c:if test="${ loginUser.classifyMem != '4' }">
    	<jsp:include page="errorpage.jsp"></jsp:include>
    </c:if>
</body>
</html>
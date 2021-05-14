<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>notice List</title>
</head>
<body>
	<!-- 네비바 -->
	<jsp:include page="../../common/navbar.jsp"></jsp:include>
	
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
            <h3>공지사항</h3>
            <table id="mypageAdminNotice">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>날짜</th>
                    </tr>
                </thead>

                <tbody>
<%-- ?? list.size() --%>                
                <c:if test="${ list.size() } == 0">
                	<div>
                		등록된 공지사항이 없습니다.
                	</div>	
                </c:if>
                
                
               	<c:forEach var="n" items="${ list }">
               		<tr onclick="selectNotice(${n.nid});">
               			<td>${ n.nid }</td>
               			<td>${ n.ntitle }</td>
               			<c:set var="date" value="<%= new Date() %>"/>
               			<td><fmt:formatDate type="date" value="${ n.ncreate }"/></td>
<%--                			<td>${ n.ncreate }</td> --%>
               		</tr>
               	</c:forEach>
               	<c:if test="${ empty list }">
               		<tr><td colspan=3>등록된 공지사항이 없습니다.</td></tr>
               	</c:if>               	
               	
                </tbody>
            </table>
            
            <c:if test="${ loginUser.classifyMem eq '4' }">
            <button id="writeNoticeAdmin" onclick="location.href='${ contextPath }/notice/write'">글쓰기</button>
            </c:if>
            
            <!-- 나중에 페이징처리 따로 -->
            <div class="mypage-pagination-area">
						<!-- [이전] -->
						<c:if test="${ pi.currentPage <= 1 }">
							&lt; &nbsp;
						</c:if>
<!-- 숨기면안되나?						 -->
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="/notice/list">
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
								<c:url var="pagination" value="/notice/list">
									<c:param name="page" value="${ p }"/>
								</c:url>
								<a href="${ pagination }">${ p }</a>
							</c:if>
						</c:forEach>
						
						<!-- [다음] -->
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							&gt;
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="/notice/list">
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
    		location.href='${contextPath}/notice/detail?nid=' + nid + '&page=${ pi.currentPage }';
    	}
    </script>
</body>
</html>
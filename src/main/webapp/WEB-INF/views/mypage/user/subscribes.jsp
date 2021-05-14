<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>Subscribes</title>
</head>
<body>
<!-- 메세지 -->
	 <c:if test="${ !empty msg }">
	 	<script>
	 		var message = "<c:out value="${msg}"/>";
	 		alert(message);
	 	</script>
			    <c:remove var="msg"/>
	</c:if>
<!-- 네비바 -->
	<jsp:include page="../../common/navbar.jsp"/>

	<!-- 유저 정보수정 팝업 -->
	<jsp:include page="updateUserPop.jsp"/>
	
	<!-- 	상단 -->
	<section id="mypageUserProfile">
		<jsp:include page="userDiv.jsp"/>
    </section>
    
    <!-- 프로필 밑에 섹션 -->
    <section id="mypageUserSection">
        <article id="mypageUserContent">
            <div id="mypageUserContentDiv">
                <!-- <h2 id="mypageUserContentDivTitle">My Subscribes</h2> -->
                <h2>My Subscribes</h2>
<!-- for문 -->             
				<c:forEach var="s" items="${ list }">
                    <div class="mypage-content-subscribes">
						<img src="${ contextPath }/resources/uploadFiles/${ s.artmainpic.attSvName }" alt="경로참조">
						<h3>${ s.artmainpic.attMain }</h3>
						<button onclick="cancel('${ s.user.id }', '${ s.subati.subCode }')">구독취소</button>
					</div>
				</c:forEach>   
				<c:if test="${ empty list }">
                    <div class="mypage-content-subscribes">
						<h3>구독한 아티스가 없습니다.</h3>
					</div>
				</c:if>
          		<!-- 나중에 페이징처리 따로 -->
            		<div class="mypage-pagination-area">
						<!-- [이전] -->
						<c:if test="${ pi.currentPage <= 1 }">
							&lt; &nbsp;
						</c:if>
<!-- 숨기면안되나?						 -->
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="/mypage/user/subscribes">
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
								<c:url var="pagination" value="/mypage/user/subscribes">
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
							<c:url var="after" value="/mypage/user/subscribes">
								<c:param name="page" value="${ pi.currentPage + 1 }" />
							</c:url>
							<a href="${ after }">&gt;</a>
						</c:if>
            		</div>
            </div>
        </article>
	
<!-- 	메뉴 -->
	<jsp:include page="menu.jsp"/>
	</section>
	<script>
//     $(document).ready(function(){
//             console.log("메소드 동작");
            
//             $("#mypageMenuBtn").children().removeClass("mypage-btn-DN");
//             console.log("removeClass 동작");
            
//             $("#mypageMenuBtn").children().eq(1).addClass("mypage-btn-DN");
//             console.log("addClass 동작");
            
//     });
	function cancel(userid, subCode){
		location.href='${contextPath}/mypage/user/subscribes/update?userid=' + userid + '&subCode=' + subCode;
	}
</script>
</body>
</html>
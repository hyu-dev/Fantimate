<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Friends</title>
</head>
<body>
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
                <h2>My Friends</h2>
                
<!--                 <div class="toggle-area"> -->
<!--                     <div class="toggle-switch" tabindex="0"> -->
<!--                         <input type="checkbox" name="my_checkbox" value="yes" id="checkbox-id" /> -->
<!--                         <label for="checkbox-id"> -->
<!--                             <div class="area" aria-hidden="true"> -->
<!--                                 <div class="background"> -->
<!--                                     <div class="handle"></div> -->
<!--                                 </div> -->
<!--                                 <p>NEW</p> -->
<!--                             </div> -->
<!--                         </label> -->
<!--                     </div> -->
<!--                 </div> -->

                <!-- 토글으로 대체.
                 -->
                <h3 class="mypage-friend-list" style="font-weight:700; font-size:15px;" onclick="javascript:location.href='${contextPath}/mypage/user/friends'">친구목록 / </h3>
                <h3 class="mypage-friend-list" onclick="javascript:location.href='${contextPath}/mypage/user/friendsReq'">친구 요청 목록</h3>
					
                	<c:forEach var="f" items="${ list }">
                		<div class="mypage-content-friends">
	                        <img src="${ contextPath }/resources/uploadFiles/${ f.attachment.attSvName }">
                			<h3>${ f.attachment.attMain }</h3>
                			<button type="button" onclick="deleteFriend('${f.attachment.attMain}');">친구삭제</button>
                		</div>
                	</c:forEach>
                	
                <!-- 나중에 페이징처리 따로 -->
            <div class="mypage-pagination-area">
						<!-- [이전] -->
						<c:if test="${ pi.currentPage <= 1 }">
							&lt; &nbsp;
						</c:if>
<!-- 숨기면안되나?						 -->
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="/mypage/user/friends">
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
								<c:url var="pagination" value="/mypage/user/friends">
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
							<c:url var="after" value="/mypage/user/friends">
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
	// 
//     $(document).ready(function(){
//             console.log("메소드 동작");
            
//             $("#mypageMenuBtn").children().removeClass("mypage-btn-DN");
//             console.log("removeClass 동작");
            
//             $("#mypageMenuBtn").children().eq(3).addClass("mypage-btn-DN");
//             console.log("addClass 동작");
//     });
    
    // Alert
    $(function(){
        var responseMessage = "<c:out value="${message}" />";
        if (responseMessage != ""){
            alert(responseMessage);
            <c:remove var="message"/>;
        }
    })
</script>
<script>
function deleteFriend(fid){
	// 친구아이디, 페이지 값 넘겨주기 
	console.log("넘겨지는 id값");
	location.href='${contextPath}/mypage/user/friends/update?fid=' + fid + '&url=/friends=${ pi.currentPage }&stat=3';
	console.log(deleteId);
}
</script>
</body>
</html>
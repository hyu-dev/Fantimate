<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/feed/feedDetail.css?aftr">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
	
<title>Insert title here</title>
</head>
<body>
   <div class="container">
    <!-- carousel slide-->
		<div id="carouselExampleDark" class="carousel carousel-dark slide"
			data-bs-ride="carousel">
			<ol class="carousel-indicators">
			
			<c:forEach begin="0" end="${ ptlistCount - 1}" step="1" var="s">
			
					<li data-bs-target="#carouselExampleDark" data-bs-slide-to=${ s } class="active"></li>
			
			
			
					<li data-bs-target="#carouselExampleDark" data-bs-slide-to=${ s }></li>
			</c:forEach>
			
			</ol>
			<div class="carousel-inner">
				<!-- 슬라이드 쇼 -->
				<c:forEach var="pt" items="${ ptlist }">
				
				<div class="carousel-item active" data-bs-interval="10000">
					<!--가로 사진-->
					<img
						src="${ contextPath }/resources/uploadFiles/${ pt.attSvName }"
						class="d-block w-100" alt="이미지">
				</div>
				
					
				
				<div class="carousel-item" data-bs-interval="2000">
					<img
						src="${ contextPath }/resources/uploadFiles/${ pt.attSvName }"
						class="d-block w-100" alt="이미지">
				</div>
				</c:forEach>
					
			</div>
			<!-- / 슬라이드 쇼 끝 -->
    
    		<!-- 왼쪽 오른쪽 화살표 버튼 -->
			<a class="carousel-control-prev" href="#carouselExampleDark"
				role="button" data-bs-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleDark"
				role="button" data-bs-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
			</a>
			<!-- / 화살표 버튼 끝 -->
		</div>
    <!-- 댓글,대댓글, 게시물 탑헤드 , 게시글 텍스트 영역 -->
    <span style="display:inline-block; width:380px; background:white;">
        <div class="right-side">

            <table class="board-top">
                <col width="13%"/>
                <col width="55%"/>
                <col width="15%"/>
                <col width="15%"/>
                <tr>
                <c:forEach var="f" items="${ list }">
                <c:forEach var="at" items="${ atlist }">
                 <c:if test="${ at.refuid eq f.writer }">
                    <td>
                        <div class="profile-bubble">
                            <p class="friend-application">친구 신청</p>
                            <p class="send-message">쪽지 보내기</p>
                        </div>
                    
                      <img class="profile-picture" src="${ contextPath }/resources/uploadFiles/${ at.attSvName }"> 
                    </td>
                    </c:if>
                    </c:forEach>
                    </c:forEach>
                    <c:forEach var="f" items="${ list }">
                    <td> 
                        <pre class="nicknameArea">성현2</pre>
                        <pre class="boarddateArea"><fmt:formatDate value="${ f.fcreate }" pattern="yyyy.MM.dd HH:mm"/></pre>
                    </td>
                   </c:forEach>
                </tr>
                </table>
                 <!-- 텍스트 영역 -->
                 <c:forEach var="f" items="${ list }">
                 <div>
                    <p class="board-text">${ f.fcontent }</p> 
                </div>
                </c:forEach>
                <hr width="85%">
                <table class="board-like">
                    <col width="13%"/>
                    <col width="55%"/>
                    <col width="15%"/>
                    <col width="15%"/>
 
                    <tr>
                        <td> <img class="likeBtn" src="../resources/images/feed/like-icon.png" style="width:30px;"></td>
                       <c:forEach var="f" items="${ list }">
                        <td>${f.flike}</td>
                       </c:forEach>
                        <td><img src="../resources/images/official/bookmark.svg" class="bm-icon"></td>
                    </tr>
                </table>
                <hr width="85%">
                <!-- 댓글, 대댓글 리스트 영역 -->
                
                     <!-- 댓글 등록 -->
                     <c:forEach var="f" items="${ list }">
                    <form action="${ contextPath }/fanfeed/insertReplyDetail" method="post">
                    <div class="insert-replyArea">
                     <input type="hidden" name="writer" value="${ loginUser.id }">
                     <input type="hidden" name="refId" value="${ f.fid }">
                        <div class="replyArea">
                            <span class="insert-reply">
                                <textarea class="nanumsquare" name="rcontent" style="resize: none;" rows="1" placeholder="댓글을 입력하세요..."></textarea>
                            </span>&nbsp;&nbsp;&nbsp;
                            <span>
                            <button type="submit" class="insert-replyBtn"><img id="addReply" src="../resources/icon/send.png" onclick="insertReply();" style="width:40px;"></button>
                            <!-- <img class="insert-replyBtn" id="addReply" src="../resources/icon/send.png" onclick="insertReply();"> -->
                            </span>
                        </div>
                    </div>
                    </form>
                    </c:forEach>
                
        </div>
    </span>
    </div>
    <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>
</html>
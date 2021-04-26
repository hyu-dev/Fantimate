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
    <link rel="stylesheet" href="${ contextPath }/resources/css/feed/feedDetail.css?after">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
   <div class="container">
    <!-- 이미지 영역 -->
    <span style="display:inline-block; width:800px; background:#343131;">

    <c:forEach var="pt" items="${ ptlist }">
        <div class="section">
        	<input type="radio" name="slide" id="slide01" checked>
           
           	<div class="slidewrap">
           		<ul class="slidelist">
           			<li>
           				<a>
           					<label for="slide01" class="left"></label>
           					<img src="${ contextPath }/resources/uploadFiles/${ pt.attSvName }" alt="이미지" style="width:600; height:583;">
           					<label for="slide01" class="right"></label>
           				</a>
           			</li>
           		</ul>
           	</div>
        </div>
     </c:forEach>
    </span>
    
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
</body>
</html>
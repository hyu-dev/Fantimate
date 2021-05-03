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
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/feed/message.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>MessageSend</title>

</head>
<body>
<!-- 메시지 -->
	 <c:if test="${ !empty msg }">
		 <c:choose>
			 <c:when test="${ msg eq 'success'}">
			 	<script>
				    alert("쪽지를 전송하였습니다.");
					opener.location.href="${ contextPath }/fanfeed/fanFeedList?artNameEn=${artiName}";
					window.close();
			    </script>
			 </c:when>
			 
		</c:choose>
	</c:if>
<!-- 쪽지 form -->
    <form action="${ contextPath }/fanfeed/message" method="post">
        <!-- 수신자 영역 쪽지받는사람(글 작성자 id)  messRecId--> 
        <div class="message-info">
            <p class="message-id">TO. <span name="messRecId" class="message-id">${ param.writer }</span></p>
        </div>
        <!-- 제목 영역 -->
        <div>
            <input type="text" class="titleArea" name="messTitle" placeholder="제목을 입력하세요" required>
        </div>
        <br>
        <!-- 내용 영역 -->
        <div>
            <textarea class="contentArea" name="messContent" placeholder="내용을 입력하세요" required></textarea>
        </div>
        <br><br>
        <!-- 쪽지 보내는 사람 -->
        <input type="hidden" name="messSendId" value="${ loginUser.id }">
        <input type="hidden" name="messRecId" value="${ param.writer }">
        <!-- 버튼 영역 -->
        <div class="btnArea">
        <button type="submit" class="insert-message">보내기</button>&nbsp;&nbsp;
        <button type="button" class="cancel-message" onclick="window.close()">취소하기</button>
        </div>
    </form>
</body>
</html>
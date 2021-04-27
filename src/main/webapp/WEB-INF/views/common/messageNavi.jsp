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
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/message.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Message</title>
    <script>
	    /* 쪽지 답장하기 */
	    function sendMessage(){
	        if($('.received-message-section').css('display') == 'none'){
	              $('.received-message-section').show();
	          }else{
	              $('.report-message-section').hide();
	              $('.received-message-section').hide();
	              $('.send-message-section').show();
	          }
	    }
	    
	    // 쪽지 답장 취소 (뒤로가기)
	    function quitReply(){
	    	 if($('.received-message-section').css('display') == 'none'){
	              $('.received-message-section').show();
	              $('.send-message-section').hide();
	          }
	    }
	    
	
	    /* 신고하기 */
	    function reportPage(){
	        if($('.received-message-section').css('display') == 'none'){
	              $('.received-message-section').show();
	          }else{
	              $('.received-message-section').hide();
	              $('.report-message-section').show();
	          }
	    }
	    
	    // 신고 취소하기 (뒤로가기)
	    function quitReport(){
	    	if($('.received-message-section').css('display') == 'none'){
	              $('.received-message-section').show();
	              $('.report-message-section').hide();
	          }
	    }
	    
    </script>
</head>
<body>
 <!-- 메세지 -->
 	<c:if test="${ !empty msg }">
 		<c:choose>
 			<c:when test="${ msg eq 'success' }">
 				<script>
 					alert("쪽지를 성공적으로 보냈습니다!"); 
				    location.href="${ contextPath }";
 				</script>
 			</c:when>
 			<c:when test="${ msg eq 'success2' }">
 				<script>
 					alert("신고가 접수 되었습니다!"); 
				    location.href="${ contextPath }";
 				</script>
 			</c:when>
 			<c:when test="${ msg eq 'fail' }">
 				<script>
 					alert("보내기 실패!"); 				
 				</script>
 			</c:when>
 		</c:choose>
 	</c:if>
 
 <!-- 받은 쪽지 -->
    <section class="received-message-section">
        
        <div class="message-info">
            <p class="message-id">FROM. <span>${message.messSendId}</span></p>
            <img src="${ contextPath }/resources/icon/report.svg" alt="" class="report-img" onclick="reportPage()">
            <!-- 제목 -->
        </div>
        <p class="message-title">${message.messTitle}</p>
        <!-- 내용 입력 -->
        <div style="overflow:auto" class="message-content">
           ${message.messContent}
        </div>
        <!-- 버튼 -->
        <div class="message-btn-section">
            <button type="button" id="sendBtn" onclick="sendMessage()">답장하기</button>
            <button type="button" id="closeBtn" onclick="location.href='javascript:history.back(-1)'">취소하기</button>
        </div>
    </section>

    <!-- 쪽지 보내기 -->
    <form action="${ contextPath }/main/messageSend" method="post">
    <section class="send-message-section">
        <div class="message-info">
            <p class="message-id">TO. <span>${message.messSendId}</span></p>
            <input type="hidden" name="id" value="${message.messSendId}">
        </div>

        <!-- 제목, 내용 입력 -->
        <div class="message-input-section">
            <input type="text" class="message-input-title" name="messTitle" placeholder="제목을 입력하세요" required>
            <textarea class="message-write" placeholder="내용을 입력하세요" name="messContent"></textarea>
        </div>
        
        <!-- 버튼 -->
        <div class="message-btn-section">
            <button id="sendBtn">보내기</button>
            <button type="button" id="closeBtn" onclick="quitReply()">취소하기</button>
        </div>

    </section>
    </form>

    <!-- 쪽지 신고 -->
    <form action="${ contextPath }/main/reportMessage" method="post">
    <section class="report-message-section">
        <div class="report-info">
            <p class="report-title">신고하기</p>
        </div>

        <!-- 사유 선택 -->
        <div class="report-option-area">
            <p class="report-option">사유 선택</p>
            <!-- 라디오 버튼-->
            <div class="report-radio-section">
                <input type="radio" id="slangLang" name="rptType" value="비속어사용" class="radio-area">
                <label for="slang">비속어사용</label>
                <input type="radio" id="spam" name="rptType" value="스팸 및 광고성" class="radio-area">
                <label for="spam">스팸 및 광고성</label>
                <input type="radio" id="manyWords" name="rptType" value="도배" class="radio-area">
                <label for="many">도배</label>
                <input type="radio" id="etc" name="rptType" value="기타" class="radio-area">
                <label for="etc">기타</label>
            </div>
        </div>

        <!-- 제목, 내용 입력 -->
        <div class="report-input-section">
            <p class="report-content-title">내용 입력</p>
            <textarea class="report-write" placeholder="구체적인 내용을 300자 이내로 적어주세요" name="rptReason"></textarea>
        </div>
        <!-- 히든 -->
        <input type="hidden" name="id" value="${message.messSendId}">
        <input type="hidden" name="refId" value="${message.messCode}">
        
        <!-- 신고 버튼 -->
        <div class="report-btn-section">
            <button id="reportBtn">신고하기</button>
            <button type="button" id="closeBtn" onclick="quitReport()">취소하기</button>
        </div>

    </section>
    </form>
</body>
</html>
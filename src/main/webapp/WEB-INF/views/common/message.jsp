<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	    /* 신고하기 */
	    function reportPage(){
	        if($('.received-message-section').css('display') == 'none'){
	              $('.received-message-section').show();
	          }else{
	              $('.received-message-section').hide();
	              $('.report-message-section').show();
	          }
	    }
    </script>
</head>
<body>
 <!-- 받은 쪽지 -->
    <section class="received-message-section">
        
        <div class="message-info">
            <p class="message-id">FROM. <span>aeee12234</span></p>
            <img src="../resource/report.svg" alt="" class="report-img" onclick="reportPage()">
            <!-- 제목 -->
        </div>
        <p class="message-title">BTS 팬 아미 중 한명이에요! 친구해요!</p>
        <!-- 내용 입력 -->
        <div style="overflow:auto" class="message-content">
            안녕하세요 ~ 만나서 반갑습니다~ 답장 보냅니다아아! 답장 부탁드려요오오오오 고맙습니닿ㅎㅎ  
            안녕하세요 ~ 만나서 반갑습니다~ 답장 보냅니다아아! 답장 부탁드려요오오오오 고맙습니닿ㅎㅎ  
            안녕하세요 ~ 만나서 반갑습니다~ 답장 보냅니다아아! 답장 부탁드려요오오오오 고맙습니닿ㅎㅎ  
            안녕하세요 ~ 만나서 반갑습니다~ 답장 보냅니다아아! 답장 부탁드려요오오오오 고맙습니닿ㅎㅎ  
        </div>
        <!-- 버튼 -->
        <div class="message-btn-section">
            <button id="sendBtn" onclick="sendMessage()">답장하기</button>
            <button id="closeBtn">취소하기</button>
        </div>
    </section>

    <!-- 쪽지 보내기 -->
    <section class="send-message-section">
        <div class="message-info">
            <p class="message-id">TO. <span>aeee12234</span></p>
        </div>

        <!-- 제목, 내용 입력 -->
        <div class="message-input-section">
            <input type="text" class="message-input-title" name="messageTitle" placeholder="제목을 입력하세요" required>
            <textarea class="message-write" placeholder="내용을 입력하세요" name="messageContent">
    
            </textarea>
        </div>
        
        <!-- 버튼 -->
        <div class="message-btn-section">
            <button id="sendBtn">보내기</button>
            <button id="closeBtn">취소하기</button>
        </div>

    </section>

    <!-- 쪽지 신고 -->
    <section class="report-message-section">
        <div class="report-info">
            <p class="report-title">신고하기</p>
        </div>

        <!-- 사유 선택 -->
        <div class="report-option-area">
            <p class="report-option">사유 선택</p>
            <!-- 라디오 버튼-->
            <div class="report-radio-section">
                <input type="radio" id="slangLang" name="report" value="비속어사용" class="radio-area">
                <label for="slang">비속어사용</label>
                <input type="radio" id="spam" name="report" value="스팸 및 광고성" class="radio-area">
                <label for="spam">스팸 및 광고성</label>
                <input type="radio" id="manyWords" name="report" value="도배" class="radio-area">
                <label for="many">도배</label>
                <input type="radio" id="etc" name="report" value="기타" class="radio-area">
                <label for="etc">기타</label>
            </div>
        </div>

        <!-- 제목, 내용 입력 -->
        <div class="report-input-section">
            <p class="report-content-title">내용 입력</p>
            <textarea class="report-write" placeholder="구체적인 내용을 300자 이내로 적어주세요" name="reportContent">
    
            </textarea>
        </div>
        
        <!-- 신고 버튼 -->
        <div class="report-btn-section">
            <button id="reportBtn">신고하기</button>
            <button id="closeBtn">취소하기</button>
        </div>

    </section>
</body>
</html>
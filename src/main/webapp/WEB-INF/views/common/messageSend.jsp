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
    <title>MessageSend</title>
    <script>
	    
    </script>
</head>
<body>

    <!-- 쪽지 보내기 -->
    <form action="" method="post">
    <section class="send-message-section">
        <div class="message-info">
            <p class="message-id">TO. <span>aeee12234</span></p>
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

</body>
</html>
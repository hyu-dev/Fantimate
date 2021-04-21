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
    <link rel="stylesheet" href="${ contextPath }/resources/css/feed/message.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>MessageSend</title>

</head>
<body>
<!-- 쪽지 form -->
    <form>
        <!-- 수신자 영역 -->
        <h3>To.성현2</h3>
        <!-- 제목 영역 -->
        <div>
            <input type="text" class="titleArea" placeholder="제목을 입력하세요">
        </div>
        <br>
        <!-- 내용 영역 -->
        <div>
            <textarea class="contentArea" placeholder="내용을 입력하세요"></textarea>
        </div>
        <br><br>
        <!-- 버튼 영역 -->
        <div class="btnArea">
        <button type="submit" class="insert-message">보내기</button>&nbsp;&nbsp;
        <button class="cancel-message">취소하기</button>
        </div>
    </form>
</body>
</html>
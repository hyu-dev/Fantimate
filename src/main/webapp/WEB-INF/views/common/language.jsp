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
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/language.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>언어설정</title>
</head>
<body>

  <!-- 언어 설정 -->
    <section class="lang-section">
        <div class="lang-line-section">
            <p class="lang-title">언어 설정</p>
        </div>

        <!-- 제목, 언어 변경 -->
        <div class="lang-option-section">
            <p class="lang-option-title">설정할 언어를 선택하세요.</p>
            <div class="lang-country">
                <select class="lang-select">
                    <option>한국어</option>
                    <option>English</option>
                    <option>日本語</option>
                </select>
            </div>
        </div>
        
        <!-- 언어설정 버튼 -->
        <div class="lang-btn-section">
            <button id="changeBtn">변경하기</button>
            <button id="closeBtn">취소하기</button>
        </div>

    </section>


</body>
</html>
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
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/messageAndreport.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Report</title>
    <script>
	
    </script>
</head>
<body>
    <!-- 신고하기 -->
    <form class="form-report" action="" method="post">
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
                <label for="slangLang">비속어사용</label>
                <input type="radio" id="spam" name="report" value="스팸 및 광고성" class="radio-area">
                <label for="spam">스팸 및 광고성</label>
                <input type="radio" id="manyWords" name="report" value="도배" class="radio-area">
                <label for="manyWords">도배</label>
                <input type="radio" id="etc" name="report" value="기타" class="radio-area">
                <label for="etc">기타</label>
            </div>
        </div>
        <!-- 제목, 내용 입력 -->
        <div class="report-input-section">
            <p class="report-content-title">내용 입력</p>
            <textarea class="report-write" placeholder="구체적인 내용을 300자 이내로 적어주세요" name="reportContent"></textarea>
        </div>
        <!-- 신고 버튼 -->
        <div class="report-btn-section">
            <button type="button" id="reportBtn">신고하기</button>
            <button type="button" id="closeBtn" onclick="closeReport();">취소하기</button>
        </div>
    </section>
    </form>
    
    <script>
    	function closeReport() {
    		$(".form-report").fadeOut();
    		$(".form-report")[0].reset();
    	}
    </script>
</body>
</html>
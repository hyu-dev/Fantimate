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
    <link rel="stylesheet" href="${ contextPath }/resources/css/feed/report.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Report</title>
    <script>
	
    </script>
</head>
<body>
<!-- 메시지 -->
	 <c:if test="${ !empty msg }">
		 <c:choose>
			 <c:when test="${ msg eq 'success'}">
			 	<script>
				    alert("신고내역이 접수되었습니다.");
					opener.location.href="${ contextPath }/fanfeed/fanFeedList?artNameEn=${artiName}";
					window.close();
			    </script>
			 </c:when>
			 
		</c:choose>
	</c:if>
   <h3 class="top">신고하기</h3>
    <hr width="95%">
    <br>
    <!-- 신고 폼 -->
    <form action="${ contextPath }/fanfeed/report" method="post">
    <h4 class="first">사유 선택</h4>
    <span>
        <input type="radio" class="rpt-reason" name="rptType" value="비속어 사용">비속어 사용
        <input type="radio" class="rpt-reason" name="rptType" value="스팸 및 광고성">스팸 및 광고성
        <input type="radio" class="rpt-reason" name="rptType" value="도배">도배
        <input type="radio" class="rpt-reason" name="rptType" value="기타">기타
    </span>
    <br>
    <h4 class="second">내용 입력</h4>
    <textarea id="test" class="rpt-content" placeholder="구체적인 내용을 300자 이내로 적어주세요" name="rptReason"></textarea>
    
    <input type="hidden" name="rptId" value="${ loginUser.id }">
    <input type="hidden" name="refId" value="${ param.fid }">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <span id="test_cnt" class="limit">(0 / 300)</span>
    <br><br>
    <div class="btnArea">
        <button type="submit" class="insert-report">신고하기</button>&nbsp;&nbsp;
        <button class="cancel-report" onclick="">취소하기</button>
    </div>
    </form>
    <!-- 글자 수 제한 -->
    <script>
    $(document).ready(function() {
    $('#test').on('keyup', function() {
        $('#test_cnt').html("("+$(this).val().length+" / 300)");
 
        if($(this).val().length > 100) {
            $(this).val($(this).val().substring(0, 100));
            $('#test_cnt').html("(300 / 300)");
        }
    });
});
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--     <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css"> --%>
<!--     <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> -->
<%--     <link rel="stylesheet" href="${ contextPath }/resources/css/common/navbar.css"> --%>
<%--     <link rel="stylesheet" href="${ contextPath }/resources/css/mypage/jw.css"> --%>
<%--     <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png"> --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>fan Store</title>
</head>
<body>
	<jsp:include page="../../common/navbar.jsp"></jsp:include>
<%-- 	<jsp:include page="${ contextPath }'WEB-INF/views/common/navbar.jsp'"></jsp:include> --%>
	<!-- 	상단 -->
	<section id="mypageUserProfile">
		<jsp:include page="userDiv.jsp"/>
    </section>
    
    <!-- 프로필 밑에 섹션 -->
    <section id="mypageUserSection">
        <article id="mypageUserContent">
            <div id="mypageUserContentDiv">
                <!-- <h2 id="mypageUserContentDivTitle">My Subscribes</h2> -->
                <h2>My FanStore</h2>
                <div class="mypage-content-fanstore">
                    <table id="mypageUserFanstore">
                        <tr>
                            <th>&nbsp;</th>
                            <th>글번호</th>
                            <th>제목</th>
                            <th>가격</th>
                            <th>날짜</th>
                            <th>조회</th>
                        </tr>
        
                        <tr>
                            <td><input type="checkbox"></td>
                            <!--value값 el태그사용-->
                            <td>201</td>
                            <td>The 3st Album - Dark & Wild 팝니다</td>
                            <td>18,000원</td>
                            <td>2021.03.03</td>
                            <td>30</td>
                        </tr>
        
        
                        
                        
                    </table>
                    <div>
                        <button id="mypageDeleteBtn">글삭제</button>
                    </div>
                </div>
        
        
        
        
            </div>
        </article>
	
<!-- 	메뉴 -->
	<jsp:include page="menu.jsp"/>
	</section>
<script>
    $(document).ready(function(){
            console.log("메소드 동작");
            
            $("#mypageMenuBtn").children().removeClass("mypage-btn-DN");
            console.log("removeClass 동작");
            
            $("#mypageMenuBtn").children().eq(6).addClass("mypage-btn-DN");
            console.log("addClass 동작");
            
    });

</script>	
</body>
</html>
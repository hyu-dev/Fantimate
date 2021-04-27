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
<title>Subscribes</title>
</head>
<body>
	<jsp:include page="../../common/navbar.jsp"></jsp:include>
<%-- 	<jsp:include page="${ contextPath }/common/navbar.jsp"></jsp:include> --%>
	<!-- 	상단 -->
	<section id="mypageUserProfile">
		<jsp:include page="userDiv.jsp"/>
    </section>
    
    <!-- 프로필 밑에 섹션 -->
    <section id="mypageUserSection">
        <article id="mypageUserContent">
            <div id="mypageUserContentDiv">
                <!-- <h2 id="mypageUserContentDivTitle">My Subscribes</h2> -->
                <h2>My Subscribes</h2>
<!-- for문 -->                
                    <div class="mypage-content-subscribes">
                        <img src="${ contextPath }/resources/images/mypage/user/Dibs1.png">
                        <h3>Henry</h3>
<!-- 이미지 경로도 EL태그 -->                
<!-- 버튼 onclick="javascript:location.href='mypage/user/feed';" -->
                        <button>구독취소</button>
                    </div>
                <div class="mypage-content-subscribes">
                    <img src="${ contextPath }/resources/images/mypage/user/subscribes/henry.png">
                    <h3>Henry</h3>
                    <button>구독취소</button>
                </div>
                <div class="mypage-content-subscribes">
                    <img src="${ contextPath }/resources/images/mypage/user/subscribes/iu.png">
                    <h3>IU</h3>
                    <button>구독취소</button>
                </div>
                <div class="mypage-content-subscribes">
                    <img src="${ contextPath }/resources/images/mypage/user/subscribes/henry.png">
                    <h3>Henry</h3>
                    <button>구독취소</button>
                </div>
                <div class="mypage-content-subscribes">
                    <img src="${ contextPath }/resources/images/mypage/user/subscribes/henry.png">
                    <h3>Henry</h3>
                    <button>구독취소</button>
                </div>
                <div class="mypage-content-subscribes">
                    <img src="${ contextPath }/resources/images/mypage/user/subscribes/henry.png">
                    <h3>Henry</h3>
                    <button>구독취소</button>
                </div>
                <div class="mypage-content-subscribes">
                    <img src="${ contextPath }/resources/images/mypage/user/subscribes/henry.png">
                    <h3>Henry</h3>
                    <button>구독취소</button>
                </div>
                <div class="mypage-content-subscribes">
                    <img src="${ contextPath }/resources/images/mypage/user/subscribes/henry.png">
                    <h3>Henry</h3>
                    <button>구독취소</button>
                </div>
                <div class="mypage-content-subscribes">
                    <img src="${ contextPath }/resources/images/mypage/user/subscribes/henry.png">
                    <h3>Henry</h3>
                    <button>구독취소</button>
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
            
            $("#mypageMenuBtn").children().eq(1).addClass("mypage-btn-DN");
            console.log("addClass 동작");
            
    });

</script>
</body>
</html>
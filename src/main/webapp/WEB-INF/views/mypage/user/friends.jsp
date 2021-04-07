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
<title>Friends</title>
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
                <h2>My Friends</h2>
                
                <div class="toggle-area">
                    <div class="toggle-switch" tabindex="0">
                        <input type="checkbox" name="my_checkbox" value="yes" id="checkbox-id" />
                        <label for="checkbox-id">
                            <div class="area" aria-hidden="true">
                                <div class="background">
                                    <div class="handle"></div>
                                </div>
                                <p>NEW</p>
                            </div>
                        </label>
                    </div>
                </div>

                <!-- 토글으로 대체.
                <h3 class="mypage-friend-list">친구목록 / </h3>
                <h3 class="mypage-friend-list">친구신청 목록</h3> -->

                    <div class="mypage-content-friends">
                        <img src="${ contextPath }/resources/images/mypage/user/profile/user/user.png">
                        <h3>ManSik</h3>
                        <button>친구삭제</button>
                    </div>
                
                    <div class="mypage-content-friends">
                        <img src="${ contextPath }/resources/images/mypage/user/profile/user01/user01.png">
                        <h3>ManSik</h3>
                        <button>친구삭제</button>
                    </div>
                
                    <div class="mypage-content-friends">
                        <img src="${ contextPath }/resources/images/mypage/user/profile/user02/user02.png">
                        <h3>ManSik</h3>
                        <button>친구삭제</button>
                    </div>
                
                


            </div>
        </article>
	
<!-- 	메뉴 -->
	<jsp:include page="menu.jsp"/>
	</section>
</body>
</html>
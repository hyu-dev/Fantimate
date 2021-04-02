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
<title>My Dibs</title>
</head>
<body>
	<jsp:include page="../../common/navbar.jsp"></jsp:include>
	<!-- 	상단 -->
	<section id="mypageUserProfile">
	
		<jsp:include page="userDiv.jsp"/>
        <%-- UserDiv include로 대체
        <div id="mypageUserProfileWrap">
            <div id="mypageUserProfileImgDiv">
                <img id="mypageUserProfileImg" src="${ contextPath }/resources/images/mypage/user/mansik.png">
            </div>
            <div id="mypageUserProfileImgDivRight">
                <h3 class="font-30">만식 김</h3>
                <h4 class="font-16">&nbsp;</h4>
                <h4 class="font-16">mansik@gmail.com</h4>
            </div>
            <div id="mypageUserProfileImgDivRightRight">
                <button class="mypage-btn-pink-14">수정하기</button>
                <h4 class="font-16">&nbsp;</h4>
                <button class="mypage-btn-blueblack-14">탈퇴하기</button>
            </div>
        </div> --%>
    </section>
    <!-- 프로필 밑에 섹션 -->
    <section id="mypageUserSection">
        <article id="mypageUserContent">
			
			<div id="mypageUserContentDiv">
                <!-- <h2 id="mypageUserContentDivTitle">My Subscribes</h2> -->
                <h2>My Dibs</h2>

                <div class="toggle-area">
                    <div class="toggle-switch" tabindex="0">
                        <input type="checkbox" name="my_checkbox" value="yes" id="checkbox-id" />
                        <label for="checkbox-id">
                            <div class="area" aria-hidden="true">
                                <div class="background">
                                    <div class="handle"></div>
                                </div>
<!--                                 스토어/팬스토어찜 -->
                                <p style="font-size:11px">스토어</p>
                            </div>
                        </label>
                    </div>
                </div>
<!-- 스토어일떄 / 팬스토어일떄 -->
<c:if test="">
</c:if>

<c:if test="">
</c:if>
                    <div class="mypage-content-dibs">
                        <div class="mypage-content-dibs-one">
                            <img src="${ contextPath }/resources/images/mypage/user/Dibs1.png">
                            <h3>BTS 1st abcde</h3>
                        </div>
                        <div class="mypage-content-dibs-one">
                            <img src="${ contextPath }/resources/images/mypage/user/Dibs1.png">
                            <h3>BTS 1st abcde</h3>
                        </div>
                        <div class="mypage-content-dibs-one">
                            <img src="${ contextPath }/resources/images/mypage/user/Dibs1.png">
                            <h3>BTS 1st abcde</h3>
                        </div>
                        <div class="mypage-content-dibs-one">
                            <img src="${ contextPath }/resources/images/mypage/user/Dibs1.png">
                            <h3>BTS 1st abcde</h3>
                        </div>
                        <div class="mypage-content-dibs-one">
                            <img src="${ contextPath }/resources/images/mypage/user/Dibs1.png">
                            <h3>BTS 1st abcde</h3>
                        </div>
                        <div class="mypage-content-dibs-one">
                            <img src="${ contextPath }/resources/images/mypage/user/Dibs1.png">
                            <h3>BTS 1st abcde</h3>
                        </div>
                        <div class="mypage-content-dibs-one">
                            <img src="${ contextPath }/resources/images/mypage/user/Dibs1.png">
                            <h3>BTS 1st abcde</h3>
                        </div>
                        <div class="mypage-content-dibs-one">
                            <img src="${ contextPath }/resources/images/mypage/user/Dibs1.png">
                            <h3>BTS 1st abcde</h3>
                        </div>
                        <div class="mypage-content-dibs-one">
                            <img src="${ contextPath }/resources/images/mypage/user/Dibs1.png">
                            <h3>BTS 1st abcde</h3>
                        </div>
                    </div>
                
                


            </div>			
			
			
        </article>
	
<!-- 	메뉴 -->
	<jsp:include page="menu.jsp"/>
	</section>
</body>
</html>
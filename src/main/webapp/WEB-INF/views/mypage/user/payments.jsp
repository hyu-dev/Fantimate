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
<title>payments</title>
</head>
<body>
	<jsp:include page="../../common/navbar.jsp"></jsp:include>
<%-- 	<jsp:include page="${ contextPath }'WEB-INF/views/common/navbar.jsp'"></jsp:include> --%>
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
                <h2>My Payments</h2>
                <div class="mypage-content-payment">
                    <table id="mypageUserPay">
                        <tr>
                            <th>주문일자</th>
                            <th colspan="2">주문상품정보</th>
                            <th>금액(수량)</th>
                            <th>주문상태</th>
                            <th>확인/취소/리뷰</th>
                        </tr>

                        <tr>
                            <td>2021.03.03</td>
                            <td><img src="mansik.png" alt="대체이미지"></td>
                            <td>The 3st Album - Dark & Wild</td>
                            <td>
                                18,000원<br>
                                (1개)
                            </td>
                            <td>결제완료</td>
                            <td>
                                <div class="mypage-user-pay-btn-div"><!--수정 class로-->
                                    <button>구매확정</button>
                                    <button>환불신청</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2021.03.03</td>
                            <td><img src="mansik.png" alt="대체이미지"></td>
                            <td>The 3st Album - Dark & Wild</td>
                            <td>
                                18,000원<br>
                                (1개)
                            </td>
                            <td>결제완료</td>
                            <td>
                                <div class="mypage-user-pay-btn-div"><!--수정 class로-->
                                    <button>구매확정</button>
                                    <button>환불신청</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2021.03.03</td>
                            <td><img src="mansik.png" alt="대체이미지"></td>
                            <td>The 3st Album - Dark & Wild</td>
                            <td>
                                18,000원<br>
                                (1개)
                            </td>
                            <td>결제완료</td>
                            <td>
                                <div class="mypage-user-pay-btn-div"><!--수정 class로-->
                                    <button>구매확정</button>
                                    <button>환불신청</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2021.03.03</td>
                            <td><img src="mansik.png" alt="대체이미지"></td>
                            <td>The 3st Album - Dark & Wild</td>
                            <td>
                                18,000원<br>
                                (1개)
                            </td>
                            <td>결제완료</td>
                            <td>
                                <div class="mypage-user-pay-btn-div"><!--수정 class로-->
                                    <button>구매확정</button>
                                    <button>환불신청</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2021.03.03</td>
                            <td><img src="mansik.png" alt="대체이미지"></td>
                            <td>The 3st Album - Dark & Wild</td>
                            <td>
                                18,000원<br>
                                (1개)
                            </td>
                            <td>결제완료</td>
                            <td>
                                <div class="mypage-user-pay-btn-div"><!--수정 class로-->
                                    <button>구매확정</button>
                                    <button>환불신청</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2021.03.03</td>
                            <td><img src="mansik.png" alt="대체이미지"></td>
                            <td>The 3st Album - Dark & Wild</td>
                            <td>
                                18,000원<br>
                                (1개)
                            </td>
                            <td>결제완료</td>
                            <td>
                                <div class="mypage-user-pay-btn-div"><!--수정 class로-->
                                    <button>구매확정</button>
                                    <button>환불신청</button>
                                </div>
                            </td>
                        </tr>
                        <!-- 하나라도 구매한 제품이있다면 c:if문안에 for문 바깥에 리뷰작성 테이블도 같이 생성. -->
                        <tr>
                            <td colspan="6" ><button>리뷰작성</button></td>
                            
                        </tr>


                    </table>
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
    
    $("#mypageMenuBtn").children().eq(7).addClass("mypage-btn-DN");
    console.log("addClass 동작");
    
});

</script>	
</body>
</html>
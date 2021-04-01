<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/navbar.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Fantimate</title>
     <script>
    // 알람 
    function alarmList(){

	        if($('.alarm-hide-show').css('display') == 'none' && $('.mail-hide-show').css('display') != 'none'){
	            $('.alarm-hide-show').show();
	            $('.mail-hide-show').hide();
	
	        } else if($('.alarm-hide-show').css('display') == 'none' && $('.etc-hide-show').css('display') != 'none'){
	            $('.alarm-hide-show').show();
	            $('.etc-hide-show').hide();
	        } 
	        else if($('.alarm-hide-show').css('display') == 'none' && $('.mail-hide-show').css('display') == 'none' && $('.etc-hide-show').css('display') == 'none' ){
	            $('.alarm-hide-show').show();
	        }
	        else{
	            $('.alarm-hide-show').hide();
	        }
	    }
		
    	// 쪽지함
	    function mailList(){
	        if($('.mail-hide-show').css('display') == 'none' && $('.alarm-hide-show').css('display') != 'none'){
	            $('.mail-hide-show').show();
	            $('.alarm-hide-show').hide();
	        } 
	        else if($('.mail-hide-show').css('display') == 'none' && $('.etc-hide-show').css('display') != 'none'){
	            $('.mail-hide-show').show();
	            $('.etc-hide-show').hide();
	        }
	        else if($('.mail-hide-show').css('display') == 'none' && $('.alarm-hide-show').css('display') == 'none' && $('.etc-hide-show').css('display') == 'none'){
	            $('.mail-hide-show').show();
	        }else{
	            $('.mail-hide-show').hide();
	        }
	    }
		
    	// 더보기
	    function etcList(){
	        if($('.etc-hide-show').css('display') == 'none' && $('.alarm-hide-show').css('display') != 'none'){
	            $('.etc-hide-show').show();
	            $('.alarm-hide-show').hide();
	        } 
	        else if($('.etc-hide-show').css('display') == 'none' && $('.mail-hide-show').css('display') != 'none'){
	            $('.etc-hide-show').show();
	            $('.mail-hide-show').hide();
	        }
	        else if($('.etc-hide-show').css('display') == 'none' && $('.mail-hide-show').css('display') == 'none' && $('.alarm-hide-show').css('display') == 'none'){
	            $('.etc-hide-show').show();
	        }else{
	            $('.etc-hide-show').hide();
	        }
	    }
	
	    // 토클버튼 (전체쪽지/친구쪽지)
	     function toggleChange() {
	
	    // Get the checkbox
	    var checkBox = document.getElementById("checkbox-id");
	
	    // If the checkbox is checked, display the output text
	    if (checkBox.checked == true){
	        $('#wholeMailContent').hide();
	        $('#friendContent').show();
	     } else {
	        $('#wholeMailContent').show();
	        $('#friendContent').hide();
	     }
	 }
    
     //쪽지 상세 이동
     function receivedMail(){
        location.href="message";
     }
     
     // 언어 설정 팝업창 
     function langSetting(){
         location.href="language";
     }
    </script>
</head>
<body>
	 <header class="main-header">
        <nav class="main-nav">
            <p class="main-logo">FANTIMATE</p>
            <!-- <div class="main-search">
                <img src="../resource/search.svg" class="nav-icon" alt="">
                <input type="search" class="main-nav-search">
            </div> -->
            <div class="main-menu">
                <!-- <input type="checkbox" id="check">
                <div class="search-box">
                    <input type="text" placeholder="아티스트 검색" id="search-input">
                    <label for="check"><img src="../resource/search.svg" alt="" class="nav-icon"></label>
                </div> -->
                <img src="${ contextPath }/resources/icon/user.svg" alt="" class="nav-icon">
                <img src="${ contextPath }/resources/icon/alarm.svg" alt="" class="nav-icon" id="alarm-icon" onclick="alarmList()">
                <img src="${ contextPath }/resources/icon/cart.svg" alt="" class="nav-icon">
                <img src="${ contextPath }/resources/icon/email.svg" alt="" class="nav-icon" id="mail-icon" onclick="mailList()">
                <img src="${ contextPath }/resources/icon/more.svg" alt="" class="nav-icon" onclick="etcList()">
            </div>
        </nav>
    </header>
    
      <!-- 알람 구간 -->
    <div class="alarm-hide-show">
        <section class="alarm-section">
            <div style="overflow:auto" class="alarm-list">
                <p class="alarm-date">2021.03.22 TODAY</p>
                <ul class="today-alarm">
                    <li class="alarm-content">회원이 작성한 게시글에 좋아요가 달렸습니다. <p class="alarm-time">1시간 전</p></li>
                    <li class="alarm-content">회원이 작성한 댓글에 좋아요가 달렸습니다. <p class="alarm-time">1시간 전</p></li>
                    <li class="alarm-content">회원이 작성한 게시글에 좋아요가 달렸습니다. <p class="alarm-time">1시간 전</p></li>
                    <li class="alarm-content">회원이 작성한 댓글에 좋아요가 달렸습니다. <p class="alarm-time">1시간 전</p></li>
                    <li class="alarm-content">회원이 작성한 게시글에 좋아요가 달렸습니다. <p class="alarm-time">1시간 전</p></li>
                    <li class="alarm-content">회원이 작성한 댓글에 좋아요가 달렸습니다. <p class="alarm-time">1시간 전</p></li>
                    <li class="alarm-content">회원이 작성한 게시글에 좋아요가 달렸습니다. <p class="alarm-time">1시간 전</p></li>
                    <li class="alarm-content">회원이 작성한 댓글에 좋아요가 달렸습니다. <p class="alarm-time">1시간 전</p></li>
                    <li class="alarm-content">회원이 작성한 게시글에 좋아요가 달렸습니다. <p class="alarm-time">1시간 전</p></li>
                    <li class="alarm-content">회원이 작성한 댓글에 좋아요가 달렸습니다. <p class="alarm-time">1시간 전</p></li>
                    <li class="alarm-content">회원이 작성한 게시글에 좋아요가 달렸습니다. <p class="alarm-time">1시간 전</p></li>
                    <li class="alarm-content">회원이 작성한 댓글에 좋아요가 달렸습니다. <p class="alarm-time">1시간 전</p></li>
                    <li class="alarm-content">회원이 작성한 게시글에 좋아요가 달렸습니다. <p class="alarm-time">1시간 전</p></li>
                    <li class="alarm-content">회원이 작성한 댓글에 좋아요가 달렸습니다. <p class="alarm-time">1시간 전</p></li>
                </ul>
            </div>
        </section>
    </div>
    <!-- 쪽지 구간 -->
    <div class="mail-hide-show">
        <section class="mail-section">
            <div style="overflow:auto" id="mailList">
                  <!-- 토클 -->
                    <div class="toggle-place">
                        <div class="toggle-change" tabindex="0">
                            <input type="checkbox" name="my_checkbox" value="yes" id="checkbox-id" onclick="toggleChange()"/>
                            <label for="checkbox-id">
                              <div class="toggle-section" aria-hidden="true">
                                <div class="toggle-back">
                                    <div class="handling"></div>
                                </div>
                                <p class="toggle-friend">친구</p>
                                <p class="toggle-whole">전체</p>
                              </div>
                            </label>
                          </div>
                    </div>
                <!-- 전체 쪽지 목록 -->
                <div id="wholeMailContent">
                    <p class="mail-title">전체 쪽지 목록</p>
                 <!-- 날짜 별 #1-->
                <p class="mail-date">2021.03.20</p>
                <ul class="today-mail">
                    <li class="mail-content" onclick="receivedMail()"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                    <li class="mail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                    <li class="mail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                    <li class="mail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p></li>
                    <li class="mail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                    <li class="mail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                </ul>
                <!-- 날짜 별 #2-->
                <p class="mail-date">2021.03.20</p>
                <ul class="today-mail">
                    <li class="mail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p></li>
                    <li class="mail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p></li>
                    <li class="mail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                    <li class="mail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                    <li class="mail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                    <li class="mail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                </ul>
                </div>
                 <!---->

                 <!-- 친구 쪽지 목록 -->
                 <div id="friendContent">
                    <div class="toggle-date-section">
                        <p class="mail-title">친구 쪽지 목록</p>
                        
                    </div>
                     <!-- #1-->
                    <div class="accordion-friendInfo">
                        <input type="checkbox" id="friend01">
                        <label for="friend01">
                            <!-- 친구 정보, 보내기 버튼 둘러싸는 div-->
                            <div class="friend-info-section">
                                <!-- 프로필사진 , 이름-->
                                <div class="profile-info">
                                    <div class="profile-circle">
                                        <img src="${ contextPath }/resources/images/main/feed1.svg" alt="" class="friend-profile">
                                    </div>
                                    <p class="friend-profile-name">tmddk12</p>
                                </div>
                                <!-- 쪽지 보내기 버튼 div-->
                                <div class="sendBtn-section">
                                    <button class="sendBtn">쪽지 보내기</button>
                                </div>
                            </div>
                            <!-- 화살표 사진 -->
                            <em></em>
                        </label>
                        <div style="overflow:auto" class="friend-mailList">
                            <ul class="friendMail-contentList">
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                            </ul>
                        </div>
                    </div>
                    <!-- #2-->
                    <div class="accordion-friendInfo">
                        <input type="checkbox" id="friend02">
                        <label for="friend02">
                            <!-- 친구 정보, 보내기 버튼 둘러싸는 div-->
                            <div class="friend-info-section">
                                <!-- 프로필사진 , 이름-->
                                <div class="profile-info">
                                    <div class="profile-circle">
                                        <img src="${ contextPath }/resources/images/main/feed1.svg" alt="" class="friend-profile">
                                    </div>
                                    <p class="friend-profile-name">tmddk12</p>
                                </div>
                                <!-- 쪽지 보내기 버튼 div-->
                                <div class="sendBtn-section">
                                    <button class="sendBtn">쪽지 보내기</button>
                                </div>
                            </div>
                            <!-- 화살표 사진 -->
                            <em></em>
                        </label>
                        <div style="overflow:auto" class="friend-mailList">
                            <ul class="friendMail-contentList">
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                            </ul>
                        </div>
                    </div>

                     <!-- #3-->
                     <div class="accordion-friendInfo">
                        <input type="checkbox" id="friend03">
                        <label for="friend03">
                            <!-- 친구 정보, 보내기 버튼 둘러싸는 div-->
                            <div class="friend-info-section">
                                <!-- 프로필사진 , 이름-->
                                <div class="profile-info">
                                    <div class="profile-circle">
										<img src="${ contextPath }/resources/images/main/feed1.svg" alt="" class="friend-profile">                                    </div>
                                    <p class="friend-profile-name">tmddk12</p>
                                </div>
                                <!-- 쪽지 보내기 버튼 div-->
                                <div class="sendBtn-section">
                                    <button class="sendBtn">쪽지 보내기</button>
                                </div>
                            </div>
                            <!-- 화살표 사진 -->
                            <em></em>
                        </label>
                        <div style="overflow:auto" class="friend-mailList">
                            <ul class="friendMail-contentList">
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                            </ul>
                        </div>
                    </div>
                    <!---->

                      <!-- #4-->
                      <div class="accordion-friendInfo">
                        <input type="checkbox" id="friend04">
                        <label for="friend04">
                            <!-- 친구 정보, 보내기 버튼 둘러싸는 div-->
                            <div class="friend-info-section">
                                <!-- 프로필사진 , 이름-->
                                <div class="profile-info">
                                    <div class="profile-circle">
                                        <img src="${ contextPath }/resources/images/main/feed1.svg" alt="" class="friend-profile">
                                    </div>
                                    <p class="friend-profile-name">tmddk12</p>
                                </div>
                                <!-- 쪽지 보내기 버튼 div-->
                                <div class="sendBtn-section">
                                    <button class="sendBtn">쪽지 보내기</button>
                                </div>
                            </div>
                            <!-- 화살표 사진 -->
                            <em></em>
                        </label>
                        <div style="overflow:auto" class="friend-mailList">
                            <ul class="friendMail-contentList">
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                            </ul>
                        </div>
                    </div>
                    <!---->

                    <!-- #5-->
                    <div class="accordion-friendInfo">
                        <input type="checkbox" id="friend05">
                        <label for="friend05">
                            <!-- 친구 정보, 보내기 버튼 둘러싸는 div-->
                            <div class="friend-info-section">
                                <!-- 프로필사진 , 이름-->
                                <div class="profile-info">
                                    <div class="profile-circle">
										<img src="${ contextPath }/resources/images/main/feed1.svg" alt="" class="friend-profile">                                    </div>
                                    <p class="friend-profile-name">tmddk12</p>
                                </div>
                                <!-- 쪽지 보내기 버튼 div-->
                                <div class="sendBtn-section">
                                    <button class="sendBtn">쪽지 보내기</button>
                                </div>
                            </div>
                            <!-- 화살표 사진 -->
                            <em></em>
                        </label>
                        <div style="overflow:auto" class="friend-mailList">
                            <ul class="friendMail-contentList">
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                            </ul>
                        </div>
                    </div>
                    <!---->


                    <!-- #6-->
                    <div class="accordion-friendInfo">
                        <input type="checkbox" id="friend06">
                        <label for="friend06">
                            <!-- 친구 정보, 보내기 버튼 둘러싸는 div-->
                            <div class="friend-info-section">
                                <!-- 프로필사진 , 이름-->
                                <div class="profile-info">
                                    <div class="profile-circle">
                                        <img src="${ contextPath }/resources/images/main/feed1.svg" alt="" class="friend-profile">
                                    </div>
                                    <p class="friend-profile-name">tmddk12</p>
                                </div>
                                <!-- 쪽지 보내기 버튼 div-->
                                <div class="sendBtn-section">
                                    <button class="sendBtn">쪽지 보내기</button>
                                </div>
                            </div>
                            <!-- 화살표 사진 -->
                            <em></em>
                        </label>
                        <div style="overflow:auto" class="friend-mailList">
                            <ul class="friendMail-contentList">
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                            </ul>
                        </div>
                    </div>
                    <!---->


                    <!-- #7-->
                    <div class="accordion-friendInfo">
                        <input type="checkbox" id="friend07">
                        <label for="friend07">
                            <!-- 친구 정보, 보내기 버튼 둘러싸는 div-->
                            <div class="friend-info-section">
                                <!-- 프로필사진 , 이름-->
                                <div class="profile-info">
                                    <div class="profile-circle">
                                        <img src="${ contextPath }/resources/images/main/feed1.svg" alt="" class="friend-profile">
                                    </div>
                                    <p class="friend-profile-name">tmddk12</p>
                                </div>
                                <!-- 쪽지 보내기 버튼 div-->
                                <div class="sendBtn-section">
                                    <button class="sendBtn">쪽지 보내기</button>
                                </div>
                            </div>
                            <!-- 화살표 사진 -->
                            <em></em>
                        </label>
                        <div style="overflow:auto" class="friend-mailList">
                            <ul class="friendMail-contentList">
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 답장 부탁드려요~~! <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                                <li class="friendMail-content"><p class="mail-id">tmddk12</p>000입니다. 회원님의 중고상품을 사고싶습니다. <p class="mail-time">1시간 전</p><p class="mail-read">읽음</p></li>
                            </ul>
                        </div>
                    </div>

                </div>
                <!---->
            </div>  <!-- 전체쪽지, 친구쪽지 감싸는 마지막 div-->
        </section>
    </div>

    <!-- 더보기 -->
    <div class="etc-hide-show">
        <section class="etc-section">
            <div style="overflow:auto" class="etc-list">
                <ul class="etc-area">
                    <li class="etc-content" id="langSetting" onclick="langSetting()">언어 설정</li>
                    <li class="etc-content" id="fanStore">팬 스토어</li>
                </ul>
            </div>
        </section>
    </div>
    
</body>
</html>
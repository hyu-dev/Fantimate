<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    	
    	// 검색
    	function searchList(){
    		if($('.search-result').css('display', 'block')){
    			$('.search-result').css('display', 'none');
    			$('#search-input').val('');
    		}
    	}
	
    
     // 언어 설정 팝업창 
     function langSetting(){
         location.href="language";
     }
     
     
     // 회원가입 팝업창 
     function showJoinPage(){

         // 팝업 가운데에 띄우기
         var popupWidth = 430;
         var popupHeight = 500;

         var popupX = Math.ceil((window.screen.width - popupWidth)/2);
         // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

         var popupY = Math.ceil((window.screen.width - popupHeight)/2);
         // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
         
         var url = "${ contextPath }/member/join";

         window.open(url, "회원가입", 'width=' + popupWidth  + ', height=' + popupHeight  + ', left='+ popupX + ', top='+ popupY);
     }
     
     // 로그인 팝업창 
	function showLoginPage() {

		// 팝업 가운데에 띄우기
		var popupWidth = 430;
		var popupHeight = 500;

		var popupX = Math
				.ceil((window.screen.width - popupWidth) / 2);
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY = Math
				.ceil((window.screen.width - popupHeight) / 2);
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
		
		 var url = "${ contextPath }/member/login";

		window.open(url, "로그인", 'width='
				+ popupWidth + ', height=' + popupHeight
				+ ', left=' + popupX + ', top=' + popupY);
	}
    
   
     
     
	
    
</script>
</head>
<body>
	
	
	<header class="main-header">
        <nav class="main-nav">
            <p class="main-logo" onclick="location.href='${contextPath}'">FANTIMATE</p>
            <c:choose>
	            <c:when test="${ !empty sessionScope.loginUser}">
		            <div class="main-menu">
		                <input type="checkbox" id="check" onclick="searchList()">
		                <div class="search-box">
		                    	<input type="text" placeholder="아티스트 검색" id="search-input"
		                    	onkeyup="search(this);">
		                    	<label for="check"><img src="${ contextPath }/resources/icon/search-icon.svg" alt="" class="nav-icon"></label>
		                </div>
		                <!-- 회원가입 버튼 생성전 예시 -->
		                <c:if test="${ loginUser.classifyMem eq 1}">
		                	<img src="${ contextPath }/resources/icon/user.svg" alt="" class="nav-icon" onclick="location.href='${ contextPath }/mypage/user/payments'">
		                </c:if>
		                <c:if test="${ loginUser.classifyMem eq 2}">
		                	<img src="${ contextPath }/resources/icon/user.svg" alt="" class="nav-icon" onclick="location.href='${ contextPath }/mypage/artist/feed'">
		                </c:if>
		                <c:if test="${ loginUser.classifyMem eq 3}">
		                	<img src="${ contextPath }/resources/icon/user.svg" alt="" class="nav-icon" onclick="location.href='${ contextPath }/mypage/agency/main'">
		                </c:if>
		                 <c:if test="${ loginUser.classifyMem eq 4}">
		                	<img src="${ contextPath }/resources/icon/user.svg" alt="" class="nav-icon" onclick="location.href='${ contextPath }/mypage/admin/paylist'">
		                </c:if>
		                <img src="${ contextPath }/resources/icon/alarm.svg" alt="" class="nav-icon" id="alarm-icon" onclick="alarmPage()">
		                <!-- 알람 갯수 카운트 -->
		                <div id="alarmCount">
		                </div>
		                <c:if test="${ loginUser.classifyMem eq 1}">
			                <img src="${ contextPath }/resources/icon/cart.svg" alt="" class="nav-icon" onclick="location.href='${contextPath}/pay/cart'">
			                <!-- 장바구니 갯수 카운트 -->
			                <div id="cartCount">
			                </div>
			                <img src="${ contextPath }/resources/icon/email.svg" alt="" class="nav-icon" id="mail-icon" onclick="mailList()">
			                <!-- 쪽지 갯수 카운트 -->
			                <div id="mailCount">
			                </div>
		                </c:if>
		                <c:if test ="${ loginUser.classifyMem ne 1}">
		                	<script>
								$("#alarmCount").css("right","97px");
		                	</script>
		                </c:if>
		                <img src="${ contextPath }/resources/icon/more.svg" alt="" class="nav-icon" onclick="etcList()">
		            </div>
	            </c:when>
	            <c:otherwise>
	            	<div class="main-menu">
		                <input type="button" id="loginBtn" value="로그인" onclick="showLoginPage();"/>
		                <input type="button" id="joinBtn" value="회원가입" onclick="showJoinPage();"/>
	            	</div>
	            </c:otherwise>
            </c:choose>
        </nav>
    </header>
      <!-- 검색 구간 -->
    <section class="search-section">
		<div class="search-result" style="overflow: auto">
		</div>
		<c:if test ="${ loginUser.classifyMem ne 1}">
		   <script>
				$(".search-result").css("margin-right","280px");
		   </script>
		 </c:if>
    </section>
    <!-- 아티스트명 검색 -->
    <script>
    function search(target){
    	var artistName = target.value;
    	console.log(artistName);
    	
    	$.ajax({
    		url : "${contextPath}/main/search",
    		type : "get",
			data : {artistName : artistName},
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				
				$(".search-result").html("");
				if(data.length > 0 && target.value != ''){
					$('.search-result').css('display', 'block');
					for(var i in data) {
						var divArea = $("<div id='divSearchArea' onclick='goSearch(" + "\"" + data[i].artG.artNameEn + "\"" + ")'>");
						var div = $("<div class='profile-circle'><img src='${ contextPath }/resources/uploadFiles/"+ data[i].att.attSvName +"' alt='' class='feed-profile'></div>");
						var span = $("<span id='artistN'>"+data[i].artG.artNameEn +"</span>");
						divArea.append(div,span);
						$(".search-result").append(divArea);
						//
					}
				} else if(target.value == ''){
					$('.search-result').css('display', 'none');
				} else if(data.length==0){
					$('.search-result').css('display', 'none');
				}
				
			},
			error : function(e) {
				console.log(e)
			}
    	})
  
    	
    }
 	// 구독 아티스트 창 열기
    function goSearch(artNameEn){
		location.href='${contextPath}/main/subscribe?artNameEn=' + artNameEn;
    }
    
    </script>
	<!-- 알람 구간 -->
    <div class="alarm-hide-show">
        <section class="alarm-section">
            <div style="overflow:auto" class="alarm-list">
            <c:set var="now" value="<%=new java.util.Date()%>"/>
                <p class="alarm-date"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></p>
                <ul class="today-alarm">
                	<!-- 알람 내역  ajax-->
                    <!--<li class="alarm-content">회원이 작성한 게시글에 좋아요가 달렸습니다. <p class="alarm-time">1시간 전</p></li>  -->
                </ul>
            </div>
            <c:if test ="${ loginUser.classifyMem ne 1}">
		       <script>
					$(".alarm-list").css("margin-right","110px");
		       </script>
		    </c:if>
        </section>
    </div>
    
    <!-- 알람 전체 리스트 ajax -->
    <script>
    function alarmPage(){
    	
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
    	
    	/* $(function(){
            $('.divSec').mouseenter(function(){
                $('.trash-btn').show();
            });
            $('.divSec').mouseleave(function(){
                $('.trash-btn').hide();
            });
        }); */
    	
    	// (오늘만 보이게)
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth();
		var day = now.getDate();
		
		var month = new String(now.getMonth() + 1);
		month = month >= 10 ? month : '0' + month; // month 두자리로 저장
		var day = new String(now.getDate());
		day = day >= 10 ? day : '0' + day;
		
		var dateFormat = year + "/" + month + "/" + day;
    	
		$.ajax({
			
			url: "${contextPath}/main/alarmList",
			data : {dateFormat : dateFormat},
			dataType : "json",
			success : function(data){
				console.log(data);
				
				
				alarmList = $(".today-alarm");
				alarmList.html("");
				
				if(data.length==0){
					
					alarmList.append("<li class='alarm-content'>"+ "알람 내역 없음" +"<p class='alarm-time'></p></li>");
					$(".alarm-list").css("height","200px");
					
				} else {
					
				for(var i in data){
					
					if(data[i].refAlCode == 16){
						var sendId = data[i].alContent.substr(0,data[i].alContent.indexOf("님"));
						alarmList.append("<li class='alarm-content'>"+ data[i].alContent +"<p class='alarm-time'></p><button id='acceptBtn' onclick='acceptFriend(" + data[i].alCode + "," + "\"" + sendId + "\"" + ")'>"+"수락"+"</button><button id='noBtn' onclick='declineFriend(" + data[i].alCode + "," + "\"" + sendId + "\"" + ")'>"+"거절"+"</button></li>");
						alarmList.append("<hr>");
					} else if(data[i].refAlCode == 2 || data[i].refAlCode == 3){
						// 팬피드 디테일 
						//<input type="hidden" name="challNo" value="">
						alarmList.append("<div class='divSec'><li class='alarm-content' onclick='fanFeed(" + data[i].ref_id + ")'>"+ data[i].alContent +"<p class='alarm-time'></p></li><img src='${ contextPath }/resources/icon/trash.png' alt='' onclick='trash(" + data[i].alCode + ")' id='sample' class='trash-btn'></div>");
						alarmList.append("<hr>");
					} else if (data[i].refAlCode == 1){
						// 아티스트피드 디테일 
						alarmList.append("<div class='divSec'><li class='alarm-content' onclick='artistFeed(" + data[i].ref_id + ")'>"+ data[i].alContent +"<p class='alarm-time'></p></li><img src='${ contextPath }/resources/icon/trash.png' alt='' onclick='trash(" + data[i].alCode + ")' class='trash-btn'></div>");
						alarmList.append("<hr>");
					} else if(data[i].refAlCode == 6 || data[i].refAlCode == 7 || data[i].refAlCode == 11 || data[i].refAlCode == 13 || data[i].refAlCode == 14 || data[i].refAlCode == 15){
						// 신고 디테일
						alarmList.append("<div class='divSec'><li class='alarm-content' onclick='reportDetail()'>"+ data[i].alContent +"<p class='alarm-time'></p></li><img src='${ contextPath }/resources/icon/trash.png' alt='' onclick='trash(" + data[i].alCode + ")' class='trash-btn'></div>");
						alarmList.append("<hr>");
					} else if(data[i].refAlCode == 10 || data.alist[i].refAlCode == 8){
						// 오피셜 디테일
						alarmList.append("<div class='divSec'><li class='alarm-content' onclick='mediaDetail(" + data[i].ref_id + ")'>"+ data[i].alContent +"<p class='alarm-time'></p></li><img src='${ contextPath }/resources/icon/trash.png' alt='' onclick='trash(" + data[i].alCode + ")' class='trash-btn'></div>");
						alarmList.append("<hr>");
					} else if(data[i].refAlCode == 9){
						// 오피셜 스케줄 등록
						var sendArtiName = data[i].alContent.substr(0,data[i].alContent.indexOf("님"));
						alarmList.append("<div class='divSec'><li class='alarm-content' onclick='schedule(" + "\"" + sendArtiName + "\"" + ")'>"+ data[i].alContent +"<p class='alarm-time'></p></li><img src='${ contextPath }/resources/icon/trash.png' alt='' onclick='trash(" + data[i].alCode + ")' class='trash-btn'></div>");
						alarmList.append("<hr>");
					} else if (data[i].refAlCode == 12){
						// 팬스토어 상세페이지
						alarmList.append("<div class='divSec'><li class='alarm-content' onclick='fanStore(" + data[i].ref_id + ")'>"+ data[i].alContent +"<p class='alarm-time'></p></li><img src='${ contextPath }/resources/icon/trash.png' alt='' onclick='trash(" + data[i].alCode + ")' class='trash-btn'></div>");
						alarmList.append("<hr>");
					} else if(data[i].refAlCode == 18){
						// 공지사항 상세페이지
						alarmList.append("<div class='divSec'><li class='alarm-content' onclick='notice(" + data[i].ref_id + ")'>"+ data[i].alContent +"<p class='alarm-time'></p></li><img src='${ contextPath }/resources/icon/trash.png' alt='' onclick='trash(" + data[i].alCode + ")' class='trash-btn'></div>");
						alarmList.append("<hr>");
					} else {
						alarmList.append("<div class='divSec'><li class='alarm-content'>"+ data[i].alContent +"<p class='alarm-time'></p></li><img src='${ contextPath }/resources/icon/trash.png' alt='' onclick='trash(" + data[i].alCode + ")' class='trash-btn'></div>");
						alarmList.append("<hr>");
					}
					
					// 현재 시간 가져옴
					var now = new Date();

					// 알람 받은 시간
					var alarmDay = new Date(data[i].alTime);
					// 오늘 받은 알람 (당일)
					if(now.getDate() == alarmDay.getDate()){
						var nowTime = now.getTime();
						var alarmTime = alarmDay.getTime();
						if(nowTime > alarmTime){
							// 시간을 비교
							sec = parseInt(nowTime - alarmTime) / 1000;
							day = parseInt(sec/60/60/24);
							sec = (sec - (day * 60 * 60 *24));
							hour = parseInt(sec/60/60);
							sec = (sec - (hour*60*60));
							min = parseInt(sec/60);
							sec = parseInt(sec-(min*60));
							if(hour > 0){
								// 몇시간 전인지
								document.getElementsByClassName("alarm-time")[i].innerHTML = hour+"시간 전";
								console.log(hour + "시간 전");
							} else if(min > 0){
								// 몇분전인지
								document.getElementsByClassName("alarm-time")[i].innerHTML = min+"분 전";
								console.log(min + "분 전");
							} else if(sec > 0){
								// 몇 초 전인지
								document.getElementsByClassName("alarm-time")[i].innerHTML = sec+"초 전";
								console.log(sec + "초 전");
							}
							
						}
					}
				}
			}
				
				
			},
			error : function(e){
				alert("code : " + e.status + "\n"
						+ "message : " + e.responseText);
			}
			
		});  	
    }
    
 	// 호버시 쓰레기 통 보이게
    
    
    // 알람 쓰레기통 onclick
    function trash(alCode){
 		
		// (오늘만 보이게)
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth();
		var day = now.getDate();
		
		var month = new String(now.getMonth() + 1);
		month = month >= 10 ? month : '0' + month; // month 두자리로 저장
		var day = new String(now.getDate());
		day = day >= 10 ? day : '0' + day;
		
		var dateFormat = year + "/" + month + "/" + day;
		
		
		$.ajax({
			url: "${contextPath}/main/alarmDelete",
			type: "get",
			data : {alCode : alCode , dateFormat : dateFormat},
			dataType : "json",
			success : function(data){
				console.log(data);
				
				alarmList = $(".today-alarm");
				alarmList.html("");
				
				if(data.alist.length==0){
					
					alarmList.append("<li class='alarm-content'>"+ "알람 내역 없음" +"<p class='alarm-time'></p></li>");
					$(".alarm-list").css("height","200px");
					
				} else {
					
				for(var i in data.alist){
					
					if(data.alist[i].refAlCode == 16){
						var sendId = data.alist[i].alContent.substr(0,data.alist[i].alContent.indexOf("님"));
						alarmList.append("<li class='alarm-content'>"+ data.alist[i].alContent +"<p class='alarm-time'></p><button id='acceptBtn' onclick='acceptFriend(" + data.alist[i].alCode + "," + "\"" + sendId + "\"" + ")'>"+"수락"+"</button><button id='noBtn' onclick='declineFriend(" + data.alist[i].alCode + "," + "\"" + sendId + "\"" + ")'>"+"거절"+"</button></li>");
						alarmList.append("<hr>");
					} else if(data.alist[i].refAlCode == 2 || data.alist[i].refAlCode == 3){
						// 팬피드 디테일 
						//<input type="hidden" name="challNo" value="">
						alarmList.append("<div class='divSec'><li class='alarm-content' onclick='fanFeed(" + data.alist[i].ref_id + ")'>"+ data.alist[i].alContent +"<p class='alarm-time'></p></li><img src='${ contextPath }/resources/icon/trash.png' alt='' onclick='trash(" + data.alist[i].alCode + ")' id='sample' class='trash-btn'></div>");
						alarmList.append("<hr>");
					} else if (data.alist[i].refAlCode == 1){
						// 아티스트피드 디테일 
						alarmList.append("<div class='divSec'><li class='alarm-content' onclick='artistFeed(" + data.alist[i].ref_id + ")'>"+ data.alist[i].alContent +"<p class='alarm-time'></p></li><img src='${ contextPath }/resources/icon/trash.png' alt='' onclick='trash(" + data.alist[i].alCode + ")' class='trash-btn'></div>");
						alarmList.append("<hr>");
					} else if(data.alist[i].refAlCode == 6 || data.alist[i].refAlCode == 7 || data.alist[i].refAlCode == 11 || data.alist[i].refAlCode == 13 || data.alist[i].refAlCode == 14 || data.alist[i].refAlCode == 15){
						// 신고 디테일
						alarmList.append("<div class='divSec'><li class='alarm-content' onclick='reportDetail()'>"+ data.alist[i].alContent +"<p class='alarm-time'></p></li><img src='${ contextPath }/resources/icon/trash.png' alt='' onclick='trash(" + data.alist[i].alCode + ")' class='trash-btn'></div>");
						alarmList.append("<hr>");
					} else if(data.alist[i].refAlCode == 10){
						// 오피셜 디테일
						alarmList.append("<div class='divSec'><li class='alarm-content' onclick='mediaDetail(" + data.alist[i].ref_id + ")'>"+ data.alist[i].alContent +"<p class='alarm-time'></p></li><img src='${ contextPath }/resources/icon/trash.png' alt='' onclick='trash(" + data.alist[i].alCode + ")' class='trash-btn'></div>");
						alarmList.append("<hr>");
					} else if(data.alist[i].refAlCode == 9){
						// 오피셜 스케줄 등록
						var sendArtiName = data.alist[i].alContent.substr(0,data.alist[i].alContent.indexOf("님"));
						alarmList.append("<div class='divSec'><li class='alarm-content' onclick='schedule(" + "\"" + sendArtiName + "\"" + ")'>"+ data.alist[i].alContent +"<p class='alarm-time'></p></li><img src='${ contextPath }/resources/icon/trash.png' alt='' onclick='trash(" + data.alist[i].alCode + ")' class='trash-btn'></div>");
						alarmList.append("<hr>");
					} else if (data.alist[i].refAlCode == 12){
						// 팬스토어 상세페이지
						alarmList.append("<div class='divSec'><li class='alarm-content' onclick='fanStore(" + data.alist[i].ref_id + ")'>"+ data.alist[i].alContent +"<p class='alarm-time'></p></li><img src='${ contextPath }/resources/icon/trash.png' alt='' onclick='trash(" + data.alist[i].alCode + ")' class='trash-btn'></div>");
						alarmList.append("<hr>");
					} else if(data.alist[i].refAlCode == 18){
						// 공지사항 상세페이지
						alarmList.append("<div class='divSec'><li class='alarm-content' onclick='notice(" + data.alist[i].ref_id + ")'>"+ data.alist[i].alContent +"<p class='alarm-time'></p></li><img src='${ contextPath }/resources/icon/trash.png' alt='' onclick='trash(" + data.alist[i].alCode + ")' class='trash-btn'></div>");
						alarmList.append("<hr>");
					} else {
						alarmList.append("<div class='divSec'><li class='alarm-content'>"+ data.alist[i].alContent +"<p class='alarm-time'></p></li><img src='${ contextPath }/resources/icon/trash.png' alt='' onclick='trash(" + data.alist[i].alCode + ")' class='trash-btn'></div>");
						alarmList.append("<hr>");
					}
					
					// 현재 시간 가져옴
					var now = new Date();

					// 알람 받은 시간
					var alarmDay = new Date(data.alist[i].alTime);
					// 오늘 받은 알람 (당일)
					if(now.getDate() == alarmDay.getDate()){
						var nowTime = now.getTime();
						var alarmTime = alarmDay.getTime();
						if(nowTime > alarmTime){
							// 시간을 비교
							sec = parseInt(nowTime - alarmTime) / 1000;
							day = parseInt(sec/60/60/24);
							sec = (sec - (day * 60 * 60 *24));
							hour = parseInt(sec/60/60);
							sec = (sec - (hour*60*60));
							min = parseInt(sec/60);
							sec = parseInt(sec-(min*60));
							if(hour > 0){
								// 몇시간 전인지
								document.getElementsByClassName("alarm-time")[i].innerHTML = hour+"시간 전";
								console.log(hour + "시간 전");
							} else if(min > 0){
								// 몇분전인지
								document.getElementsByClassName("alarm-time")[i].innerHTML = min+"분 전";
								console.log(min + "분 전");
							} else if(sec > 0){
								// 몇 초 전인지
								document.getElementsByClassName("alarm-time")[i].innerHTML = sec+"초 전";
								console.log(sec + "초 전");
							}
							
						}
					}
				}
				}
				
				// 알람 카운트 -1
				document.getElementById("alarmCount").innerHTML = data.countA;
				
			},
			error : function(e){
				alert("code : " + e.status + "\n"
						+ "message : " + e.responseText);
			}
			
		});  	
			

    }
 	
    
    function acceptFriend(alCode,sendId){
		location.href='${contextPath}/main/acceptFriend?alCode=' + alCode + "&sendId=" + sendId;
    }
    
    function declineFriend(alCode,sendId){
		location.href='${contextPath}/main/declineFriend?alCode=' + alCode + "&sendId=" + sendId;
    }
    
    function fanFeed(refId){
    	// refId 추후 수정 
		location.href='${contextPath}/fanfeed/detailView?fid=' + refId;
    }
    
    function artistFeed(refId){
    	// refId 추후 수정 
		location.href='${contextPath}/artistfeed/detailView?fid=' + refId;
    }
    
    function reportDetail(){
		location.href='${contextPath}/mypage/admin/report';
    }
    
    function mediaDetail(mediaNum){
		location.href='${contextPath}/official/detail?mediaNum=' + mediaNum;
    }
    
    function schedule(sendArtiName){
    	// 추후 수정 
		location.href='${contextPath}//official/schedule/artiName=' + sendArtiName;
    }
    
    function fanStore(fcode){
		location.href='${contextPath}/fanStore/detail?fcode=' + fcode;
    }
    
    function notice(nid){
		location.href='${contextPath}/notice/detail?nid=' + nid;
    }
    </script>
    
    <!-- 알람 카운트 ajax -->
    <c:if test="${ !empty sessionScope.loginUser}">
    <script>
    	$(function(){
    		alarmCount();
    	});
    	
    	function alarmCount(){
    		
    		// (오늘만 보이게)
    		var now = new Date();
    		var year = now.getFullYear();
    		var month = now.getMonth();
    		var day = now.getDate();
    		
    		var month = new String(now.getMonth() + 1);
    		month = month >= 10 ? month : '0' + month; // month 두자리로 저장
    		var day = new String(now.getDate());
    		day = day >= 10 ? day : '0' + day;
    		
    		var dateFormat = year + "/" + month + "/" + day;
    		
    		$.ajax({
    			url: "${contextPath}/main/alarmCount",
    			data : {dateFormat : dateFormat},
    			dataType : "json",
    			success : function(data){
    				console.log(data);
    				
    				document.getElementById("alarmCount").innerHTML = data;
    				
    				
    			},
    			error : function(e){
    				alert("code : " + e.status + "\n"
    						+ "message : " + e.responseText);
    			}
    			
    		}); 
    		
    	}
    
    
    </script>
    </c:if>
    
    <!-- 쪽지 카운트 ajax -->
    <c:if test="${ !empty sessionScope.loginUser}">
    <script>
    	$(function(){
    		mailCount();
    	});
    	
    	function mailCount(){
    		
    		$.ajax({
    			url: "${contextPath}/main/mailCount",
    			dataType : "json",
    			success : function(data){
    				console.log(data);
    				
    				document.getElementById("mailCount").innerHTML = data;
    				
    				
    			},
    			error : function(e){
    				alert("code : " + e.status + "\n"
    						+ "message : " + e.responseText);
    			}
    			
    		}); 
    		
    	}
    
    
    </script>
    </c:if>
    
    <!-- 장바구니 카운트 ajax -->
    <c:if test="${ !empty sessionScope.loginUser}">
    <script>
    	$(function(){
    		cartCount();
    	});
    	
    	function cartCount(){
    		
    		$.ajax({
    			url: "${contextPath}/main/cartCount",
    			dataType : "json",
    			success : function(data){
    				console.log(data);
    				
    				document.getElementById("cartCount").innerHTML = data;
    				
    				
    			},
    			error : function(e){
    				alert("code : " + e.status + "\n"
    						+ "message : " + e.responseText);
    			}
    			
    		}); 
    		
    	}
    
    
    </script>
    </c:if>
    
    
     <!-- 친구 쪽지 보내기 include -->
     
    <jsp:include page="../common/messageSend.jsp"/>
    
    
    <!-- 쪽지부분 ajax -->
    <script>
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
        
        // 공통 ajax
        callAjax();
    	        
    
    }
	 // 토클버튼 (전체쪽지/친구쪽지) --> ajax 처리
	   function toggleChange() {
	 
	   var checkBox = document.getElementById("check-toggle");
	
	   if (checkBox.checked == true){
	       $('#wholeMailContent').hide();
	       $('#friendContent').show();
	       
	       //console.log("친구");
	      
	       // 친구 ajax
	       callFriendAjax();
	        
	    } else {
	       $('#wholeMailContent').show();
	       $('#friendContent').hide();
	       
	       // 공통 ajax
	       callAjax(); 
	    }
	}
	 
	 
	 // 공통 ajax
	 function callAjax(){
		// 전체 쪽지 불러오기 ajax
	       $.ajax({
				url: "${contextPath}/main/messageWholeList",
				dataType : "json",
				success : function(data){
					console.log(data);
					
					var wholeMailList = $("#wholeMailContent");
					wholeMailList.html("");
					
					// 쪽지 쌓이는 방식 
					var p1 = $("<p class='mail-title'>"+"전체 쪽지 목록"+"</p>");
					//1.전체 목록 div(wholeMailContent)에 제목 append
					wholeMailList.append(p1);
					
					for(var i in data.dlist){
						console.log("date"+i);
						var ul = $("<ul id='day"+i+"'class='today-mail'><p class='mail-date'>"+data.dlist[i].messDate+"</p></ul>");
						
						//2.전체 목록 div(wholeMailContent)에 ul태그&날짜 append
						wholeMailList.append(ul);
						
						// 해당 날짜에 쪽지 쌓이게 
						for(var j in data.mlist){
							if(data.dlist[i].messDate == data.mlist[j].messDate){
								
								
								// 쪽지 읽음 여부 
								var readStatus;
								if(data.mlist[j].messRead == 'Y'){
									readStatus = " ";
									
								} else {
									readStatus = "안 읽음";
									
								}
								
								var li = $("<li class='mail-content' onclick='readMessage(" + data.mlist[j].messCode + "," + "\""  + data.mlist[j].messTitle + "\"" + ",\"" + data.mlist[j].messContent + "\"" + ",\"" + data.mlist[j].messSendId + "\"" + ")'><p class='mail-id'>"+data.mlist[j].messSendId+"</p>"+data.mlist[j].messTitle+"<p class='mail-time'></p><p class='mail-read'>"+readStatus+"</p></li>");
								//3.해당 ul태그를 찾아서 날짜에 맞는 쪽지list append 
								$("#day"+i+"").append(li);
								
								
								// 현재 시간 가져옴
								var now = new Date();
								// 알람 받은 시간
								var messageDay = new Date(data.mlist[j].messDate);
								// 오늘 받은 알람 (당일)
								if(now.getDate() == messageDay.getDate()){
									var nowTime = now.getTime();
									var messageTime = messageDay.getTime();
									if(nowTime > messageTime){
										// 시간을 비교
										sec = parseInt(nowTime - messageTime) / 1000;
										day = parseInt(sec/60/60/24);
										sec = (sec - (day * 60 * 60 *24));
										hour = parseInt(sec/60/60);
										sec = (sec - (hour*60*60));
										min = parseInt(sec/60);
										sec = parseInt(sec-(min*60));
										if(hour > 0){
											// 몇시간 전인지
											document.getElementsByClassName("mail-time")[j].innerHTML = hour+"시간 전";
											console.log(hour + "시간 전");
										} else if(min > 0){
											// 몇분전인지
											document.getElementsByClassName("mail-time")[j].innerHTML = min+"분 전";
											console.log(min + "분 전");
										} else if(sec > 0){
											// 몇 초 전인지
											document.getElementsByClassName("mail-time")[j].innerHTML = sec+"초 전";
											console.log(sec + "초 전");
										}
										
									}
								} else if(now.getFullYear() > messageDay.getFullYear()){
									// 몇 년 전 
									minus= now.getFullYear()-messageDay.getFullYear();
						            //두개의 차이를 구해서 표시
						            document.getElementsByClassName("mail-time")[j].innerHTML = minus+"년 전";
						            console.log(minus+"년 전");
								} else if(now.getMonth() > messageDay.getMonth()){
									// 몇달 전 
									minus= now.getMonth()-messageDay.getMonth();
						            document.getElementsByClassName("mail-time")[j].innerHTML = minus+"달 전";
						            console.log(minus+"달 전");
								} else if(now.getDate() > messageDay.getDate()){
									// 몇일전 
									minus= now.getDate()-messageDay.getDate();
						            document.getElementsByClassName("mail-time")[j].innerHTML = minus+"일 전";
						            console.log(minus+"일 전");
								}
								
								
								
							}
							
							
						}
						
					}
					
					
				},
				error : function(e){
					alert("code : " + e.status + "\n"
							+ "message : " + e.responseText);
				}
				
			});
	 	}
	 	
	 	// 쪽지 이동 
	 	function readMessage(messCode,messTitle,messContent,messSendId){
	 		location.href='${contextPath}/main/readMessage?messCode=' + messCode + "&messTitle=" + messTitle +"&messContent=" + messContent +"&messSendId=" + messSendId;
	 		
	 	}
	 	
	 	// 친구 쪽지 ajax
	 	function callFriendAjax(){
	 		
	 		$.ajax({
				url: "${contextPath}/main/friendMessage",
				dataType : "json",
				success : function(data){
					console.log(data);
					
					var friendContent = $("#friendContent");
					friendContent.html("");
					
					var toggle = $("<div class='toggle-date-section'><p class='mail-title'>"+"친구 쪽지 목록"+"</p></div>");
					
					friendContent.append(toggle);
					
					for(var i in data.flist){
						
						var friendInfoDiv = $("<div class='accordion-friendInfo'>");
						var checkbox = $("<input type='checkbox' id='friend"+i+"'>");
						var label = $("<label for='friend"+i+"'>");
                        var friendInfo = $("<div class='friend-info-section'>");
                        var profileInfo = $("<div class='profile-info'>");
                        var friendProfile = $("<div class='profile-circle'><img src='${ contextPath }/resources/uploadFiles/"+ data.flist[i].att.attSvName+"' alt='' class='friend-profile'></div>")
                        var friendId = $("<p class='friend-profile-name'>"+ data.flist[i].att.id +"</p>");
                        var sendBtn = $("<div class='sendBtn-section'><button class='sendBtn' onclick='sendMess("+ "\"" + data.flist[i].att.id+ "\"" + ")'>"+ "쪽지 보내기" +"</button></div>");
                        var arrow = $("<em></em>");
                        
                        friendInfo.append(profileInfo,sendBtn);
                        profileInfo.append(friendProfile,friendId);
                        label.append(friendInfo,arrow);
                        friendInfoDiv.append(checkbox,label);
                        friendContent.append(friendInfoDiv);
                        
                        var fmailList = $("<div style='overflow:auto' class='friend-mailList'>");
                        var ul2 = $("<ul class='friendMail-contentList'>");
                        
                        for(var j in data.fmlist){
                        	
                        	if(data.fmlist[j].msg.messSendId == data.flist[i].att.id){
                        		
                        		// 쪽지 읽음 여부 
								var readStatus;
								if(data.fmlist[j].msg.messRead == 'Y'){
									readStatus = " ";
								} else {
									readStatus = "안 읽음";
								}
                        		
								var li2 = $("<li class='friendMail-content' onclick='readMessage(" + data.fmlist[j].msg.messCode + "," + "\""  + data.fmlist[j].msg.messTitle + "\"" + ",\"" + data.fmlist[j].msg.messContent + "\"" + ",\"" + data.fmlist[j].msg.messSendId + "\"" + ")'><p class='mail-id'>"+data.fmlist[j].msg.messSendId+"</p>"+data.fmlist[j].msg.messTitle+"<p class='fr-time'></p><p class='mail-read'>"+readStatus+"</p></li>");

								ul2.append(li2);
								fmailList.append(ul2);
								friendInfoDiv.append(fmailList);
								
					
								
                        	}
                        	
                        }
						
					}
					
					
					
				},
				error : function(e){
					alert("code : " + e.status + "\n"
							+ "message : " + e.responseText);
				}
				
			});
	 		
	 	}
	 	
	 	
	 
    </script>
    
    <script>
 // 친구한테 쪽지 보내기
	 function sendMess(recId){
    	$(".form-send-message").css({"display":"block"})
    	var messSendId = "${loginUser.id}";
    	var messRecId = recId;
    	$(".to-id").text(messRecId);
    }
	
    // 쪽지 보내기의 보내기 버튼클릭시 
    $("#sendBtn").click(function(){
    	var messSendId = "${loginUser.id}";
    	var messRecId = $(".to-id").text();
    	
    	
    	$(".mess-send-id").val(messSendId)
		$(".mess-rec-id").val(messRecId)
		var form = $(".form-send-message").serialize();
    	$.ajax({
			url : "${pageContext.request.contextPath}/main/sendMessage",
			method : "post",
			data : form,
			dataType : "json",
			success : function(data) {
				alert(data.msg)
				location.href="${contextPath}";
			},
			error : function(e) {
				alert(e)
			}
		});
    	
    });
    
    </script>
    
    
    
    <!-- 쪽지 구간 -->
    <div class="mail-hide-show">
        <section class="mail-section">
            <div style="overflow:auto" id="mailList">
                <!-- 토클 -->
                    <div class="toggle-place">
                        <div class="toggle-change" tabindex="0">
                            <input type="checkbox" name="my_checkbox" value="yes" id="check-toggle" onclick="toggleChange()"/>
                            <label for="check-toggle">
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
                    
                <!-- 1. 전체 쪽지 목록 -->
                <div id="wholeMailContent">
                    <p class="mail-title">전체 쪽지 목록</p>
                 <!-- ajax -->
                </div>
                 <!-- 2. 친구 쪽지 목록 -->
                 <div id="friendContent">
					<!-- ajax -->
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
                    <c:if test="${ loginUser.classifyMem eq 1}">
                    	<li class="etc-content" id="fanStore" onclick="location.href='${ contextPath }/fanStore/list'">팬 스토어</li>
                    	<li class="etc-content" id="payPlan" onclick="location.href='${ contextPath }/pay/plan'">요금 플랜</li>
                    </c:if>
                    <li class="etc-content" id="notice" onclick="location.href='${ contextPath }/notice/list'">공지사항</li>
                    <li class="etc-content" id="logout" onclick="location.href='${ contextPath }/member/logout'">로그아웃</li>
                </ul>
            </div>
        </section>
    </div>
    
    
    
</body>
</html>
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
    <link rel="stylesheet" href="${ contextPath }/resources/css/account/login.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <title>로그인</title>
	<script type="text/javascript">
		function findId() {
			if ($('.login-section').css('display') == 'none') {
				$('.login-section').show();
			} else {
				$('.login-section').hide();
				$('.search-pass-section').hide();
				$('.search-id-section').show();
			}
		}
	
		function findPass() {
			if ($('.login-section').css('display') == 'none') {
				$('.login-section').show();
			} else {
				$('.login-section').hide();
				$('.search-id-section').hide();
				$('.search-pass-section').show();
			}
		}
		
		function backFindId(){
			if ($('.login-section').css('display') == 'none') {
				$('.login-section').show();
			} else {
				$('.search-id-section').hide();
			}
		}
		
		function backFindPass(){
			if ($('.login-section').css('display') == 'none') {
				$('.login-section').show();
			} else {
				$('.search-pass-section').hide();
			}
		}
		
		
		//dea602cd4e58b6d1655298d41e1a22dd
		window.Kakao.init("dea602cd4e58b6d1655298d41e1a22dd");
		
		function kakaoLogin(){
			window.Kakao.Auth.login({
				scope:'profile, account_email, gender',
				success: function(authObj){
					console.log(authObj);
					window.Kakao.API.request({
						url:'/v2/user/me',
						success: res => {
							const kakao_account = res.kakao_account;
							console.log(kakao_account);
						}
					});
				}
				
			});
		}
		
		   // 회원가입 팝업창 
	     function showJoinPage(){
	    	 self.close(); 
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
		
		
		
	</script>
</head>
<body>
	<!-- 메시지 -->
	 <c:if test="${ !empty msg }">
		 <c:choose>
			 <c:when test="${ msg eq 'success'}">
			 	<script>
				    alert("로그인이 완료되었습니다!");
					opener.location.href="${ contextPath }";
					window.close();
			    </script>
			 </c:when>
			 <c:when test="${ msg eq 'fail'}">
			 	<script>
				    alert("로그인 실패!");
			    </script>
			 </c:when>
			 <c:when test="${ msg eq 'stop'}">
			 	<script>
				    alert("활동이 정지된 회원입니다.");
			    </script>
			 </c:when>
		</c:choose>
	</c:if>
 <!-- 로그인 -->
 <form action="${ contextPath }/member/login" method="post">
    <section class="login-section">
        <header class="login-header">
            <p class="main-title">Fantimate Account</p>
            <p class="login-title">로그인</p>
        </header>
        <div class="login-input">
            <input type="text" class="login-input-info" name="id" placeholder="계정 ID" required>
            <input type="password" class="login-input-info" name="pwd" placeholder="비밀번호" required>
        </div>
        <div class="login-btn-section">
            <button id="loginBtn">로그인</button>
            <button type="button" id="closeBtn">닫기</button>
        </div>
        <div id="find-account">
            <a class="find-account-info" onclick="findPass()">비밀번호 찾기</a>
            <a class="find-account-info" onclick="findId()">아이디 찾기</a>
        </div>
        <hr id="line">
        <p class="otherLogintitle">또는 다른 계정으로 로그인</p>
        <div class="other-btn-section">
            <button type="button" class="other-login-btn" onclick="kakaoLogin();"><img src="${ contextPath }/resources/images/account/kakao.png" alt="" class="login-btn-logo"></button>
            <button class="other-login-btn"><img src="${ contextPath }/resources/images/account/google.png" alt="" class="login-btn-logo"></button>
            <button class="other-login-btn"><img src="${ contextPath }/resources/images/account/naver.png" alt="" class="login-btn-logo"></button>
        </div>
        <p class="otherLogintitle">아직 계정이 없다면 ? <a class="get-account" onclick="showJoinPage()">Fantimate 계정으로 가입하기</a></p>
        
        <select class="lang-option">
            <option>한국어</option>
            <option>English</option>
            <option>日本語</option>
        </select>
    </section>
 </form>
 
    <!-- 아이디 찾기 -->
    <form action="${ contextPath }/member/findId" method="post">
    <section class="search-id-section">
        <header class="search-id-header">
            <p class="join-title">Fantimate Account</p>
        </header>
        <p class="id-input-title">아이디 찾기</p>
        <div class="id-input">
            <input type="text" id="userName" class="id-input-info" name="fullName" placeholder="이름 입력" required>
            <input type="email" id="userEmail" class="id-input-info" name="userEmail" placeholder="이메일 입력" required>
        </div>
        <div class="id-btn-section">
            <button id="searchIdBtn">아이디 찾기</button>
            <button type="button" id="backBtn" onclick="backFindId()">뒤로가기</button>
        </div>
    </section>
    </form>
    
	<%-- <!-- 아이디 찾은 후 팝업창 띄어주기 -->
	<c:if test="${ empty passMsg }">
	<div id="my_modal">
        <a id='close' class='modal_close_btn'>닫기</a>
    </div>
	</c:if>
	 --%>
	<!-- 회원 아이디 모달창 띄어주기 -->
	<c:if test="${ !empty idMsg }">
    <c:choose>
	    <c:when test="${ idMsg eq 'success'}">
		    <div id="my_modal">
		    	<div id='idText'>${ fc.mem.name }님의 아이디는 <span id='idCss'>${ fc.us.id }</span>입니다</div>
		        <a id='close' class='modal_close_btn'>닫기</a>
		    </div>
	    </c:when>
	    <c:when test="${ idMsg eq 'fail'}">
		    <div id="my_modal">
		    	<div id='idText'>존재하는 이름 또는 이메일이 없습니다.</div>
		        <a id='close' class='modal_close_btn'>닫기</a>
		    </div>
	    </c:when>
    </c:choose>
    </c:if>
	
	
	<!-- 비번 모달창 띄어주기 -->
    <c:if test="${ !empty passMsg }">
    <c:choose>
	    <c:when test="${ passMsg eq 'success'}">
		    <div id="my_modal">
		    	<div id='idText'>회원님 이메일로 비밀번호를 발송하였습니다.</div>
		        <a id='close' class='modal_close_btn'>닫기</a>
		    </div>
	    </c:when>
	    <c:when test="${ passMsg eq 'fail'}">
		    <div id="my_modal">
		    	<div id='idText'>존재하는 아이디가 없습니다.</div>
		        <a id='close' class='modal_close_btn'>닫기</a>
		    </div>
	    </c:when>
    </c:choose>
    </c:if>
    
    
    <script>
    Element.prototype.setStyle = function(styles){
    	for (var k in styles) this.style[k] = styles[k];
    	return this;
    }
    </script>
    
    <script>
    function commonModal(){
    	var zIndex = 9999;
    	var modal = document.getElementById('my_modal');
    	
		// 모달 div 뒤에 배경 
    	var bg = document.createElement('div');
    	bg.setStyle({
    		position : 'fixed',
    		zIndex: zIndex,
    		left:'0px',
    		top: '0px',
    		width: '100%',
    		height: '100%',
    		overflow : 'auto',
    		// 리에어 색깔은 여기서 바꾸기 
    		backgroundColor:'rgba(0,0,0,0.4)'
    	});
    	document.body.append(bg);
    	
    	// 닫기 버튼 처리 , 시꺼면 레이어와 모달 div 지우기
    	modal.querySelector('.modal_close_btn').addEventListener('click', function() {
	        bg.remove();
	        modal.style.display = 'none';
	    });
    	 
   
    	
    	 modal.setStyle({
    		position: "fixed",
    		display: "block",
    		boxShadow : "0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)",
    		
    		// 레이어 보다 한칸 위에 보이기
    		zIndex: zIndex + 1,
    		
    		// div center 정렬
    		top: '50%',
    		left: '50%',
    		transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
    		
    	});
    	
    }
    
    
    </script>
  
     
      <!-- 아이디 찾기  -->
     <c:if test="${ !empty idMsg }">
		 <c:choose>
			 <c:when test="${ idMsg eq 'success'}">
			 	<script>
			 	commonModal();
				</script>
			 </c:when>
			 <c:when test="${ idMsg eq 'fail'}">
			 	<script>
			 	commonModal();
			    </script>
			 </c:when>
		</c:choose>
	</c:if>
     
    
   

    <!-- 비밀번호 찾기 -->
    <form action="${ contextPath }/member/findPwd" method="post">
    <section class="search-pass-section">
        <header class="search-pass-header">
            <p class="join-title">Fantimate Account</p>
        </header>
        <p class="pass-input-title">비밀번호 찾기</p>
        <div class="pass-input">
            <input type="text" id="uId" class="pass-input-info" name="id" placeholder="아이디 입력" required>
            <input type="email" id="uEmail" class="pass-input-info" name="email" placeholder="이메일 입력" required>
        </div>
        <div class="pass-btn-section">
            <button id="searchPassBtn">비밀번호 찾기</button>
            <button type="button" id="backBtn" onclick="backFindPass()">뒤로가기</button>
        </div>
    </section>
    </form>
    
    
    <!-- 비밀번호 찾기  -->
     <c:if test="${ !empty passMsg }">
		 <c:choose>
			 <c:when test="${ passMsg eq 'success'}">
			 	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2/dist/email.min.js"></script>
				<script type="text/javascript">
					(function() {
						emailjs.init("user_VSkDNH3A4JaE7ThmLy6n0");
					})();
				</script>
				<script type="text/javascript">
				
				(function(){
				var email = $("#userEmail").val();
				
				emailjs.send("Fantimate","template_47tfn1f",{
					name: '${userInfo.name}',
					pwd:  '${userInfo.pwd}',
					email: 'email'
					});
				
				})();
				//alert("회원님 이메일로 비밀번호를 발송하였습니다.");
				//window.close();
				commonModal();
				</script>
			 </c:when>
			 <c:when test="${ passMsg eq 'fail'}">
			 	<script>
			 	commonModal();
			    </script>
			 </c:when>
		</c:choose>
	</c:if>
	
	

</body>
</html>
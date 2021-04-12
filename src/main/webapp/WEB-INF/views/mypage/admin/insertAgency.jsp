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
<%--     <link rel="stylesheet" href="${ contextPath }/resources/css/common/navbar.css"> --%>
    <link rel="stylesheet" href="${ contextPath }/resources/css/mypage/jw.css">
<%--     <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png"> --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>insertAgency</title>
</head>
<body>
	<div id="mypageAdminSignInWrap">
		<div id="mypageAdminSignIn">
			<form id="agencyForm" method="post" action="${ contextPath }/mypage/admin/insertAgency"
			onsubmit="return joinValidate();">
				<h2>소속사 정보 등록</h2>
				<div id="mypageAgencySignInContents">
					<div id="mypageAgencySignIn">
						<label>소속사명</label> <label>사업자 등록번호</label> <label>이메일 주소</label>
						<label>연락처</label> <label>아이디</label> <label>비밀번호</label> <label>비밀번호
							확인</label>
					</div>
					<div id="mypageUserUpdateRight">
						<%-- value="${}""--%>
						<input type="text" name="name" value="SM"> 
						<input type="text" name="agNum" value="1438812345"> 
						<input type="email" name="agEmail" value="smenter33@sm.town">
						<input type="text" name="agPhone" value="0252523333"> 
						<input type="text" name="id" value="edam"> 
						<input type="password" name="pwd" placeholder="비밀번호는 8-20자의 영문, 숫자, 특수문자를 조합하여 설정해주세요."> 
						<input type="password" name="pwd2" placeholder="비밀번호는 8-20자의 영문, 숫자, 특수문자를 조합하여 설정해주세요.">
					</div>
				</div>

				<div class="mypage-Btn-align-center">
					<button class="mypage-pop-Btn-pink">등록하기</button>
					<button class="mypage-pop-Btn-navi" type="button">취소하기</button>
				</div>
			</form>
		</div>
	</div>
<script>
		function joinValidate(){
			if(!(/^[a-z][a-z0-9]{3,15}$/.test($("input[name=name]").val()))){
				alert('아이디는 영소문자로 시작해서 4~16글자 입력(숫자 포함 가능)');
				$("input[name=name]").select();
				return false;
			}

			if(!(/^[0-9]{10}$/).test($("#bsnum").val())){
				alert('사업자번호는 -를 제외한 숫자 10자리 입력');
				$("#bsnum").select();
				return false;
			}
			
			if(!(/(?=.*[a-z][A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,20}/.test($("#pwd").val()))){
				alert('비밀번호는 영어,숫자,특수문자를 포함한 8자리~20자리로 설정해 주세요.');
				$("#pwd").select();
				return false;
			}
			if($("#pwd2").val() != $("#pwd").val()){
				alert('비밀번호가 일치하지 않습니다.');
				$("#pwd2").select();
				return false;
			}
			if(!(/^[가-힣]{2,5}$/).test($("#name").val())){
				alert('이름은 한글 2~5글자 사이만 가능');
				$("#name").select();
				return false;
			}
			if(inputbirth > date){
				alert('생년월일을 정확하게 입력하세요.');
				$("#birth").select();
				return false;
			}
			if(!((/^[a-z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i).test($("#email").val()))){
				alert('이메일주소를 확인해주세요.');
				$("#email").select();
				return false;
			}
			if(!(/^010\D?\d{4}\D?\d{4}$|^01[16789]\D?\d{3}\D?\d{4}$/).test($("#phone").val())){
				alert('휴대전화번호를 확인해주세요.');
				$("#phone").select();
				return false;
			}
// 			if(!($("#m").checked && $("#f").checked)){
// 				alert('성별을 선택해주세요.');
// 				return false;
// 			}
// 			else if(($("#m").checked || $("#f").checked)){
// 				return true;
// 			}
			return true;
		}
	</script>
</body>
</html>
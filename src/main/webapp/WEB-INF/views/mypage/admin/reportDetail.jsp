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
<title>reportDetail</title>
</head>
<body>
	<div id="mypageReportDetailWrap">
        <div id="mypageReportDetail">
            <form id="reportDetailForm" method="post" action="${ contextPath }/mypage/admin/report/user">
                <!-- onsubmit="return joinValidate();"> -->
                <h2>신고 상세내역</h2>
                <div class="mypage-refund-detail">
                    <div class="mypage-refund-detail-in">
                        <label>신고한 유저 아이디
                            <input id="reportDetail1" type="text" name="rptId" readonly>
                        </label>
<!-- 오류 확인 type Date -->                        
                        <label>신고일자
                            <input id="reportDetail2" type="text" name="rptDateString" readonly>
                        </label>
                        <label>신고당한 유저 아이디
                            <input id="reportDetail3" type="text" name="id" readonly>
                        </label>
                        <label>신고한 게시물 제목
                            <input id="reportDetail4" type="text" name="rptTitle" readonly>
                        </label>
                        <label>신고 유형
                            <input id="reportDetail5" type="text" name="rptType" readonly>
                        </label>
                        <label>
                            신고 사유
                            <textarea id="reportDetail6" name="rptReason" cols="30" rows="10"></textarea>
                        </label>
                        <label>정지할 일수 입력
                        	<input type="text" name ="reportDay" placeholder="정지할 일수(반려시  0입력)">
                        </label>
                        <input id="reportDetail7" type="number" name="rptCode" readonly style="display:none;">
<!--                         <input id="reportDetail8" type="number" name="reportDay" readonly style="display:none;"> -->
                        <input id="reportDetail9" type="number" name="refId" readonly style="display:none;">
                        <input id="reportDetail10" type="text" name="isReported" readonly style="display:none;"><%-- 안쓰는거 넘기기 --%>
                    </div>
                    <div class="mypage-Btn-align-center">
                        <button class="mypage-pop-Btn-pink" id="reportThis">제재하기</button>
                        <button class="mypage-pop-Btn-navi" type="button">뒤로가기</button>
                    </div>
                </div>
        </form>
        </div>
    </div>  
<script>
		// 중복검사
		// 아이디 중복검사
		
		$(function(){
			// 아이디 중복 시 false, 아이디 사용 가능 시 true --> 유효성 검사를 위한 변수 
			var isUsable = false;
			
			$("#idCheckAgency").click(function(){
				var userId = $("#agencyForm input[name='id']");
				
				// UserId가 잘 가져와졌을때, 4글자 이상일 떄  발동하도록
				if(!userId || userId.val().length < 4){
					alert("아이디는 최소 4자리 이상이어야 합니다.");
					userId.focus();
				}else{
					// 4자리 이상의 userId 값을 입력했을 경우 $.ajax() 통신
					$.ajax({
						url : "${ contextPath }/mypage/admin/idCheck", 
						type : "post",
						data : {userId : userId.val()},
						success : function(data){
							console.log(data);
							if(data == "fail"){
								alert("사용할 수 없는 아이디입니다.");
								userId.focus();
							}else{
								//alert("사용 가능한 아이디입니다.");
								if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")){
									userId.prop('readonly', true);	// 더이상 id 수정 불가능
									isUsable = true; 	// 사용 가능한 아이디라는 flag 값
								}else{
									// confirm창에서 취소 누를경우 (처음, 또는 반복해서)
									userId.prop('readonly', false);	// 수정 가능하도록
									isUsable = false;
									userId.focus();
								}
							}
							
							// 아이디 중복 체크 후 중복이 아니며 사용하겠다고 선택한 경우
							// joinBtn disabled 제거 
							if(isUsable){
								$("#joinBtn").removeAttr("disabled");
							}else{
								$("#joinBtn").attr("disabled", true);
							}
						},
						error : function(e){
							console.log(e);
						}
					});
				}
				
			});
		});



		// 유효성 검사
		function joinValidate(){
			if(!(/^[a-z0-9가-힣A-Z]{2,20}$/.test($("input[name=name]").val()))){
				alert('소속사명은 2~20글자 입력(영어,숫자 한글 포함 가능)');
				$("input[name=name]").select();
				return false;
			}
			if(!(/^\d{3}-\d{2}-\d{5}$/).test($("input[name=agNum]").val())){
				alert('사업자번호를 다시 확인해 주세요.');
				$("input[name=agNum]").select();
				return false;
			}
			if(!(/^(?=.*[a-zA-Z])(?=.*\d)(?=.*\W).{8,20}$/.test($("input[name=pwd]").val()))){
				alert('비밀번호는 영어,숫자,특수문자를 포함한 8자리~20자리로 설정해 주세요.');
				$("input[name=pwd]").select();
				return false;
			}
			if($("input[name=pwd2]").val() != $("input[name=pwd]").val()){
				alert('비밀번호가 일치하지 않습니다.');
				$("input[name=pwd2]").select();
				return false;
			}
			if(!(/^[가-힣a-zA-z0-9]{2,10}$/).test($("input[name=name]").val())){
				alert('이름은 2~10글자 사이 한글 숫자 영어만 가능');
				$("#name").select();
				return false;
			}
			if(!((/^[a-z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i).test($("input[name=agEmail]").val()))){
				alert('이메일주소를 확인해주세요.');
				$("input[name=agEmail]").select();
				return false;
			} 
			
			if(!(/^01[01]-\D?\d{4}-\D?\d{4}$|^01[6-9]-\D?\d{3}-\D?\d{4}$/).test($("input[name=agPhone]").val())){
				alert('휴대전화번호를 확인해주세요.');
				$("input[name=agPhone]").select();
				return false;
			}
			// 아이디
			if(!(/^[a-z][a-z0-9]{3,19}$/.test($("input[name=id]").val()))){
				alert('아이디는 영어 4~20글자로 입력해주세요.');
				$("input[name=id]").select();
				return false;
			}
			
			return true;
		}
	</script>
</body>
</html>
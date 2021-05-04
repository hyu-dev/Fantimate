<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/mypage/agency/profile.css">
</head>
<body>
	<!-- 프로필 수정 -->
    <section class="profile-form-container pop-up">
        <div class="black-back"></div>
        <form class="profile-form artist-form">
            <span class="artist-text nanumsquare">프로필 수정</span>
            <hr>
            <table class="profile-table agency-table" class="nanumsquare">
            	<colgroup>
                    <col width="30%"/>
                    <col width="70%"/>
                </colgroup>
                <tr class="nanumsquare">
                	<td>아이디&nbsp;&nbsp;</td>
                	<td>
                		<span id="agencyId">${ agency.agId }</span>&nbsp;
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>비밀번호&nbsp;&nbsp;</td>
                	<td>
                		<input type="password" name="agPwd">&nbsp;<button id="passwordBtn" class="nanumsquare" type="button">비밀번호 변경</button>
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>소속사명&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="agName" value="${ agency.agName }">
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>연락처&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="agPhone" value="${ agency.agPhone }">
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>이메일&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="agEmail" value="${ agency.agEmail }">
                	</td>
                </tr>
            </table>
            <div class="arti-button-area">
                <button id="profileEditBtn" class="enroll-cancel-btn pink-btn nanumsquare" type="button">등록하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
                <input id="profileCancelBtn" class="enroll-cancel-btn blue-btn nanumsquare" type="reset" value="취소하기">
            </div>
        </form>
    </section>

	<!-- 스토어 관리 팝업 -->
    <section class="store-form-container pop-up">
        <div class="black-back"></div>
        <div class="store-admin-form pop-up-form">
            <span class="pop-up-text nanumsquare">스토어 관리</span>
            <br><br>
            <div class="choose-artist nanumsquare">아티스트를 선택하세요</div>
            <br>
            <div class="select-area">
                <select id="storeCategory" class="form-category" name="artiName">
                    <option value="">검색</option>
                    <c:forEach var="arti" items="${ artist }">
                    <option class="search-value" value="${ arti.artNameEn }">${ arti.artNameEn }</option>
                    </c:forEach>
                </select>
                <br><br>
                <div class="button-area">
                    <button id="storeAdminBtn" class="pink-btn nanumsquare">확인</button>&nbsp;&nbsp;
                    <button id="storeCancelBtn" class="blue-btn nanumsquare" type="button">취소</button>
                </div>
            </div>
        </div>
    </section>
    
    <!-- 오피셜 관리 팝업 -->
    <section class="official-form-container pop-up">
        <div class="black-back"></div>
        <div class="official-admin-form pop-up-form">
            <span class="pop-up-text nanumsquare">오피셜 관리</span>
            <br><br>
            <div class="choose-artist nanumsquare">아티스트를 선택하세요</div>
            <br>
            <div class="select-area">
                <select id="officialCategory" class="form-category" name="artiName">
                    <option value="">검색</option>
                    <c:forEach var="arti" items="${ artist }">
                    <option class="search-value" value="${ arti.artNameEn }">${ arti.artNameEn }</option>
                    </c:forEach>
                </select>
                <div class="move-text nanumsquare">오피셜 스케줄 페이지로 이동합니다</div>
                <br><br>
                <div class="button-area">
                    <button id="mediaAdminBtn" class="pink-btn nanumsquare" type="button">미디어</button>&nbsp;&nbsp;
                    <button id="scheduleAdminBtn" class="blue-btn nanumsquare" type="button">스케줄</button>
                </div>
                <div class="sub-button-area">
                    <button id="scheduleBtn" class="nanumsquare" type="button">확인</button>&nbsp;&nbsp;
                    <button id="scheduleCancelBtn" class="blue-btn nanumsquare" type="button">취소</button>
                </div>
            </div>
        </div>
    </section>

    <section class="profile-container nanumsquare">
        <div class="profile-box">
            <div class="profile-left">
                <table class="profile-area">
                    <colgroup>
                        <col width="40%"/>
                        <col width="60%"/>
                    </colgroup>
                    <tr>
                        <td class="info-title">소속사명</td>
                        <td class="info-content">${ agency.agName }</td>
                    </tr>
                    <tr>
                        <td class="info-title">사업자등록번호</td>
                        <td class="info-content">${ agency.agNum }</td>
                    </tr>
                    <tr>
                        <td class="info-title">연락처</td>
                        <td class="info-content">${ agency.agPhone }</td>
                    </tr>
                    <tr>
                        <td class="info-title">이메일</td>
                        <td class="info-content">${ agency.agEmail }</td>
                    </tr>
                </table>
                <button id="profileBtn" type="button">수정하기</button>
            </div>
            <div class="profile-right">
            	<button id="artistBtn" class="btn-group" type="button">아티스트 관리</button>
                <button id="storeBtn" class="btn-group" type="button">스토어 관리</button>
                <button id="officialBtn" class="btn-group" type="button">오피셜 관리</button>
            </div>
        </div>
    </section>
    
    <script type="text/javascript">
 	// 프로필 수정 버튼 눌렀을 때
    $('#profileBtn').click(function () {
        $(".profile-form-container").css("display", "block");
    });
    
    // 프로필 수정 팝업 등록하기 버튼 눌렀을 때
    $('#profileEditBtn').click(function () {
        var pwd = $("input[name=agPwd]").val();
        var agName = $("input[name=agName]").val();
        var agPhone = $("input[name=agPhone]").val();
        var agEmail = $("input[name=agEmail]").val();
    		
   		$.ajax({
   			url : "${ contextPath }/mypage/updateAgencyProfile",
   			data : { pwd : pwd, agName : agName, agPhone : agPhone, agEmail : agEmail},
   			type : "post",
   			dataType : "json",
   			success : function(data) {
				console.log("data : " + data);	// 프로필 데이터 받아오기
				if(data != null) {
					alert("프로필 수정이 완료되었습니다.");
				}
				
				profileArea = $(".profile-area");			
				profileArea.html("");
				
				var colgroup = $("<colgroup>");
				var col1 = $("<col width='40%'/>");
				var col2 = $("<col width='60%'/>");
				
				colgroup.append(col1);
				colgroup.append(col2);
				
				profileArea.append(colgroup);

				for(var i in data){
					console.log(data[i]);
					
					var tr = $("<tr>");
					var td1 = $("<td class='info-title'></td>");
					var td2 = $("<td class='info-content'>").text(data[i]);
					
					tr.append(td1);
					tr.append(td2);
					profileArea.append(tr);
				}
				
				$(".info-title:nth-child(1)").text("소속사명");
				$(".info-title:nth-child(2)").text("사업자등록번호");
				$(".info-title:nth-child(3)").text("연락처");
				$(".info-title:nth-child(4)").text("이메일");
   			} 
   		});
   		
   		$("#agencyId").text("");
   		$("input[name=agPwd]").val("");
        $("input[name=agRePwd]").val("");
        $("input[name=agName]").val("");
        $("input[name=agPhone]").val("");
        $("input[name=agEmail]").val("");
        
        $(".profile-form-container").css("display", "none");
    });
    
 	// 프로필 수정 팝업 취소하기 버튼 눌렀을 때
 	$("#profileCancelBtn").click(function() {
 		$(".profile-form-container").css("display", "none");
    });
    
	var artistName = [];
	
	// ---------------------------------------------------------------------------
    
    // 스토어 관리 창 눌렀을 때
    $("#storeBtn").click(function() {
    	 $(".store-form-container").css("display", "block");
    });
    
    // 스토어 관리 확인 버튼 눌렀을 때
    $("#storeAdminBtn").click(function() {
    	var artiName = $("#storeCategory").val();
    	
    	if(artiName != "") {
    		location.href="${ contextPath }/mypage/agency/store?artiName=" + artiName;
    	} else {
    		alert("아티스트를 선택해주세요");
    	}
    });
    
 	// 스토어 관리 취소 버튼 눌렀을 때
	$("#storeCancelBtn").click(unselect1);
    
    function unselect1() {
    	$(".store-form-container").css("display", "none");
    	
        $.each($("#storeCategory option:selected"), function () {
        	artistName.push($(this).val());
            $(this).prop('selected', false);
        });
    }
    
 	// ---------------------------------------------------------------------------
    
 	// 오피셜 관리 창 눌렀을 때
    $("#officialBtn").click(function() {
    	 $(".official-form-container").css("display", "block");
    });
    
    // 오피셜 미디어 버튼 눌렀을 때
    $("#mediaAdminBtn").click(function() {
    	var artiName = $("#officialCategory").val();
    	
    	if(artiName != "") {
    		location.href="${ contextPath }/mypage/agency/media?artiName=" + artiName;
    		$("#officialBtn").css("display", "none");
        	$("#artistBtn").css("display", "block");
    	} else {
    		alert("아티스트를 선택해주세요");
    	}
    });
    
    // 아티스트관리 버튼 눌렀을 때
    $("#artistBtn").click(function() {
    	var artiName = "${ artiName }";
    	
    	location.href="${ contextPath }/mypage/agency/main";
    });
    
    // 오피셜 스케줄 버튼 눌렀을 때
    $("#scheduleAdminBtn").click(function() {
    	var artiName = $("#officialCategory").val();
    	
    	if(artiName == "") {
    		alert("아티스트를 선택해주세요");
    	} else {
    		$("#officialCategory").css("display", "none");
         	$(".choose-artist").css("display", "none");
         	$(".button-area").css("display", "none");
         	$(".move-text").css("display", "block");
         	$(".sub-button-area").css("display", "flex");
    	}
    });
    
 	// 오피셜 스케줄 확인 버튼 눌렀을 때
    $("#scheduleBtn").click(function() {
    	var artiName = $("#officialCategory").val();
    	
    	if(artiName != "") {
    		location.href="${ contextPath }/official/schedule?artiName=" + artiName;
    	} else {
    		alert("아티스트를 선택해주세요");
    	}
    });
    
    // 오피셜 스케줄 취소 버튼 눌렀을 때    
    $("#scheduleCancelBtn").click(unselect2);
    
    function unselect2() {
    	$(".official-form-container").css("display", "none");
    	$("#officialCategory").css("display", "block");
     	$(".choose-artist").css("display", "block");
     	$(".button-area").css("display", "flex");
     	$(".move-text").css("display", "none");
    	$(".sub-button-area").css("display", "none");
    	
        $.each($("#officialCategory option:selected"), function () {
        	artistName.push($(this).val());
            $(this).prop('selected', false);
        });
    }
    </script>
</body>
</html>
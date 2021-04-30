<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/mypage/agency/main.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
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
            <div class="arti-btn-area">
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
                <div class="btn-area">
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
                <div class="btn-area">
                    <button id="mediaAdminBtn" class="pink-btn nanumsquare" type="button">미디어</button>&nbsp;&nbsp;
                    <button id="scheduleAdminBtn" class="blue-btn nanumsquare" type="button">스케줄</button>
                </div>
                <div class="sub-btn-area">
                    <button id="scheduleBtn" class="nanumsquare" type="button">확인</button>&nbsp;&nbsp;
                    <button id="scheduleCancelBtn" class="blue-btn nanumsquare" type="button">취소</button>
                </div>
            </div>
        </div>
    </section>
    
    <!-- 솔로 아티스트 등록 -->
    <section class="solo-form-container pop-up">
        <div class="black-back"></div>
        <form class="solo-artist-form artist-form" enctype="multipart/form-data">
            <span class="artist-text nanumsquare">아티스트 등록 (솔로)</span>
            <hr>
            <table class="artist-table" class="nanumsquare">
            	<colgroup>
                    <col width="30%"/>
                    <col width="70%"/>
                </colgroup>
                <tr class="nanumsquare">
                	<td>아이디&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="soloId">&nbsp;
                		<span class="check-text">중복된 아이디입니다.</span>
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>비밀번호&nbsp;&nbsp;</td>
                	<td>
                		<input type="password" name="soloPwd">&nbsp;
                		<span class="check-text">비밀번호 형식이 맞지 않습니다.</span>
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>비밀번호 확인&nbsp;&nbsp;</td>
                	<td>
                		<input type="password" name="soloRePwd">&nbsp;
                		<span class="check-text">비밀번호가 일치하지 않습니다.</span>
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>활동명(영어)&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="soloArtiName">
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>활동명(한글)&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="soloName">
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>닉네임&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="soloArtiNickname">
                		<span class="check-text">중복된 닉네임입니다.</span>
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>프로필 사진&nbsp;&nbsp;</td>
                	<td>
                		<input type="file" id="soloFileInput" name="soloAttClName">
                	</td>
                </tr>
            </table>
            <div class="arti-btn-area">
                <button id="soloEnrollBtn" class="enroll-cancel-btn pink-btn nanumsquare" type="button">등록하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
                <input id="soloCancelBtn" class="enroll-cancel-btn blue-btn nanumsquare" type="reset" value="취소하기">
            </div>
        </form>
    </section>
    
    <!-- 그룹 아티스트 등록 -->
    <section class="team-form-container pop-up">
        <div class="black-back"></div>
        <form class="team-artist-form artist-form" enctype="multipart/form-data">
            <span class="artist-text nanumsquare">아티스트 등록 (팀)</span>
            <hr>
            <table class="team-artist-table" class="nanumsquare">
            	<colgroup>
                    <col width="30%"/>
                    <col width="70%"/>
                </colgroup>
                <tr class="nanumsquare">
                	<td>그룹명(영어)&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="groupArtNameEn">&nbsp;
                		<span class="check-text">중복된 이름입니다.</span>
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>그룹명(한글)&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="groupArtNameKr">&nbsp;
                		<span class="check-text">중복된 이름입니다.</span>
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>프로필 사진&nbsp;&nbsp;</td>
                	<td>
                		<input type="file" id="teamFileInput" name="groupAttClName">
                	</td>
                </tr>
            </table>
            <div class="arti-btn-area">
                <button id="teamEnrollBtn" class="enroll-cancel-btn pink-btn nanumsquare" type="button">등록하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
                <input id="teamCancelBtn" class="enroll-cancel-btn blue-btn nanumsquare" type="reset" value="취소하기">
            </div>
        </form>
    </section>
    
    <!-- 개인 아티스트 등록 -->
    <section class="one-form-container pop-up">
        <div class="black-back"></div>
        <form class="one-artist-form artist-form" enctype="multipart/form-data">
            <span class="artist-text nanumsquare">아티스트 등록 (개인)</span>
            <hr>
            <table class="artist-table" class="nanumsquare">
            	<colgroup>
                    <col width="30%"/>
                    <col width="70%"/>
                </colgroup>
                <tr class="nanumsquare">
                	<td>그룹명&nbsp;&nbsp;</td>
                	<td>
                		<span id="GroupName"></span>&nbsp;
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>아이디&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="oneId">&nbsp;
                		<span class="check-text">중복된 아이디입니다.</span>
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>비밀번호&nbsp;&nbsp;</td>
                	<td>
                		<input type="password" name="onePwd">&nbsp;
                		<span class="check-text">중복된 아이디입니다.</span>
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>비밀번호 확인&nbsp;&nbsp;</td>
                	<td>
                		<input type="password">&nbsp;
                		<span class="check-text">비밀번호가 일치하지 않습니다.</span>
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>활동명(영어)&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="oneArtiName">
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>활동명(한글)&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="oneName">
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>닉네임&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="oneArtiNickname">
                		<div></div>
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>프로필 사진&nbsp;&nbsp;</td>
                	<td>
                		<input type="file" id="oneFileInput" name="oneAttClName">
                		<div></div>
                	</td>
                </tr>
            </table>
            <div class="arti-btn-area">
                <button id="oneEnrollBtn" class="enroll-cancel-btn pink-btn nanumsquare" type="button">등록하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
                <input id="oneCancelBtn" class="enroll-cancel-btn blue-btn nanumsquare" type="reset" value="취소하기">
            </div>
        </form>
    </section>
    
    <!-- 그룹 아티스트 삭제 팝업 -->
    <section class="remove-team-form-container pop-up">
        <div class="black-back"></div>
        <div class="remove-team-artist-form pop-up-form">
            <span class="pop-up-text nanumsquare">아티스트 삭제</span>
            <br><br>
            <div class="choose-artist nanumsquare">아티스트를 선택하세요</div>
            <br>
            <div class="select-area">
                <select id="removeTeamCategory" class="form-category" name="artiName">
                    <option value="">검색</option>
                    <c:forEach var="team" items="${ team }">
                    <option class="search-value" value="${ team.artNameEn }">${ team.artNameEn }</option>
                    </c:forEach>
                </select>
                <br><br>
                <div class="btn-area">
                    <button id="removeTeamBtn" class="pink-btn nanumsquare">확인</button>&nbsp;&nbsp;
                    <button id="removeTeamCancelBtn" class="blue-btn nanumsquare" type="button">취소</button>
                </div>
            </div>
        </div>
    </section>
    
    <!-- 솔로 아티스트 삭제 팝업 -->
    <section class="remove-solo-form-container pop-up">
        <div class="black-back"></div>
        <div class="remove-solo-artist-form pop-up-form">
            <span class="pop-up-text nanumsquare">아티스트 삭제</span>
            <br><br>
            <div class="choose-artist nanumsquare">아티스트를 선택하세요</div>
            <br>
            <div class="select-area">
                <select id="removeSoloCategory" class="form-category" name="artiName">
                    <option value="">검색</option>
                    <c:forEach var="solo" items="${ solo }">
                    <option class="search-value" value="${ solo.artNameEn }">${ solo.artNameEn }</option>
                    </c:forEach>
                </select>
                <br><br>
                <div class="btn-area">
                    <button id="removeSoloBtn" class="pink-btn nanumsquare">확인</button>&nbsp;&nbsp;
                    <button id="removeSoloCancelBtn" class="blue-btn nanumsquare" type="button">취소</button>
                </div>
            </div>
        </div>
    </section>
    
	<!-- 네비바 인클루드 -->
	<jsp:include page="../../common/navbar.jsp"/>
	
	<!-- 아티스트 프로필 인클루드 -->
	<jsp:include page="profile.jsp"/>
	
	<!-- 본문 시작 -->
	
	<!-- 메인 -->
	<section class="main-section">
        <div class="artist-list-container">
            <div class="artist-list">
                <p class="list-title nanumsquare">My Artist List (solo)</p>
                <hr class="list-line">
                <div class="list-box">
                    <table class="solo-list nanumsquare">
                        <tbody>
                        	<c:forEach var="solo" items="${ solo }">
                            <tr>
                                <td>${ solo.artNameEn }</td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <span id="soloPlus" class="artist-plus nanumsquare">+</span>
                <span id="soloMinus" class="artist-minus nanumsquare">-</span>
            </div>
            <div class="artist-list">
                <p class="list-title nanumsquare">My Artist List (group)</p>
                <hr class="list-line">
                <div class="list-box">
                    <table class="group-list nanumsquare">
                        <tbody>
                        	<c:forEach var="team" items="${ team }">
                            <tr>
                                <td>
                                    <span class="team-name" onclick="enrollOne('${ team.artNameEn }')">${ team.artNameEn }</span>&nbsp;
                                    <table class="group-member nanumsquare">
                                        <tbody>
                                            <colgroup>
                                                <col width="7%"/>
                                                <col width="93%"/>
                                            </colgroup>
                                            <c:forEach var="member" items="${ member }">
	                                            <c:if test="${ team.artNameEn eq member.artiNameEn }">
	                                            <tr class="artist-click">
	                                                <td>┕</td>
	                                                <td><span class="artist-one">${ member.artiName }</span></td>
	                                            </tr>
	                                            </c:if>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                         	</c:forEach>
                        </tbody>
                    </table>
                </div>
                <span id="groupPlus" class="artist-plus nanumsquare">+</span>
                <span id="groupMinus" class="artist-minus nanumsquare">-</span>
            </div>
        </div>
    </section>
	<!-- 본문 끝 -->
	
    <script>
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
    
 	// ---------------------------------------------------------------------------
    
    var artistName = [];
    
    // 스토어 관리 창 눌렀을 때
    $("#storeBtn").click(function() {
    	 $(".store-form-container").css("display", "block");
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
    
    // 스토어 관리 확인 버튼 눌렀을 때
    $("#storeAdminBtn").click(function() {
    	var artiName = $("#storeCategory").val();
    	
    	if(artiName != "") {
    		location.href="${ contextPath }/mypage/agency/store?artiName=" + artiName;
    	} else {
    		alert("아티스트를 선택해주세요");
    	}
    });
    
 	// 오피셜 관리 창 눌렀을 때
    $("#officialBtn").click(function() {
    	 $(".official-form-container").css("display", "block");
    });
    
    // 오피셜 미디어 버튼 눌렀을 때
    $("#mediaAdminBtn").click(function() {
    	var artiName = $("#officialCategory").val();
    	
    	if(artiName != "") {
    		location.href="${ contextPath }/mypage/agency/media?artiName=" + artiName;
    	} else {
    		alert("아티스트를 선택해주세요");
    	}
    });
    
    // 오피셜 스케줄 버튼 눌렀을 때
    $("#scheduleAdminBtn").click(function() {
    	var artiName = $("#officialCategory").val();
    	
    	if(artiName == "") {
    		alert("아티스트를 선택해주세요");
    	} else {
    		$("#officialCategory").css("display", "none");
         	$(".choose-artist").css("display", "none");
         	$(".btn-area").css("display", "none");
         	$(".move-text").css("display", "block");
         	$(".sub-btn-area").css("display", "flex");
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
     	$(".btn-area").css("display", "flex");
     	$(".move-text").css("display", "none");
    	$(".sub-btn-area").css("display", "none");
    	
        $.each($("#officialCategory option:selected"), function () {
        	artistName.push($(this).val());
            $(this).prop('selected', false);
        });
    }
    
 	// ---------------------------------------------------------------------------
    
    // 그룹 아티스트 이름 클릭할 때 개인 아티스트 등록창 생성
    function enrollOne(artNameEn) {
   		$(".one-form-container").css("display", "block");
   		$("#GroupName").text(artNameEn);
 	}
 	
 	// 개인팝업 등록하기 누를 때
    $('#oneEnrollBtn').click(function () {
    	var id = $("input[name=oneId]").val();
        var pwd = $("input[name=onePwd]").val();
        var name = $("input[name=oneName]").val();
        var artiId = $("input[name=oneId]").val();
        var artiName = $("input[name=oneArtiName]").val();
        var artiNickname = $("input[name=oneArtiNickname]").val();
        var AttClName = $("input[name=oneAttClName]").val();
       	var artiNameEn = $("#GroupName").text();
    		
   		$.ajax({
   			url : "${ contextPath }/mypage/enrollArtistOne",
   			data : { id : id, pwd : pwd, name : name, artiId : artiId, artiName : artiName, 
					 artiNickname : artiNickname, AttClName : AttClName, artiNameEn : artiNameEn},
   			type : "post",
   			dataType : "json",
   			success : function(data) {
   				console.log(data);	// 솔로 리스트 새로 받아오기
   			} 
   		});
   		
   		$("#GroupName").text("");
   		$("input[name=oneId]").val("");
        $("input[name=onePwd]").val("");
        $("input[name=oneRePwd]").val("");
        $("input[name=oneName]").val("");
        $("input[name=oneArtiName]").val("");
        $("input[name=oneArtiNickname]").val("");
        $("input[name=oneAttClName]").val("");
        
        $(".one-form-container").css("display", "none");
    });
 	
    // 개인 아티스트 이름 클릭할 때
    $('.artist-one').click(function () {
    	var name = $(this).text();
    	
    	if(confirm("해당 아티스트를 삭제하시겠습니까?")) {
    		$(this).parent().parent(".artist-click").css("display", "none");
    		
    		$.ajax({
    			url : "${ contextPath }/mypage/deleteArtistOne",
    			data : { name : name },
    			type : "post",
    			dataType : "json",
    			success : function(data) {
    				if(data == "성공") {
    					alert("아티스트가 정상적으로 삭제되었습니다.");
    				} else {
    					alert("아티스트 삭제에 실패하였습니다.");
    				}
    			} 
    		});
    	}
    });
    
 	// 개인팝업 취소하기 버튼 클릭할 때
    $('#oneCancelBtn').click(function () {
    	$(".one-form-container").css("display", "none");
    });
    
    // ---------------------------------------------------------------------------
    
    // 솔로 +버튼 클릭할 때
    $('#soloPlus').click(function () {
        $(".solo-form-container").css("display", "block");
    });
    
 	// 솔로 -버튼 클릭할 때
    $('#soloMinus').click(function () {
        $(".remove-solo-form-container").css("display", "block");
    });
 	
 	// 솔로팝업 등록하기 버튼 클릭할 때
 	$("#soloEnrollBtn").click(function () {
        var id = $("input[name=soloId]").val();
        var pwd = $("input[name=soloPwd]").val();
        var name = $("input[name=soloName]").val();
        var artiId = $("input[name=soloId]").val();
        var artiName = $("input[name=soloArtiName]").val();
        var artiNickname = $("input[name=soloArtiNickname]").val();
        var AttClName = $("input[name=soloAttClName]").val();
        var artiNameEn = $("input[name=soloArtiName]").val();
        var artNameEn = $("input[name=soloArtiName]").val();
        var artNameKr = $("input[name=soloName]").val();
        
        $.ajax({
			url : "${ contextPath }/mypage/enrollArtistSolo",
			data : { id : id, pwd : pwd, name : name, artiId : artiId, artiName : artiName, 
					 artiNickname : artiNickname, AttClName : AttClName, artiNameEn : artiNameEn,
					 artNameEn : artNameEn, artNameKr : artNameKr },
			type : "post",
			dataType : "json",
			success : function(data) {
				console.log(data);	// 솔로 리스트 새로 받아오기
				
				soloList = $(".solo-list tbody");			
				soloList.html("");

				for(var i in data){
					var tr = $("<tr>");
					var artNameEn = $("<td>").text(data[i].artNameEn);
					
					tr.append(artNameEn);
					soloList.append(tr);
				}
				
				category = $(".select-area select option");
				category.val("");
				
				console.log(category);
				
				for(var i in data){
					var artNameEn = category.val(data[i].artNameEn);
				}
				
				alert("아티스트가 정상적으로 등록되었습니다.");
			} 
		});
        
        $("input[name=soloId]").val("");
        $("input[name=soloPwd]").val("");
        $("input[name=soloRePwd]").val("");
        $("input[name=soloName]").val("");
        $("input[name=soloArtiName]").val("");
        $("input[name=soloArtiNickname]").val("");
        $("input[name=soloAttClName]").val("");
        
        $(".solo-form-container").css("display", "none");
    });
    
    // 솔로팝업 취소하기 버튼 클릭할 때
    $('#soloCancelBtn').click(function () {
    	$(".solo-form-container").css("display", "none");
    });
    
 	// 솔로 삭제팝업 확인 버튼 클릭할 때
    $('#removeSoloBtn').click(function () {
    	var artiNameEn = $("#removeSoloCategory").val();
    	
    	if(artiNameEn != "") {
    		$.ajax({
    			url : "${ contextPath }/mypage/deleteArtistSolo",
    			data : { artiNameEn : artiNameEn },
    			type : "post",
    			dataType : "json",
    			success : function(data) {
    				if(data == "성공") {
    					alert("아티스트가 정상적으로 삭제되었습니다.");
    				} else {
    					alert("아티스트 삭제에 실패하였습니다.");
    				}
    			} 
    		});
    	} else {
    		alert("아티스트를 선택해주세요");
    	}
    });
    
    // 솔로 삭제팝업 취소 버튼 클릭할 때
	$("#removeSoloCancelBtn").click(unselect4);
    
    function unselect4() {
    	$(".remove-solo-form-container").css("display", "none");
    	
        $.each($("#removeSoloCategory option:selected"), function () {
        	artistName.push($(this).val());
            $(this).prop('selected', false);
        });
    }
    
 	// ---------------------------------------------------------------------------
    
 	// 그룹 +버튼 클릭할 때
    $('#groupPlus').click(function () {
        $(".team-form-container").css("display", "block");
    });
    
 	// 그룹 -버튼 클릭할 때
    $('#groupMinus').click(function () {
        $(".remove-team-form-container").css("display", "block");
    });
 	
 	// 그룹팝업 등록하기 버튼 클릭할 때
 	$("#teamEnrollBtn").click(function () {
        var artNameEn = $("input[name=groupArtNameEn]").val();
        var artNameKr = $("input[name=groupArtNameKr]").val();
        
        $.ajax({
			url : "${ contextPath }/mypage/enrollArtistGroup",
			data : { artNameEn : artNameEn, artNameKr : artNameKr },
			type : "post",
			dataType : "json",
			success : function(data) {
				if(data == "성공") {
					alert("아티스트가 정상적으로 등록되었습니다.");
				} else {
					alert("아티스트 등록에 실패하였습니다.");
				}
			} 
		});

        $("input[groupArtNameEn]").val("");
        $("input[name=groupArtNameKr]").val("");
        
        $(".team-form-container").css("display", "none");
    });
 	
 	// 그룹팝업 취소하기 버튼 클릭할 때
    $('#teamCancelBtn').click(function () {
        $(".team-form-container").css("display", "none");
    });
 	
 	// 그룹 삭제팝업 확인 버튼 클릭할 때
    $('#removeTeamBtn').click(function () {
    	var artiNameEn = $("#removeTeamCategory").val();
    	
    	if(artiNameEn != "") {
    		$.ajax({
    			url : "${ contextPath }/mypage/deleteArtistGroup",
    			data : { artiNameEn : artiNameEn },
    			type : "post",
    			dataType : "json",
    			success : function(data) {
    				if(data == "성공") {
    					alert("아티스트가 정상적으로 삭제되었습니다.");
    				} else {
    					alert("아티스트 삭제에 실패하였습니다.");
    				}
    			} 
    		});
    	} else {
    		alert("아티스트를 선택해주세요");
    	}
    });
    
 	// 그룹 삭제팝업 취소 버튼 클릭할 때    
	$("#removeTeamCancelBtn").click(unselect3);
    
    function unselect3() {
    	$(".remove-team-form-container").css("display", "none");
    	
        $.each($("#removeTeamCategory option:selected"), function () {
        	artistName.push($(this).val());
            $(this).prop('selected', false);
        });
    }
    </script>
</body>
</html>
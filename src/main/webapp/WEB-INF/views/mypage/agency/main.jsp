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
    <link rel="stylesheet" href="${ contextPath }/resources/css/mypage/agency/main.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Fantimate</title>
</head>
<body>
	<!-- 프로필 수정 -->
    <section class="profile-form-container pop-up">
        <div class="black-back"></div>
        <form class="profile-form artist-form">
            <span class="artist-text nanumsquare">프로필 수정</span>
            <hr>
            <table class="profile-table artist-table" class="nanumsquare">
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
                		<input type="password" name="agPwd">&nbsp;
                		<span class="check-text">중복된 아이디입니다.</span>
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>비밀번호 확인&nbsp;&nbsp;</td>
                	<td>
                		<input type="password" name="agRePwd">&nbsp;
                		<span class="check-text">비밀번호가 일치하지 않습니다.</span>
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
        <form class="solo-artist-form artist-form" action="" method="POST" enctype="multipart/form-data">
            <span class="artist-text nanumsquare">아티스트 등록 (솔로)</span>
            <input type="hidden" name="isTeam" value="N">
            <hr>
            <table class="artist-table" class="nanumsquare">
            	<colgroup>
                    <col width="30%"/>
                    <col width="70%"/>
                </colgroup>
                <tr class="nanumsquare">
                	<td>아이디&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="id" id="input-id">&nbsp;
                		<input type="hidden" name="artiId" id="input-artiId">
                		<span class="check-text">중복된 아이디입니다.</span>
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>비밀번호&nbsp;&nbsp;</td>
                	<td>
                		<input type="password" name="pwd">&nbsp;
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
                		<input type="text" name="artiName" id="input-artiName">
                		<input type="hidden" name="artiNameEn" id="input-artiNameEn">
                		<input type="hidden" name="artNameEn" id="input-artNameEn">
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>활동명(한글)&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="name" id="input-name">
                		<input type="hidden" name="artNameKr" id="input-artNameKr">
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>닉네임&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="artiNickname">
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
            <input type="hidden" name="isTeam" value="Y">
            <hr>
            <table class="team-artist-table" class="nanumsquare">
            	<colgroup>
                    <col width="30%"/>
                    <col width="70%"/>
                </colgroup>
                <tr class="nanumsquare">
                	<td>그룹명(영어)&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="artNameEn">&nbsp;
                		<span class="check-text">중복된 이름입니다.</span>
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>그룹명(한글)&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="artNameKr">&nbsp;
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
                		<input type="hidden" name="artiNameEn" value="" id="input-one-group">
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>아이디&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="id" id="input-one-id">&nbsp;
                		<input type="hidden" name="artiId" id="input-one-artiId">
                		<span class="check-text">중복된 아이디입니다.</span>
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>비밀번호&nbsp;&nbsp;</td>
                	<td>
                		<input type="password" name="pwd">&nbsp;
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
                		<input type="text" name="artiName">
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>활동명(한글)&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="name">
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>닉네임&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="artiNickname">
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
	                                                <td><span class="artist-one">${ member.artiName }<input type="hidden" class="artist-one-id" value="${ member.artiId }"></span></td>
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
    
    // 오피셜 관리 스케줄 버튼 눌렀을 때
     $("#scheduleAdminBtn").click(function() {
    	$("#officialCategory").css("display", "none");
     	$(".choose-artist").css("display", "none");
     	$(".btn-area").css("display", "none");
     	$(".move-text").css("display", "block");
     	$(".sub-btn-area").css("display", "flex");
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
    	$("#input-one-artiId").val($("#input-one-id").val())
        $("#input-one-group").val($("#GroupName").text())
        
    	var form = $(".one-artist-form")[0];
        var formData = new FormData(form);
   		$.ajax({
   			url : "${ contextPath }/mypage/enrollArtistOne",
   			type : "POST",
			enctype: "multipart/form-data",
			processData: false,
	        contentType: false,
			data : formData,
   			dataType : "json",
   			success : function(data) {
   				alert(data.msg);
				location.href="${contextPath}/mypage/agency/main";
			},
			error : function(e) {
				console.log(e)
			}
   		});
    });
 	
    // 개인 아티스트 이름 클릭할 때
    $('.artist-one').click(function () {
    	var id = $(this).children("input").val();
    	console.log(name);
    	if(confirm("해당 아티스트를 삭제하시겠습니까?")) {
    		$(this).parent().parent(".artist-click").css("display", "none");
    		
    		$.ajax({
    			url : "${ contextPath }/mypage/deleteArtistOne",
    			data : { id : id },
    			type : "post",
    			dataType : "json",
    			success : function(data) {
    				alert(data.msg);
    				location.href="${contextPath}/mypage/agency/main";
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
 		// 동일한 데이터를 이용하는 input태그에 값 넣기
        $("#input-artiId").val($("#input-id").val())
        $("#input-artiNameEn").val($("#input-artiName").val())
        $("#input-artNameEn").val($("#input-artiName").val())
        $("#input-artNameKr").val($("#input-name").val())
        
        var form = $(".solo-artist-form")[0];
        var formData = new FormData(form);
        
        $.ajax({
			url : "${ contextPath }/mypage/enrollArtistSolo",
			type : "POST",
			enctype: "multipart/form-data",
			processData: false,
	        contentType: false,
			data : formData,
			dataType : "json",
			success : function(data) {
				alert(data.msg);
				location.href="${contextPath}/mypage/agency/main";
			},
			error : function(e) {
				console.log(e)
			}
		});
    });
    
    // 솔로팝업 취소하기 버튼 클릭할 때
    $('#soloCancelBtn').click(function () {
    	$(".solo-form-container").css("display", "none");
    });
    
 	// 솔로 삭제팝업 확인 버튼 클릭할 때
    $('#removeSoloBtn').click(function () {
    	var artiNameEn = $("#removeSoloCategory").val();
    	
    	$.ajax({
			url : "${ contextPath }/mypage/deleteArtistSolo",
			data : { artiNameEn : artiNameEn },
			type : "post",
			dataType : "json",
			success : function(data) {
				alert(data.msg);
				location.href="${contextPath}/mypage/agency/main";
			} 
		});
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
        var form = $(".team-artist-form")[0];
        var formData = new FormData(form)
        $.ajax({
			url : "${ contextPath }/mypage/enrollArtistGroup",
			type : "POST",
			enctype: "multipart/form-data",
			processData: false,
	        contentType: false,
			data : formData,
			dataType : "json",
			success : function(data) {
				alert(data.msg);
				location.href="${contextPath}/mypage/agency/main";
			},
			error : function(e) {
				alert(e);
			}
		});
    });
 	
 	// 그룹팝업 취소하기 버튼 클릭할 때
    $('#teamCancelBtn').click(function () {
        $(".team-form-container").css("display", "none");
    });
 	
 	// 그룹 삭제팝업 확인 버튼 클릭할 때
    $('#removeTeamBtn').click(function () {
    	var artNameEn = $("#removeTeamCategory option:selected").val();
    	$.ajax({
			url : "${ contextPath }/mypage/deleteArtistGroup",
			data : { artNameEn : artNameEn },
			type : "post",
			dataType : "json",
			success : function(data) {
				alert(data.msg);
				location.href="${contextPath}/mypage/agency/main";
			} 
		});
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
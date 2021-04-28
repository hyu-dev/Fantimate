<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/mypage/agency/main.css">
</head>
<body>
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
        <div class="solo-artist-form">
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
                		<div></div>
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>프로필 사진&nbsp;&nbsp;</td>
                	<td>
                		<input type="file" name="soloAttClName">
                		<div></div>
                	</td>
                </tr>
            </table>
            <div class="arti-btn-area">
                <button id="soloEnrollBtn" class="pink-btn nanumsquare" type="button">등록하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
                <input id="soloCalcelBtn" class="blue-btn nanumsquare" type="reset" value="취소하기">
            </div>
        </div>
    </section>
    
    <!-- 그룹 아티스트 등록 -->
    <section class="team-form-container pop-up">
        <div class="black-back"></div>
        <form class="team-artist-form" action="${ contextPath }/artist/teamInsert" method="post">
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
                		<div></div>
                		<input type="hidden" name="artNameEn">
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>아이디&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="groupId">&nbsp;
                		<span class="check-text">중복된 아이디입니다.</span>
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>비밀번호&nbsp;&nbsp;</td>
                	<td>
                		<input type="password" name="groupPwd">&nbsp;
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
                		<input type="text" name="groupArtiName">
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>활동명(한글)&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="groupName">
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>닉네임&nbsp;&nbsp;</td>
                	<td>
                		<input type="text" name="groupArtiNickname">
                		<div></div>
                	</td>
                </tr>
                <tr class="nanumsquare">
                	<td>프로필 사진&nbsp;&nbsp;</td>
                	<td>
                		<input type="file" name="groupAttClName">
                		<div></div>
                	</td>
                </tr>
            </table>
            <div class="arti-btn-area">
                <button id="teamEnrollBtn" class="pink-btn nanumsquare">등록하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
                <input id="teamCalcelBtn" class="blue-btn nanumsquare" type="reset" value="취소하기">
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
                                    <span class="team-name">${ team.artNameEn }</span>
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
    		location.href="${ contextPath }/mypage/agency/media?artiName=" + artiName;
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
    
    // 그룹 아티스트 이름 클릭할 때
    $('.team-name').click(function () {
        $(this).siblings(".group-member").toggleClass('close-area', 500);
    });
    
    // 개인 아티스트 이름 클릭할 때
    $('.artist-one').click(function () {
    	var name = $(this).text();
    	
    	console.log(name);
    	
    	if(confirm("해당 아티스트를 삭제하시겠습니까?")) {
    		$(this).parent().parent(".artist-click").css("display", "none");
    		
    		$.ajax({
    			url : "${ contextPath }/mypage/deleteArtistOne",
    			data : { name : name },
    			type : "post",
    			dataType : "json",
    			success : function(data) {
    				alert("아티스트가 정상적으로 삭제되었습니다.");
    			} 
    		});
    	}
    });
    
    // 솔로 +버튼 클릭할 때
    $('#soloPlus').click(function () {
        $(".solo-form-container").css("display", "block");
    });
    
 	// 솔로 -버튼 클릭할 때
    $('#soloMinus').click(function () {
        $(".remove-solo-form-container").css("display", "block");
    });
 	
 	// 솔로팝업 등록하기 버튼 클릭할 때
 	$('#soloEnrollBtn').click(function () {
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
				alert("아티스트가 정상적으로 등록되었습니다.");
			} 
		});
    });
    
    // 솔로팝업 취소하기 버튼 클릭할 때
    $('#soloCalcelBtn').click(function () {
        $(".solo-form-container").css("display", "none");
    });
    
 	// 그룹 삭제팝업 확인 버튼 클릭할 때
    $('#removeTeamBtn').click(function () {
    	var artiNameEn = $("#removeTeamCategory").val();
    	
    	$.ajax({
			url : "${ contextPath }/mypage/deleteArtistGroup",
			data : { artiNameEn : artiNameEn },
			type : "post",
			dataType : "json",
			success : function(data) {
				alert("아티스트가 정상적으로 삭제되었습니다.");
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
    
    // 솔로 삭제팝업 확인 버튼 클릭할 때
    $('#removeSoloBtn').click(function () {
    	var artiNameEn = $("#removeSoloCategory").val();
    	
    	$.ajax({
			url : "${ contextPath }/mypage/deleteArtistSolo",
			data : { artiNameEn : artiNameEn },
			type : "post",
			dataType : "json",
			success : function(data) {
				alert("아티스트가 정상적으로 삭제되었습니다.");
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
    
    // 그룹 +버튼 클릭할 때
    $('#groupPlus').click(function () {
        $(".team-form-container").css("display", "block");
    });
    
 	// 그룹 -버튼 클릭할 때
    $('#groupMinus').click(function () {
        $(".remove-team-form-container").css("display", "block");
    });
    
 	// 그룹팝업 취소하기 버튼 클릭할 때
    $('#teamCalcelBtn').click(function () {
        $(".team-form-container").css("display", "none");
    });
    </script>
</body>
</html>
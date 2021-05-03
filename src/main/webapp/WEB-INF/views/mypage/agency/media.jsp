<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/mypage/agency/media.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
	<!-- 미디어 작성폼 인클루드 -->
	<jsp:include page="mediaInsert.jsp"/>
	
	<!-- 미디어 삭제 팝업 -->
    <section class="media-delete-form-container pop-up">
        <div class="black-back"></div>
        <div class="media-delete-form pop-up-form">
            <span class="pop-up-text nanumsquare">미디어 삭제</span>
            <br><br>
            <div class="choose-item nanumsquare">미디어명을 선택하세요</div>
            <br>
            <div class="select-area">
                <select id="mediaCategory" class="form-category" name="artiName">
                    <option value="">검색</option>
                    <c:forEach var="mo" items="${ media }">
                    <option class="search-value" value="${ mo.official.mediaTtl }">${ mo.official.mediaTtl }</option>
                    </c:forEach>
                </select>
                <br><br>
                <div class="form-btn-area">
                    <button id="mediaDeleteBtn" class="pink-btn nanumsquare">확인</button>&nbsp;&nbsp;
                    <button id="mediaCancelBtn" class="blue-btn nanumsquare" type="button">취소</button>
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
        <div class="official-list-container">
            <p class="list-title nanumsquare">My Official List</p>
            <hr class="list-line">
            <c:set var="artistName" value="${ artiName }" scope="session"/>
            <table class="official-list nanumsquare">
                <tbody>
                    <colgroup>
                        <col width="6%"/>
                        <col width="20%"/>
                        <col width="54%"/>
                        <col width="10%"/>
                    </colgroup>
                    <tr>
                        <td>글번호</td>
                        <td>
                            <select class="category-box nanumsquare" name="category">
                                <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;카테고리</option>
                                <c:forEach var="cate" items="${ cate }">
                                <option value="${ cate.cateName }">${ cate.cateName }</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td id="itemName">미디어명</td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <hr class="list-line">
            <div class="list-box">
                <table class="official-list nanumsquare">
                    <tbody>
                        <colgroup>
                            <col width="6%"/>
                            <col width="20%"/>
                            <col width="54%"/>
                            <col width="10%"/>
                        </colgroup>
                        <c:set var="mcount" value="0"/>
                        <c:forEach var="m" items="${ media }">
                        <c:set var="mcount" value="${ mcount + 1 }"/>
                        <tr>
                            <td>${ mcount }</td>
                            <td>${ m.category.cateName }</td>
                            <td>${ m.official.mediaTtl }</td>
                            <td><button type="button" class="official-link-Btn" onclick="mediaLink('${ m.official.mediaNum }');">이동하기</button></td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="search-area">
                <input type="search" class="contents-search-input">
                <img src="${ contextPath }/resources/icon/search-icon.svg" class="search-icon" alt="">
                <span class="official-plus nanumsquare">+</span>
                <span class="official-minus nanumsquare">-</span>
            </div>
        </div>
    </section>
	
	<!-- 본문 끝 -->
	<script>
	// 이동하기 버튼 클릭할 때
	function mediaLink(mediaNum) {
		location.href = "${ contextPath }/official/media/detail?mediaNum=" + mediaNum;
	}
	
	// 미디어 +버튼 클릭할 때
	$(".official-plus").click(function() {
		$(".media-form-container").css("display", "block");
	});
	
	// 미디어 등록하기 팝업 등록하기 버튼 클릭할 때
	$("#mediaInsertBtn").click(function() {
		$(".media-form-container").css("display", "block");
	});
	
	// 미디어 등록하기 팝업 취소하기 버튼 클릭할 때
	$("#mediaInsertCancelBtn").click(function() {
		$(".media-form-container").css("display", "none");
	});
	
	$("[type=file]").change(function() {
		var thumb = $("#thumbnail").val();
		$("#thumbLabel").val(thumb);
		
		var video = $("#video").val();
		$("#videoLabel").val(video);
	});
	
	// 미디어 -버튼 클릭할 때
	$(".official-minus").click(function() {
		$(".media-delete-form-container").css("display", "block");
	});
	
	// 미디어 삭제 팝업 확인 버튼 클릭할 때
	$("#mediaDeleteBtn").click(function() {
		var mediaTtl = $("#mediaCategory").val();
		var artiName = "${ artiName }";
		
		if(artiName != "") {
			$.ajax({
    			url : "${ contextPath }/mypage/deleteMediaItem",
    			data : { mediaTtl : mediaTtl, artiName : artiName },
    			type : "post",
    			dataType : "json",
    			success : function(data) {
    				console.log(data);	// 상품 리스트 새로 받아오기
    				console.log(data[i]);
    				
    				storeList = $(".store-list tbody");			
    				storeList.html("");
    				colgroup = $("<colgroup>");
    				col1 = $("<col width='7%'/>");
    				col2 = $("<col width='10%'/>");
    				col3 = $("<col width='63%'/>");
    				col4 = $("<col width='10%'/>");
    				col5 = $("<col width='10%'/>");
    				
    				colgroup.append(col1);
    				colgroup.append(col2);
    				colgroup.append(col3);
    				colgroup.append(col4);
    				colgroup.append(col5);
    				
    				storeList.append(colgroup);

    				for(var i in data.length-1){
    					var tr = $("<tr>");
    					
    					for(var i in 5) {
    						var td = $("<td>").text(data[i]);
    						
    						tr.append(td);
    					}
    					
    					var td = $("<td>").text(data[i]);
    					
    					tr.append(td);
    				}

    				var td2 = $("<td>");
    				var btn = $("<button type='button' class='store-link-Btn'>");
    				td2.append(btn);
    				
    				tr.append(td2);
    			} 
    		});
    	} else {
    		alert("미디어명을 선택해주세요");
    	}
	});
	
	var mediaName = [];
	
	// 미디어 삭제 팝업 취소 버튼 클릭할 때
	$("#mediaCancelBtn").click(mediaDeleteReturn);
	
	function mediaDeleteReturn() {
    	$(".media-delete-form-container").css("display", "none");
    	
        $.each($("#mediaCategory option:selected"), function () {
        	mediaName.push($(this).val());
            $(this).prop('selected', false);
        });
    }
	
	// 카테고리를 변경할 때
	$("category-box").change(function() {
		var category = $("category-box option:selected").val();
		
		if(category != "") {
			location.href = "${ contextPath }/mypage/agency/media?category=" + category;
		} 
	});
	
	// 리스트 검색 기능 사용
	$(".contents-search-input").keydown(function(key) {
		var search = $(".contents-search-input").val();
		
        if (key.keyCode == 13) {
        	location.href = "${ contextPath }/mypage/agency/media?search=" + search;
        }
    });
	</script>
</body>
</html>
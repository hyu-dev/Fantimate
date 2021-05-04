<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/mypage/agency/store.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
	<c:if test="${ flag eq 'yes' }">
		<c:remove var="flag"/>
	</c:if>
	<!-- 스토어 작성폼 인클루드 -->
	<jsp:include page="../../store/storeInsert.jsp"/>

	<!-- 스토어 삭제 팝업 -->
    <section class="store-delete-form-container pop-up">
        <div class="black-back"></div>
        <div class="store-delete-form pop-up-form">
            <span class="pop-up-text nanumsquare">스토어 삭제</span>
            <br><br>
            <div class="choose-item nanumsquare">상품명을 선택하세요</div>
            <br>
            <div class="select-area">
                <select id="storeItemCategory" class="form-category" name="artiName">
                    <option value="">검색</option>
                    <c:forEach var="ss" items="${ store }">
                    <option class="search-value" value="${ ss.store.pname }">${ ss.store.pname }</option>
                    </c:forEach>
                </select>
                <br><br>
                <div class="form-btn-area">
                    <button id="storeItemDeleteBtn" class="pink-btn nanumsquare">확인</button>&nbsp;&nbsp;
                    <button id="storeItemCancelBtn" class="blue-btn nanumsquare" type="button">취소</button>
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
        <div class="store-list-container">
            <p class="list-title nanumsquare">My Store List</p>
            <hr class="list-line">
            <table class="store-list nanumsquare">
                <tbody>
                    <colgroup>
                        <col width="7%"/>
                        <col width="10%"/>
                        <col width="63%"/>
                        <col width="10%"/>
                        <col width="10%"/>
                    </colgroup>
                    <tr>
                        <td>글번호</td>
                        <td>
                            <select class="category-box nanumsquare" name="category">
                                <option value="">카테고리</option>
	                            <c:choose>
	                            <c:when test="${ category eq  'ALBUM' }">
	                                <option value="ALBUM" selected>ALBUM</option>
	                            </c:when>
	                            <c:otherwise>
	                            	<option value="ALBUM">ALBUM</option>
	                            </c:otherwise>
	                            </c:choose>
	                            <c:choose>
	                            <c:when test="${ category eq  'GOODS' }">
	                                <option value="GOODS" selected>GOODS</option>
	                            </c:when>
	                            <c:otherwise>
	                            	<option value="GOODS">GOODS</option>
	                            </c:otherwise>
	                            </c:choose>
	                            <c:choose>
	                            <c:when test="${ category eq  'TICKET' }">
	                                <option value="TICKET" selected>TICKET</option>
	                            </c:when>
	                            <c:otherwise>
	                            	<option value="TICKET">TICKET</option>
	                            </c:otherwise>
	                            </c:choose>
	                            <c:choose>
	                            <c:when test="${ category eq  'PHOTO' }">
	                                <option value="PHOTO" selected>PHOTO</option>
	                            </c:when>
	                            <c:otherwise>
	                            	<option value="PHOTO">PHOTO</option>
	                            </c:otherwise>
	                            </c:choose>
	                            <c:choose>
	                            <c:when test="${ category eq  'ETC' }">
	                                <option value=ETC selected>ETC</option>
	                            </c:when>
	                            <c:otherwise>
	                            	<option value="ETC">ETC</option>
	                            </c:otherwise>
	                            </c:choose>
	                        </select>
                        </td>
                        <td id="itemName">상품명</td>
                        <td>품절 여부</td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <hr class="list-line">
            <div class="list-box">
                <table class="store-list nanumsquare">
                    <tbody>
                        <colgroup>
                            <col width="7%"/>
                            <col width="10%"/>
                            <col width="63%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                        </colgroup>
                        <c:forEach var="s" items="${ store }">
                        <tr>
                            <td>${ s.store.pcode }</td>
                            <td>${ s.storeCate.cateName }</td>
                            <td>${ s.store.pname }</td>
                            <c:choose>
                            <c:when test="${ s.store.isSoldout eq 'N' }">
                            <td></td>
                            </c:when>
                            <c:otherwise>
                            <td>품절</td>
                            </c:otherwise>
                            </c:choose>
                            <td><button type="button" class="store-link-Btn" onclick="storeLink(${ s.store.pcode });">이동하기</button></td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="search-area">
                <input type="search" class="contents-search-input" value="${ search }">
                <img src="${ contextPath }/resources/icon/search-icon.svg" class="search-icon" alt="">
                <span class="store-plus nanumsquare">+</span>
                <span class="store-minus nanumsquare">-</span>
            </div>
        </div>
    </section>
	<!-- 본문 끝 -->
	<script>
	$(document).ready(function() {
		$("#storeBtn").css("display", "none");
    	$("#artistBtn").css("display", "block");
    });
	
	// 이동하기 버튼 클릭할 때
	function storeLink(pcode) {
		location.href = "${ contextPath }/store/detail?pcode=" + pcode;
	}
	
	// 스토어 + 버튼 클릭할 때
	$(".store-plus").click(function() {
		var artiName = "${ artiName }";
		console.log(artiName);
		$(".main-template").css("display", "block");
        $(".insert-section").css("display", "block");
         
        $(".arti").val(artiName);
	});
	
	// 스토어 - 버튼 클릭할 때
	$(".store-minus").click(function() {
		$(".store-delete-form-container").css("display", "block");
	});
	
	// 스토어 삭제 팝업 확인 버튼 클릭할 때
	$("#storeItemDeleteBtn").click(function() {
		var pname = $("#storeItemCategory").val();
		var artiName = "${ artiName }";
		
		if(artiName != "") {
			$.ajax({
    			url : "${ contextPath }/mypage/deleteStoreItem",
    			data : { pname : pname, artiName : artiName },
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
    				
    				alert("스토어가 정상적으로 삭제되었습니다.");
    			} 
    		});
    	} else {
    		alert("상품명을 선택해주세요");
    	}
	});
	
	var storeName = [];
	
	// 스토어 삭제 팝업 취소 버튼 클릭할 때
	$("#storeItemCancelBtn").click(storeDeleteReturn);
	
	function storeDeleteReturn() {
    	$(".store-delete-form-container").css("display", "none");
    	
        $.each($("#storeItemCategory option:selected"), function () {
        	storeName.push($(this).val());
            $(this).prop('selected', false);
        });
    }
	
	// 카테고리를 변경할 때
	$("category-box").change(function() {
		var category = $("category-box option:selected").val();
		
		if(category != "") {
			location.href = "${ contextPath }/mypage/agency/store?category=" + category;
		} 
	});
	
	// 리스트 검색 기능 사용
	$(".contents-search-input").keydown(function(key) {
		var search = $(".contents-search-input").val();
		
        if (key.keyCode == 13) {
        	location.href = "${ contextPath }/mypage/agency/store?search=" + search;
        }
    });
	</script>
</body>
</html>
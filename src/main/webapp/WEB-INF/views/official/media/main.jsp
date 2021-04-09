<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/official/mediaMain.css">
</head>
<body>
	<!-- 네비바 인클루드 -->
	<jsp:include page="../../common/navbar.jsp"/>
	
    <!-- 본문 시작 -->
    <section class="main-section">
    
    	<!-- 왼쪽(카테고리) 인클루드 -->
		<jsp:include page="../../common/category.jsp"/>

        <!-- 중간 -->
        <section class="main-contents">
        
        	<!-- 슬라이드 -->
            <div class="new-title">NEW</div>
            <div class="slide-box">
                <ul class="slide-container">
                	<c:forEach var="s" items="${ slide }">
                    <li class="slider">
                        <div class="new-container">
                            <div class="new-media-left">
                                <div class="new-media-title nanumsquare">${ s.official.mediaTtl }</div>
                                <div class="circle">
                                    <a href="${ contextPath }/official/list" class="new-media-link nanumsquare">바로 가기</a>
                                </div>
                            </div>
                            <div class="new-media-right">
                                <img class="new-media-img" src="${ contextPath }/resources/images/official/${ s.attachment.attSvName }">
                            </div>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </div>

			<!-- 본문 -->
			<c:forEach var="cate" items="${ category }">
            <div class="category-container">
                <div class="category-upper">
                    <div class="category-title nanumsquare">${ cate.cateName }</div>
                    <a href="${ contextPath }/official/media/list" class="category-link nanumsquare">전체 보기</a>
                </div>
                <div class="category-under">
                	<c:forEach var="m" items="${ list }">
                	<c:if test="${ m.official.cateCode eq cate.cateCode }">
                    <div class="category-media" onclick="selectMedia(${ m.official.mediaNum })">
                    	<c:if test="${ m.official.isPay eq 'Y' }">
                        <div class="media-pay-sign">유료</div>
                        </c:if>
                        <c:if test="${ m.attachment.attMain eq 'Y' }">
                        <img src="${ contextPath }/resources/images/official/${ m.attachment.attSvName }">
                        </c:if>
                        <div class="media-title nanumsquare">${ m.official.mediaTtl }</div>
                        <div class="media-date nanumsquare">${ m.official.mediaDate }</div>
                    </div>
                    </c:if>
                    </c:forEach>
                </div>
            </div>
            </c:forEach>
        
        <script type="text/javascript">
        /* 화면에 미디어를 4개 배치하기 위해 hide 처리 */
        $(document).ready(function() {
        });
        
        /* 미디어 클릭 시 */
        function selectMedia(mediaNum) {
        	var loginUser = ${ loginUser.classifyMem }
        	var membership = ${ user.isMembership }
        	
        	/* 미디어가 유료일 때 */
        	if($(this).children('.media-pay-sign').text() == "유료") {
        		
        		/* 일반유저가 아니면 상세페이지로 이동 */
        		if(loginUser != 1) {
            		location.href="${ contextPath }/official/media/detail?mediaNum=" + mediaNum;
            		
            	/* 일반유저라도 멤버십 회원이면 상세페이지로 이동 */	
            	} else {            		
            		if(membership == "Y") {
            			location.href="${ contextPath }/official/media/detail?mediaNum=" + mediaNum;
            			
            		/* 멤버십에 가입하지 않은 회원은 구매 유도 팝업창 생성 */
            		} else {
            			
            			if(confirm("해당 상품을 구매하시겠습니까?")) {
        					
            				/* 장바구니로 해당 상품 데이터를 넘기는 ajax 처리 */
            				$.ajax({
			            		url : "${ contextPath }/official/media/insertCart",
			            		data : { mediaNum : mediaNum },
			            		type : "post",
			            		dataType : "json",
			            		contentType : "application/json; charset=utf-8",
			            		success : function(data) {
			            			console.log(data);
			            		},
			            		error : function(e) {
			            			console.log(e);
			            		}
			            	});
            				
            				/* 장바구니 페이지로 이동 */
                            if(confirm("상품이 정상적으로 장바구니에 담겼습니다.\n" + 
                            "장바구니로 이동하시겠습니까?")) {
                            	location.href="${ contextPath }/official/media/detail?mediaNum=" + mediaNum;
                            } 
                        }
            		}
            	} 
        	}
        </script>
        
        <!-- 오른쪽 -->
        <aside class="main-contents-right">
            <div class="toggle-area">
                <div class="toggle-switch" tabindex="0">
                    <input type="checkbox" name="my_checkbox" value="yes" id="checkbox-id" />
                    <label for="checkbox-id">
                      <div class="area" aria-hidden="true">
                        <div class="background">
                            <div class="handle"></div>
                        </div>
                        <p>미디어</p>
                      </div>
                    </label>
                  </div>
            </div>
        </aside>
        
	    <script>
        // 해당 페이지에 대한 카테고리 색상 변경
		$(document).ready(function() {
		    $(".category a").eq(2).css("color", "#5C5F78");
		});
	    
	 	// 토글 스위치 클릭할 때 스케줄 페이지로 이동
	    $(".toggle-switch").click(function () {
		    location.href="${ contextPath }/official/schedule";
		});
	    </script>
   </section>
   <!-- 본문 끝 -->
</body>
</html>
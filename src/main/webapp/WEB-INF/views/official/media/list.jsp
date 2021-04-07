<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/official/mediaList.css">
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
            <div class="category-container">
                <div class="category-upper">
                    <span class="category-title nanumsquare">BREAK THE SILENCE</span>&nbsp;<span class="category-count nanumsquare">(7)</span>
                </div>
                <div class="category-under">
                    <div class="category-media">
                        <div class="media-pay-sign">유료</div>
                        <img src="${ contextPath }/resources/images/official/category-media.jpg">
                        <div class="media-title nanumsquare">BREAK THE SILENCE : THE MOVIE COMMENTARY</div>
                        <div class="media-date nanumsquare">2021.03.21</div>
                    </div>
                    <div class="category-media">
                        <img src="${ contextPath }/resources/images/official/category-media.jpg">
                        <div class="media-title nanumsquare">BREAK THE SILENCE : THE MOVIE COMMENTARY</div>
                        <div class="media-date nanumsquare">2021.03.21</div>
                    </div>
                    <div class="category-media">
                        <img src="${ contextPath }/resources/images/official/category-media.jpg">
                        <div class="media-title nanumsquare">BREAK THE SILENCE : THE MOVIE COMMENTARY</div>
                        <div class="media-date nanumsquare">2021.03.21</div>
                    </div>
                    <div class="category-media">
                        <img src="${ contextPath }/resources/images/official/category-media.jpg">
                        <div class="media-title nanumsquare">BREAK THE SILENCE : THE MOVIE COMMENTARYBREAK THE SILENCE : THE MOVIE COMMENTARYBREAK THE SILENCE : THE MOVIE COMMENTARY</div>
                        <div class="media-date nanumsquare">2021.03.21</div>
                    </div>
                    <div class="category-media">
                        <img src="${ contextPath }/resources/images/official/category-media.jpg">
                        <div class="media-title nanumsquare">BREAK THE SILENCE : THE MOVIE COMMENTARY</div>
                        <div class="media-date nanumsquare">2021.03.21</div>
                    </div>
                    <div class="category-media">
                        <img src="${ contextPath }/resources/images/official/category-media.jpg">
                        <div class="media-title nanumsquare">BREAK THE SILENCE : THE MOVIE COMMENTARYBREAK THE SILENCE : THE MOVIE COMMENTARYBREAK THE SILENCE : THE MOVIE COMMENTARY</div>
                        <div class="media-date nanumsquare">2021.03.21</div>
                    </div>
                </div>
            </div>
        </section>
        
        <script>
        /* 유료 상품 클릭 시 구매 유도 알럿창 */
        $(".category-media img").click(function() {

		    if($(this).siblings('.media-pay-sign').text() == "유료") {
		        if(confirm("해당 상품을 구매하시겠습니까?")) {
		            if(confirm("상품이 정상적으로 장바구니에 담겼습니다.\n" + 
		            "장바구니로 이동하시겠습니까?")) {		    
		            } 
		        }
		    }
		});
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
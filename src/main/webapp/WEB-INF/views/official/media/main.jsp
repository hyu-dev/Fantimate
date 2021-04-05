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
            <div class="new-title">NEW</div>
            <div class="slide-box">
                <ul class="slide-container">
                    <li class="slider">
                        <div class="new-container">
                            <div class="new-media-left">
                                <div class="new-media-title nanumsquare">BTS WORLD TOUR 'LOVE YOURSELF' NEWYORK</div>
                                <div class="circle">
                                    <a href="${ contextPath }/official/list" class="new-media-link nanumsquare">바로 가기</a>
                                </div>
                            </div>
                            <div class="new-media-right">
                                <img class="new-media-img" src="${ contextPath }/resources/images/official/new-media.png">
                            </div>
                        </div>
                    </li>
                    <li class="slider">
                        <div class="new-container">
                            <div class="new-media-left">
                                <div class="new-media-title nanumsquare">BTS WORLD TOUR 'LOVE YOURSELF' NEWYORK</div>
                                <div class="circle">
                                    <a href="../official/media-detail.html" class="new-media-link nanumsquare">바로 가기</a>
                                </div>
                            </div>
                            <div class="new-media-right">
                                <img class="new-media-img" src="${ contextPath }/resources/images/official/new-media.png">
                            </div>
                        </div>
                    </li>
                    <li class="slider">
                        <div class="new-container">
                            <div class="new-media-left">
                                <div class="new-media-title nanumsquare">BTS WORLD TOUR 'LOVE YOURSELF' NEWYORK</div>
                                <div class="circle">
                                    <a href="../official/media-detail.html" class="new-media-link nanumsquare">바로 가기</a>
                                </div>
                            </div>
                            <div class="new-media-right">
                                <img class="new-media-img" src="${ contextPath }/resources/images/official/new-media.png">
                            </div>
                        </div>
                    </li>
                    <li class="slider">
                        <div class="new-container">
                            <div class="new-media-left">
                                <div class="new-media-title nanumsquare">BTS WORLD TOUR 'LOVE YOURSELF' NEWYORK</div>
                                <div class="circle">
                                    <a href="../official/media-detail.html" class="new-media-link nanumsquare">바로 가기</a>
                                </div>
                            </div>
                            <div class="new-media-right">
                                <img class="new-media-img" src="${ contextPath }/resources/images/official/new-media.png">
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
<!---->
            <div class="category-container">
                <div class="category-upper">
                    <div class="category-title nanumsquare">BREAK THE SILENCE</div>
                    <a href="${ contextPath }/official/media/list" class="category-link nanumsquare">전체 보기</a>
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
                </div>
            </div>
            <div class="category-container">
                <div class="category-upper">
                    <div class="category-title nanumsquare">BREAK THE SILENCE</div>
                    <a href="${ contextPath }/official/media/list" class="category-link nanumsquare">전체 보기</a>
                </div>
                <div class="category-under">
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
            <div class="category-container">
                <div class="category-upper">
                    <div class="category-title nanumsquare">BREAK THE SILENCE</div>
                    <a href="${ contextPath }/official/media/list" class="category-link nanumsquare">전체 보기</a>
                </div>
                <div class="category-under">
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
        
        <script type="text/javascript">
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
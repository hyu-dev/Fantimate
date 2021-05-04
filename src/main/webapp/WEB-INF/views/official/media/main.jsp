<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
   			<c:set var="count" value="0"/>
           	<c:forEach var="sc" items="${ slide }">
           	<c:set var="count" value="${ count + 1 }"/>
           	</c:forEach>
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
                                    <a href="${ contextPath }/official/media/detail?mediaNum=${ s.official.mediaNum }" class="new-media-link nanumsquare">바로 가기</a>
                                </div>
                            </div>
                            <div class="new-media-right">
                                <img class="new-media-img" src="${ contextPath }/resources/uploadFiles/${ s.mediaFile.picSvName }">
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
                    <input type="hidden" name="cateName" value="${ cate.cateName }">
                    <c:set var="check" value="0"/>
                    <c:forEach var="m" items="${ list }">
                	<c:if test="${ m.official.cateCode eq cate.cateCode }">
                	<c:set var="check" value="${ check + 1 }"/>
                	</c:if>
                	</c:forEach>
                    <c:if test="${ check > 4 }">
                    <a href="${ contextPath }/official/media/list?category=${ cate.cateName }" class="category-link nanumsquare">전체 보기</a>
                    </c:if>
                </div>
                <div class="category-under">
                	<c:forEach var="m" items="${ list }">
                	<c:if test="${ m.official.cateCode eq cate.cateCode }">
                    <div class="category-media">
                    	<c:if test="${ m.official.isPay eq 'Y' }">
                        <div class="media-pay-sign">유료</div>
                        </c:if>
                        <img src="${ contextPath }/resources/uploadFiles/${ m.mediaFile.picSvName }"
                         	 onclick="selectMedia(${ m.official.mediaNum }, '${ m.official.isPay }', ${ m.official.mediaPay })">
                        <div class="media-title nanumsquare">${ m.official.mediaTtl }</div>
                        <div class="media-date nanumsquare"><fmt:formatDate value="${ m.official.mediaDate }" pattern="yyyy.MM.dd"/></div>
                    </div>
                    </c:if>
                    </c:forEach>
                </div>
            </div>
            </c:forEach>
        </section>
        
        <script type="text/javascript">
        // 슬라이드 표현
        $(document).ready(function() {
        	var count = ${ count };
        	
        	console.log(count);
        	
        	if(count < 4) {
        		$(".new-title").css("display", "none");
        		$(".slide-box").css("display", "none");
        	}
        });
        
        /* 미디어 클릭 시 */
        function selectMedia(mediaNum, isPay, mediaPay) {
        	var loginUser = ${ loginUser.classifyMem }
        	var membership = "${ userColl.user.isMembership }";
        	console.log("로그인유저 번호 : " + loginUser);
        	console.log("멤버십 : " + membership);
        	
        	/* 미디어가 유료일 때 */
        	if(isPay == "Y") {
        		
        		/* 일반유저가 아니면 상세페이지로 이동 */
        		if(loginUser != 1) {
            		location.href="${ contextPath }/official/media/detail?mediaNum=" + mediaNum;
            		
            	/* 일반유저라도 멤버십 회원이면 상세페이지로 이동 */	
            	} else {            		
            		if(membership == "Y") {
            			location.href="${ contextPath }/official/media/detail?mediaNum=" + mediaNum;
            			
            		/* 멤버십에 가입하지 않은 회원은 구매 유도 팝업창 생성 */
            		} else {
            			if(confirm("해당 상품은 " + mediaPay + "원입니다. 구매를 진행하시겠습니까?")) {
        					
            				/* 장바구니로 해당 상품 데이터를 넘기는 ajax 처리 */
            				$.ajax({
			            		url : "${ contextPath }/official/media/insertCart",
			            		data : { mediaNum : mediaNum, mediaPay : mediaPay },
			            		type : "post",
			            		dataType : "json",
			            		// 데이터가 전송되지 않아서 contentType을 주석 처리함
			            		// contentType : "application; charset=utf-8",
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
                            	location.href="${ contextPath }/pay/cart";
                            } 
                        }
            		}
            	} 
        	} else {
        		location.href="${ contextPath }/official/media/detail?mediaNum=" + mediaNum;
        	}
        }
        
     	// 카테고리 검색창에 글씨 입력 후 엔터를 클릭했을 때
		$(".contents-search-input").keyup(function(e) {
			if(e.keyCode == 13) {
				$(".search-area img").click();
				$(".contents-search-input").val("").focus();
		        $(".category-search-result.official-result").css('display', 'none');
			}
		})
		
		// 카테고리 검색창에 돋보기 아이콘 클릭시
		$(".search-area img").click(function() {
			var search = $(".contents-search-input").val();
			$.ajax({
				url : "${ pageContext.request.contextPath }/official/search?search=" + search,
	    		data : "get",
				dataType : "json",
				success : function(data) {
					console.log(data)
					if(data.length < 1) {
						alert('검색된 영상이 없습니다')
					} else {
						var main = $(".main-contents");
						main.html("");
						// 중간 데이터에 삽입
						var container = $("<div class='category-container'>");
						var upper = $("<div class='category-upper'>");
						var span = $("<span class='category-title nanumsquare'>").text("검색 키워드 : " + search)
						var under = $("<div class='category-under'>");
						for(var i in data) {
							var media = $("<div class='category-media'>");
							var pay = $("<div class='media-pay-sign'>").text("유료");
							var img = $("<img onclick='selectMedia(" + data[i].official.mediaNum + "," + data[i].official.isPay + "," + data[i].official.mediaPay + ")'>")
							img.attr("src", "${contextPath}/resources/uploadFiles/" + data[i].mediaFile.picSvName);
							var title = $("<div class='media-title nanumsquare'>").text(data[i].official.mediaTtl);
							var date = $("<div class='media-date nanumsquare'>").text(data[i].official.mediaDate);
							
							if(data[i].official.isPay == 'Y') {
								media.append(pay)
							}
							media.append(img, title, date);
							under.append(media);
						}
						upper.append(span);
						container.append(upper, under);
						main.append(container);
					}
				}
			})
		})
        </script>
        
        <!-- 오른쪽 -->
         
        <aside class="main-contents-right">
        <!--
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
         -->
        </aside>
        
	    <script>
        // 해당 페이지에 대한 카테고리 색상 변경
		$(document).ready(function() {
		    $(".category a").eq(2).css("color", "#5C5F78");
		});
	    
	 	// 토글 스위치 클릭할 때 스케줄 페이지로 이동
	 	var artiName = "${ artiName }";
	 	
	    $(".toggle-switch").click(function() {
	    	location.href="${ contextPath }/official/schedule?artiName=" + artiName;
		});
	    </script>
   </section>
   <!-- 본문 끝 -->
</body>
</html>
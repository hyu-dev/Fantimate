<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/store/storeList.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Fantimate</title>
</head>
<body>
	<c:if test="${ !empty msg }">
		<script>
			$(function() {
				alert('${msg}')
				location.href="${referer}"
			}) 
		</script>
		<c:remove var="msg"/>
	</c:if>
	
	<!-- 네비바 인클루드 -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	<c:if test="${ !empty loginUser }">
	<section class="main-section">
		<!-- 카테고리 인클루드 -->
		<jsp:include page="../common/category.jsp"></jsp:include>
		
		<section class="main-contents">
             <div class="store-category">
                 <ul>
                 	<c:forEach var="c" items="${ cateList }">
                    <li class="circle"><a class="highlight">${ c.cateName }</a></li>
                    </c:forEach>
                </ul>
                <div class="toggle-area">
                    <div class="toggle-switch" tabindex="0">
                        <input type="checkbox" name="my_checkbox" value="yes" id="checkbox-id" />
                        <label for="checkbox-id">
                          <div class="area" aria-hidden="true">
                            <div class="background">
                                <div class="handle"></div>
                            </div>
                            <p>NEW</p>
                          </div>
                        </label>
                    </div>
                </div>
             </div>
             <div class="store-product">
             	<c:forEach var="list" items="${ list }">
                <article class="product-background">
                    <div class="product-info">
                   	<c:choose>
                   		<c:when test="${ list.store.isSoldout eq 'Y' }">
                   		<p>SOLD OUT</p>
                   		</c:when>
                   		<c:otherwise>
                   		<p>${ artiName }</p>
                        <b>${ list.store.pname }</b>
                        <p>
                        	<fmt:formatNumber type="number" value="${ list.store.qprice * (1 - list.store.discount/100) }"/> 
                        	&nbsp;
                        	<sub>
                        		<s><fmt:formatNumber type="number" value="${ list.store.qprice }"/></s>&nbsp;
                        		${ list.store.discount }%
                        	</sub>
                        </p>
                        <img class="cart-icon store-icon" src="${ contextPath }/resources/icon/shopping.png" alt="">
                        <c:choose>
	                        <c:when test="${ list.wish.id eq 'user' && list.wish.isWish eq 'Y'}">
	                        <img class="ddim-icon store-icon noddim" src="${ contextPath }/resources/icon/heart-pink.png" alt="">
	                        </c:when>
	                        <c:otherwise>
	                        <img class="ddim-icon store-icon ddim" src="${ contextPath }/resources/icon/heart.png" alt="">
	                        </c:otherwise>
                        </c:choose>
                   		</c:otherwise>
                   	</c:choose>
                    </div>
                    <img src="${ contextPath }/resources/uploadFiles/${ list.att.attSvName }" alt="이미지">
                    <input type="hidden" id="pcode" value="${ list.store.pcode }"/>
                </article>
                </c:forEach>
             </div>
             <div class="more-product">
             	<button type="button" class="more-btn">+MORE</button>
             </div>
         </section>
	</section>
	<script>
		// 페이지 로딩시 스토어카테고리 첫번째에 적용
		$(function() {
			$(".circle:first-of-type").addClass("click-li");
			$(".circle:first-of-type").children().addClass("click-li");
			// 페이지로딩시 조회된 상품의 개수가 12개 이하일 경우
			if(length < 13) {
				$(".more-btn").css("display", "none");
			} else {
				$(".more-btn").css("display", "block");
			}
		});
		
		// 찜 아이콘 클릭시
		$(document).on('click', '.ddim-icon', function() {
			var clickMe = $(".circle.click-li");
	        var cateName = $(".circle.click-li").children().text();
	        var toggle = $(".area p").text();
	        var pcode = $(this).parent().siblings("input").val();
	        var url = '';
	        if($(this).hasClass('ddim')) {
		        alert('찜목록에 등록되었습니다');
		        url = "${ pageContext.request.contextPath }/store/enrollWish/" + pcode + "/" + cateName + "/" + toggle;
		     	// ajax 호출
		        callAjax(clickMe, url);
		    } else {
		        alert('찜목록이 취소되었습니다.')
		        url = "${ pageContext.request.contextPath }/store/cancelWish/" + pcode + "/" + cateName + "/" + toggle;
		        // ajax 호출
		        callAjax(clickMe, url);
		    }
		})
		
		// 더보기 버튼 클릭시
		let height = parseInt(($(".store-product").css("height")).replace(/[a-z]/gi,""));
		let length = $(".product-background").length;
		$(".more-btn").on('click', function() {
		    if(length - 12 > 0) {
		        length -= 12;
		        length > 8 
		        ? height+=1170
		        : length > 4
		        ? height+=780
		        : height+=390
		        $(".store-product").css("height", height)
		    } else {
		        alert("더 이상 목록이 없습니다.")
		    }
		})
	
		// 상품 장바구니 아이콘 클릭시
		$(document).on('click', '.cart-icon', function() {
			var clickMe = $(".circle.click-li");
	        var pcode = $(this).parent().siblings("input").val();
			var url = "${ pageContext.request.contextPath }/store/insertCart/" + pcode;
			// ajax 호출
			callAjax(clickMe, url);
		    if(confirm('장바구니에 등록되었습니다. 이동하시겠습니까?')) {
		    	location.href = "${contextPath}/pay/cart";
		    }
		})
	
		// 상품 클릭시
		$(document).on('click', '.product-background', function(e) {
		    if(!$(e.target).hasClass('store-icon')) {
		    	var pcode = $(this).children("#pcode").val();
		        location.href='${ contextPath }/store/detail?pcode=' + pcode;
		    }
		})
		
		// 상품에 마우스 호버시 (동적생성태그로 인해 css가 안먹힘..)
		$(document).on('mouseenter', '.product-background', function(e) {
			$(e.target).children(".product-info").css("top", "50%");
		})
		// 상품에 마우스 호버 취소시
		$(document).on('mouseleave', '.product-background', function(e) {
			$('.product-background').children(".product-info").css("top", "100%");
		})
		
		
		// 스토어 카테고리 호버 및 클릭시
		$(".circle").hover(function() {
		    $(this).addClass("special");
		    $(this).children().addClass("special");
		}, function() {
		    $(this).removeClass("special");
		    $(this).children().removeClass("special");
		}).click(function() {
			var clickMe = $(this);
			var cateName = $(this).children().text();
		    var toggle = $(".area p").text();
		    var url = "${ pageContext.request.contextPath }/store/category/" + cateName + "/" + toggle;
		    // ajax 호출
		    callAjax(clickMe, url);
		});
		
	
		// 토클 클릭시 
		let flag = true;
		$(".toggle-switch input").on('click', function(e) {
		    if(flag == true) {
		        // 토글이 true일 경우(기본키 일 경우)
		        $(".area p").text("TOP");
		        var clickMe = $(".circle.click-li");
		        var cateName = $(".circle.click-li").children().text();
		        var toggle = $(".area p").text();
		        var url = "${ pageContext.request.contextPath }/store/category/" + cateName + "/" + toggle;
		        // ajax 호출
		        callAjax(clickMe, url);
		        flag = false;
		    } else {
		        // 토글이 false일 경우(체크된 경우)
		        $(".area p").text("NEW");
		        var clickMe = $(".circle.click-li");
		        var cateName = $(".circle.click-li").children().text();
		        var toggle = $(".area p").text();
		        var url = "${ pageContext.request.contextPath }/store/category/" + cateName + "/" + toggle;
		     	// ajax 호출
		        callAjax(clickMe, url);
		        flag = true;
		    }
		});
		
		// 카테고리 검색창에 글씨 입력 후 엔터를 클릭했을 때
		$(".contents-search-input").keyup(function(e) {
			if(e.keyCode == 13) {
				$(".search-area img").click();
			}
		})
		
		// 카테고리 검색창에 돋보기 아이콘 클릭시
		$(".search-area img").click(function() {
			var clickMe = $(".circle.click-li");
			var search = $(".contents-search-input").val();
			var url = "${ pageContext.request.contextPath }/store/search/" + search;
		    
			// ajax 호출
			callAjax(clickMe, url);
		    $(".contents-search-input").val("").focus();
	        $('.category-search-result').css('display', 'none');
		})
		
		// 반복하는 AJAX 공통 함수로 구분
		function callAjax(clickMe, url) {
			$.ajax({
	        	url : url,
	        	data : "get",
				dateType : "json",
				contentType : "application/json; charset=utf-8",
	        	success : function(data) {
	        		if(data.length < 1) {
	        			alert("상품목록이 존재하지 않습니다")
	        		} else {
	        			var area = $(".store-product").html("");
						
						for(var i in data) {
							var article = $("<article class='product-background'>");
							var div = $("<div class='product-info'>");
							var soldout = $("<p>").text("SOLD OUT");
							var artiName = $("<p>").text("${ artiName }");
							var pName = $("<b>").text(data[i].store.pname);
							var price = $("<p>")
							var sub = $("<sub>")
							var s = $("<s>").text(" " + numberWithCommas(data[i].store.qprice));
							var cart = $("<img class='cart-icon store-icon' src='${ contextPath }/resources/icon/shopping.png' alt=''>");
							var ddim = $("<img class='ddim-icon store-icon ddim' src='${ contextPath }/resources/icon/heart.png' alt=''>");
							var noddim = $("<img class='ddim-icon store-icon noddim' src='${ contextPath }/resources/icon/heart-pink.png' alt=''>");
							var imgSrc = "${ contextPath }/resources/uploadFiles/" + data[i].att.attSvName;
							var img = $("<img src='' alt=''>").attr("src", imgSrc);
							var pCode = $("<input type='hidden' id='pcode'>").val(data[i].store.pcode);
							sub.append(s, " " + data[i].store.discount + "%").trigger("create");
							price.append(numberWithCommas(data[i].store.qprice * (1- data[i].store.discount/100)), sub).trigger("create");
							
							if(data[i].store.isSoldout == 'Y') {
								div.append(soldout);
							} else {
								if(data[i].wish.id == 'user' && data[i].wish.isWish == 'Y') {
									div.append(artiName, pName, price, cart, noddim).trigger("create");
								} else {
									div.append(artiName, pName, price, cart, ddim).trigger("create");
								}
							}
							article.append(div, img, pCode).trigger("create");
							area.append(article).trigger("create");
						}
						$(".circle").removeClass("click-li");
					    $(".circle").children().removeClass("click-li");
					    clickMe.addClass("click-li");
					    clickMe.children().addClass("click-li");
	        		}
	        	},
	        	error : function(e) {
	        		console.log(e);
	        	}
	        });
		}
		// 숫자 3 단위마다 콤마찍기
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	</script>
	</c:if>
	<c:if test="${ empty loginUser }">
	<script>
		$(function() {
			alert("로그인을 해주세요");
			location.href="${contextPath}/main"
		})
	</script>
	</c:if>
</body>
</html>
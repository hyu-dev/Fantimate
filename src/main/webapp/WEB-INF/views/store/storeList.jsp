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
	<!-- 네비바 인클루드 -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
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
                        <p>세션에서 아티스트명 불러오기 입니다잉</p>
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
                    </div>
                    <img src="${ contextPath }/resources/images/store/${ list.att.attSvName }" alt="이미지">
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
		// 찜 아이콘 클릭시
		$(document).on('click', '.ddim-icon', function() {
			var clickMe = $(".circle.click-li");
	        var cateName = $(".circle.click-li").children().text();
	        var toggle = $(".area p").text();
	        var pcode = $(this).parent().siblings("input").val();
		    
	        if($(this).hasClass('ddim')) {
		        alert('찜목록에 등록되었습니다');
		        $.ajax({
					url : "${ pageContext.request.contextPath }/store/enrollWish/" + pcode + "/" + cateName + "/" + toggle,
					data : "get",
					dateType : "json",
					contentType : "application/json; charset=utf-8",
					success : function(data) {
						console.log(data);
						var area = $(".store-product").html("");
						
						for(var i in data) {
							var article = $("<article class='product-background'>");
							var div = $("<div class='product-info'>");
							var artiName = $("<p>").text("세션값을 넣는다");
							var pName = $("<b>").text(data[i].store.pname);
							var price = $("<p>")
							var sub = $("<sub>")
							var s = $("<s>").text(data[i].store.qprice);
							var cart = $("<img class='cart-icon store-icon' src='${ contextPath }/resources/icon/shopping.png' alt=''>");
							var ddim = $("<img class='ddim-icon store-icon ddim' src='${ contextPath }/resources/icon/heart.png' alt=''>");
							var noddim = $("<img class='ddim-icon store-icon noddim' src='${ contextPath }/resources/icon/heart-pink.png' alt=''>");
							var imgSrc = "${ contextPath }/resources/images/store/" + data[i].att.attSvName;
							var img = $("<img src='' alt=''>").attr("src", imgSrc);
							var pCode = $("<input type='hidden' id='pcode'>").val(data[i].store.pcode);
							sub.append(s, data[i].store.discount + "%").trigger("create");
							price.append((data[i].store.qprice * (1- data[i].store.discount/100)), sub).trigger("create");
							if(data[i].wish.id == 'user' && data[i].wish.isWish == 'Y') {
								div.append(artiName, pName, price, cart, noddim).trigger("create");
							} else {
								div.append(artiName, pName, price, cart, ddim).trigger("create");
							}
							article.append(div, img, pCode).trigger("create");
							area.append(article).trigger("create");
						}
						$(".circle").removeClass("click-li");
					    $(".circle").children().removeClass("click-li");
					    clickMe.addClass("click-li");
					    clickMe.children().addClass("click-li");
					},
					error : function(e) {
						console.log(e);
					}
		        });
		    } else {
		        alert('찜목록이 취소되었습니다.')
		        $.ajax({
					url : "${ pageContext.request.contextPath }/store/cancelWish/" + pcode + "/" + cateName + "/" + toggle,
					data : "get",
					dateType : "json",
					contentType : "application/json; charset=utf-8",
					success : function(data) {
						console.log(data);
						var area = $(".store-product").html("");
						
						for(var i in data) {
							var article = $("<article class='product-background'>");
							var div = $("<div class='product-info'>");
							var artiName = $("<p>").text("세션값을 넣는다");
							var pName = $("<b>").text(data[i].store.pname);
							var price = $("<p>")
							var sub = $("<sub>")
							var s = $("<s>").text(data[i].store.qprice);
							var cart = $("<img class='cart-icon store-icon' src='${ contextPath }/resources/icon/shopping.png' alt=''>");
							var ddim = $("<img class='ddim-icon store-icon ddim' src='${ contextPath }/resources/icon/heart.png' alt=''>");
							var noddim = $("<img class='ddim-icon store-icon noddim' src='${ contextPath }/resources/icon/heart-pink.png' alt=''>");
							var imgSrc = "${ contextPath }/resources/images/store/" + data[i].att.attSvName;
							var img = $("<img src='' alt=''>").attr("src", imgSrc);
							var pCode = $("<input type='hidden' id='pcode'>").val(data[i].store.pcode);
							sub.append(s, data[i].store.discount + "%").trigger("create");
							price.append((data[i].store.qprice * (1- data[i].store.discount/100)), sub).trigger("create");
							if(data[i].wish.id == 'user' && data[i].wish.isWish == 'Y') {
								div.append(artiName, pName, price, cart, noddim).trigger("create");
							} else {
								div.append(artiName, pName, price, cart, ddim).trigger("create");
							}
							article.append(div, img, pCode).trigger("create");
							area.append(article).trigger("create");
						}
						$(".circle").removeClass("click-li");
					    $(".circle").children().removeClass("click-li");
					    clickMe.addClass("click-li");
					    clickMe.children().addClass("click-li");
					},
					error : function(e) {
						console.log(e);
					}
		        });
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
		$('.cart-icon').click(function() {
		    if(confirm('장바구니에 등록되었습니다. 이동하시겠습니까?')) {
		        location.href='../pay/cart.html';
		    }
		})
	
		// 상품 클릭시
		$(document).on('click', '.product-background', function(e) {
		    if(!$(e.target).hasClass('store-icon')) {
		        location.href='detail.html';
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
		    callAjax(clickMe, cateName, toggle);
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
		        callAjax(clickMe, cateName, toggle);
		        flag = false;
		    } else {
		        // 토글이 false일 경우(체크된 경우)
		        $(".area p").text("NEW");
		        var clickMe = $(".circle.click-li");
		        var cateName = $(".circle.click-li").children().text();
		        var toggle = $(".area p").text();
		        callAjax(clickMe, cateName, toggle);
		        flag = true;
		    }
		});
		
		// 카테고리 검색창에 글씨 입력 후 엔터를 클릭했을 때
		$(".contents-search-input").keyup(function(e) {
			var search = $(this).val();
			if(e.keyCode == 13) {
				$(".search-area img").click();
			}
		})
		
		// 카테고리 검색창에 돋보기 아이콘 클릭시
		$(".search-area img").click(function() {
			var search = $(".contents-search-input").val();
		    // 상품 검색 시작
		    $.ajax({
		    	url : "${ pageContext.request.contextPath }/store/search/" + search,
	    		data : "get",
				dateType : "json",
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					if(data.length < 1) {
	        			alert("검색된 상품이 없습니다")
	        		} else {
	        			var area = $(".store-product").html("");
						
						for(var i in data) {
							var article = $("<article class='product-background'>");
							var div = $("<div class='product-info'>");
							var artiName = $("<p>").text("세션값을 넣는다");
							var pName = $("<b>").text(data[i].store.pname);
							var price = $("<p>")
							var sub = $("<sub>")
							var s = $("<s>").text(data[i].store.qprice);
							var cart = $("<img class='cart-icon store-icon' src='${ contextPath }/resources/icon/shopping.png' alt=''>");
							var ddim = $("<img class='ddim-icon store-icon ddim' src='${ contextPath }/resources/icon/heart.png' alt=''>");
							var noddim = $("<img class='ddim-icon store-icon noddim' src='${ contextPath }/resources/icon/heart-pink.png' alt=''>");
							var imgSrc = "${ contextPath }/resources/images/store/" + data[i].att.attSvName;
							var img = $("<img src='' alt=''>").attr("src", imgSrc);
							var pCode = $("<input type='hidden' id='pcode'>").val(data[i].store.pcode);
							sub.append(s, data[i].store.discount + "%").trigger("create");
							price.append((data[i].store.qprice * (1- data[i].store.discount/100)), sub).trigger("create");
							if(data[i].wish.id == 'user' && data[i].wish.isWish == 'Y') {
								div.append(artiName, pName, price, cart, noddim).trigger("create");
							} else {
								div.append(artiName, pName, price, cart, ddim).trigger("create");
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
		    $(".contents-search-input").val("").focus();
	        $('.search-result').css('display', 'none');
		})
		
		// 반복하는 AJAX 공통 함수로 구분
		function callAjax(clickMe, cateName, toggle) {
			$.ajax({
	        	url : "${ pageContext.request.contextPath }/store/category/" + cateName + "/" + toggle,
	        	data : "get",
				dateType : "json",
				contentType : "application/json; charset=utf-8",
	        	success : function(data) {
	        		if(data.length < 1) {
	        			alert("등록된 상품이 없습니다.")
	        		} else {
	        			var area = $(".store-product").html("");
						
						for(var i in data) {
							var article = $("<article class='product-background'>");
							var div = $("<div class='product-info'>");
							var artiName = $("<p>").text("세션값을 넣는다");
							var pName = $("<b>").text(data[i].store.pname);
							var price = $("<p>")
							var sub = $("<sub>")
							var s = $("<s>").text(data[i].store.qprice);
							var cart = $("<img class='cart-icon store-icon' src='${ contextPath }/resources/icon/shopping.png' alt=''>");
							var ddim = $("<img class='ddim-icon store-icon ddim' src='${ contextPath }/resources/icon/heart.png' alt=''>");
							var noddim = $("<img class='ddim-icon store-icon noddim' src='${ contextPath }/resources/icon/heart-pink.png' alt=''>");
							var imgSrc = "${ contextPath }/resources/images/store/" + data[i].att.attSvName;
							var img = $("<img src='' alt=''>").attr("src", imgSrc);
							var pCode = $("<input type='hidden' id='pcode'>").val(data[i].store.pcode);
							sub.append(s, data[i].store.discount + "%").trigger("create");
							price.append((data[i].store.qprice * (1- data[i].store.discount/100)), sub).trigger("create");
							if(data[i].wish.id == 'user' && data[i].wish.isWish == 'Y') {
								div.append(artiName, pName, price, cart, noddim).trigger("create");
							} else {
								div.append(artiName, pName, price, cart, ddim).trigger("create");
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
	</script>
</body>
</html>
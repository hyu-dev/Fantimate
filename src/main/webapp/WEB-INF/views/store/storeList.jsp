<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <li class="circle"><a class="highlight" href="#">ALBUM</a></li>
                    <li class="circle"><a class="highlight" href="#">GOODS</a></li>
                    <li class="circle"><a class="highlight" href="#">TICKET</a></li>
                    <li class="circle"><a class="highlight" href="#">PHOTO</a></li>
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
                <article class="product-background">
                    <div class="product-info">
                        <p>BTS</p>
                        <b>The 1st Album - Dark & Wild</b>
                        <p>\14,900 <sub><s>\16,500</s> 10%</sub></p>
                        <img class="cart-icon store-icon" src="${ contextPath }/resources/icon/shopping.png" alt="">
                        <img class="ddim-icon store-icon ddim" src="${ contextPath }/resources/icon/heart.png" alt="">
                        <img class="ddim-icon store-icon noddim" src="${ contextPath }/resources/icon/heart-pink.png" alt="">
                    </div>
                    <img src="${ contextPath }/resources/images/store/1stAlbumBts.png" alt="">
                </article>
             </div>
             <div class="more-product">
             	<button type="button" class="more-btn">+MORE</button>
             </div>
         </section>
	</section>
	<script>
		// 찜 아이콘 클릭시
		$('.ddim-icon').click(function() {
		    console.log('찜')
		    if($(this).hasClass('ddim')) {
		        alert('찜목록에 등록되었습니다')
		        $(this).siblings('.noddim').css('z-index', '2')
		        $(this).css('z-index', '1')
		    } else {
		        alert('찜목록이 취소되었습니다.')
		        $(this).siblings('.ddim').css('z-index', '2')
		        $(this).css('z-index', '1')
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
		$('.product-background').click(function(e) {
		    if(!$(e.target).hasClass('store-icon')) {
		        location.href='detail.html';
		    }
		})
	
		// 스토어 카테고리 호버 및 클릭시
		$(".circle").hover(function() {
		    $(this).addClass("special");
		    $(this).children().addClass("special");
		}, function() {
		    $(this).removeClass("special");
		    $(this).children().removeClass("special");
		}).click(function() {
		    $(".circle").removeClass("click-li");
		    $(".circle").children().removeClass("click-li");
		    $(this).addClass("click-li");
		    $(this).children().addClass("click-li");
		});
	
		// 토클 클릭시 
		let flag = true;
		$(".toggle-switch input").on('click', function(e) {
		    if(flag == true) {
		        // 토글이 true일 경우(기본키 일 경우)
		        $(".area p").text("TOP");
		        $.ajax({
		        	url : "",
		        	dataType : "json",
		        	success : function(data) {
		        		console.log(data);
		        	},
		        	error : function(e) {
		        		console.log(e);
		        	}
		        });
		        flag = false;
		    } else {
		        // 토글이 false일 경우(체크된 경우)
		        $(".area p").text("NEW");
		        $.ajax({
		        	url : "",
		        	dataType : "json",
		        	success : function(data) {
		        		console.log(data);
		        	},
		        	error : function(e) {
		        		console.log(e);
		        	}
		        });
		        flag = true;
		    }
		});
	</script>
</body>
</html>
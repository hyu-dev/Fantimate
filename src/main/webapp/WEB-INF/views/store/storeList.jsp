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
                        <img class="cart-icon store-icon" src="../resource/icon/shopping.png" alt="">
                        <img class="ddim-icon store-icon ddim" src="../resource/icon/heart.png" alt="">
                        <img class="ddim-icon store-icon noddim" src="../resource/icon/heart-pink.png" alt="">
                    </div>
                    <img src="../resource/images/1stAlbumBts.png" alt="">
                </article>
             </div>
         </section>
	</section>
</body>
</html>
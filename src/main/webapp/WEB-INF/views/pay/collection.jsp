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
    <link rel="stylesheet" href="${ contextPath }/resources/css/pay/collection.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/typeit@7.0.4/dist/typeit.min.js"></script>
    <title>Fantimate</title>
</head>
<body>
	<!-- 네비바 인클루드 -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	
	<section class="main-section">
        <section class="collection-area">
            <h1 class="collection-title">My Collection
                <div class="toggle-area">
                    <div class="toggle-switch" tabindex="0">
                        <input type="checkbox" name="my_checkbox" value="yes" id="checkbox-id" />
                        <label for="checkbox-id">
                            <div class="area" aria-hidden="true">
                            <div class="background">
                                <div class="handle"></div>
                            </div>
                            <p>최신순</p>
                            </div>
                        </label>
                    </div>
                </div>
            </h1>
            <div class="display-stand">
                <article class="product">
                    <div class="product-background">
                        <img src="${ contextPath }/resources/images/store/1stAlbumBts.png" alt="">
                    </div>
                    <div class="product-info">
                        <p>BTS</p>
                        <b>The 1st Album - Dark & Wild</b>
                    </div>
                    <div class="product-operation">
                        <button class="write-photo">포토리뷰 등록하기</button>
                        <!-- <p class="not-confirmed-product">구매 미확정 상품</p>
                        <div class="completed-review">
                            <div class="date-created">
                                <div class="product-score">
                                    <img src="../resource/images/store/star-pink.png" alt="">
                                    <img src="../resource/images/store/star-pink.png" alt="">
                                    <img src="../resource/images/store/star-pink.png" alt="">
                                    <img src="../resource/images/store/star-pink.png" alt="">
                                    <img src="../resource/images/store/star-gray.png" alt="">
                                </div>
                                <p>등록일 : 2021. 03. 07</p>
                            </div>
                            <div class="review-contents">
                                <b>울 옵빠 만나고 싶어효!</b>
                                <p>몇 번이나 사는지 몰라요 이번에는 제발 팬싸인회 당첨 좀ㅠㅠㅠㅠ 이렇게나 원하는데</p>
                            </div>
                        </div> -->
                    </div>
                </article>
                <article class="product">
                    <div class="product-background">
                        <img src="${ contextPath }/resources/images/store/1stAlbumBts.png" alt="">
                    </div>
                    <div class="product-info">
                        <p>BTS</p>
                        <b>The 1st Album - Dark & Wild</b>
                    </div>
                    <div class="product-operation">
                        <button class="write-photo">포토리뷰 등록하기</button>
                        <!-- <p class="not-confirmed-product">구매 미확정 상품</p>
                        <div class="completed-review">
                            <div class="date-created">
                                <div class="product-score">
                                    <img src="../resource/images/store/star-pink.png" alt="">
                                    <img src="../resource/images/store/star-pink.png" alt="">
                                    <img src="../resource/images/store/star-pink.png" alt="">
                                    <img src="../resource/images/store/star-pink.png" alt="">
                                    <img src="../resource/images/store/star-gray.png" alt="">
                                </div>
                                <p>등록일 : 2021. 03. 07</p>
                            </div>
                            <div class="review-contents">
                                <b>울 옵빠 만나고 싶어효!</b>
                                <p>몇 번이나 사는지 몰라요 이번에는 제발 팬싸인회 당첨 좀ㅠㅠㅠㅠ 이렇게나 원하는데</p>
                            </div>
                        </div> -->
                    </div>
                </article>
                <article class="product">
                    <div class="product-background">
                        <img src="${ contextPath }/resources/images/store/1stAlbumBts.png" alt="">
                    </div>
                    <div class="product-info">
                        <p>BTS</p>
                        <b>The 1st Album - Dark & Wild</b>
                    </div>
                    <div class="product-operation">
                        <!-- <button class="write-photo">포토리뷰 등록하기</button>
                        <p class="not-confirmed-product">구매 미확정 상품</p> -->
                        <div class="completed-review">
                            <div class="date-created">
                                <div class="product-score">
                                    <img src="${ contextPath }/resources/images/store/star-pink.png" alt="">
                                    <img src="${ contextPath }/resources/images/store/star-pink.png" alt="">
                                    <img src="${ contextPath }/resources/images/store/star-pink.png" alt="">
                                    <img src="${ contextPath }/resources/images/store/star-pink.png" alt="">
                                    <img src="${ contextPath }/resources/images/store/star-gray.png" alt="">
                                </div>
                                <p>등록일 : 2021. 03. 07</p>
                            </div>
                            <div class="review-contents">
                                <b>울 옵빠 만나고 싶어효!</b>
                                <p>몇 번이나 사는지 몰라요 이번에는 제발 팬싸인회 당첨 좀ㅠㅠㅠㅠ 이렇게나 원하는데</p>
                            </div>
                        </div>
                    </div>
                </article>
                <article class="product">
                    <div class="product-background">
                        <img src="${ contextPath }/resources/images/store/1stAlbumBts.png" alt="">
                    </div>
                    <div class="product-info">
                        <p>BTS</p>
                        <b>The 1st Album - Dark & Wild</b>
                    </div>
                    <div class="product-operation">
                        <!-- <button class="write-photo">포토리뷰 등록하기</button> -->
                        <p class="not-confirmed-product">구매 미확정 상품</p>
                        <!-- <div class="completed-review">
                            <div class="date-created">
                                <div class="product-score">
                                    <img src="../resource/images/store/star-pink.png" alt="">
                                    <img src="../resource/images/store/star-pink.png" alt="">
                                    <img src="../resource/images/store/star-pink.png" alt="">
                                    <img src="../resource/images/store/star-pink.png" alt="">
                                    <img src="../resource/images/store/star-gray.png" alt="">
                                </div>
                                <p>등록일 : 2021. 03. 07</p>
                            </div>
                            <div class="review-contents">
                                <b>울 옵빠 만나고 싶어효!</b>
                                <p>몇 번이나 사는지 몰라요 이번에는 제발 팬싸인회 당첨 좀ㅠㅠㅠㅠ 이렇게나 원하는데</p>
                            </div>
                        </div> -->
                    </div>
                </article>
                <article class="product">
                    <div class="product-background">
                        <img src="${ contextPath }/resources/images/store/1stAlbumBts.png" alt="">
                    </div>
                    <div class="product-info">
                        <p>BTS</p>
                        <b>The 1st Album - Dark & Wild</b>
                    </div>
                    <div class="product-operation">
                        <!-- <button class="write-photo">포토리뷰 등록하기</button> -->
                        <p class="not-confirmed-product">구매 미확정 상품</p>
                        <!-- <div class="completed-review">
                            <div class="date-created">
                                <div class="product-score">
                                    <img src="../resource/images/store/star-pink.png" alt="">
                                    <img src="../resource/images/store/star-pink.png" alt="">
                                    <img src="../resource/images/store/star-pink.png" alt="">
                                    <img src="../resource/images/store/star-pink.png" alt="">
                                    <img src="../resource/images/store/star-gray.png" alt="">
                                </div>
                                <p>등록일 : 2021. 03. 07</p>
                            </div>
                            <div class="review-contents">
                                <b>울 옵빠 만나고 싶어효!</b>
                                <p>몇 번이나 사는지 몰라요 이번에는 제발 팬싸인회 당첨 좀ㅠㅠㅠㅠ 이렇게나 원하는데</p>
                            </div>
                        </div> -->
                    </div>
                </article>
            </div>
        </section>
    </section>
    <script>
	 	// 토클 클릭시 
		let flag = true;
		$(".toggle-switch input").on('click', function(e) {
		    if(flag == true) {
		        // 토글이 true일 경우(기본키 일 경우)
		        $(".area p").text("과거순");
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
		        $(".area p").text("최신순");
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
	 	// 포토리뷰 등록
	    $('.write-photo').click(function() {
	        location.href="review_write.html"
	    })
	
	    // 포토리뷰 보기
	    $('.completed-review').click(function() {
	        location.href="review_read.html"
	    })
    </script>
</body>
</html>
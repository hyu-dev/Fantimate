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
    <link rel="stylesheet" href="${ contextPath }/resources/css/pay/reviewDetail.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Fantimate</title>
</head>
<body>
	<section class="read-section">
        <form class="main-template" action="" method="POST">
            <div class="my-score">
                <article>
                    <div class="product-background">
                        <img src="${ contextPath }/resources/images/store/1stAlbumBts.png" alt="">
                    </div>
                    <div class="product-info">
                        <p>BTS</p>
                        <b>The 1st Album - Dark & Wild</b>
                    </div>
                </article>
                <article>
                    <p>내 평점</p>
                    <div class="my-score-star">
                        <img src="${ contextPath }/resources/images/store/star-pink.png" alt="">
                        <img src="${ contextPath }/resources/images/store/star-pink.png" alt="">
                        <img src="${ contextPath }/resources/images/store/star-pink.png" alt="">
                        <img src="${ contextPath }/resources/images/store/star-pink.png" alt="">
                        <img src="${ contextPath }/resources/images/store/star-gray.png" alt="">
                    </div>
                    <p class="score-number">4.0</p>
                </article>
            </div>
            <div class="read-review">
                <input type="text" name="" readonly value="울 옵빠 넘흐 멋져효~">
                <div>
                    <textarea name="" readonly>ㅠㅠㅠ 초기때부터 넘 좋아했는데 이렇게 갑자기 빵뜰 줄 누가 알았나요? 아셨어요? 저는 알았습니닿ㅎ 1집때부터 좋아했는데 잘생긴 우리 뷔님을 보면서 나는 알았지효.. 우리 방탄</textarea>
                </div>
            </div>
            <div class="read-photo">
                <img class="main-photo" src="${ contextPath }/resources/images/store/1stAlbumBts.png" alt=""></img>
                <img class="main-photo" src="${ contextPath }/resources/images/store/1stAlbumBts.png" alt=""></img>
                <img class="main-photo" src="${ contextPath }/resources/images/store/1stAlbumBts.png" alt=""></img>
                <img class="main-photo" src="${ contextPath }/resources/images/store/1stAlbumBts.png" alt=""></img>
                <img class="main-photo" src="${ contextPath }/resources/images/store/1stAlbumBts.png" alt=""></img>
            </div>
            <div class="btn-area">
                <button type="button" class="alright">확인</button>
            </div>
        </form>
    </section>
    <script>
	    // 리뷰 읽기
	    // 확인버튼 클릭했을 때
	    $('.alright').click(function() {
	       $('.read-section').fadeOut();
	    })
    </script>
</body>
</html>
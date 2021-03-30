<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/category.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Fantimate</title>
</head>
<body>
	<aside class="main-contents-left">
        <div class="artist-follower">
            <p class="artist-name">BTS</p>
            <p class="artist-follower-count">5,555,555 FAN</p>
        </div>
        <div class="category">
            <a href="#">FAN</a>
            <a href="#">ARTIST</a>
            <a href="#">OFFICIAL</a>
            <a href="#">STORE</a>
        </div>
        <form class="contents-search" action="" method="get">
            <div class="search-area">
                <input type="search" class="contents-search-input">
                <img src="${ contextPath }/resources/icon/search-icon.svg" class="search-icon" alt="">
            </div>
            <div class="search-result">
                <p>1집 앨범</p>
                <p>2집 앨범</p>
                <p>3집 앨범</p>
                <p>4집 앨범</p>
                <p>4집 앨범</p>
                <p>4집 앨범</p>
            </div>
        </form>
     </aside>
     <script type="text/javascript">
		// 카테고리를 클릭한 경우
		$('.category a').click(function() {
			if($(this).text() == 'STORE' || $(this).text() == 'OFFICIAL') {
				$(".contents-search").css("display", "flex")
			} else {
				$(".contents-search").css("display", "none")
			}
			// 전체 카테고리 색상 변경
		    $('.category a').css('color', '#E5D2D2');
			// 클릭한 카테고리 색상 변경
		    $(this).css('color', '#5C5F78');
		})
	     
	    // 카테고리 검색창에 데이터 클릭시
		$(".contents-search-input").on('keyup', function() {
		    if($(this).val() == '') {
		        // 검색input에 글자가 없다면
		        $('.search-result').css('display', 'none');
		    } else {
		        // 검색input에 글자가 있다면
		        $('.search-result').css('display', 'block');
		    }
		})
		
		// 카테고리 검색창 결과 데이터 클릭시
		$(".search-result p").on('click', function() {
		    $(".contents-search-input").val($(this).text());
		})
		
		// 카테고리 검색창에 글씨 입력 후 엔터를 클릭했을 때
		$(".contents-search-input").keyup(function(e) {
			console.log(e.keyCode)
			if(e.keyCode == 13) {
				$(".contents-search").attr("action", "주소 값을 넣으시오");
			    $(".contents-search").submit();
			}
		})
		
		// 카테고리 검색창에 돋보기 아이콘 클릭시
		$(".search-area img").click(function() {
		    // 상품 검색 시작
		    $(".contents-search").attr("action", "주소 값을 넣으시오");
		    $(".contents-search").submit();
		})
     </script>
</body>
</html>
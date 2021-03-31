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
    <link rel="stylesheet" href="${ contextPath }/resources/css/store/fanStoreList.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Fantimate</title>
</head>
<body>
	<!-- 네비바 인클루드 -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	<section class="main-section">
         <section class="main-contents">
             <div class="fanstore-search-area">
                 <div class="settings">
                    <div>
                        <button class="setting-btn my-area">내 지역</button>
                        <p class="my-zone">경기도 성남시 중원구</p>
                    </div>
                    <div>
                        <button class="setting-btn enroll-btn">상품등록</button>
                        <p>등록가능</p>
                    </div>
                 </div>
                 <div class="search-area">
                    <div class="search-content">
                        <img src="${ contextPath }/resources/icon/hash-gray.png" alt="">
                        <input type="text" placeholder="해시태그 검색은 해시태그 클릭!">
                        <img src="${ contextPath }/resources/icon/search-icon.svg" alt="">
                        <div class="search-result">
                            <p>테스트</p>
                            <p>테스트</p>
                            <p>테스트</p>
                            <p>테스트</p>
                            <p>테스트</p>
                        </div>
                    </div>
                    <div class="top-hashtag">
                        <ul>
                            <li>명찰</li>
                            <li>팬라이트eeee</li>
                            <li>BTS</li>
                            <li>키링</li>
                            <li>앨범</li>
                        </ul>
                    </div>
                 </div>
                <div class="toggle-area">
                    <div class="toggle-switch" tabindex="0">
                        <input type="checkbox" name="my_checkbox" value="yes" id="checkbox-id" />
                        <label for="checkbox-id">
                          <div class="area" aria-hidden="true">
                            <div class="background">
                                <div class="handle"></div>
                            </div>
                            <p>전체</p>
                          </div>
                        </label>
                      </div>
                </div>
             </div>
             <div class="store-product">
                <article class="product-background">
                    <div class="product-info">
                        <div class="enroll-hash">
                            <ul>
                                <li>앨범wefwefwe</li>
                                <li>BTSwe</li>
                                <li>정규</li>
                                <li>유물we</li>
                                <li>검정wefw</li>
                            </ul>
                        </div>
                        <p>BTS</p>
                        <b>The 1st Album - Dark & Wild</b>
                        <p>\14,900 <sub><s>\16,500</s> 10%</sub></p>
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
	 	// 더보기 버튼 클릭시
	    let height = parseInt(($(".store-product").css("height")).replace(/[a-z]/gi,""));
	    let length = $(".product-background").length;
	    $(".more-btn").on('click', function() {
	        if(length - 15 > 0) {
	            length -= 15;
	            length > 10 
	            ? height+=1170
	            : length > 5
	            ? height+=780
	            : height+=390
	            $(".store-product").css("height", height)
	        } else {
	            alert("더 이상 목록이 없습니다.")
	        }
	    })
	
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
	
	    // 상품 상세정보로 이동
	    $('.product-background').click(function(e) {
	        if(!$(e.target).hasClass('store-icon')) {
	            location.href='detail.html';
	        }
	    })
	
	    // 검색영역 해시태그 클릭시
	    $(".top-hashtag li").click(function() {
	        // 해당 해시태그의 데이터를 검색영역에 삽입
	        $(".search-content input").val($(this).text());
	        console.log($(this).text())
	    })
	
	    // 검색 아이콘 클릭시
	    $(".search-content img:last-of-type").click(function() {
	        // 검색 컨트롤러 실행
	        console.log('검색 컨트롤러 실행')
	        // 해시태그 활성화여부에 따라 각 컨트롤러 실행 내용 달리 적용
	        $('.search-content img:first-of-type').attr('src') == "${ contextPath }/resources/icon/hash-gray.png"
	        ? console.log("상품명 검색")
	        : console.log("해시태그명 검색")
	    })
	
	    // 해시태그 아이콘 클릭시
	    $(".search-content img:first-of-type").click(function() {
	        $(this).attr('src') == "${ contextPath }/resources/icon/hash-gray.png"
	        ? $(this).attr('src', "${ contextPath }/resources/icon/hash-pink.png")
	        : $(this).attr('src', "${ contextPath }/resources/icon/hash-gray.png")
	    })
	
	    // 검색창에 텍스트 입력시
	    $(".search-content input").on('keyup', function() {
	        if($(this).val() == '') {
	            $(this).siblings('.search-result').css('display', 'none');
	        } else {
	            $(this).siblings('.search-result').css('display', 'block');
	        }
	    })
	
	    // 내지역 버튼을 클릭했을 때
	    $(".my-area").click(function() {
	        location.href="area_enroll.html";
	    })
	
	    // 상품등록 버튼을 클릭했을 때
	    $(".enroll-btn").click(function() {
	        location.href="fanwrite.html";
	    })
	    
	    // 토클 클릭시 
		let flag = true;
		$(".toggle-switch input").on('click', function(e) {
		    if(flag == true) {
		        // 토글이 true일 경우(기본키 일 경우)
		        $(".area p").text("내상품");
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
		        $(".area p").text("전체");
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
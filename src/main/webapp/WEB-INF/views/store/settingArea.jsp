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
    <link rel="stylesheet" href="${ contextPath }/resources/css/store/settingArea.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Fantimate</title>
</head>
<body>
	<div class="confirm-background">
        <div class="confirm-area" id="confirm">
            <div class="confirm-title">
                <b>지역설정</b>
                <div class="toggle-area-alert">
                    <div class="toggle-switch-alert" tabindex="0">
                        <input type="checkbox" name="my_checkbox" value="yes" id="checkbox-id-alert" />
                        <label for="checkbox-id-alert">
                          <div class="area-alert" aria-hidden="true">
                            <div class="background-alert">
                                <div class="handle-alert"></div>
                            </div>
                            <p>설정</p>
                          </div>
                        </label>
                      </div>
                </div>
            </div>
            <div class="confirm-content">
                <p class="call-my-area">현재 위치 정보를 불러옵니다</p>
                <div class="setting-area">
                    <div class="search">
                        <input type="text" class="contents-search">
                        <img src="${ contextPath }/resources/icon/search-icon.svg" class="search-icon" alt="">
                    </div>
                    <div class="result">
                        <p>1집 앨범</p>
                        <p>2집 앨범</p>
                        <p>3집 앨범</p>
                        <p>4집 앨범</p>
                        <p>4집 앨범</p>
                        <p>4집 앨범</p>
                    </div>
                    <p class="search-text"></p>
                </div>
            </div>
            <div class="btn-container">
                <button class="btn yes">설정하기</button>
                <button class="btn no">돌아가기</button>
                <button class="setting-area-btn">불러오기</button>
            </div>
        </div>
    </div>
    <script type="text/javascript">
	    // 카테고리 검색창에 데이터 입력시
	    $(".contents-search").on('keyup', function(e) {
	        if($(this).val() == '') {
	            // 검색input에 글자가 없다면
	            $('.result').css({'opacity':'0', 'height':'0px'});
	        } else {
	            // 검색input에 글자가 있다면
	            if(e.keyCode == 13) {
	                // 조회된 데이터가 있는지 확인 후에 결과텍스트로 입력
	                // 조회된 데이터가 여러개인 경우 첫번째 데이터를 결과텍스트로 입력
	                $(".result p").length > 0
	                ? $('.contents-search').val($(".result p:nth-of-type(1)").text())
	                : alert('조회된 데이터가 없습니다')
	                $('.search-text').text($(".contents-search").val())
	            } else {
	                $('.result').css({'opacity':'1', 'height':'150px'});
	            }
	        }
	    })
	
	    $(".result p").hover(function(){
	        $(this).css('color', 'red');
	    }, function(){
	        $(this).css('color', 'black');
	    })
	
	    // 카테고리 검색창 결과 데이터 클릭시
	    $(".result p").on('click', function() {
	        $(".contents-search").val($(this).text());
	    })
	
	    // 카테고리 검색창에 돋보기 아이콘 클릭시
	    $(".search img").click(function() {
	        // 지역값 서치
	
	    })
	
	    // 토클 클릭시 
	    let flag = true;
	    $(".toggle-switch-alert input").on('click', function(e) {
	        if(flag == true) {
	            // 토글이 true일 경우(기본키 일 경우)
	            $(".area-alert p").text("인증");
	            $(".confirm-title b").text("지역인증");
	            $(".call-my-area").css("display", "block");
	            $(".setting-area").css("display", "none");
	            $(".btn").css("display", "none");
	            $(".setting-area-btn").css("display", "block");
	            flag = false;
	        } else {
	            // 토글이 false일 경우(체크된 경우)
	            $(".area-alert p").text("설정");
	            $(".confirm-title b").text("지역설정");
	            $(".call-my-area").css("display", "none");
	            $(".setting-area").css("display", "flex");
	            $(".btn").css("display", "block");
	            $(".setting-area-btn").css("display", "none");
	            flag = true;
	        }
	    });
    </script>
</body>
</html>
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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=160e31e7c671f4f6dce038e8e409529e&libraries=services"></script>
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
                <div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				</div>
                <div class="setting-area">
                    <div class="search">
                        <input type="text" class="contents-search" value="">
                        <img src="${ contextPath }/resources/icon/search-icon.svg" class="search-icon" alt="">
                    </div>
                    <div class="result"></div>
                    <p class="search-text"><c:if test="${ !empty user }">${ user.get(0).area.areaName }</c:if></p>
                </div>
            </div>
            <div class="btn-container">
                <button class="btn yes">설정하기</button>
                <button class="location-loading">불러오기</button>
                <button class="enroll-area">등록하기</button>
                <button class="btn no">취소하기</button>
            </div>
        </div>
    </div>
    <script type="text/javascript">
	    // 카테고리 검색창에 데이터 입력시
	    $(".contents-search").on('keyup', function(e) {
	    	var search = $(this).val();
	        if(search == '') {
	            // 검색input에 글자가 없다면
	            $('.result').css({'opacity':'0', 'height':'0px'});
	        } else {
	            // 검색input에 글자가 있다면
	            $('.result').css({'opacity':'1', 'height':'150px'});
	            $.ajax({
                	url : "${ pageContext.request.contextPath }/fanStore/area",
                	data : {search : search},
                	method : "post",
                	dataType: "json",
                	success : function(data) {
                		var div = $(".result");
            	    	div.html("");
                		for(var i in data) {
                			var p = $("<p>").text(data[i].areaName);
                			div.append(p);
                		}
                	},
                	error : function(e) {
                		console.log(e)
                	}
                });
	        }
	    })
		// 검색한 데이터 hover
		$(document).on("mouseenter", ".result p", function() {
			$(this).css('color', 'red');
		});
	    $(document).on("mouseleave", ".result p", function() {
	    	$(this).css('color', '#5C5F78');
		});
	    // 검색한 데이터 클릭
	    $(document).on("click", ".result p", function() {
	    	$(".search-text").text($(this).text());
	    	$('.result').css({'opacity':'0', 'height':'0px'});
	    	$(".contents-search").val("").focus();
	    });
	
	    // 카테고리 검색창에 돋보기 아이콘 클릭시
	    $(".search img").click(function() {
	    	var search = $(this).siblings("input").val()
            $.ajax({
            	url : "${ pageContext.request.contextPath }/fanStore/area",
            	data : {search : search},
            	method : "post",
            	dataType: "json",
            	success : function(data) {
            		var div = $(".result");
        	    	div.html("");
            		for(var i in data) {
            			var p = $("<p>").text(data[i].areaName);
            			div.append(p);
            		}
            		if(data.length < 1) {
            			alert("해당하는 지역이 없습니다");
            		} else {
            			for(var i = 0; i < data.length; i++) {
                			if(data[0].areaName == search) {
                				$(".search-text").text(search);
                    			$('.result').css({'opacity':'0', 'height':'0px'});
                    			$(".contents-search").val("").focus();
                    		} else {
                    			$(".search-text").text(data[i].areaName);
                    			$('.result').css({'opacity':'0', 'height':'0px'});
                    			$(".contents-search").val("").focus();
                    			break;
                    		}
                		}
            		}
            	},
            	error : function(e) {
            		console.log(e)
            	}
            });
	    })
	
	    // 토클 클릭시 
	    let area = true;
	    $(".toggle-switch-alert input").on('click', function(e) {
	        if(area == true) {
	            // 토글이 true일 경우(기본키 일 경우)
	            $(".area-alert p").text("인증");
	            $(".confirm-title b").text("지역인증");
	            $(".call-my-area").css("display", "block");
	            $(".setting-area").css("display", "none");
	            $(".yes").css("display", "none");
	            $(".location-loading").css("display", "block");
	            area = false;
	        } else {
	            // 토글이 false일 경우(체크된 경우)
	            $(".area-alert p").text("설정");
	            $(".confirm-title b").text("지역설정");
	            $(".call-my-area").css("display", "none");
	            $(".setting-area").css("display", "flex");
	            $(".map_wrap").css("display", "none");
	            $(".yes").css("display", "block");
	            $(".location-loading").css("display", "none");
	            $(".enroll-area").css("display", "none");
	            area = true;
	        }
	    });
	    
	 	// 불러오기 버튼 클릭시
	    $(".location-loading").click(function() {
	    	navigator.geolocation.getCurrentPosition(function(position) {
	    		var x = position.coords.latitude	// 위도
	    		var y = position.coords.longitude	// 경도
	    		var container = document.getElementById('map');	// 지도를 담을 영역의 DOM 래퍼런스
		    	var options = {	// 지도를 생성할 때 필요한 기본 옵션
		    			center: new kakao.maps.LatLng(x, y),	// 지도의 중심 좌표
		    			level: 6	// 지도의 레벨 (확대, 축소 정도)
		    	}
		    	
		    	var map = new kakao.maps.Map(container, options);	// 지도 생성 및 객체 리턴
	    		console.log(x, y)
	    		
	    		// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
	    		
	    		var marker = new kakao.maps.Marker()	// 클릭한 위치를 표시할 마커입니다
	    		var infowindow = new kakao.maps.InfoWindow({zindex:1});	// 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	    		
	    		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	    		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	    		
	    		function searchAddrFromCoords(coords, callback) {
	    		    // 좌표로 행정동 주소 정보를 요청합니다
	    		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	    		}

	    		function searchDetailAddrFromCoords(coords, callback) {
	    		    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	    		}

	    		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	    		function displayCenterInfo(result, status) {
	    		    if (status === kakao.maps.services.Status.OK) {
	    		        var infoDiv = document.getElementsByClassName('call-my-area')[0];

	    		        for(var i = 0; i < result.length; i++) {
	    		            // 행정동의 region_type 값은 'H' 이므로
	    		            if (result[i].region_type === 'H') {
	    		                infoDiv.innerHTML = result[i].region_1depth_name + " " + result[i].region_2depth_name;
	    		                break;
	    		            }
	    		        }
	    		    }    
	    		}
	    	});
	    	$(".map_wrap").css("display", "block");
	    	$(".location-loading").css("display", "none");
	    	$(".enroll-area").css("display", "block");
	    });
	 	
	 	// 등록하기 버튼 클릭시
	 	$(".enroll-area").click(function() {
	 		var area = $(".call-my-area").text();
	 		location.href="${ pageContext.request.contextPath }/fanStore/certifyArea?area=" + area;
	 	});
	    
	    // 돌아가기 버튼 클릭시
	    $(".btn.no").click(function() {
	    	location.href="${referer}";
	    })
	    // 설정하기 버튼 클릭시
	    $(".btn.yes").click(function() {
	    	var area = $(".search-text").text();
	    	if(area == '') {
	    		alert('지역을 선택하세요')
	    	} else {
		    	location.href="${ pageContext.request.contextPath }/fanStore/settingArea?area=" + area;
	    	}
	    });
    </script>
</body>
</html>
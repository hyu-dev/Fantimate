<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/main/chart.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Chart</title>
    <script>
    
    </script>
</head>
<body>
	<jsp:include page="../common/navbar.jsp"></jsp:include>
    <section class="chart-section">
        <!-- 토클 -->
        <div class="toggle-title-section">
            <p class="chart-title">MEDIA CHART</p>
            <div class="toggle-area">
                <div class="toggle-switch" tabindex="0">
                    <input type="checkbox" name="my_checkbox" value="yes" id="checkbox-id" onclick="chartToggleChange()" />
                    <label for="checkbox-id">
                        <div class="area" aria-hidden="true">
                            <div class="background">
                                <div class="handle"></div>
                            </div>
                            <p class="toggle-week">주간</p>
                            <p class="toggle-day">일간</p>
                        </div>
                    </label>
                </div>
            </div>
        </div>
        
        <script>
        $(function(){
	        	// onload 직후 호출
	        	callDayAjax(); 
	        	// 5초에 1번씩 topList function 호출
				//setInterval(topList, 5000);
	        })
        
        </script>
        
        
        <!-- 일간별 / 주간별 미디어 차트 순위 -->
        <script>
	 	   function chartToggleChange() {
	 	 
	 	   var checkBox = document.getElementById("checkbox-id");
	 	
	 	   if (checkBox.checked == true){
	 	       // 주간별 ajax
	 	       callWeekAjax();
	 	        
	 	    } else {
	 	    	
	 	    	$(function(){
	 	        	// onload 직후 호출
	 	        	callDayAjax(); 
	 	        	// 5초에 1번씩 topList function 호출
	 				//setInterval(topList, 5000);
	 	        })
	 	       
	 	    }
	 	}
	 	   
	 	// 일간 ajax
	 	function callDayAjax(){
	 		
	 		$.ajax({
				url: "${contextPath}/main/chartDay",
				dataType : "json",
				success : function(data){
					console.log(data);
					
					var top3Section = $(".top3-section");
					top3Section.html("");
					var ul = $("<ul class='top3-info-section'>");
					var j = 0;
					
					var topRestSec = $(".rest-section");
					topRestSec.html("");
					var ul1 = $("<ul class='rest-info-section'>");
					
					for(var i in data){
						
						j++;
						
						var length = 20; // 표시할 글자수 기준
             			if (data[i].of.mediaTtl.length > length) {
             				data[i].of.mediaTtl = data[i].of.mediaTtl.substr(0, length-2) + '...';
             			}
						
						
						if(i < 3){
							var li = $("<li class='top3-info'>");
	     					var video1 = $("<video src='${ contextPath }/resources/images/official/"+ data[i].mf.vidSvName+"' controls='controls' poster='${ contextPath }/resources/images/official/"+ data[i].mf.picSvName+"' class='artist-media'></video>");
							var divSec = $("<div class='media-info'>");
							var div1 = $("<div class='m-title'><p class='rank-num'>"+j+"</p><p class='rank-title'>"+ data[i].of.mediaTtl+"</p></div>");
							var div2 = $("<div class='m-time-area'><p class='m-times'></p>"+"&nbsp;"+"<p class='m-artistName'>"+ data[i].mc.artiNameEn +"</p></div>");
							var div3 = $("<div class='play-info'><img src='${ contextPath }/resources/images/main/play.svg' alt='' class='play-img'><p class='like-count'>"+ data[i].of.mediaCount +"</p></div>");
							
							divSec.append(div1,div2,div3);
							li.append(video1,divSec);
							ul.append(li);
							
						/* 	// 현재 시간 가져옴
							var now = new Date();
							// 알람 받은 시간
							var messageDay = new Date(data[i].of.mediaDate);
							// 오늘 받은 알람 (당일)
							if(now.getDate() == messageDay.getDate()){
								var nowTime = now.getTime();
								var messageTime = messageDay.getTime();
								if(nowTime > messageTime){
									// 시간을 비교
									sec = parseInt(nowTime - messageTime) / 1000;
									day = parseInt(sec/60/60/24);
									sec = (sec - (day * 60 * 60 *24));
									hour = parseInt(sec/60/60);
									sec = (sec - (hour*60*60));
									min = parseInt(sec/60);
									sec = parseInt(sec-(min*60));
									if(hour > 0){
										// 몇시간 전인지
										document.getElementsByClassName("m-times")[i].innerHTML = hour+"시간 전";
										console.log(hour + "시간 전");
									} else if(min > 0){
										// 몇분전인지
										document.getElementsByClassName("m-times")[i].innerHTML = min+"분 전";
										console.log(min + "분 전");
									} else if(sec > 0){
										// 몇 초 전인지
										document.getElementsByClassName("m-times")[i].innerHTML = sec+"분 전";
										console.log(sec + "초 전");
									}
									
								}
							} else if(now.getFullYear() > messageDay.getFullYear()){
								// 몇 년 전 
								minus= now.getFullYear()-messageDay.getFullYear();
					            //두개의 차이를 구해서 표시
					            document.getElementsByClassName("m-times")[i].innerHTML = minus+"년 전";
					            console.log(minus+"년 전");
							} else if(now.getMonth() > messageDay.getMonth()){
								// 몇달 전 
								minus= now.getMonth()-messageDay.getMonth();
					            document.getElementsByClassName("m-times")[i].innerHTML = minus+"달 전";
					            console.log(minus+"달 전");
							} else if(now.getDate() > messageDay.getDate()){
								// 몇일전 
								minus= now.getDate()-messageDay.getDate();
					            document.getElementsByClassName("m-times")[i].innerHTML = minus+"일 전";
					            console.log(minus+"일 전");
							} */
							
						} else {
							
							var li1 = $("<li class='rest-info'>");
	     					var video2 = $("<video src='${ contextPath }/resources/images/official/"+ data[i].mf.vidSvName+"' controls='controls' poster='${ contextPath }/resources/images/official/"+ data[i].mf.picSvName+"' class='rest-media'></video>");
	     					var divSec1 = $("<div class='rest-media-info'>");
							var div11 = $("<div class='m-title'><p class='rank-num'>"+j+"</p><p class='rank-title'>"+ data[i].of.mediaTtl+"</p></div>");
							var div22 = $("<div class='m-time-area'><p class='m-times'></p>"+"&nbsp;"+"<p class='m-artistName'>"+ data[i].mc.artiNameEn +"</p></div>");
							var div33 = $("<div class='play-info2'><img src='${ contextPath }/resources/images/main/play.svg' alt='' class='play-img'><p class='like-count'>"+ data[i].of.mediaCount +"</p></div>");
							
							divSec1.append(div11,div22,div33);
							li1.append(video2,divSec1);
							ul1.append(li1);
							
							/* // 현재 시간 가져옴
							var now = new Date();
							// 알람 받은 시간
							var messageDay = new Date(data[i].of.mediaDate);
							// 오늘 받은 알람 (당일)
							if(now.getDate() == messageDay.getDate()){
								var nowTime = now.getTime();
								var messageTime = messageDay.getTime();
								if(nowTime > messageTime){
									// 시간을 비교
									sec = parseInt(nowTime - messageTime) / 1000;
									day = parseInt(sec/60/60/24);
									sec = (sec - (day * 60 * 60 *24));
									hour = parseInt(sec/60/60);
									sec = (sec - (hour*60*60));
									min = parseInt(sec/60);
									sec = parseInt(sec-(min*60));
									if(hour > 0){
										// 몇시간 전인지
										document.getElementsByClassName("m-times")[i].innerHTML = hour+"시간 전";
										console.log(hour + "시간 전");
									} else if(min > 0){
										// 몇분전인지
										document.getElementsByClassName("m-times")[i].innerHTML = min+"분 전";
										console.log(min + "분 전");
									} else if(sec > 0){
										// 몇 초 전인지
										document.getElementsByClassName("m-times")[i].innerHTML = sec+"분 전";
										console.log(sec + "초 전");
									}
									
								}
							} else if(now.getFullYear() > messageDay.getFullYear()){
								// 몇 년 전 
								minus= now.getFullYear()-messageDay.getFullYear();
					            //두개의 차이를 구해서 표시
					            document.getElementsByClassName("m-times")[i].innerHTML = minus+"년 전";
					            console.log(minus+"년 전");
							} else if(now.getMonth() > messageDay.getMonth()){
								// 몇달 전 
								minus= now.getMonth()-messageDay.getMonth();
					            document.getElementsByClassName("m-times")[i].innerHTML = minus+"달 전";
					            console.log(minus+"달 전");
							} else if(now.getDate() > messageDay.getDate()){
								// 몇일전 
								minus= now.getDate()-messageDay.getDate();
					            document.getElementsByClassName("m-times")[i].innerHTML = minus+"일 전";
					            console.log(minus+"일 전");
							}
	                     */
							
						}
						
						
						
					}
					
					top3Section.append(ul);
					topRestSec.append(ul1);
					
				},
				error : function(e){
					alert("code : " + e.status + "\n"
							+ "message : " + e.responseText);
				}
				
			});
	 		
	 	}  
	 	   
	 	   
 		// 주간 ajax
	 	function callWeekAjax(){
	 		
	 		$.ajax({
				url: "${contextPath}/main/chartWeek",
				dataType : "json",
				success : function(data){
				console.log(data);
					
					var top3Section = $(".top3-section");
					top3Section.html("");
					var ul = $("<ul class='top3-info-section'>");
					var j = 0;
					
					var topRestSec = $(".rest-section");
					topRestSec.html("");
					var ul1 = $("<ul class='rest-info-section'>");
					
					for(var i in data){
						
						j++;
						
						var length = 20; // 표시할 글자수 기준
             			if (data[i].of.mediaTtl.length > length) {
             				data[i].of.mediaTtl = data[i].of.mediaTtl.substr(0, length-2) + '...';
             			}
						
						if(i < 3){
							
							var li = $("<li class='top3-info'>");
	     					var video1 = $("<video src='${ contextPath }/resources/images/official/"+ data[i].mf.vidSvName+"' controls='controls' poster='${ contextPath }/resources/images/official/"+ data[i].mf.picSvName+"' class='artist-media'></video>");
							var divSec = $("<div class='media-info'>");
							var div1 = $("<div class='m-title'><p class='rank-num'>"+j+"</p><p class='rank-title'>"+ data[i].of.mediaTtl+"</p></div>");
							var div2 = $("<div class='m-time-area'><p class='m-times'>"+"11시간 전 |"+"</p>"+"&nbsp;"+"<p class='m-artistName'>"+ data[i].mc.artiNameEn +"</p></div>");
							var div3 = $("<div class='play-info'><img src='${ contextPath }/resources/images/main/play.svg' alt='' class='play-img'><p class='like-count'>"+ data[i].of.mediaCount +"</p></div>");
							
							divSec.append(div1,div2,div3);
							li.append(video1,divSec);
							ul.append(li);
							
						} else {
							
							var li1 = $("<li class='rest-info'>");
	     					var video2 = $("<video src='${ contextPath }/resources/images/official/"+ data[i].mf.vidSvName+"' controls='controls' poster='${ contextPath }/resources/images/official/"+ data[i].mf.picSvName+"' class='rest-media'></video>");
	     					var divSec1 = $("<div class='rest-media-info'>");
							var div11 = $("<div class='m-title'><p class='rank-num'>"+j+"</p><p class='rank-title'>"+ data[i].of.mediaTtl+"</p></div>");
							var div22 = $("<div class='m-time-area'><p class='m-times'>"+"11시간 전 |"+"</p>"+"&nbsp;"+"<p class='m-artistName'>"+ data[i].mc.artiNameEn +"</p></div>");
							var div33 = $("<div class='play-info2'><img src='${ contextPath }/resources/images/main/play.svg' alt='' class='play-img'><p class='like-count'>"+ data[i].of.mediaCount +"</p></div>");
							
							divSec1.append(div11,div22,div33);
							li1.append(video2,divSec1);
							ul1.append(li1);
	                    
							
						}
						
					}
					
					top3Section.append(ul);
					topRestSec.append(ul1);
					
					
				},
				error : function(e){
					alert("code : " + e.status + "\n"
							+ "message : " + e.responseText);
				}
				
			});
	 		
	 	}  
	 	   
        
        </script>
        

        <!-- 1~3 순위 -->
        <div class="top3-section">
          <!-- ajax -->
        </div>
        
        <!-- 4~20 순위 -->
        <div class="rest-section">
           <!-- ajax -->
        </div>

    </section>

    <footer>
        <div id="footer-section">
            (주)Fantimate  |  KH정보교육원 사업자등록번호 : 851-87-00622  |  Fanther. 황유정, 고재우, 고성현, 이유리, 최승아<br><br>

            강남지원 1관 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F<br>
            강남지원 2관 : 서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩 4F, 5F, 7F<br>
            강남지원 3관 : 서울특별시 강남구 테헤란로 130 호산빌딩 5F, 6F<br><br>
        
            Copyright Fantimate <br>
        </div>   
    </footer>


</body>
</html>
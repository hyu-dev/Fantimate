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
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/main.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Fantimate</title>
    <script>
    
 /*    $(function(){
        $('.mainPage-artistFeed').mouseenter(function(){
            $('#right').show();
        });
        $('.mainPage-artistFeed').mouseleave(function(){
            $('#right').hide();
        });

        $('.mainPage-artistFeed').mouseenter(function(){
            $('#left').show();
        });
        $('.mainPage-artistFeed').mouseleave(function(){
            $('#left').hide();
        });

    }); */

    
    </script>
</head>
<body>
	<jsp:include page="navSearch.jsp"></jsp:include>
	
	<!-- 메시지 -->
	 <c:if test="${ !empty msg }">
		 <c:choose>
			 <c:when test="${ msg eq 'accept'}">
			 	<script>
				    alert("친구를 수락하셨습니다!");
				    //location.href="${ contextPath }";
			    </script>
			 </c:when>
			 <c:when test="${ msg eq 'decline'}">
			 	<script>
			 		alert("친구를 거절하셨습니다!");
			 		//location.href="${ contextPath }";
			 	</script>
			 </c:when>
			  <c:when test="${ msg eq 'fail'}">
			 	<script>
				    alert("친구 수락, 또는 거절 실패!");
			    </script>
			 </c:when>
		</c:choose>
	</c:if>
	
	
	 <!-- 메인 페이지 -->
    <section class="mainPage-section">
        <!-- 로그인 했을 경우에 관심아티스트 + 그외 아티스트 리스트 보이기 / 안 했을 경우 전체 리스트 / 로그인한 유저가 관리자, 소속사, 아티스트일때 전체 리스트 보이게-->
        <c:if test="${ empty sessionScope.loginUser}">
        <div id="mainPage-wholeList">
        <!-- ajax -->
        </div>
        <script>
        $(function(){
        	// onload 직후 호출
        	artistWholeList();
        	// 5초에 1번씩 topList function 호출
			//setInterval(topList, 5000);
        })
        
        function artistWholeList(){
        	$.ajax({
        		url: "${contextPath}/main/artistWholeList",
        		dataType : "json",
        		success : function(data){
        			console.log(data);
        			
        			artistList = $("#mainPage-wholeList");
        			artistList.html("");
        			
        			 for(var i in data){
        				 artistList.append("<div class='artistList-move' onclick='subscribePage()'><img src='${ contextPath }/resources/images/main/"+ data[i].att.attSvName +"' alt='' class='artist-pic'><span class='artist-name'>"+ data[i].artG.artNameEn +"</span></div>");
        				 //console.log(data[i].artNameEn);
        			 }
        			
        			
        		},
        		error : function(e){
					alert("code : " + e.status + "\n"
							+ "message : " + e.responseText);
				}
        		
        	});
        	
        }
        
        function subscribePage(){
        	alert("로그인을 해야 구독 가능합니다!")
        }
        </script>
        </c:if>
        
        <c:if test="${ !empty sessionScope.loginUser}">
        <!-- 전체 아티스트 리스트 (상단에는 loginUser 관심아티스트 3명 -->
    	<div id="mainPage-artistFavList">
    	</div>
        <div id="mainPage-artistList" class="artists-L">
           <!-- ajax로 전체 아티스트 리스트 뿌려주기 -->
           <%--  <div class="artistList-move" onclick="subscribePage()">            
                <img src="${ contextPath }/resources/images/main/artist1.svg" alt="" class="artist-pic">
                <span class="artist-name">Alexander 23</span>
            </div> --%>
        </div>
        
        <c:if test="${ loginUser.classifyMem eq 2}">
        <script>
        	$(".artists-L").css("height","1200px");
        </script>
        </c:if>
        
         <c:if test="${ loginUser.classifyMem eq 3}">
        <script>
        	$(".artists-L").css("height","1200px");
        </script>
        </c:if>
        
         <c:if test="${ loginUser.classifyMem eq 4}">
        <script>
        	$(".artists-L").css("height","1200px");
        </script>
        </c:if>
        
        <!-- 1. 관심아티스트 3개 상단에 -->
        <script>
        $(function(){
        	// onload 직후 호출
        	artistFavList();
        	// 5초에 1번씩 topList function 호출
			//setInterval(topList, 5000);
        })
        
        function artistFavList(){
        	$.ajax({
        		url: "${contextPath}/main/artistFavList",
        		dataType : "json",
        		success : function(data){
        			console.log(data);
        			
        			artistList = $("#mainPage-artistFavList");
        			artistList.html("");
        			
        			 for(var i in data){
        				 artistList.append("<div class='artistList-move2' onclick='subScribe(" + "\"" + data[i].artG.artNameEn + "\"" + ")'><img src='${ contextPath }/resources/images/main/"+ data[i].att.attSvName +"' alt='' class='artist-pic'><span class='artist-name'>"+ data[i].artG.artNameEn +"</span><img src='${ contextPath }/resources/icon/heart-pink.png' alt='' class='fav-img'></div>");
        				// <img src="${ contextPath }/resources/icon/heart-pink.png" alt="" class="like-img">

        			 }
        			
        			
        		},
        		error : function(e){
					alert("code : " + e.status + "\n"
							+ "message : " + e.responseText);
				}
        		
        	});
        	
        }
        // 구독 아티스트 창 열기
        function subScribe(artNameEn){
			location.href='${contextPath}/main/subscribe?artNameEn=' + artNameEn;
        }
        </script>
        
        <!-- 2. 관심 아티스트 제외한 전체 리스트 -->
        <script>
        $(function(){
        	// onload 직후 호출
        	artistAllList();
        	// 5초에 1번씩 topList function 호출
			//setInterval(topList, 5000);
        })
        
        // 전체 아티스트 조회해서 메인에 뿌려줌
        function artistAllList(){
        	$.ajax({
        		url: "${contextPath}/main/artistList",
        		dataType : "json",
        		success : function(data){
        			console.log(data);
        			
        			artistList = $("#mainPage-artistList");
        			artistList.html("");
        			
        			 for(var i in data){
        				 artistList.append("<div class='artistList-move' onclick='subScribe(" + "\"" + data[i].artG.artNameEn + "\"" + ")'><img src='${ contextPath }/resources/images/main/"+ data[i].att.attSvName +"' alt='' class='artist-pic'><span class='artist-name'>"+ data[i].artG.artNameEn +"</span></div>");
        			 }
        			
        			
        		},
        		error : function(e){
					alert("code : " + e.status + "\n"
							+ "message : " + e.responseText);
				}
        		
        	});
        	
        }
     	// 구독 아티스트 창 열기
        function subScribe(artNameEn){
			location.href='${contextPath}/main/subscribe?artNameEn=' + artNameEn;
        }
        </script>
        </c:if>
        
        
        <!-- 회원이 구독한 아티스트 인기 피드 탑 9 -->
        <c:if test="${ !empty sessionScope.loginUser}">
          <script>
        $(function(){
        	// onload 직후 호출
        	feedTopNine();
        })
        
        function feedTopNine(){
        	
        	
     	        $('.mainPage-artistFeed').mouseenter(function(){
     	            $('.mainPage-artistFeed .slide-list .right').show('nomal');
     	        });
     	        $('.mainPage-artistFeed').mouseleave(function(){
     	            $('.mainPage-artistFeed .slide-list .right').hide('slow');
     	        });

     	        $('.mainPage-artistFeed').mouseenter(function(){
     	            $('.mainPage-artistFeed .slide-list .left').show('nomal');
     	        });
     	        $('.mainPage-artistFeed').mouseleave(function(){
     	            $('.mainPage-artistFeed .slide-list .left').hide('slow');
     	        });

        	    
        	$.ajax({
        		url: "${contextPath}/main/feedTopNine",
        		dataType : "json",
        		success : function(data){
        			console.log(data);
        			
        			var bid = "";
        			var artistFeedContent = $(".mainPage-artistFeed");
        			artistFeedContent.html("");
        			var slide01 = $("<input type='radio' name='slide' id='slide01' checked>");
        			var slide02 = $("<input type='radio' name='slide' id='slide02'>");
        			var slide03 = $("<input type='radio' name='slide' id='slide03'>");
        			var feedTitle = $("<div class='feed-title'><p class='mainPage-artistFeed-title'>"+"Artist Popular Feed"+"</p>");
        			var slideWrap = $("<div class='slide-wrap'>");
        			var ul = $("<ul class='slide-list'>");
        			var liSlide1 = $("<li>");
        			var liSlide2 = $("<li>");
        			var liSlide3 = $("<li>");
        			var divSlide1 = $("<div class='feed-slide-section'>");
        			var divSlide2 = $("<div class='feed-slide-section'>");
        			var divSlide3 = $("<div class='feed-slide-section'>");
        			var btnlSlide1 = $("<label for='slide03' class='left'></label>");
        			var btnrSlide1 =  $("<label for='slide02' class='right'></label>");
        			var btnlSlide2 = $("<label for='slide01' class='left'></label>");
        			var btnrSlide2 = $("<label for='slide03' class='right'></label>");
        			var btnlSlide3 = $("<label for='slide02' class='left'></label>");
        			var btnrSlide3 = $("<label for='slide01' class='right'></label>");
        			divSlide1.append(btnlSlide1); // 슬라이드 1 왼쪽 버튼 
        			divSlide2.append(btnlSlide2); // 슬라이드 2 왼쪽 버튼
        			divSlide3.append(btnlSlide3); // 슬라이드 3 왼쪽 버튼
        			var j = 0;
        			
       				for(var i in data){
       					
       					if(bid != data[i].fd.fid){
       						bid = data[i].fd.fid;
       						
       					
       					if(j < 3){
       						
       						if(data[i].att2.attSvName != undefined){ // 사진이 있는 경우 
	       						// 슬라이드 1
	        					var feedInfoSlide1= $("<div class='artist-feed-info'>");
	        					var aSlide1=$("<a href='#' class='img-box'><img src='${ contextPath }/resources/images/main/"+ data[i].att2.attSvName+"' alt='' class='feed-pic'></a>")
	        					var feedSlide1= $("<div class='feed-info-section'>");
	        					var profileSlide1=$("<div class='profile-info'><div class='profile-circle'><img src='${ contextPath }/resources/images/main/"+ data[i].att.attSvName+"' alt='' class='feed-profile'></div><p class='profile-name'>"+ data[i].li.id+"</p></div>");
	        					var likeSlide1 =$("<div class='like-info'><img src='${ contextPath }/resources/icon/heart-pink.png' alt='' class='like-img'><p class='like-count'>"+ data[i].fd.flike +"</p></div>");
	        					
	        					feedSlide1.append(profileSlide1,likeSlide1);
	        					feedInfoSlide1.append(aSlide1,feedSlide1);
	        					
	        					//divSlide1.append(btnlSlide1, feedInfoSlide1, btnrSlide1);
	        					divSlide1.append(feedInfoSlide1);
	                			liSlide1.append(divSlide1);
	                			ul.append(liSlide1);
                			
       						} else { // 글만 있는 경우 
       							
	        					var feedInfoSlide1= $("<div class='artist-feed-info'>");
	        					var textSlide1=$("<div class='feed-text-section'><img src='${ contextPath }/resources/images/main/text2.svg' alt='' class='feed-pic'><span class='feed-text'>"+ data[i].fd.fcontent +"</span></div>");
	        					var feedSlide1= $("<div class='feed-info-section'>");
	        					var profileSlide1=$("<div class='profile-info'><div class='profile-circle'><img src='${ contextPath }/resources/images/main/"+ data[i].att.attSvName+"' alt='' class='feed-profile'></div><p class='profile-name'>"+ data[i].li.id+"</p></div>");
	        					var likeSlide1 =$("<div class='like-info'><img src='${ contextPath }/resources/icon/heart-pink.png' alt='' class='like-img'><p class='like-count'>"+ data[i].fd.flike +"</p></div>");
	        					
	        					feedSlide1.append(profileSlide1,likeSlide1);
	        					feedInfoSlide1.append(textSlide1,feedSlide1);
	        					
	        					//divSlide1.append(btnlSlide1, feedInfoSlide1, btnrSlide1);
	        					divSlide1.append(feedInfoSlide1);
	                			liSlide1.append(divSlide1);
	                			ul.append(liSlide1);
	                			
       							
       						}
        					
       					} else if (j >=3 && j < 6){
       						
       						if(data[i].att2.attSvName != undefined){
	       						// 슬라이드 2
	       						var feedInfoSlide2= $("<div class='artist-feed-info'>");
	        					var aSlide2=$("<a href='#' class='img-box'><img src='${ contextPath }/resources/images/main/"+ data[i].att2.attSvName+"' alt='' class='feed-pic'></a>")
	        					var feedSlide2= $("<div class='feed-info-section'>");
	        					var profileSlide2=$("<div class='profile-info'><div class='profile-circle'><img src='${ contextPath }/resources/images/main/"+ data[i].att.attSvName+"' alt='' class='feed-profile'></div><p class='profile-name'>"+ data[i].li.id+"</p></div>");
	        					var likeSlide2 =$("<div class='like-info'><img src='${ contextPath }/resources/icon/heart-pink.png' alt='' class='like-img'><p class='like-count'>"+ data[i].fd.flike +"</p></div>");
	        					
	        					feedSlide2.append(profileSlide2,likeSlide2);
	        					feedInfoSlide2.append(aSlide2,feedSlide2);
	        					
	        					divSlide2.append(feedInfoSlide2);
	                			liSlide2.append(divSlide2);
	                			ul.append(liSlide2);
       						} else {
       							
       							var feedInfoSlide2= $("<div class='artist-feed-info'>");
	        					var textSlide2=$("<div class='feed-text-section'><img src='${ contextPath }/resources/images/main/text2.svg' alt='' class='feed-pic'><span class='feed-text'>"+ data[i].fd.fcontent +"</span></div>");
	        					var feedSlide2= $("<div class='feed-info-section'>");
	        					var profileSlide2=$("<div class='profile-info'><div class='profile-circle'><img src='${ contextPath }/resources/images/main/"+ data[i].att.attSvName+"' alt='' class='feed-profile'></div><p class='profile-name'>"+ data[i].li.id+"</p></div>");
	        					var likeSlide2 =$("<div class='like-info'><img src='${ contextPath }/resources/icon/heart-pink.png' alt='' class='like-img'><p class='like-count'>"+ data[i].fd.flike +"</p></div>");
	        					
	        					feedSlide2.append(profileSlide2,likeSlide2);
	        					feedInfoSlide2.append(textSlide2,feedSlide2);
	        					
	        					divSlide2.append(feedInfoSlide2);
	                			liSlide2.append(divSlide2);
	                			ul.append(liSlide2);
       							
       						}
       						
       						
       					} else if(j >=6 && j < 9){
       						
       						if(data[i].att2.attSvName != undefined){
	       						// 슬라이드 3
	       						var feedInfoSlide3= $("<div class='artist-feed-info'>");
	        					var aSlide3=$("<a href='#' class='img-box'><img src='${ contextPath }/resources/images/main/"+ data[i].att2.attSvName+"' alt='' class='feed-pic'></a>")
	        					var feedSlide3= $("<div class='feed-info-section'>");
	        					var profileSlide3=$("<div class='profile-info'><div class='profile-circle'><img src='${ contextPath }/resources/images/main/"+ data[i].att.attSvName+"' alt='' class='feed-profile'></div><p class='profile-name'>"+ data[i].li.id+"</p></div>");
	        					var likeSlide3 =$("<div class='like-info'><img src='${ contextPath }/resources/icon/heart-pink.png' alt='' class='like-img'><p class='like-count'>"+ data[i].fd.flike +"</p></div>");
	        					
	        					feedSlide3.append(profileSlide3,likeSlide3);
	        					feedInfoSlide3.append(aSlide3,feedSlide3);
	        					
	        					divSlide3.append(feedInfoSlide3);
	                			liSlide3.append(divSlide3);
	                			ul.append(liSlide3);
       						} else {
       							
       							var feedInfoSlide3= $("<div class='artist-feed-info'>");
	        					var textSlide3=$("<div class='feed-text-section'><img src='${ contextPath }/resources/images/main/text2.svg' alt='' class='feed-pic'><span class='feed-text'>"+ data[i].fd.fcontent +"</span></div>");
	        					var feedSlide3= $("<div class='feed-info-section'>");
	        					var profileSlide3=$("<div class='profile-info'><div class='profile-circle'><img src='${ contextPath }/resources/images/main/"+ data[i].att.attSvName+"' alt='' class='feed-profile'></div><p class='profile-name'>"+ data[i].li.id+"</p></div>");
	        					var likeSlide3 =$("<div class='like-info'><img src='${ contextPath }/resources/icon/heart-pink.png' alt='' class='like-img'><p class='like-count'>"+ data[i].fd.flike +"</p></div>");
	        					
	        					feedSlide3.append(profileSlide3,likeSlide3);
	        					feedInfoSlide3.append(textSlide3,feedSlide3);
	        					
	        					divSlide3.append(feedInfoSlide3);
	                			liSlide3.append(divSlide3);
	                			ul.append(liSlide3);
       							
       						}
       					}
       					
       					j++; // 중복 없으면 j++ 해주기!! 
       			    }
       					
       				
       			}
        			
       				
       				divSlide1.append(btnrSlide1); // 슬라이드 1 오른쪽 버튼 
       				divSlide2.append(btnrSlide2); // 슬라이드 2 오른쪽 버튼 
       				divSlide3.append(btnrSlide3); // 슬라이드 3 오른쪽 버튼 
        			slideWrap.append(ul); // 전체 ul
        			artistFeedContent.append(slide01,slide02,slide03,feedTitle,slideWrap); 
        			
        		},
        		error : function(e){
					alert("code : " + e.status + "\n"
							+ "message : " + e.responseText);
				}
        		
        	});
        	
        }
     	// 해당 피드로 이동 
       /*  function subScribe(artNameEn){
			location.href='${contextPath}/main/subscribe?artNameEn=' + artNameEn;
        } */
        </script>
        </c:if>
        
        <!-- 회원이 구독한 인기 미디어 탑 9 -->
         <c:if test="${ !empty sessionScope.loginUser}">
         <script>
         $(function(){
         	// onload 직후 호출
         	mediaTopNine();
         })
         
         function mediaTopNine(){
        	 
        	 $('.mainPage-media').mouseenter(function(){
  	            $('.mainPage-media .slide-list .right').show('nomal');
  	        });
  	        $('.mainPage-media').mouseleave(function(){
  	            $('.mainPage-media .slide-list .right').hide('slow');
  	        });

  	        $('.mainPage-media').mouseenter(function(){
  	            $('.mainPage-media .slide-list .left').show('nomal');
  	        });
  	        $('.mainPage-media').mouseleave(function(){
  	            $('.mainPage-media .slide-list .left').hide('slow');
  	        });
        	 
        	 $.ajax({
         		url: "${contextPath}/main/mediaTopNine",
         		dataType : "json",
         		success : function(data){
         			console.log(data);
         			
        			var artistMediaContent = $(".mainPage-media");
        			artistMediaContent.html("");
        			var slide01 = $("<input type='radio' name='slide' id='slide04' checked>");
        			var slide02 = $("<input type='radio' name='slide' id='slide05'>");
        			var slide03 = $("<input type='radio' name='slide' id='slide06'>");
        			var mediaTitle = $("<div class='media-title'><p class='mainPage-artistMedia-title'>"+"Artist Popular Media"+"</p>");
        			var slideWrap = $("<div class='slide-wrap'>");
        			var ul = $("<ul class='slide-list'>");
        			var liSlide1 = $("<li>");
        			var liSlide2 = $("<li>");
        			var liSlide3 = $("<li>");
        			var divSlide1 = $("<div class='media-slide-section'>");
        			var divSlide2 = $("<div class='media-slide-section'>");
        			var divSlide3 = $("<div class='media-slide-section'>");
        			var btnlSlide1 = $("<label for='slide06' class='left'></label>");
        			var btnrSlide1 =  $("<label for='slide05' class='right'></label>");
        			var btnlSlide2 = $("<label for='slide04' class='left'></label>");
        			var btnrSlide2 = $("<label for='slide06' class='right'></label>");
        			var btnlSlide3 = $("<label for='slide05' class='left'></label>");
        			var btnrSlide3 = $("<label for='slide04' class='right'></label>");
        			divSlide1.append(btnlSlide1); // 슬라이드 1 왼쪽 버튼 
        			divSlide2.append(btnlSlide2); // 슬라이드 2 왼쪽 버튼
        			divSlide3.append(btnlSlide3); // 슬라이드 3 왼쪽 버튼
        			
       				for(var i in data){
       						
       					
       					if(i < 3){
       						
	       						// 슬라이드 1
	        					var feedInfoSlide1= $("<div class='media-feed-info'>");
	        					var aSlide1=$("<video src='${ contextPath }/resources/images/official/"+ data[i].mf.vidSvName+"' controls='controls' poster='${ contextPath }/resources/images/official/"+ data[i].mf.picSvName+"' class='media-pic'></video>")
	        					var feedSlide1= $("<div class='media-info-section'>");
	        					var profileSlide1=$("<div class='profile-info'><div class='profile-circle'><img src='${ contextPath }/resources/images/main/"+ data[i].att.attSvName+"' alt='' class='feed-profile'></div><p class='profile-name'>"+ data[i].sb.artNameEn+"</p></div>");
	        					var likeSlide1 =$("<div class='play-info'><img src='${ contextPath }/resources/images/main/play.svg' alt='' class='play-img'><p class='like-count'>"+ data[i].of.mediaCount +"</p></div>");
	        					
	        					feedSlide1.append(profileSlide1,likeSlide1);
	        					feedInfoSlide1.append(aSlide1,feedSlide1);
	        					
	        					//divSlide1.append(btnlSlide1, feedInfoSlide1, btnrSlide1);
	        					divSlide1.append(feedInfoSlide1);
	                			liSlide1.append(divSlide1);
	                			ul.append(liSlide1);
        					
       					} else if (i >=3 && i < 6){
       						
	       						// 슬라이드 2
	       						var feedInfoSlide2= $("<div class='media-feed-info'>");
	        					var aSlide2=$("<video src='${ contextPath }/resources/images/official/"+ data[i].mf.vidSvName+"' controls='controls' poster='${ contextPath }/resources/images/official/"+ data[i].mf.picSvName+"' class='media-pic'></video>")
	        					var feedSlide2= $("<div class='media-info-section'>");
	        					var profileSlide2=$("<div class='profile-info'><div class='profile-circle'><img src='${ contextPath }/resources/images/main/"+ data[i].att.attSvName+"' alt='' class='feed-profile'></div><p class='profile-name'>"+ data[i].sb.artNameEn+"</p></div>");
	        					var likeSlide2 =$("<div class='play-info'><img src='${ contextPath }/resources/images/main/play.svg' alt='' class='play-img'><p class='like-count'>"+ data[i].of.mediaCount +"</p></div>");
	        					
	        					feedSlide2.append(profileSlide2,likeSlide2);
	        					feedInfoSlide2.append(aSlide2,feedSlide2);
	        					
	        					divSlide2.append(feedInfoSlide2);
	                			liSlide2.append(divSlide2);
	                			ul.append(liSlide2);
       						
       						
       					} else if(i >=6 && i < 9){
       						
	       						// 슬라이드 3
	       						var feedInfoSlide3= $("<div class='media-feed-info'>");
	        					var aSlide3=$("<video src='${ contextPath }/resources/images/official/"+ data[i].mf.vidSvName+"' controls='controls' poster='${ contextPath }/resources/images/official/"+ data[i].mf.picSvName+"' class='media-pic'></video>")
	        					var feedSlide3= $("<div class='media-info-section'>");
	        					var profileSlide3=$("<div class='profile-info'><div class='profile-circle'><img src='${ contextPath }/resources/images/main/"+ data[i].att.attSvName+"' alt='' class='feed-profile'></div><p class='profile-name'>"+ data[i].sb.artNameEn+"</p></div>");
	        					var likeSlide3 =$("<div class='play-info'><img src='${ contextPath }/resources/images/main/play.svg' alt='' class='play-img'><p class='like-count'>"+ data[i].of.mediaCount +"</p></div>");
	        					
	        					feedSlide3.append(profileSlide3,likeSlide3);
	        					feedInfoSlide3.append(aSlide3,feedSlide3);
	        					
	        					divSlide3.append(feedInfoSlide3);
	                			liSlide3.append(divSlide3);
	                			ul.append(liSlide3);
       						}
       					
       			    }
       					
       				
       				divSlide1.append(btnrSlide1); // 슬라이드 1 오른쪽 버튼 
       				divSlide2.append(btnrSlide2); // 슬라이드 2 오른쪽 버튼 
       				divSlide3.append(btnrSlide3); // 슬라이드 3 오른쪽 버튼 
        			slideWrap.append(ul); // 전체 ul
        			artistMediaContent.append(slide01,slide02,slide03,mediaTitle,slideWrap);
         			
         		},
         		error : function(e){
 					alert("code : " + e.status + "\n"
 							+ "message : " + e.responseText);
 				}
         		
         	});
        	 
        	 
        	 
        	 
        	 
         }
         
         </script>
         </c:if>
         
         <!-- 회원이 구독한 조회수 스토어 탑 9 -->
         <c:if test="${ !empty sessionScope.loginUser}">
         <script>
         $(function(){
         	// onload 직후 호출
         	storeTopNine();
         })
         
         function storeTopNine(){
        	 
        	 $('.mainPage-store').mouseenter(function(){
   	            $('.mainPage-store .slide-list .right').show('nomal');
   	        });
   	        $('.mainPage-store').mouseleave(function(){
   	            $('.mainPage-store .slide-list .right').hide('slow');
   	        });

   	        $('.mainPage-store').mouseenter(function(){
   	            $('.mainPage-store .slide-list .left').show('nomal');
   	        });
   	        $('.mainPage-store').mouseleave(function(){
   	            $('.mainPage-store .slide-list .left').hide('slow');
   	        });
        	 
        	 $.ajax({
         		url: "${contextPath}/main/storeTopNine",
         		dataType : "json",
         		success : function(data){
         			console.log(data);
         			
        			var artistStoreContent = $(".mainPage-store");
        			artistStoreContent.html("");
        			var slide01 = $("<input type='radio' name='slide' id='slide07' checked>");
        			var slide02 = $("<input type='radio' name='slide' id='slide08'>");
        			var slide03 = $("<input type='radio' name='slide' id='slide09'>");
        			var mediaTitle = $("<div class='store-title'><p class='mainPage-artistStore-title'>"+"Artist Store"+"</p>");
        			var slideWrap = $("<div class='slide-wrap'>");
        			var ul = $("<ul class='slide-list'>");
        			var liSlide1 = $("<li>");
        			var liSlide2 = $("<li>");
        			var liSlide3 = $("<li>");
        			var divSlide1 = $("<div class='store-slide-section'>");
        			var divSlide2 = $("<div class='store-slide-section'>");
        			var divSlide3 = $("<div class='store-slide-section'>");
        			var btnlSlide1 = $("<label for='slide09' class='left'></label>");
        			var btnrSlide1 =  $("<label for='slide08' class='right'></label>");
        			var btnlSlide2 = $("<label for='slide07' class='left'></label>");
        			var btnrSlide2 = $("<label for='slide09' class='right'></label>");
        			var btnlSlide3 = $("<label for='slide08' class='left'></label>");
        			var btnrSlide3 = $("<label for='slide07' class='right'></label>");
        			divSlide1.append(btnlSlide1); // 슬라이드 1 왼쪽 버튼 
        			divSlide2.append(btnlSlide2); // 슬라이드 2 왼쪽 버튼
        			divSlide3.append(btnlSlide3); // 슬라이드 3 왼쪽 버튼
        			
       				for(var i in data){
       						
       					
       					if(i < 3){
       						
	       						// 슬라이드 1
	        					var feedInfoSlide1= $("<div class='store-feed-info'>");
	        					var aSlide1=$("<img src='${ contextPath }/resources/images/main/storeBackground.svg' alt='' class='store-background'>")
	        					var aSlide11=$("<img src='${ contextPath }/resources/images/store/"+ data[i].att.attSvName+"' alt='' class='store-pic'>")
	        					var profileSlide1=$("<div class='profile-info'><p class='profile-name'>"+ data[i].s.pname+"</p></div>");
	        					
	        					feedInfoSlide1.append(aSlide1,aSlide11,profileSlide1);
	        					
	        					divSlide1.append(feedInfoSlide1);
	                			liSlide1.append(divSlide1);
	                			ul.append(liSlide1);
        					
       					} else if (i >=3 && i < 6){
       						
	       						// 슬라이드 2
	        					var feedInfoSlide2= $("<div class='store-feed-info'>");
	        					var aSlide2=$("<img src='${ contextPath }/resources/images/main/storeBackground.svg' alt='' class='store-background'>")
	        					var aSlide22=$("<img src='${ contextPath }/resources/images/store/"+ data[i].att.attSvName+"' alt='' class='store-pic'>")
	        					var profileSlide2=$("<div class='profile-info'><p class='profile-name'>"+ data[i].s.pname+"</p></div>");
	        					
	        					feedInfoSlide2.append(aSlide2,aSlide22,profileSlide2);
	        					
	        					divSlide2.append(feedInfoSlide2);
	                			liSlide2.append(divSlide2);
	                			ul.append(liSlide2);
       						
       						
       					} else if(i >=6 && i < 9){
       						
	       						// 슬라이드 3
	        					var feedInfoSlide3= $("<div class='store-feed-info'>");
	        					var aSlide3=$("<img src='${ contextPath }/resources/images/main/storeBackground.svg' alt='' class='store-background'>")
	        					var aSlide33=$("<img src='${ contextPath }/resources/images/store/"+ data[i].att.attSvName+"' alt='' class='store-pic'>")
	        					var profileSlide3=$("<div class='profile-info'><p class='profile-name'>"+ data[i].s.pname+"</p></div>");
	        					
	        					feedInfoSlide3.append(aSlide3,aSlide33,profileSlide3);
	        					
	        					divSlide3.append(feedInfoSlide3);
	                			liSlide3.append(divSlide3);
	                			ul.append(liSlide3);
       						}
       					
       			    }
       					
       				
       				divSlide1.append(btnrSlide1); // 슬라이드 1 오른쪽 버튼 
       				divSlide2.append(btnrSlide2); // 슬라이드 2 오른쪽 버튼 
       				divSlide3.append(btnrSlide3); // 슬라이드 3 오른쪽 버튼 
        			slideWrap.append(ul); // 전체 ul
        			artistStoreContent.append(slide01,slide02,slide03,mediaTitle,slideWrap); 
         			
         		},
         		error : function(e){
 					alert("code : " + e.status + "\n"
 							+ "message : " + e.responseText);
 				}
         		
         	});
        	 
         }
         
         </script>
         </c:if>
         
         <!-- 전체 순위 차트 (메인에는 탑 3) -->
         <script>
         $(function(){
         	// onload 직후 호출
         	chartTopThree();
         })
         
         function chartTopThree(){
        	 
        	 
        	 $.ajax({
         		url: "${contextPath}/main/chartTopThree",
         		dataType : "json",
         		success : function(data){
         			console.log(data);
         			
         			var chartContent = $(".mainPage-chart");
         			chartContent.html("");
        			var mediaTitle = $("<div class='chart-title'><p class='mainPage-artistChart-title'>"+"Fantimate Chart"+"</p><a href='${contextPath}/main/chart' id='goTo-chart'>더보기</a></div>");
         			var chartSection = $("<div class='chart-slide-section'>");
         			

         			
         			for(var i in data){
         				
         				var length = 20; // 표시할 글자수 기준
             			if (data[i].of.mediaTtl.length > length) {
             				data[i].of.mediaTtl = data[i].of.mediaTtl.substr(0, length-2) + '...';
             			}
         				
         				if(i == 1){
         					
         					var mediaInfo1 = $("<div class='media-feed-info'>");
         					var video1 = $("<video src='${ contextPath }/resources/images/official/"+ data[i].mf.vidSvName+"' controls='controls' poster='${ contextPath }/resources/images/official/"+ data[i].mf.picSvName+"' class='chart-pic'></video>");
         					var div1 = $("<div class='chart-info-section'>");
         					var title1=$("<div class='profile-info'><p class='chart-rank'>"+"#2"+"</p><p class='profile-name'>"+data[i].of.mediaTtl+"</p></div>");
         					var hit1=$("<div class='play-info'><img src='${ contextPath }/resources/images/main/play.svg' alt='' class='play-img'><p class='like-count'>"+data[i].hc.count+"</p></div>");
         					
         					div1.append(title1,hit1);
         					mediaInfo1.append(video1,div1);
         					
         				}else if(i == 0){
         					
         					var mediaInfo2 = $("<div class='media-feed-info'>");
         					var video2 = $("<video src='${ contextPath }/resources/images/official/"+ data[i].mf.vidSvName+"' controls='controls' poster='${ contextPath }/resources/images/official/"+ data[i].mf.picSvName+"' id='numberOneChart'></video>");
         					var div2 = $("<div class='rank1-info-section'>");
         					var title2=$("<div class='profile-info'><p class='chart-rank'>"+"#1"+"</p><p class='profile-name'>"+data[i].of.mediaTtl+"</p></div>");
         					var hit2=$("<div class='play-info'><img src='${ contextPath }/resources/images/main/play.svg' alt='' class='play-img'><p class='like-count'>"+data[i].hc.count+"</p></div>");
         					
         					div2.append(title2,hit2);
         					mediaInfo2.append(video2,div2);
         					
         				}else if(i == 2){
         					
         					var mediaInfo3 = $("<div class='media-feed-info'>");
         					var video3 = $("<video src='${ contextPath }/resources/images/official/"+ data[i].mf.vidSvName+"' controls='controls' poster='${ contextPath }/resources/images/official/"+ data[i].mf.picSvName+"' class='chart-pic'></video>");
         					var div3 = $("<div class='chart-info-section'>");
         					var title3=$("<div class='profile-info'><p class='chart-rank'>"+"#3"+"</p><p class='profile-name'>"+data[i].of.mediaTtl+"</p></div>");
         					var hit3=$("<div class='play-info'><img src='${ contextPath }/resources/images/main/play.svg' alt='' class='play-img'><p class='like-count'>"+data[i].hc.count+"</p></div>");
         					
         					div3.append(title3,hit3);
         					mediaInfo3.append(video3,div3);
         					
         				}
         				
         			}
         			
        			
         			chartSection.append(mediaInfo1,mediaInfo2,mediaInfo3);
         			chartContent.append(mediaTitle,chartSection);
         			
         			
         		},
         		error : function(e){
 					alert("code : " + e.status + "\n"
 							+ "message : " + e.responseText);
 				}
         		
         	});
        	 
         }
         
         </script>


		<!-- 아티스트 인기 게시물 (좋아요 순)-->
		<c:choose>
			<c:when test="${ !empty sessionScope.loginUser}">
				<c:if test="${ loginUser.classifyMem eq 1}">
					<div class="mainPage-artistFeed">
						<!-- ajax 공간 -->
					</div>
				</c:if>
			</c:when>
			<c:otherwise>
				<script>
					$(".mainPage-artistFeed").removeAttr("height");
				</script>
			</c:otherwise>
		</c:choose>


		<!-- 아티스트 인기 미디어 -->
		<c:choose>
			<c:when test="${ !empty sessionScope.loginUser}">
				<c:if test="${ loginUser.classifyMem eq 1}">
					<div class="mainPage-media">
						<!-- ajax 공간 -->
					</div>
				</c:if>
			</c:when>
			<c:otherwise>
				<script>
					$(".mainPage-media").removeAttr("height");
				</script>
			</c:otherwise>
		</c:choose>

		<!-- 아티스트 스토어 -->
		<c:choose>
			<c:when test="${ !empty sessionScope.loginUser}">
				<c:if test="${ loginUser.classifyMem eq 1}">
					<div class="mainPage-store">
						<!-- ajax 공간 -->
					</div>
				</c:if>
			</c:when>
			<c:otherwise>
				<script>
					$(".mainPage-store").removeAttr("height");
				</script>
			</c:otherwise>
		</c:choose>

		<!-- 전체 순위 차트 -->

		<c:choose>
			<c:when test="${ empty sessionScope.loginUser}">
				<div class="mainPage-chart">
					<!-- ajax -->
				</div>
				<script>
					$(".mainPage-chart").removeAttr("height");
				</script>
			</c:when>
			<c:otherwise>
				<div class="mainPage-chart">
					<!-- ajax -->
				</div>
				<script>
					$(".mainPage-chart").css("height", "430px");
				</script>
			</c:otherwise>
		</c:choose>


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
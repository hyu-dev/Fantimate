<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<c:set var="page" value="<%= request.getRequestURL() %>" />
	<aside class="main-contents-left">
        <div class="artist-follower">
            <p class="artist-name">${artiName}</p>
            <p class="artist-follower-count">${ fn:length(subList) } FAN</p>
        </div>
        <div class="category">
        	
            <a href="${ contextPath }/fanfeed/fanFeedList?artNameEn=${artiName}">FAN</a>  
            <a class="membership" style="cursor:pointer;">ARTIST</a> 
             
             
              
            <a class="official-url" href="${ contextPath }/official/media/main">OFFICIAL</a>
            <a href="${ contextPath }/store/storeList">STORE</a>
        </div>
        <c:if test="${ page eq 'http://localhost:8800/fantimate/WEB-INF/views/store/storeList.jsp' }">
        <div class="store-search contents-search">
            <div class="search-area">
                <input type="text" name="search" class="contents-search-input">
                <img src="${ contextPath }/resources/icon/search-icon.svg" class="search-icon" alt="">
            </div>
            <div class="category-search-result store-result"></div>
        </div>
        </c:if>
        <c:if test="${ page eq 'http://localhost:8800/fantimate/WEB-INF/views/official/media/main.jsp' }">
        <div class="official-search contents-search" action="" method="get">
            <div class="search-area">
                <input type="text" class="contents-search-input">
                <img src="${ contextPath }/resources/icon/search-icon.svg" class="search-icon" alt="">
            </div>
            <div class="category-search-result official-result"></div>
        </div>
        </c:if>
     </aside>
     
     <script type="text/javascript">
     	// ?????????????????? ???????????? ????????????
     	$(function() {
     		var page = "<%= request.getRequestURL() %>";
     		console.log(page)
     		var find = page.split("/");
     		for(var i in find) {
     			if(find[i] == 'store') {
     				$(".official-search").css("display", "none")
    				$(".store-search").css("display", "flex")
    				$('.category a').eq(3).css('color', '#5C5F78')
     			} else if(find[i] == 'official') {
     				$(".store-search").css("display", "none")
    				$(".official-search").css("display", "flex")
    				$('.category a').eq(2).css('color', '#5C5F78')
     			} else if(find[i] == 'fanfeed') {
     				$(".store-search").css("display", "none")
    				$(".official-search").css("display", "none")
    				$('.category a').eq(0).css('color', '#5C5F78')
     			} else if(find[i] == 'artistfeed') {
     				$(".store-search").css("display", "none")
    				$(".official-search").css("display", "none")
    				$('.category a').eq(1).css('color', '#5C5F78')
     			}
     		}
     	});
	     
	    // ???????????? ???????????? ????????? ?????????
		$(".contents-search-input").on('keyup', function(e) {
			var search = $(this).val();
			var div = $(this).parent().next(".category-search-result");
			console.log(search)
	        // ??????????????? ????????? ????????????
	        if($('.category a').eq(3).css('color') == 'rgb(92, 95, 120)') {
		    	$.ajax({
		    		url : "${ pageContext.request.contextPath }/store/search/" + search,
		    		data : "get",
					dateType : "json",
					success : function(data) {
						div.html("");
						if(data.list.length > 0) {
							div.css('display', 'block');
							for(var i in data.list) {
								var p = $("<p>").text(data.list[i].store.pname);
								div.append(p);
							}
						} else {
							div.css('display', 'block');
							var p = $("<p>").text("????????? ???????????? ????????????");
							div.append(p);
						}
					},
					error : function(e) {
						console.log(e)
					}
		    	})
		    } else {
		    	// ??????????????? ????????? ?????? ???????????? (??????????????? ????????? ????????????)
		    	console.log("????????? ??????")
		    	$.ajax({
		    		// ??????????????? ????????? ??????????????? ?????????
		    		url : "${ pageContext.request.contextPath }/official/search?search=" + search,
		    		data : "get",
					dateType : "json",
					success : function(data) {
						console.log(data)
						div.html("");
						if(data.length > 0) {
							if(search == '') {
								div.css('display', 'none');
							} else {
								div.css('display', 'block');
								for(var i in data) {
									var p = $("<p>").text(data[i].official.mediaTtl);
									div.append(p);
								}
							}
						} else {
							div.css('display', 'block');
							var p = $("<p>").text("????????? ???????????? ????????????");
							div.append(p);
						}
					},
					error : function(e) {
						console.log(e)
					}
		    	})
		    }
	        // ???????????? ???????????????
	        if(search == '') {
	        	div.css('display', 'none');
	        }
		})
		
		// ???????????? ????????? ?????? ????????? ?????????
		$(document).on('click', '.category-search-result p', function() {
			if($(".category-search-result p").eq(1).text() != '????????? ???????????? ????????????') {
				$(".contents-search-input").val($(this).text());
			}
		})
		
		// ????????? ???????????? ?????? ???
	    $(".official-url").click(function() {
	    	// ????????? ???????????? ??????????????? ??????
	    	var artiNameEn = "${ artiName }";
	    	
	    	$.ajax({
	    		url : "${ contextPath }/official/countMedia",
	    		data : {},
	    		type : "post",
				dateType : "json",
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					if(data > 1) {
						console.log(data);
					} else {
						alert("???????????? ???????????? ????????????.");
						location.href = "${ contextPath }/fanfeed/fanFeedList?artNameEn=" + artiNameEn;
					}
				},
				error : function(e) {
					console.log(e)
				}
	    	})
		});
     </script>
     
     <script>
    $(".membership").click(function(){
    var check = "${loginUser.classifyMem}";
    var ms = "${Membership}";
    if( check == 1 && ms == 'N'  ) {
		if(confirm("????????? ????????? ?????? ????????? ??????????????????. ?????????????????????????")){
			location.href='${contextPath}/pay/plan';
		} 
			
		} if( check == 1 && ms == 'Y'){
			location.href="${ contextPath }/artistfeed/artistFeedList?artNameEn=${artiName}"
		} if( check == 2){
			location.href="${ contextPath }/artistfeed/artistFeedList?artNameEn=${artiName}"
		} 
    });
     </script>
     
     
     
   
     
</body>
</html>
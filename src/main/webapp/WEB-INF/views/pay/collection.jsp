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
	<c:if test="${ !empty msg }">
		<script>
			$(function() {
				alert('${msg}')
				location.href="${referer}"
			}) 
		</script>
		<c:remove var="msg"/>
	</c:if>
	<!-- 리뷰 등록 페이지 인클루드 -->
	<jsp:include page="reviewInsert.jsp"/>
	<!-- 리뷰 보기 페이지 인클루드 -->
	<jsp:include page="reviewDetail.jsp"/>
	<!-- 네비바 인클루드 -->
	<jsp:include page="../common/navbar.jsp"/>
	<c:if test="${ !empty loginUser }">
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
                            <p>상품</p>
                            </div>
                        </label>
                    </div>
                </div>
            </h1>
            <div class="display-stand">
            	<c:if test="${ !empty collection }">
            	<c:forEach var="coll" items="${ collection }">
                <article class="product">
                    <div class="product-background list-product">
                        <img src="${ contextPath }/resources/uploadFiles/${ coll.att.attSvName }" alt="">
                    </div>
                    <div class="product-info list-info">
                        <p>${ coll.storeCate.artiNameEn }</p>
                        <b>${ coll.store.pname }</b>
                    </div>
                    <div class="product-operation">
                    	<input type="hidden" class="pcode" value="${ coll.store.pcode }">
                    	<input type="hidden" class="cartCode" value="${ coll.cart.cartCode }">
                    	<c:choose>
                    		<c:when test="${ coll.review.rvCode eq '' && coll.payment.payStatus eq 2 }">
                    			<button class="write-photo">포토리뷰 등록하기</button>
                    		</c:when>
                    		<c:when test="${ coll.payment.payStatus ne 2 }">
                    			<p class="not-confirmed-product">구매 미확정 상품</p>
                    		</c:when>
                    		<c:otherwise>
	                    		<div class="completed-review">
		                            <div class="date-created">
		                                <div class="product-score">
		                                    <c:forEach var="i" begin="1" end="5" step="1">
		                                	<c:choose>
			                                	<c:when test="${ coll.review.rvScore >= i }">
			                                	<img src="${ contextPath }/resources/images/store/star-pink.png" alt="">
			                                	</c:when>
			                                	<c:otherwise>
			                                	<img src="${ contextPath }/resources/images/store/star-gray.png" alt="">
			                                	</c:otherwise>
		                                	</c:choose>
		                                    </c:forEach>
		                                </div>
		                                <p>등록일 : ${ coll.review.enrollDate }</p>
		                            </div>
		                            <div class="review-contents">
		                                <b>"${ coll.review.rvTitle }"</b>
		                                <p>"${ coll.review.rvContent }"</p>
		                            </div>
		                        </div>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                </article>
                </c:forEach>
                </c:if>
                <c:if test="${ empty collection }">
                	<h1>구입한 상품이 없습니다</h1>
                </c:if>
            </div>
            <div class="more-product">
           		<button type="button" class="more-btn">+MORE</button>
           	</div>
        </section>
    </section>
    <script>
	 	// 토클 클릭시 
		let flag = true;
		$(".toggle-switch input").on('click', function(e) {
		    if(flag == true) {
		        // 토글이 true일 경우(기본키 일 경우)
		        $(".area p").text("영상");
		        $.ajax({
		        	url : "${ pageContext.request.contextPath }/pay/collectionMedia",
		        	dataType : "json",
		        	success : function(data) {
		        		console.log(data);
		        		var stand = $(".display-stand");
		        		stand.html("");
		        		for(var i in data) {
		        			var product = $("<article class='product'>");
		        			var productBg = $("<div class='product-background'>");
		        			var url = "${ contextPath }/resources/uploadFiles/" + data[i].attMedia.picSvName
		        			var mediaImg = $("<img alt=''>").attr("src", url);
		        			var productInfo = $("<div class='product-info'>");
		        			var artiName = $("<p>").text(data[i].mcategory.artiNameEn);
		        			var mediaTtl = $("<p>").text(data[i].official.mediaTtl);
		        			var mediaCtt = $("<p class='mediaCtt'>").text(data[i].official.mediaCtt);
		        			var productOper = $("<div class='product-operation'>");
		        			var mediaNum = $("<input type='hidden' class='mediaNum'>").val(data[i].official.mediaNum)
		        			productBg.append(mediaImg)
		        			productInfo.append(artiName, mediaTtl)
		        			productOper.append(mediaCtt, mediaNum)
		        			product.append(productBg, productInfo, productOper)
		        			stand.append(product)
		        		}
		        		height = parseInt(($(".display-stand").css("height")).replace(/[a-z]/gi,""));
		        		length = $(".product").length;
		        		if(height > 1200) {
		        			$(".display-stand").css("height", "1200px");
		        		}
		        		
		        	},
		        	error : function(e) {
		        		console.log(e);
		        	}
		        });
		        flag = false;
		    } else {
		        // 토글이 false일 경우(체크된 경우)
		        $(".area p").text("상품");
		        location.href="${contextPath}/store/collectionStore";
		        flag = true;
		    }
		});
		
	 	// 포토리뷰 등록
	    $('.write-photo').click(function() {
	    	var pcode = $(this).siblings(".pcode").val();
	    	var cartCode = $(this).siblings(".cartCode").val();
	    	var insertProd = $(".insert-product").children("img");
	    	var artiName = $(".insert-info").children("p");
	    	var pName = $(".insert-info").children("b")
	    	var pCode = $(".insert-pcode");
	    	var cCode = $(".insert-cartCode");
	    	$.ajax({
	    		url : "${ pageContext.request.contextPath }/store/" + pcode + "/" + cartCode,
	    		data : "get",
	    		dataType : "json",
	    		success : function(data) {
	    			console.log(data)
	    			var src = "${contextPath}/resources/uploadFiles/" + data.att.attSvName;
	    			insertProd.attr("src", src)
	    			artiName.text(data.storeCate.artiNameEn)
	    			pName.text(data.store.pname)
	    			pCode.val(pcode)
	    			cCode.val(cartCode)
	    		},
	    		error : function(e) {
	    			console.log(e)
	    		}
	    	});
	    	$(".insert-section").fadeIn();
	    })
	
	    // 포토리뷰 보기
	    $('.completed-review').click(function() {
	    	var pcode = $(this).siblings(".pcode").val();
	    	var cartCode = $(this).siblings(".cartCode").val();
	    	$.ajax({
	    		url : "${ pageContext.request.contextPath }/store/review/" + pcode + "/" + cartCode,
	    		data : "get",
	    		dataType : "json",
	    		success : function(data) {
	    			console.log(data)
	    			var src = "${contextPath}/resources/uploadFiles/" + data[0].att.attSvName;
	    			$(".read-product img").attr("src", src);
	    			$(".read-info p").text(data[0].storeCate.artiNameEn);
	    			$(".read-info b").text(data[0].store.pname);
	    			$(".read-score").text(data[0].review.rvScore + ".0");
	    			$(".read-title").val(data[0].review.rvTitle);
	    			$(".read-content").text(data[0].review.rvContent);
	    			var star = $(".read-star").html("");
	    			for(var i = 1; i <= 5; i++) {
	    				var img = $("<img alt=''>");
	    				if(i <= data[0].review.rvScore) {
	    					img.attr("src", "${ contextPath }/resources/images/store/star-pink.png");
	    				} else {
	    					img.attr("src", "${ contextPath }/resources/images/store/star-gray.png");
	    				}
	    				star.append(img);
	    			}
	    			
	    			var photo = $(".read-photo").html("");
	    			for(var i in data) {
	    				var src = "${contextPath}/resources/uploadFiles/" + data[i].attReview.attSvName;
	    				var img = $("<img class='main-photo'>").attr("src", src);
	    				photo.append(img);
	    			}
	    			
	    		},
	    		error : function(e) {
	    			console.log(e)
	    		}
	    	});
	    	$(".read-section").fadeIn();
	    })
	    
	    // 더보기 버튼 클릭시
	    let height = parseInt(($(".display-stand").css("height")).replace(/[a-z]/gi,""));
		let length = $(".product").length;
		$(".more-btn").on('click', function() {
		    if(length - 6 > 0) {
		        length -= 6;
		        length > 6 
		        ? height+=1200
		        : height+=600
		        $(".display-stand").css("height", height)
		    } else {
		        alert("더 이상 목록이 없습니다.")
		    }
		})
    </script>
    </c:if>
    <c:if test="${ empty loginUser }">
	<script>
		$(function() {
			alert("로그인을 해주세요");
			location.href="${contextPath}/main"
		})
	</script>
	</c:if>
</body>
</html>
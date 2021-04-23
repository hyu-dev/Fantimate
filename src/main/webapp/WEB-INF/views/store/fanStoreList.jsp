<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<c:if test="${ !empty msg }">
		<script>
			$(function() {
				if(confirm('${msg}')) {
					$(".confirm-background").css("display", "block");				
				} else {
					location.href="${referer}"
				}
			}) 
		</script>
		<c:remove var="msg"/>
	</c:if>
	
	<c:if test="${ !empty error }">
		<script>
			$(function() {
				alert("지역설정에 실패하였습니다");
			}) 
		</script>
		<c:remove var="error"/>
	</c:if>
	
	<jsp:include page="settingArea.jsp"/>
	<c:if test="${ !empty loginUser }">
	<jsp:include page="fanStoreInsert.jsp"/>
	<!-- 네비바 인클루드 -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	<section class="main-section">
         <section class="main-contents">
             <div class="fanstore-operation">
                 <div class="set-area">
                    <div>
                        <button class="set-btn my-area">내 지역</button>
                        <p class="my-zone">${ userColl.area.areaName }</p>
                        <c:choose>
	                        <c:when test="${ userColl.user.areaCertify eq 'Y' }">
	                        <img class="certification" src="${ contextPath }/resources/icon/location.png">
	                        </c:when>
	                        <c:otherwise>
	                        <img class="question-mark" src="${ contextPath }/resources/icon/question.png">
	                        <span class="question-guide">지역인증시 팬스토어 등록 및 쪽지발송가능</span>
	                        </c:otherwise>
                        </c:choose>
                    </div>
                    <div>
                        <button class="set-btn enroll-fstore-btn">상품등록</button>
                        <c:choose>
	                        <c:when test="${ userColl.user.areaCertify eq 'Y' }">
	                        <p class="isEnrollfstore">등록가능</p>
	                        </c:when>
	                        <c:otherwise>
	                        <p class="isEnrollfstore">지역인증필요<p>
	                        </c:otherwise>
                        </c:choose>
                    </div>
                 </div>
                 <div class="fstore-search-area">
                    <div class="fstore-search-content">
                        <img src="${ contextPath }/resources/icon/hash-gray.png" alt="">
                        <input type="text" placeholder="해시태그 검색은 해시태그 클릭!">
                        <img src="${ contextPath }/resources/icon/search-icon.svg" alt="">
                        <div class="fstore-search-result"></div>
                    </div>
                    <div class="top-hashtag">
                        <ul>
                        	<c:forEach var="h" items="${ hash }" varStatus="status">
                        	<c:if test="${ status.index < 5 }">
                        	<li>${ h.tagName }</li>
                        	</c:if>
                        	</c:forEach>
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
             	<c:if test="${ !empty fanStoreList }">
             	<c:set var="code" value=""/>
             	<c:forEach var="fs" items="${ fanStoreList }">
             	<c:if test="${ code ne fs.fstore.fcode }">
                <article class="product-background">
                    <div class="product-info">
                        <div class="enroll-hash">
                            <ul>
                            	<c:forEach var="tag" items="${ fanStoreList }">
                            	<c:if test="${ fs.fstore.fcode eq tag.fstore.fcode }">
                                <li>${ tag.hash.tagName }</li>
                                </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                        <p>${ fs.fstore.artiNameEn }</p>
                        <b>${ fs.fstore.fname }</b>
                        <p>\ <fmt:formatNumber type="number" value="${ fs.fstore.offerPrice }"/></p>
                        <c:if test="${ fs.fstore.id ne loginUser.id }">
                        <c:choose>
	                        <c:when test="${ fs.wish.id eq loginUser.id && fs.wish.isWish eq 'Y' }">
	                        <img class="ddim-icon store-icon noddim" src="${ contextPath }/resources/icon/heart-pink.png" alt="">
	                        </c:when>
	                        <c:otherwise>
	                        <img class="ddim-icon store-icon ddim" src="${ contextPath }/resources/icon/heart.png" alt="">
	                        </c:otherwise>
                        </c:choose>
                        </c:if>
                    </div>
                    <img src="${ contextPath }/resources/uploadFiles/${ fs.att.attSvName }" alt="">
                    <input type="hidden" id="fcode" value="${ fs.fstore.fcode }">
                </article>
                <c:set var="code" value="${ fs.fstore.fcode }"/>
                </c:if>
                </c:forEach>
                </c:if>
                <c:if test="${ empty fanStoreList }">
                <h1 class="empty-fanStore">등록된 상품이 없습니다</h1>
                </c:if>
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
	        if(length - 12 > 0) {
	            length -= 12;
	            length > 8 
	            ? height+=1230
	            : length > 4
	            ? height+=810
	            : height+=410
	            $(".store-product").css("height", height)
	        } else {
	            alert("더 이상 목록이 없습니다.")
	        }
	    })
	    // 지역설정 대상자에 한해 퀘스천마크 호버시
	    $(".question-mark").hover(function() {
	    	$(".question-guide").css("display", "flex");
	    }, function() {
	    	$(".question-guide").css("display", "none");
	    })
	    // 로딩시
	    $(function() {
	    	// 상품등록 안내정보
    		if($(".isEnrollfstore").text() == '지역인증필요') {
    			$(".isEnrollfstore").css("color", '#ff6b6b');
    		}
	    	// 페이지 높이 설정
    		if(length <= 8) {
    			height = 810;
    			$(".store-product").css("height", height)
    		}
    	});
	
	    // 찜 아이콘 클릭시
	    $(document).on('click', '.ddim-icon', function() {
	    	var data;
	    	var fcode = $(this).parent().siblings("#fcode").val();
	    	var img = $(this)
	        if($(this).attr('src') == "${ contextPath }/resources/icon/heart.png") {
	            data = {
	        		code : fcode,
	        		id : "${loginUser.id}",
	        		type : '등록'
	        	}
	        } else if($(this).attr('src') == "${ contextPath }/resources/icon/heart-pink.png"){
	            data = {
	        		code : fcode,
	        		id : "${loginUser.id}",
	        		type : '취소'
	            }
	        }
	        var url = "${pageContext.request.contextPath}/fanStore/wish"
	        callAjaxWish(url, data, img);
	    })
	
	    // 상품 상세정보로 이동
	    $('.product-background').click(function(e) {
	    	var fcode = $(this).children("#fcode").val();
	        if(!$(e.target).hasClass('store-icon')) {
	            location.href='${ contextPath }/fanStore/detail?fcode=' + fcode;
	        }
	    })
	
	    // 검색영역 해시태그 클릭시
	    $(".top-hashtag li").click(function() {
	        // 해당 해시태그의 데이터를 검색영역에 삽입
	        $(".fstore-search-content input").val($(this).text());
	        // 해시태그 활성화
	        $('.fstore-search-content img:first-of-type').attr('src', "${ contextPath }/resources/icon/hash-pink.png")
	    })
	
	    // 검색 아이콘 클릭시
	    $(".fstore-search-content img:last-of-type").click(function() {
	    	// 검색 데이터 result에 담기
	        var result = $(this).siblings('input').val();
	        // 해시태그 활성화여부에 따라 각 컨트롤러 실행 내용 달리 적용
	        if($('.fstore-search-content img:first-of-type').attr('src') == "${ contextPath }/resources/icon/hash-gray.png") {
	        	// 상품명으로 상품 검색
	        	var url = "${pageContext.request.contextPath}/fanStore/search"
		        var data = {
		        		areaCode : "${userColl.area.areaCode}",
		        		search : result,
		        		type : '상품'
		        }
		        callAjaxFanStoreList(url, data);
	        } else {
	        	// 해시태그로 상품 검색
	        	var url = "${pageContext.request.contextPath}/fanStore/search"
		        var data = {
		        		areaCode : "${userColl.area.areaCode}",
		        		search : result,
		        		type : '태그'
		        }
		        callAjaxFanStoreList(url, data);
	        }
	        $(this).siblings('.fstore-search-result').css('display', 'none');
        	$(this).siblings("input").val("").focus();
	    })
	
	    // 해시태그 아이콘 클릭시
	    $(".fstore-search-content img:first-of-type").click(function() {
	        if($(this).attr('src') == "${ contextPath }/resources/icon/hash-gray.png") {
	        	// 해시태그가 비활성화 상태라면
	        	$(this).attr('src', "${ contextPath }/resources/icon/hash-pink.png")
	        	$(this).next().val("").focus();
	        	$(this).siblings('.fstore-search-result').css('display', 'none');
	        } else {
	        	// 해시태그가 활성화 상태라면
	        	$(this).attr('src', "${ contextPath }/resources/icon/hash-gray.png")
	        	$(this).next().val("").focus();
	        	$(this).siblings('.fstore-search-result').css('display', 'none');
	        }
	    })
	
	    // 검색창에 텍스트 입력시
	    $(".fstore-search-content input").on('keyup', function() {
	    	var search = $(this).val()
	        if(search == '') {
	            $(this).siblings('.fstore-search-result').css('display', 'none');
	        } else {
	        	$(this).siblings('.fstore-search-result').css('display', 'block');
	        	if($(this).prev().attr('src') == "${ contextPath }/resources/icon/hash-gray.png") {
		        	// 상품명 검색시
	        		var url = "${pageContext.request.contextPath}/fanStore/fNameList";
	        		var data = {
	        				areaCode: "${userColl.area.areaCode}",
	        				search: search
	        		}
		            callAjaxSearch(url, data, '상품');
	        	} else {
	        		// 해시코드 검색시
	        		var url = "${pageContext.request.contextPath}/fanStore/hashList";
	        		var data = {
	        				areaCode: "${userColl.area.areaCode}",
	        				search: search
	        		}
		            callAjaxSearch(url, data, '태그');
	        	}
	        }
	    })
	    
	    // 검색 영역 데이터 클릭시
	    $(document).on('click', '.fstore-search-result p', function() {
	    	$(".fstore-search-content input").val($(this).text())
	    });
	
	    // 내지역 버튼을 클릭했을 때
	    $(".my-area").click(function() {
	    	$(".confirm-background").css("display", "block");
	    })
	
	    // 상품등록 버튼을 클릭했을 때
	    $(".enroll-fstore-btn").click(function() {
	        var text = $(".isEnrollfstore").text();
	        if(text == '지역인증필요') {
	        	if(confirm('지역인증이 필요합니다. 인증하시겠습니까?')) {
	        		$(".confirm-background").css("display", "block");
	        		$(".toggle-switch-alert input").attr("checked", true)
	        		$(".area-alert p").text("인증");
		            $(".confirm-title b").text("지역인증");
		            $(".call-my-area").css("display", "block");
		            $(".setting-area").css("display", "none");
		            $(".yes").css("display", "none");
		            $(".location-loading").css("display", "block");
		            area = false;
	        	}
	        } else {
	        	$(".insert-section").css("display", "block")
	        }
	    })
	    
	    // 토클 클릭시 
		let flag = true;
		$(".toggle-switch input").on('click', function(e) {
		    if(flag == true) {
		        // 토글이 true일 경우(기본키 일 경우)
		        $(".area p").text("내상품");
		        // AJAX 호출
		        var url = "${pageContext.request.contextPath}/fanStore/myStore"
		        var data = {
		        		id : "${loginUser.id}",
		        		areaCode : "${userColl.area.areaCode}"
		        }
		        callAjaxFanStoreList(url, data);
		        flag = false;
		    } else {
		        // 토글이 false일 경우(체크된 경우)
		        $(".area p").text("전체");
		     	location.href="${pageContext.request.contextPath}/fanStore/list"
		        flag = true;
		    }
		});
		
		// 찜등록 ajax
		function callAjaxWish(url, data, img) {
			console.log(img.attr("src"));
			$.ajax({
				url : url,
				method : "POST",
	        	data : data,
				dateType : "json",
	        	success : function(msg) {
	        		alert(msg.msg)
	        		var src = "${ contextPath }/resources/icon/"
	        		if(msg.msg == '찜목록에 등록되었습니다') {
	        			img.attr("src", src + "heart-pink.png");
	        		} else if(msg.msg == '찜목록에서 제거되었습니다') {
	        			img.attr("src", src + "heart.png");
	        		}
	        		console.log("적용후 : ", img.attr("src"))
	        	},
	        	error : function(e) {
	        		console.log(e)
	        	}
			});
		}
		
		// 반복하는 AJAX 공통 함수로 구분(팬스토어 리스트 호출)
		function callAjaxFanStoreList(url, data) {
			$.ajax({
	        	url : url,
	        	method : "POST",
	        	data : data,
				dateType : "json",
	        	success : function(list) {
	        		console.log(list)
	        		if(list.length < 1) {
	        			alert("상품목록이 존재하지 않습니다")
	        			if($(".toggle-switch input").is(":checked")) {
	        				$(".area p").text("전체");
	        				$(".toggle-switch input").prop("checked", false)
	        				flag = true;
	        				console.log("왜 안바껴")
	        			}
	        		} else {
	        			var area = $(".store-product").html("");
						var fcode = '';
						for(var i in list) {
							if(fcode != list[i].fstore.fcode) {
								fcode = list[i].fstore.fcode;
								var article = $("<article class='product-background'>");
								var div = $("<div class='product-info'>");
								var hash = $("<div class='enroll-hash'>")
								var ul = $("<ul>")
								var artiName = $("<p>").text(list[i].fstore.artiNameEn);
								var fName = $("<b>").text(list[i].fstore.fname);
								var price = $("<p>")
								var s = $("<s>").text(" " + numberWithCommas(list[i].fstore.offerPrice));
								var ddim = $("<img class='ddim-icon store-icon ddim' src='${ contextPath }/resources/icon/heart.png' alt=''>");
								var noddim = $("<img class='ddim-icon store-icon noddim' src='${ contextPath }/resources/icon/heart-pink.png' alt=''>");
								var imgSrc = "${ contextPath }/resources/uploadFiles/" + list[i].att.attSvName;
								var img = $("<img src='' alt=''>").attr("src", imgSrc);
								var fCode = $("<input type='hidden' id='fcode'>").val(list[i].fstore.fcode);
								price.append("\\ " + numberWithCommas(list[i].fstore.offerPrice)).trigger("create");
								
								for(var j in list) {
									if(list[i].fstore.fcode == list[j].fstore.fcode) {
										var li = $("<li>")
										li.append(list[j].hash.tagName)
										ul.append(li)
									}
								}
								hash.append(ul)
								if(list[i].wish.id == "${loginUser.id}" && list[i].wish.isWish == 'Y' && list[i].fstore.id != "${loginUser.id}") {
									div.append(hash, artiName, fName, price, noddim).trigger("create");
								} else if(list[i].fstore.id != "${loginUser.id}"){
									div.append(hash, artiName, fName, price, ddim).trigger("create");
								} else {
									div.append(hash, artiName, fName, price).trigger("create");
								}
								article.append(div, img, fCode).trigger("create");
								area.append(article).trigger("create");
							}
						}
	        		}
	        	},
	        	error : function(e) {
	        		console.log(e);
	        	}
	        });
		}
		// 숫자 3 단위마다 콤마찍기
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		// 반복하는 AJAX 공통 함수로 구분(검색 리스트 호출)
		function callAjaxSearch(url, data, type) {
			$.ajax({
	        	url : url,
	        	method : "POST",
	        	data : data,
				dateType : "json",
	        	success : function(list) {
	        		var searchResult = $(".fstore-search-result");
	        		searchResult.html("");
	        		if(list.length < 1) {
		        		// 리스트에 정보가 없는 경우
	        			var p = $("<p>").text("찾으시는 정보가 없습니다");
	        			searchResult.append(p);
	        		} else {
						// 리스트에 정보가 있는 경우
						switch(type) {
						case '상품' :
							for(var i in list) {
			        			var p = $("<p>").text(list[i].fname);
			        			searchResult.append(p);
			        		}
							break;
						case '태그' :
							for(var i in list) {
			        			var p = $("<p>").text(list[i].tagName);
			        			searchResult.append(p);
			        		}
							break;
						}
	        		}
	        	},
	        	error : function(e) {
	        		console.log(e);
	        	}
	        });
		}
    </script>
    </c:if>
    <c:choose>
    <c:when test="${ empty loginUser }">
	<script>
		$(function() {
			alert("로그인을 해주세요");
			location.href="${contextPath}/main";
		})
	</script>
	</c:when>
	</c:choose>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/store/fanStoreDetail.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Fantimate</title>
</head>
<body>
	<c:if test="${ !empty loginUser }">
	<c:set var="flag" value="yes" scope="session"/>
	<jsp:include page="fanStoreInsert.jsp"/>
	<jsp:include page="../common/report.jsp"/>
	<jsp:include page="../common/messageSend.jsp"/>
	<!-- 네비바 인클루드 -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	<section class="main-section">
         <section class="left-contents">
            <article class="main-photo-area">
            	<!-- 메인 사진 -->
            	<c:set var="mainCount" value="0" />
            	<c:forEach var="attList" items="${ fanStore }">
	            	<c:if test="${ attList.att.attMain eq 'Y'}">
	            	<c:if test="${ mainCount < 1 }">
	                <img class="main-img" src="${ contextPath }/resources/uploadFiles/${ attList.att.attSvName }" alt="">
	                </c:if>
	                <c:set var="mainCount" value="${ mainCount + 1 }"/>
	                </c:if>
	            </c:forEach>
                <!-- 찜아이콘 -->
                <c:if test="${ fanStore.get(0).fstore.id ne loginUser.id }">
                <c:choose>
                	<c:when test="${ wish.isWish eq 'Y' }">
	                <img class="photo-icon ddim" src="${ contextPath }/resources/icon/heart-pink.png" alt="">
	                </c:when>
	                <c:otherwise>
	                <img class="photo-icon ddim" src="${ contextPath }/resources/icon/heart.png" alt="">
	                </c:otherwise>
                </c:choose>
                </c:if>
                <!-- 축소된 뷰 영역 -->
                <div class="is-view">
                	<c:set var="attName" value=""/>
                	<c:forEach var="attList" items="${ fanStore }">
	                <c:if test="${ attList.att.attSvName ne attName }">
                	<img class="small-img" src="${ contextPath }/resources/uploadFiles/${ attList.att.attSvName }" alt="">
	                <c:set var="attName" value="${ attList.att.attSvName }"/>
	                </c:if>
                	</c:forEach>
                </div>
            </article>
            
            <article class="product-guide">
                <div class="product-title">
                    <p>상품소개</p>
                    <p>[연락]&nbsp;&nbsp;${ fanStore.get(0).fstore.contact }&nbsp;&nbsp;|&nbsp;&nbsp;[거래]&nbsp;&nbsp;${ fanStore.get(0).fstore.deal }</p>
                </div>
                <div class="guide">${ fanStore.get(0).fstore.finfo }</div>
            </article>
         </section>


         <section class="right-contents">
             <table>
             	<colgroup>
             	 	<col width="25%">
             	 	<col width="25%">
             	 	<col width="25%">
             	 	<col width="25%">
             	 </colgroup>
                 <tr>
                     <td colspan="3">${ fanStore.get(0).area.areaName }</td>
                     <td colspan="1"><a href="${ contextPath }/fanStore/list">목록으로</a></td>
                 </tr>
                 <tr>
                     <td colspan="4">${ fanStore.get(0).fstore.fname }</td>
                 </tr>
                 <tr>
                    <td colspan="4">
                        <ul>
                        	<c:set var="attCode" value="${ fanStore.get(0).att.attCode }"/>
                        	<c:forEach var="tagList" items="${ fanStore }">
                        	<c:if test="${ attCode eq tagList.att.attCode }">
                            <li>${ tagList.hash.tagName }</li>
                            </c:if>
                            </c:forEach>
                        </ul>
                    </td>
                 </tr>
                 <tr>
                     <td colspan="2">OFFER PRICE</td>
                     <td colspan="2">\ <fmt:formatNumber type="number" value="${ fanStore.get(0).fstore.offerPrice }"/></td>
                 </tr>
                 <tr>
                     <td colspan="4">
                     	 <c:if test="${ loginUser.classifyMem eq 1 && loginUser.id ne fanStore.get(0).fstore.id }">
                         <button class="fs-send-message">쪽지 보내기</button>
                         </c:if>
                         <c:if test="${ loginUser.classifyMem eq 1 && loginUser.id eq fanStore.get(0).fstore.id }">
                         <button class="update-fanStore">수정하기</button>
                         </c:if>
                     </td>
                 </tr>
                 <tr>
                 	 <c:if test="${ loginUser.classifyMem eq 1 && loginUser.id ne fanStore.get(0).fstore.id }">
                     <td colspan="2">
                     <c:choose>
                    	<c:when test="${ wish.isWish eq 'Y' }">
                        <button class="enroll-wish-btn">찜등록해제</button>
                        </c:when>
                        <c:otherwise>
                        <button class="enroll-wish-btn">찜등록</button>
                        </c:otherwise>
                   	 </c:choose>
                     </td>
                     <td colspan="2">
                         <button class="report-btn">신고하기</button>
                     </td>
                     </c:if>
                 </tr>
             </table>
             <h4 class="reply">댓글
             	<c:if test="${ loginUser.id eq fanStore.get(0).fstore.id }">
             		(${ fn:length(fanStoreReply) })<span id="backList">리스트보기</span>
             	</c:if>
             </h4>
             <div class="reply-area">
           	 <c:if test="${ loginUser.id eq fanStore.get(0).fstore.id }">
            	 <c:choose>
            	 <c:when test="${ !empty fanStoreReply }">
                 <div class="reply-list">
                   <ul>
                   <c:forEach var="r" items="${ fanStoreReply }">
                       <li>
                           <div>
                               <img class="user-profile" src="${ contextPath }/resources/uploadFiles/${r.attUser.attSvName}" alt="">
                               <span>${ r.user.id } 님이 댓글을 남겼습니다</span>
                           </div>
                           <span><fmt:formatDate value="${ r.fsReply.rcreate }" type="date" /></span>
                       </li>
                   </c:forEach>
                   </ul>
                 </div>
                 </c:when>
                 <c:otherwise>
                    <div class="notList">
	                	<p>등록된 댓글이 없습니다</p>
                    </div>
                 </c:otherwise>
                 </c:choose>
              </c:if>
                 <div class="reply-content">
                     <div class="content-view">
                         <c:if test="${ loginUser.id ne fanStore.get(0).fstore.id }">
                     	 <c:forEach var="r" items="${ fanStoreReply }">
                         <article>
                             <img class="user-profile" src="${ contextPath }/resources/uploadFiles/${r.attUser.attSvName}" alt="">
                             <div class="text-content">${ r.fsReply.rcontent }</div>
                             <span class="text-write-date"><fmt:formatDate value="${ r.fsReply.rcreate }" type="date" /></span>
                             <div class="controller">
                                 <img src="${ contextPath }/resources/icon/dot.png" alt="">
                             </div>
                             <div class="reply-controller">
                                 <div class="reply-controll">쪽지보내기</div>
                                 <div class="reply-controll">신고하기</div>
                                 <div class="reply-controll">삭제하기</div>
                             </div>
                         </article>
                         </c:forEach>
                         </c:if>
                     </div>
                    <div class="reply-write">
                       <img class="user-profile" src="${ contextPath }/resources/uploadFiles/${ user.get(0).attUser.attSvName }" alt="">
                       <textarea class="replyContent"></textarea>
                       <img id="sendReply" src="${ contextPath }/resources/icon/send.png" alt="">
                    </div>
                 </div>
             </div>
         </section>
    </section>
    <script>
    	// 로딩 시
    	$(function() {
    		var loginUser = "${loginUser.id}"
    		var writer = "${ fanStore.get(0).fstore.id }"
    		if(loginUser != writer) {
    			$(".reply-content").css("display", "flex")
    		}
    	});
	 	// 왼쪽 컨텐츠 메인 사진의 작은 사진 클릭시
		$(".small-img").click(function() {
			var url = $(this).attr("src");
			$(".main-img").attr("src", url);
		});
	 	
	 	// **************** 오른쪽 영역 ******************
	 	// 오른쪽 컨텐츠 찜하기 버튼 클릭시
		$(".enroll-wish-btn").click(function() {
			var text = $(".enroll-wish-btn").text();
			var fcode = ${ fanStore.get(0).fstore.fcode };
			var id = "${loginUser.id}"
			var type = "";
		    if(text == '찜등록해제') {
		    	type = "취소";
		    	$.ajax({
					url : "${pageContext.request.contextPath}/fanStore/wish",
					method : "post",
					data : {
						code : fcode,
						id : id,
						type : type
					},
					dataType : "json",
					success : function(data) {
						alert(data.msg)
						$(".ddim").attr("src", "${ contextPath }/resources/icon/heart.png")
						$(".enroll-wish-btn").text("찜등록")
					},
					error : function(e) {
						console.log(e)
					}
		    	})
		    } else if(text == '찜등록'){
		    	type = "등록";
		    	$.ajax({
					url : "${pageContext.request.contextPath}/fanStore/wish",
					method : "post",
					data : {
						code : fcode,
						id : id,
						type : type
					},
					dataType : "json",
					success : function(data) {
						alert(data.msg)
						$(".ddim").attr("src", "${ contextPath }/resources/icon/heart-pink.png")
						$(".enroll-wish-btn").text("찜등록해제")
					},
					error : function(e) {
						console.log(e)
					}
		    	})
		    }
		})
		// 쪽지보내기 클릭시
		$(".fs-send-message").click(function() {
			$(".send-message-section").css({"display":"block", "z-index":"4"})
		});
	 	// 신고하기 클릭시
	 	$(".report-btn").click(function() {
	 		$(".report-message-section").css({"display":"block", "z-index":"4"});
	 	});
	 	// 수정하기 클릭시
	 	$(".update-fanStore").click(function() {
	 		$(".insert-section").css("display", "block");
	 	});
	 	
	 	// 댓글 내용에 마우스 호버시
	    $(".content-view article").hover(function() {
	        $(this).children(".controller").css("display", "flex")
	    }, function() {
	        $(this).children(".controller").css("display", "none")
	    })
	    
	    // 댓글 컨트롤러 클릭시
	    $(".controller").on('click', function() {
	    	if($(this).next().css("display") == "block") {
	    		$(this).next().css("display", "none")
	    	} else {
	    		$(this).next().css("display", "block")
	    	}
	    })
	    // 댓글 리스트 중 하나 클릭시
	    $(".reply-list").on('click', function() {
	        $(this).css("display", "none")
	        // 필요정보 변수에 담기
	        // 댓글 ajax에 보낼 데이터 변수에 담기
	        var url = "${ pageContext.request.contextPath }/fanStore/replyOne"
	        var data = {
	        		
	        }
	        // 댓글 ajax 호출
	        ajaxReply(url, data)
	        $(".reply-content").css("display", "flex")
	    })
	    // 리스트 보기 클릭시
	    $("#backList").click(function() {
	    	$(".reply-list").css("display", "flex")
	    	$(".reply-content").css("display", "none")
	    });
	 	// 댓글 작성 후 보내기
	 	$("#sendReply").click(function() {
	 		// 필요정보 변수에 담기
	 		var rcontent = $(".replyContent").val();
	 		var fcode = ${ fanStore.get(0).fstore.fcode };
			var id = "${loginUser.id}";
			var refRid = ${ fanStoreReply.get(0).fsReply.rid };
			var fanStoreWriter = "${ fanStore.get(0).fstore.id }";
			var firstWriter = "${ fanStoreReply.get(0).user.id }";
	 		// 댓글 ajax에 보낼 데이터 변수에 담기
	 		var url = "${ pageContext.request.contextPath }/fanStore/insertReply";
	 		var data = {
	 			rcontent : rcontent,
 				refId : fcode,
 				writer : id,
 				refRid : refRid,
 				fanStoreWriter : fanStoreWriter,
 				firstWriter : firstWriter
	 		}
	 		// 댓글 ajax 호출
	 		ajaxReply(url, data)
	 	});
	 	
	 	// 댓글관련 AJAX
	 	function ajaxReply(url, data) {
	 		$.ajax({
	 			url : url,
	 			method : "POST",
	 			data : data,
	 			dataType : "json",
	 			success : function(data) {
	 				console.log(data)
	 				if(data.length < 1) {
	 					alert("댓글 등록에 실패하였습니다")
	 				} else {
	 					$(".content-view").html("");
		 				for(var i in data) {
		 					var article = $("<article>")
		 					var userProfile = $("<img class='user-profile'>").attr("src", "${contextPath}/resources/uploadFiles/" + data[i].attUser.attSvName);
		 					var content = $("<div class='text-content'>").text(data[i].fsReply.rcontent)
		 					var create = new Date(data[i].fsReply.rcreate);
		 					var rcreate = $("<span class='text-write-date'>").text(create.getFullYear()+"."+create.getMonth()+"."+create.getDate())
		 					var controller = $("<div class='controller'>")
		 					var dot = $("<img>").attr("src", "${contextPath}/resources/icon/dot.png")
		 					var rController = $("<div class='reply-controller'>")
		 					var sendMessage = $("<div class='reply-controll'>").text("쪽지보내기")
		 					var report = $("<div class='reply-controll'>").text("신고하기")
		 					var deleteReply = $("<div class='reply-controll'>").text("삭제하기")
		 					rController.append(sendMessage, report, deleteReply)
		 					controller.append(dot)
		 					article.append(userProfile, content, rcreate, controller, rController);
		 					$(".content-view").append(article)
		 				}
		 				$(".replyContent").val("").focus();
	 				}
	 			},
	 			error : function(e) {
	 				console.log(e)
	 			}
	 		})
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
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
	<c:if test="${ !empty noti }">
		<script>
			$(function() {
				alert("${noti}");
			}) 
		</script>
		<c:remove var="msg"/>
	</c:if>
	<c:if test="${ !empty loginUser }">
	<c:set var="fsFlag" value="yes" scope="session"/>
	<jsp:include page="fanStoreInsert.jsp"/>
	<jsp:include page="../common/report.jsp"/>
	<jsp:include page="../common/messageSend.jsp"/>
	<!-- 네비바 인클루드 -->
	<jsp:include page="../common/navbar.jsp"/>
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
                	<c:set var="tagCode" value="${ fanStore.get(0).hash.tagCode }" />
                	<c:forEach var="attList" items="${ fanStore }">
	                <c:if test="${ attList.hash.tagCode eq tagCode }">
                	<img class="small-img" src="${ contextPath }/resources/uploadFiles/${ attList.att.attSvName }" alt="">
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
                           <input type="hidden" id="rWriter" value="${ r.user.id }">
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
	                     	 <c:choose>
		                     	 <c:when test="${ loginUser.id eq r.user.id }">
		                         <article class="reverse">
		                             <img class="user-profile" src="${ contextPath }/resources/uploadFiles/${r.attUser.attSvName}" alt="">
		                             <c:if test="${ r.fsReply.rstatus eq 'Y' }">
			                             <div class="text-content">${ r.fsReply.rcontent }</div>
			                             <span class="text-write-date-reverse"><fmt:formatDate value="${ r.fsReply.rcreate }" type="date" /></span>
			                             <div class="controller-reverse">
			                                 <img src="${ contextPath }/resources/icon/dot.png" alt="">
			                             </div>
		                             </c:if>
		                             <c:if test="${ r.fsReply.rstatus eq 'N' }">
		                             	<div class="text-content">삭제된 댓글입니다</div>
		                             </c:if>
		                             <div class="reply-controller-reverse">
		                                 <div class="reply-controll">삭제하기</div>
		                             </div>
		                             <input type="hidden" id="rid" value="${ r.fsReply.rid }">
		                             <input type="hidden" id="rcWriter" value="${ r.user.id }">
		                         </article>
		                         </c:when>
		                         <c:otherwise>
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
		                             </div>
		                             <input type="hidden" id="rid" value="${ r.fsReply.rid }">
		                             <input type="hidden" id="rcWriter" value="${ r.user.id }">
		                         </article>
		                         </c:otherwise>
	                         </c:choose>
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
    		// 리뷰 스크롤 항상 하단에 위치 하도록
    		$('.content-view').stop().animate( { scrollTop : '+=1000' } )
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
			$(".form-send-message").css({"display":"block"})
			var messSendId = "${loginUser.id}";
			var messRecId = "${ fanStore.get(0).fstore.id }";
			if(messSendId == messRecId) {
				messRecId = $("#rcWriter").val();
			}
			console.log(messRecId)
			$(".to-id").text(messRecId);
		});
	 	// 쪽지보내기의 보내기 버튼 클릭시
	 	$("#sendBtn").click(function() {
	 		var messSendId = "${loginUser.id}";
			var messRecId = "${ fanStore.get(0).fstore.id }";
			if(messSendId == messRecId) {
				messRecId = $("#rcWriter").val();
			}
			var fsArea = ${ fanStore.get(0).fstore.areaCode };
			var userArea = ${ user.get(0).area.areaCode };
			var isCertify = "${ user.get(0).user.areaCertify }";
			// 보내는 이의 인증지역과 팬스토어가 등록된 지역이 다르다면
			if(fsArea != userArea || isCertify == 'N') {
				alert("같은 지역구에서 지역인증시 발송가능합니다")
			} else {
			// 보내는 이의 인증지역과 팬스토어가 등록된 지역이 같다면
				$(".mess-send-id").val(messSendId)
				$(".mess-rec-id").val(messRecId)
				var form = $(".form-send-message").serialize();
				$.ajax({
					url : "${pageContext.request.contextPath}/fanStore/sendMessage",
					method : "post",
					data : form,
					dataType : "json",
					success : function(data) {
						alert(data.msg)
						var fcode = "${ fanStore.get(0).fstore.fcode }";
						location.href="${ pageContext.request.contextPath }/fanStore/detail?fcode=" + fcode;
					},
					error : function(e) {
						alert(e)
					}
				});
			}
	 	});
	 	var reportType = "";
	 	var rid = 0;
	 	// 신고하기 클릭시
	 	$(".report-btn").click(function() {
	 		reportType = "팬스토어";
	 		$(".form-report").css({"display":"block"});
	 	});
	 	// 신고하기의 신고하기버튼 클릭시
	 	$("#reportBtn").click(function() {
	 		var rptType = $(".radio-area:checked").val()
	 		var rptReason = $(".report-write").val()
	 		var rptId = "${ loginUser.id }";
	 		var refId = "${ fanStore.get(0).fstore.fcode }";
	 		if(reportType == '댓글') {
	 			refId = rid;
	 		}
	 		console.log(rptType, rptReason, rptId, refId);
	 		var data = {
	 				rptType : rptType,
	 				rptReason : rptReason,
	 				rptId : rptId,
	 				refId : refId,
	 				reportType : reportType
	 		}
			$.ajax({
				url : "${pageContext.request.contextPath}/fanStore/reportFanStore",
				method : "post",
				data : data,
				dataType : "json",
				success : function(data) {
					alert(data.msg)
					var fcode = "${ fanStore.get(0).fstore.fcode }";
					location.href="${ pageContext.request.contextPath }/fanStore/detail?fcode=" + fcode;
				},
				error : function(e) {
					alert(e)
				}
			});
	 		
	 	});
	 	// 수정하기 클릭시
	 	$(".update-fanStore").click(function() {
	 		$(".insert-section").css("display", "block");
	 	});
	 	
	 	
	 	// ************************** 댓글 관련 *************************
	 	// 댓글 내용에 마우스 호버시
	 	$(document).on("mouseenter", ".content-view article", function() {
	 		$(this).children(".controller").css("display", "flex")
	 		$(this).children(".controller-reverse").css("display", "flex")
	 	});
	 	$(document).on("mouseleave", ".content-view article", function() {
	 		$(this).children(".controller").css("display", "none")
	 		$(this).children(".controller-reverse").css("display", "none")
	 	});
	    
	    // 댓글 컨트롤러 클릭시
	    $(document).on('click', ".controller", function() {
	    	if($(this).next().css("display") == "none") {
		    	$(this).next().css("display", "block")
	    	} else {
	    		$(this).next().css("display", "none")
	    	}
	    })
	    $(document).on("click", ".controller-reverse", function() {
	    	if($(this).next().css("display") == "none") {
		    	$(this).next().css("display", "block")
	    	} else {
	    		$(this).next().css("display", "none")
	    	}
	    })
	    
	    // 댓글 컨트롤러 중 하나 클릭시
	    $(document).on('click', ".reply-controll", function() {
	    	var controller = $(this).text();
	    	rid = $(this).parent().siblings("input#rid").val();
	    	var fcode = "${ fanStore.get(0).fstore.fcode }";
	    	var fsWriter = "${ fanStore.get(0).fstore.id }";
	    	var loginUser = "${ loginUser.id }";
	    	var firstWriter = $("#rcWriter").val();
	    	switch(controller) {
	    	case '쪽지보내기' :
	    		var messSendId = "${loginUser.id}";
				var messRecId = "${ fanStore.get(0).fstore.id }";
				if(messSendId == messRecId) {
					messRecId = $("#rcWriter").val();
				}
	    		$(".form-send-message").css({"display":"block"})
				$(".to-id").text(messRecId);
	    		break;
	    	case '신고하기' :
	    		reportType = "댓글";
	    		$(".form-report").css({"display":"block"});
	    		break;
	    	case '삭제하기' :
	    		var url = "${pageContext.request.contextPath}/fanStore/deleteReply";
	    		var data = {
	    			rid : rid,
	    			fcode : fcode,
	    			fsWriter : fsWriter,
	    			loginUser : loginUser,
	    			firstWriter : firstWriter
	    		}
	    		ajaxReply(url, data)
	    		break;
	    	}
	    });
	    
	    // 리스트 보기 클릭시
	    $("#backList").click(function() {
	    	$(".reply-list").css("display", "flex")
	    	$(".reply-content").css("display", "none")
	    });
	    // 댓글 리스트 중 하나 클릭시
	    $(document).on('click', ".reply-list li", function() {
	        $(".reply-list").css("display", "none")
	        // 필요정보 변수에 담기
	        var fcode = "${ fanStore.get(0).fstore.fcode }"
	        var fsWriter = "${ fanStore.get(0).fstore.id }"
	        var rWriter = $(this).children("#rWriter").val();
	        console.log(fcode, fsWriter, rWriter);
	        // 댓글 ajax에 보낼 데이터 변수에 담기
	        var url = "${ pageContext.request.contextPath }/fanStore/replyOne"
	        var data = {
	        		fcode : fcode,
	        		fsWriter : fsWriter,
	        		rWriter : rWriter
	        }
	        // 댓글 ajax 호출
	        ajaxReply(url, data)
	        $(".reply-content").css("display", "flex")
	    })
	 	// 댓글 작성 후 보내기
	 	$("#sendReply").click(function() {
	 		// 필요정보 변수에 담기
	 		var rcontent = $(".replyContent").val();
	 		var fcode = ${ fanStore.get(0).fstore.fcode };
			var id = "${loginUser.id}";
			var refRid = parseInt($("#rid").val());
			var fanStoreWriter = "${ fanStore.get(0).fstore.id }";
			var firstWriter = $("#rcWriter").val();
	 		// 댓글 ajax에 보낼 데이터 변수에 담기
	 		var url = "${ pageContext.request.contextPath }/fanStore/insertReply";
	 		var data = {};
	 		if(!refRid) {
	 			data = {
 		 			rcontent : rcontent,
 	 				refId : fcode,
 	 				writer : id,
 	 				fanStoreWriter : fanStoreWriter,
 	 				firstWriter : ""
 		 		}
	 		} else {
	 			console.log("실행됨")
	 			data = {
 		 			rcontent : rcontent,
 	 				refId : fcode,
 	 				writer : id,
 	 				refRid : refRid,
 	 				fanStoreWriter : fanStoreWriter,
 	 				firstWriter : firstWriter,
 		 		}
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
		 					var rcreate = $("<span class='text-write-date'>").text(create.getFullYear()+"."+(create.getMonth()+1)+"."+create.getDate())
		 					var myRcreate = $("<span class='text-write-date-reverse'>").text(create.getFullYear()+"."+(create.getMonth()+1)+"."+create.getDate())
		 					var controller = $("<div class='controller'>")
		 					var myController = $("<div class='controller-reverse'>")
		 					var dot = $("<img>").attr("src", "${contextPath}/resources/icon/dot.png")
		 					var rController = $("<div class='reply-controller'>")
		 					var myRController = $("<div class='reply-controller-reverse'>")
		 					var sendMessage = $("<div class='reply-controll'>").text("쪽지보내기")
		 					var report = $("<div class='reply-controll'>").text("신고하기")
		 					var deleteReply = $("<div class='reply-controll'>").text("삭제하기")
		 					var rid = $("<input type='hidden' id='rid'>").val(data[i].fsReply.rid)
		 					var rcWriter = $("<input type='hidden' id='rcWriter'>").val(data[i].user.id)
		 					if("${loginUser.id}" == data[i].user.id) {
		 						article.addClass("reverse")
		 						if(data[i].fsReply.rstatus == 'N') {
		 							content = $("<div class='text-content'>").text("삭제된 댓글입니다")
		 							article.append(userProfile, content, myController, myRController, rid, rcWriter);
		 						} else {
		 							myRController.append(deleteReply)
				 					myController.append(dot)
				 					article.append(userProfile, content, myRcreate, myController, myRController, rid, rcWriter);
		 						}
		 					} else {
		 						rController.append(sendMessage, report)
			 					controller.append(dot)
			 					article.append(userProfile, content, rcreate, controller, rController, rid, rcWriter);
		 					}
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
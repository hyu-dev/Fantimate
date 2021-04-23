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
    <link rel="stylesheet" href="${ contextPath }/resources/css/store/fanStoreDetail.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Fantimate</title>
</head>
<body>
	<c:if test="${ !empty loginUser }">
	<c:set var="flag" value="yes" scope="session"/>
	<jsp:include page="fanStoreInsert.jsp"/>
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
                <c:choose>
                	<c:when test="${ !empty wish && wish.isWish eq 'Y' }">
	                <img class="photo-icon ddim" src="${ contextPath }/resources/icon/heart-pink.png" alt="">
	                </c:when>
	                <c:otherwise>
	                <img class="photo-icon ddim" src="${ contextPath }/resources/icon/heart.png" alt="">
	                </c:otherwise>
                </c:choose>
                
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
                    	<c:when test="${ fanStore.get(0).wish.isWish eq 'Y'  }">
                        <button class="enroll-wish-btn">찜등록해제</button>
                        </c:when>
                        <c:otherwise>
                        <button class="enroll-wish-btn">찜등록</button>
                        </c:otherwise>
                   	 </c:choose>
                     </td>
                     <td colspan="2">
                         <button>신고하기</button>
                     </td>
                     </c:if>
                 </tr>
             </table>
             <h4 class="reply">댓글(2) <span><img src="${ contextPath }/resources/icon/hand-point-left-solid.svg" alt="" width="25px"></span></h4>
             <div class="reply-area">
                 <div class="reply-list">
                    <ul>
                        <li>
                            <div>
                                <img class="user-profile" src="${ contextPath }/resources/images/mypage/만식프로필.png" alt="">
                                <span>bt******* 님이 댓글을 남겼습니다</span>
                            </div>
                            <span>2021. 03. 01</span>
                        </li>
                    </ul>
                 </div>
                 <div class="reply-content">
                     <div class="content-view">
                         <article>
                             <img class="user-profile" src="${ contextPath }/resources/images/mypage/만식프로필.png" alt="">
                             <div class="text-content">bt******* 님이 댓글을 남겼습니다 bt******* 님이 댓글을 남겼습니다
                                 bt******* 님이 댓글을 남겼습니다
                                 bt******* 님이 댓글을 남겼습니다
                                 bt******* 님이 댓글을 남겼습니다
                                 bt******* 님이 댓글을 남겼습니다
                             </div>
                             <span class="text-write-date">2021. 03. 01</span>
                             <div class="controller">
                                 <img src="${ contextPath }/resources/icon/dot.png" alt="">
                             </div>
                             <div class="reply-controller">
                                 <div class="reply-controll">쪽지보내기</div>
                                 <div class="reply-controll">신고하기</div>
                                 <div class="reply-controll">삭제하기</div>
                             </div>
                         </article>
                     </div>
                    <form class="reply-write">
                       <img class="user-profile" src="${ contextPath }/resources/images/mypage/만식프로필.png" alt="">
                       <textarea name="replyContent"></textarea>
                       <img src="${ contextPath }/resources/icon/send.png" alt="">
                    </form>
                 </div>
             </div>
         </section>
    </section>
    <script>
	 	// 왼쪽 컨텐츠 메인 사진의 작은 사진 클릭시
		$(".small-img").click(function() {
			var url = $(this).attr("src");
			$(".main-img").attr("src", url);
		});
	 	// 댓글 내용에 마우스 호버시
	    $(".content-view article").hover(function() {
	        console.log('호버함')
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
	        $(".reply-content").css("display", "flex")
	    })
	    
	    // 오른쪽 컨텐츠 찜하기 버튼 클릭시
		let flag = true;
		$("tr:nth-of-type(6) td:first-of-type").click(function() {
		    if(flag == true) {
		        alert("찜목록에 등록되었습니다")
		        $(".ddim").attr("src", "${ contextPath }/resources/icon/heart-pink.png")
		        flag = false;
		    } else {
		        alert("찜목록에서 제거되었습니다")
		        $(".ddim").attr("src", "${ contextPath }/resources/icon/heart.png")
		        flag = true;
		    }
		})

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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--     <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css"> --%>
<!--     <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> -->
<%--     <link rel="stylesheet" href="${ contextPath }/resources/css/common/navbar.css"> --%>
<%--     <link rel="stylesheet" href="${ contextPath }/resources/css/mypage/jw.css"> --%>
<%--     <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png"> --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>payments</title>
</head>
<body>
<!-- 메세지 -->
	 <c:if test="${ !empty msg }">
	 	<script>
	 		alert(${ msg });
	 	</script>
<%-- 		 <c:choose> --%>
<%-- 			 <c:when test="${ msg eq 'successRefund'}"> --%>
<!-- 			 	<script> -->
// 				    alert("환불신청이 완료되었습니다.");
<!-- 			    </script> -->
<%-- 			    <c:remove var="msg"/> --%>
<%-- 			 </c:when> --%>
<%-- 			 <c:when test="${ msg eq 'successConfirm'}"> --%>
<!-- 			 	<script> -->
// 				    alert("구매확정이 완료되었습니다.");
<!-- 			    </script> -->
<%-- 			    <c:remove var="msg"/> --%>
<%-- 			 </c:when> --%>
<%-- 			 <c:otherwise> --%>
<!-- 			 	<script> -->
// 				    alert("회원가입 실패!");
<!-- 			    </script> -->
<%-- 			 </c:otherwise> --%>
<%-- 		</c:choose> --%>
	</c:if>
	
	
	<jsp:include page="../../common/navbar.jsp"></jsp:include>
<%-- 	<jsp:include page="${ contextPath }'WEB-INF/views/common/navbar.jsp'"></jsp:include> --%>
	<!-- 	상단 -->
	<section id="mypageUserProfile">
		<jsp:include page="userDiv.jsp"/>
        <%-- UserDiv include로 대체
        <div id="mypageUserProfileWrap">
            <div id="mypageUserProfileImgDiv">
                <img id="mypageUserProfileImg" src="${ contextPath }/resources/images/mypage/user/mansik.png">
            </div>
            <div id="mypageUserProfileImgDivRight">
                <h3 class="font-30">만식 김</h3>
                <h4 class="font-16">&nbsp;</h4>
                <h4 class="font-16">mansik@gmail.com</h4>
            </div>
            <div id="mypageUserProfileImgDivRightRight">
                <button class="mypage-btn-pink-14">수정하기</button>
                <h4 class="font-16">&nbsp;</h4>
                <button class="mypage-btn-blueblack-14">탈퇴하기</button>
            </div>
        </div> --%>
    </section>
    <!-- 프로필 밑에 섹션 -->
    <section id="mypageUserSection">
        <article id="mypageUserContent">
            <div id="mypageUserContentDiv">
                <!-- <h2 id="mypageUserContentDivTitle">My Subscribes</h2> -->
                <h2>My Payments</h2>
                <div class="mypage-content-payment">
                    <table id="mypageUserPay">
                        <tr>
                            <th>주문일자</th>
                            <th colspan="2">주문상품정보</th>
                            <th>금액(수량)</th>
                            <th>주문상태</th>
                            <th>확인/취소/리뷰</th>
                        </tr>

                    	<c:forEach var="p" items="${ list }">
                    	<tr>
                        	<c:set var="date" value="<%= new Date() %>"/>
                    		<td><fmt:formatDate type="date" value="${ p.payment.payDate }"/></td><!-- 주문일자 -->
                    		
                    		<c:choose>
                    			<c:when test="${ p.cart.pcode eq 0 }">
                    				<td>${ p.mdatt.attSvName }</td>
                    				<td>${ p.media.mediaTtl }</td>
                    			</c:when>
                    			<c:when test="${ p.cart.pcode ne 0 }">
		                    		<!-- 상품사진 -->
		                    		<td>
		                    		${ p.att.attSvName }
		                    		</td>
		                    		<td>${ p.store.pname }</td><!-- 주문상품정보 -->
                    			</c:when>
                    		</c:choose>
                    		
<%-- style="white-space:pre-wrap; word_wrap:break-word; word-break: break-all;" pre처럼 --%>                    		
                    		<td style="white-space:pre-wrap; word_wrap:break-word; word-break: break-all;"
                    		>${ p.cart.buyPrice }원
(${ p.cart.buyQ }개)</td><!-- 금액(수량) -->
                    		<td>
	                    		<c:choose>
	<%--                     		${ p.payment.payStatus } --%>
	                    			<c:when test="${ p.payment.payStatus == 1}">
	                    				결제완료
	                    			</c:when>
	                    			<c:when test="${ p.payment.payStatus == 2}">
	                    				구매확정
	                    			</c:when>
	                    			<c:when test="${ p.payment.payStatus == 3}">
	                    				환불진행
	                    			</c:when>
	                    			<c:when test="${ p.payment.payStatus == 4}">
	                    				환불완료
	                    			</c:when>
	                    			<c:when test="${ p.payment.payStatus == 5}">
	                    				환불진행
	                    			</c:when>
	                    			<c:when test="${ p.payment.payStatus == 6}">
	                    				환불완료
	                    			</c:when>
	                    		</c:choose>
                    		</td><!-- 주문상태 -->
                    		<td>
                    			<div class="mypage-user-pay-btn-div"><!--수정 class로-->
                    			<c:choose>
                   					<c:when test="${ p.cart.pcode eq 0 }">
	                                    <button onclick="confirmMStatus('${ p.cart.cartCode}','${ p.payment.payStatus }')">구매확정</button>
	                                    <button onclick="mediarefund()">환불신청</button>
	                                    
                   					</c:when>
                   					<c:when test="${ p.cart.pcode ne 0}">
	                                    <button onclick="confirmSStatus('${ p.cart.cartCode }','${ p.payment.payStatus }')">구매확정</button>
	                                    <button onclick="refundSStatus('${ p.cart.cartCode }','${ p.payment.payStatus }')) ">환불신청</button>
									</c:when>
                    			</c:choose>
                                </div>
                    		</td><!-- 확인/취소/리뷰 버튼 -->
                    		
                    	</tr>
                    	</c:forEach>
<!--                         하나라도 구매한 제품이있다면 c:if문안에 for문 바깥에 리뷰작성 테이블도 같이 생성. -->
                        <tr>
                            <td colspan="6" ><button type="button" onclick="javascript:location.href='${contextPath}/store/collectionStore'">리뷰작성</button></td>
                        </tr>
                    </table>
            		<!-- 나중에 페이징처리 따로 -->
            		<div class="mypage-pagination-area">
						<!-- [이전] -->
						<c:if test="${ pi.currentPage <= 1 }">
							&lt; &nbsp;
						</c:if>
<!-- 숨기면안되나?						 -->
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="/mypage/user/payments">
								<c:param name="page" value="${ pi.currentPage - 1 }"/>
							</c:url>
							<a href="${ before }"> &lt; </a> &nbsp;
						</c:if>
						
						<!-- 페이지 숫자 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<b>[${ p }]</b>								
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="/mypage/user/payments">
									<c:param name="page" value="${ p }"/>
								</c:url>
								<a href="${ pagination }">${ p }</a>
							</c:if>
						</c:forEach>
						
						<!-- [다음] -->
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							&nbsp; &gt;
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="/mypage/user/payments">
								<c:param name="page" value="${ pi.currentPage + 1 }" />
							</c:url>
							<a href="${ after }">&gt;</a>
						</c:if>
            		</div>
            
            
            	</div>
            </div>
        </article>
	
<!-- 	메뉴 -->
	<jsp:include page="menu.jsp"/>
	</section>
<script>
$(document).ready(function(){
    console.log("메소드 동작");
    
    $("#mypageMenuBtn").children().removeClass("mypage-btn-DN");
    console.log("removeClass 동작");
    
    $("#mypageMenuBtn").children().eq(7).addClass("mypage-btn-DN");
    console.log("addClass 동작");
    
});
// 구매확정 (store)
function confirmSStatus(Cartcode,payStatus){
	// Cartcode받아서 해당 글 업데이트  
	// 단, 결제완료(1)인 상태와 환불진행중인 경우에만 가능
	if(payStatus == 1){
		if(confirm("구매확정을 하시겠습니까?")){
			console.log("구매확정 " + Cartcode);
			
			location.href='${contextPath}/mypage/user/payments/update?Cartcode=' + 'S-' + Cartcode + '&paystatus=2';
			console.log("구매확정 완료")
			// 확정으로 업데이트 하기
			
			alert("구매가 확정되었습니다.");
		}else{
			console.log("구매확정 취소");
			alert("구매확정이 취소되었습니다.");
		}
		
	}else if(payStatus == 2){
		alert("이미 구매확정된 상품입니다.")
	}else if(payStatus == 3){
		if(confirm("환불진행중인 상품입니다. 환불신청을 취소하고 구매확정을 하시겠습니까?")){
			location.href='${contextPath}/mypage/user/payments/update?Cartcode=' + 'S-' + Cartcode + '&paystatus=2';
		}else{
			alert("구매확정이 취소되었습니다.");
		}
	}else {
		alert("구매확정이 불가능한 상품입니다.");
	}
}
// 구매확정 (media 둘다 옴)
function confirmMStatus(Cartcode,payStatus){
	// bcode받아서 해당 글 업데이트  
	// 단, 결제완료(1)인 상태와 환불진행중인 경우에만 가능
	if(payStatus == 1){
		if(confirm("구매확정을 하시겠습니까?")){
			console.log("구매확정 " + Cartcode);
			
			location.href='${contextPath}/mypage/user/payments/update?Cartcode=' + 'M-' + Cartcode + '&paystatus=2';
			console.log("구매확정 완료")
			// 확정으로 업데이트 하기
			
			alert("구매가 확정되었습니다.");
		}else{
			console.log("구매확정 취소");
			alert("구매확정이 취소되었습니다.");
		}
		
	}else if(payStatus == 2){
		alert("이미 구매확정된 상품입니다.")
	}else {
		alert("구매확정이 불가능한 상품입니다.");
	}
}
// 환불신청(store만 가능)  --> 상태 3으로 + R로
function refundSStatus(Cartcode){
	// bcode받아서 해당 글 업데이트 
	// 단, 결제완료인 상태에만  
	if(payStatus == 1){
		if(confirm("환불 신청을 하시겠습니까?")){
			console.log("환불신청 " + Cartcode);
			
			// 해당 게시글을 갖고 요청  // 페이지값과 status도 줘야할듯?
			location.href='${contextPath}/mypage/user/payments/update?Cartcode=' + 'S-' + Cartcode + '&paystatus=3';
			
			console.log("구매확정 완료")
			// 확정으로 업데이트 하기
			
			alert("환불신청이 완료되었습니다.");
		}else{
			console.log("환불신청 취소");
			alert("환불신청이 취소되었습니다.");
		}
	}
//환불신청을 한 후에 결제완료로 다시 바꾸기
// 	else if(payStatus == 3){
// 		if(confirm("환불신청을 취소하시겠습니까?")){
// 			location.href='${contextPath}/mypage/user/payments/update?Cartcode=' + Cartcode + '&paystatus=1';		
// 			alert("환불신청이 취소되었습니다.");
// 		}
// 	}
	else{
		alert("환불신청이 불가능합니다.");
	}
}

// 미디어 환불 불가 알람
function mediarefund(){
	alert("미디어 상품은 환불이 불가합니다.");
}
</script>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paylist</title>
</head>
    <c:if test="${ loginUser.classifyMem == '4' }">
<body>
	<!-- 네비바 -->
	<jsp:include page="../../common/navbar.jsp"/>
	
    <!-- 밑에 섹션 -->
    <section id="mypageAdminSection">
    
        <!-- 왼쪽메뉴 -->
        <article id="mypageAdminMenu">
        	<jsp:include page="adminMenu.jsp"/>
        </article>


         <!-- 오른쪽 테이블 -->
        <article id="mypageContent">
            <h3>결제내역</h3>
            <table id="mypageAdminpaylist">
                <thead>
                    <tr>
                        <th>결제일</th>
                        <th>아이디</th>
                        <th>결제수단</th>
                        <th>상품명</th>
                        <th>결제가격</th>
                        <th>결제상태</th>
                        <th>응답</th>
                    </tr>
                </thead>

                <tbody>
                	<c:forEach var="p" items="${ list }">
                	<tr>
                		<c:set var="date" value="<%= new Date() %>"/>
                    	<td><fmt:formatDate type="date" value="${ p.payment.payDate }"/></td><!-- 결제일 -->
                    	<td>${ p.cart.id }</td><!-- 아이디 -->
                    	<td>
                    		<c:choose>
                    			<c:when test="${ p.payment.payMethod eq 'kakaopay_card' }">
                    				카카오페이
                    			</c:when>
                    			<c:otherwise>
                    				기타
                    			</c:otherwise>
                    		</c:choose>
<%--                     	${ p.payment.payMethod } --%>
                    	</td><!-- 결제수단 -->
                    	<td>
                    		<c:choose>
                    			<c:when test="${ p.cart.pcode eq 0 }">
                    				${ p.media.mediaTtl }
                    			</c:when>
                    			<c:when test="${ p.cart.pcode ne 0 }">
		                    		${ p.store.pname }
                    			</c:when>
                    		</c:choose>
                    	</td><!-- 상품명 -->
                    	<td>${ p.cart.buyPrice }</td><!-- 결제가격 -->
                    	<td>
							<c:choose>
<%-- 	                    		${ p.cart.isBought } --%>
									<c:when test="${ p.cart.isBought == 'Y' }">
										결제완료
									</c:when>
									<c:when test="${ p.cart.isBought == 'W' }">
										환불신청
									</c:when>
									<c:when test="${ p.cart.isBought == 'R' }">
										환불완료
									</c:when>
									<c:when test="${ p.cart.isBought == 'C' }">
										구매확정
									</c:when>
	                    		</c:choose>
						</td><!-- 결제상태 -->
                    	<td></td><!-- 응답 -->
                    	<input type="hidden" id="cartcode" value="${ p.cart.cartCode }" >
                    	<input type="hidden" id="cartcode" value="${ p.cart.payCode }" >
<%--                     	<input type="hidden" value="${ p.cart.cartCode }" style="display:none;"> --%>
                    	
                	</tr>
                	</c:forEach>
                </tbody>
            </table>
                    <!-- 나중에 페이징처리 따로 -->
            		<div class="mypage-pagination-area">
						<!-- [이전] -->
						<c:if test="${ pi.currentPage <= 1 }">
							&lt; &nbsp;
						</c:if>
<!-- 숨기면안되나?						 -->
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="/mypage/admin/paylist">
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
								<c:url var="pagination" value="/mypage/admin/paylist">
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
							<c:url var="after" value="/mypage/admin/paylist">
								<c:param name="page" value="${ pi.currentPage + 1 }" />
							</c:url>
							<a href="${ after }">&gt;</a>
						</c:if>
            		</div>
        </article>
    </section>
    <script>
    $(document).ready(function() {
	    $("#mypageAdminpaylist tbody tr").click(function cancelPay(){
	    	console.log("cancelPay 클릭메소드 작동");
	    });
    });
    
    function cancelPay() {
	    	console.log("cancelPay 메소드가 작동");
        jQuery.ajax({
          "url": "http://www.myservice.com/payments/cancel",
          "type": "POST",
          "contentType": "application/json",
          "data": JSON.stringify({
            "merchant_uid": "mid_" + new Date().getTime(), // 주문번호
            "cancel_request_amount": 2000, // 환불금액
            "reason": "테스트 결제 환불", // 환불사유
            "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
            "refund_bank": "88", // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(ex. KG이니시스의 경우 신한은행은 88번)
            "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
          }),
          "dataType": "json"
        });
      }
    
    //결제정보 조회
    var mid = '${mId}'; 
    // 서버에서 발급받은 결제 고유번호
    var money = ${pInfo.money}; 
    // 결제금액 ( 서버에서 RestAPI를 통해서 결제번호로 금액변조를 방지함) 
    var point = $ {userPoint}; 
    // 고객 맴버십 포인트 정보 
    function paymentDo() {
    	$.ajax({ 
    		type: "get", 
    		url: "/civ/payment/checkseat", // 최종 결제전에 마지막으로 해당 좌석이 예매가능한 상태인지 확인 요청 
    		data: {
    			'scheduleCode': ${pInfo.scheduleCode}, // 구매하려는 스케줄 코드 
    			'checkSeat': '${pInfo.checkSeat}' // 확인 좌석 
    			}, 
    		success: function(data) {
    			if (data) {
    				var IMP = window.IMP;
    				IMP.init('imp93258645');// 아임포트 라이브러리를 통해서 가맹점정보를 불러옴 
    				IMP.request_pay({ 
    					pg: 'html5_inicis', // 웹 표준 결제 
    					pay_method: $(":input:radio[name=paycard]:checked").val(), //결제수단
    					merchant_uid: mid, // 결제 고유번호 
    					name: '테스트 주문', // 결제 상품 이름 
    					amount: money, // 결제금액 ( RestAPI를 호출한 상태이기 때문에 금액 변조시 결제창이 뜨지 않고 오류 ) 
    					buyer_tel: '${sessionScope.loginInfo.userPhone}' // 유저 전화번호 ( 필수 )
    					}, function(rsp) { // 콜백 함수 
    						if (rsp.success) { 
    							// 결제 정보를 form에 담음 
    							$('#checkSeat').val('${pInfo.checkSeat}'); 
    							$('#merchant_uid').val(rsp.merchant_uid); 
    							$('#paid_amount').val(rsp.paid_amount); 
    							$('#pay_method').val(rsp.pay_method); 
    							var queryString = $("#form").serialize(); 
    							$.ajax({ 
    								type: "post", 
    								url: "/civ/payment/paid", //최종 결제정보를 서버로 전달 
    								data: queryString, 
    								success: function(data) {
    									if (data == "failed") {
    										alert('결제 실패'); 
    										} else {
    											// 성공시 웹소켓을 사용해서 해당 스케줄을 보고있는 사람들에게도 좌석 정보를 업데이트 
    											var webSocket = 
    												new WebSocket("ws://192.168.219.101/civ/websocket/${pInfo.scheduleCode}"); 
    											webSocket.onopen = () => webSocket.send(data); 
    											webSocket.onclose = function(message) { 
    												disconnect();
    												};
    												function disconnect() {
    													webSocket.close(); 
    													}
    												// 결제 확인창으로 이동 
    												location.href = "/civ/payment/payok"; 
    												}
    									}
    							}) 
    						} else {
    							alert('결제 실패하셨습니다.'); 
    							} 
    					}); 
    				} else {
    					alert('결제 오류'); 
    					}
    			} 
    		}); 
    	}


    </script>
    </c:if>
    <c:if test="${ loginUser.classifyMem != '4' }">
    	<jsp:include page="errorpage.jsp"></jsp:include>
    </c:if>
</body>
</html>
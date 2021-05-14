<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>paylist</title>
</head>
    <c:if test="${ loginUser.classifyMem == '4' }">
<body>
	<!-- 네비바 -->
	<jsp:include page="../../common/navbar.jsp"/>
	
		<!--소속사 정보 등록창 -->
	<jsp:include page="insertAgency.jsp"/>
	
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
                	<c:if test="${ empty list }">
                		<tr><td colspan=7>결제내역이 없습니다.</td></tr>
                	</c:if>
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
    


    </script>
    </c:if>
    <c:if test="${ loginUser.classifyMem != '4' }">
    	<jsp:include page="errorpage.jsp"></jsp:include>
    </c:if>
</body>
</html>
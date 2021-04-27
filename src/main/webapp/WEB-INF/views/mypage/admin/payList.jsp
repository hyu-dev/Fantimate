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
                    	
                    	
                	</tr>
                	</c:forEach>
<!--                     <tr> -->
<!--                         <td>2021.01.01</td> -->
<!--                         <td>cheonsik2323</td> -->
<!--                         <td>신용카드</td> -->
<!--                         <td>The 3st Album - Dark & Wild</td> -->
<!--                         <td>18,000</td> -->
<!--                         <td>구매확정</td> -->
<!--                         <td>환불하기</td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>2021.01.01</td> -->
<!--                         <td>cheonsik2323</td> -->
<!--                         <td>신용카드</td> -->
<!--                         <td>The 3st Album - Dark & Wild</td> -->
<!--                         <td>18,000</td> -->
<!--                         <td>구매확정</td> -->
<!--                         <td>환불하기</td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>2021.01.01</td> -->
<!--                         <td>cheonsik2323</td> -->
<!--                         <td>신용카드</td> -->
<!--                         <td>The 3st Album - Dark & Wild</td> -->
<!--                         <td>18,000</td> -->
<!--                         <td>구매확정</td> -->
<!--                         <td>환불하기</td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>2021.01.01</td> -->
<!--                         <td>cheonsik2323</td> -->
<!--                         <td>신용카드</td> -->
<!--                         <td>The 3st Album - Dark & Wild</td> -->
<!--                         <td>18,000</td> -->
<!--                         <td>구매확정</td> -->
<!--                         <td>환불하기</td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>2021.01.01</td> -->
<!--                         <td>cheonsik2323</td> -->
<!--                         <td>신용카드</td> -->
<!--                         <td>The 3st Album - Dark & Wild</td> -->
<!--                         <td>18,000</td> -->
<!--                         <td>구매확정</td> -->
<!--                         <td>환불하기</td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>2021.01.01</td> -->
<!--                         <td>cheonsik2323</td> -->
<!--                         <td>신용카드</td> -->
<!--                         <td>The 3st Album - Dark & Wild</td> -->
<!--                         <td>18,000</td> -->
<!--                         <td>구매확정</td> -->
<!--                         <td>환불하기</td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>2021.01.01</td> -->
<!--                         <td>cheonsik2323</td> -->
<!--                         <td>신용카드</td> -->
<!--                         <td>The 3st Album - Dark & Wild</td> -->
<!--                         <td>18,000</td> -->
<!--                         <td>구매확정</td> -->
<!--                         <td>환불하기</td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>2021.01.01</td> -->
<!--                         <td>cheonsik2323</td> -->
<!--                         <td>신용카드</td> -->
<!--                         <td>The 3st Album - Dark & Wild</td> -->
<!--                         <td>18,000</td> -->
<!--                         <td>구매확정</td> -->
<!--                         <td>환불하기</td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>2021.01.01</td> -->
<!--                         <td>cheonsik2323</td> -->
<!--                         <td>신용카드</td> -->
<!--                         <td>The 3st Album - Dark & Wild</td> -->
<!--                         <td>18,000</td> -->
<!--                         <td>구매확정</td> -->
<!--                         <td>환불하기</td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>2021.01.01</td> -->
<!--                         <td>cheonsik2323</td> -->
<!--                         <td>신용카드</td> -->
<!--                         <td>The 3st Album - Dark & Wild</td> -->
<!--                         <td>18,000</td> -->
<!--                         <td>구매확정</td> -->
<!--                         <td>환불하기</td> -->
<!--                     </tr> -->
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
</body>
</html>
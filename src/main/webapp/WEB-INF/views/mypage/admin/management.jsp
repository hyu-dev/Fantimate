<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>admin notice detail</title>
</head>
    <c:if test="${ loginUser.classifyMem == '4' }">
<body>
<!-- 	<div id="mypageAdminSignInWrap"> -->
	<!-- 네비바 -->
	<jsp:include page="../../common/navbar.jsp"></jsp:include>
	
	<!-- 회원가입창 -->
	<jsp:include page="insertAgency.jsp"/>
	
	<!-- 신고 상세 -->
	<jsp:include page="reportDetail.jsp"/>
		
    <!-- 밑에 섹션 -->
    <section id="mypageAdminSection">
    
        <!-- 왼쪽메뉴 -->
        <article id="mypageAdminMenu">
        	<jsp:include page="adminMenu.jsp"/>
        </article>


        <!-- 오른쪽 테이블 -->
        <article id="mypageContent">
            <h3>회원관리</h3>
            <table id="mypageAdminManage">
                <thead>
                    <tr>
                        <th>활동상태</th>
                        <th>회원유형</th>
                        <th>아이디</th>
                        <th>이름</th>		<!-- 연락처가 낫나 -->
                        <th>가입일</th>
<!--                         <th>활동정지일</th> -->
                        <th>활동재개일</th>
                    </tr>
                </thead>

                <tbody>
                	<c:forEach var="m" items="${ list }">
                	<tr onclick="updateUser('${ m.common.id }','${ m.common.status }','${ m.common.classifyMem }')">
                		<td>
	                		<c:if test="${ m.common.status eq 'Y' }">
	                			활동중
	                		</c:if>
	                		<c:if test="${ m.common.status eq 'N' }">
	                			활동정지
	                		</c:if>
                		</td>	<!-- 활동상태 -->
                		<td>
                		<c:if test="${ m.common.classifyMem eq '1' }">
                			일반회원
                		</c:if>
                		<c:if test="${ m.common.classifyMem eq '2' }">
                			아티스트회원
                		</c:if>
                		<c:if test="${ m.common.classifyMem eq '3' }">
                			소속사
                		</c:if></td>		<!-- 회원유형 -->
                		<td>${ m.common.id }</td>		<!-- 아이디 -->
                		<td>${ m.common.name }</td>		<!-- 연락처/이름? -->
                		<c:set var="date" value="<%= new Date() %>"/>
                		<td><fmt:formatDate type="date" value="${ m.common.signupDate }"/></td>		<!-- 가입일 -->
                		<!-- 활동정지일 -->
                		<td>
							<c:if test="${ not empty m.user.ususpendEnd }">
								<c:set var="date" value="<%= new Date() %>"/>
								<fmt:formatDate type="date" value="${ m.user.ususpendEnd }"/>
							</c:if>
                		</td>		
                	</tr>
                	</c:forEach>
<!--                     <tr> -->
<!--                         <td>222</td> -->
<!--                         <td>아티스트</td> -->
<!--                         <td>manager22</td> -->
<!--                         <td>010-1234-1234</td> -->
<!--                         <td>2021.03.14</td> -->
<!--                         <td>2021.03.14</td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>222</td> -->
<!--                         <td>아티스트</td> -->
<!--                         <td>manager22</td> -->
<!--                         <td>010-1234-1234</td> -->
<!--                         <td>2021.03.14</td> -->
<!--                         <td>2021.03.14</td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>222</td> -->
<!--                         <td>아티스트</td> -->
<!--                         <td>manager22</td> -->
<!--                         <td>010-1234-1234</td> -->
<!--                         <td>2021.03.14</td> -->
<!--                         <td>2021.03.14</td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>222</td> -->
<!--                         <td>아티스트</td> -->
<!--                         <td>manager22</td> -->
<!--                         <td>010-1234-1234</td> -->
<!--                         <td>2021.03.14</td> -->
<!--                         <td>2021.03.14</td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>222</td> -->
<!--                         <td>아티스트</td> -->
<!--                         <td>manager22</td> -->
<!--                         <td>010-1234-1234</td> -->
<!--                         <td>2021.03.14</td> -->
<!--                         <td>2021.03.14</td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>222</td> -->
<!--                         <td>아티스트</td> -->
<!--                         <td>manager22</td> -->
<!--                         <td>010-1234-1234</td> -->
<!--                         <td>2021.03.14</td> -->
<!--                         <td>2021.03.14</td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>222</td> -->
<!--                         <td>아티스트</td> -->
<!--                         <td>manager22</td> -->
<!--                         <td>010-1234-1234</td> -->
<!--                         <td>2021.03.14</td> -->
<!--                         <td>2021.03.14</td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>222</td> -->
<!--                         <td>아티스트</td> -->
<!--                         <td>manager22</td> -->
<!--                         <td>010-1234-1234</td> -->
<!--                         <td>2021.03.14</td> -->
<!--                         <td>2021.03.14</td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>222</td> -->
<!--                         <td>아티스트</td> -->
<!--                         <td>manager22</td> -->
<!--                         <td>010-1234-1234</td> -->
<!--                         <td>2021.03.14</td> -->
<!--                         <td>2021.03.14</td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>222</td> -->
<!--                         <td>아티스트</td> -->
<!--                         <td>manager22</td> -->
<!--                         <td>010-1234-1234</td> -->
<!--                         <td>2021.03.14</td> -->
<!--                         <td>2021.03.14</td> -->
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
							<c:url var="before" value="/mypage/admin/management">
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
								<c:url var="pagination" value="/mypage/admin/management">
									<c:param name="page" value="${ p }"/>
								</c:url>
								<a href="${ pagination }">${ p }</a>
							</c:if>
						</c:forEach>
						
						<!-- [다음] -->
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							&gt;
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="/mypage/admin/management">
								<c:param name="page" value="${ pi.currentPage + 1 }" />
							</c:url>
							<a href="${ after }">&gt;</a>
						</c:if>
            </div>
        </article>
    </section>
    <script>
    	function updateUser(userid, status, memType){
    		if(memType == 1){
	    		// 활동중인 회원 정지하기
	    		if(status == "Y"){
	    			if(confirm("회원을 정지하시겠습니까?")){
	    				var userInput = prompt("정지할 일수를 입력하세요.");
	    				if(userInput != null){
	    				location.href='${contextPath}/mypage/admin/management/update?userid=' + userid + '&page=${ pi.currentPage }&status=' + "N&reportDate=" + userInput;
	    				}else if(userInput == null){
	    					alert("공백은 입력할 수 없습니다.");
	    				}else{
	    					alert("정지를 취소하였습니다.");
	    				}
	    			}else{
	    					alert("정지를 취소하였습니다.");
	    			}
	    		// 정지중인회원 정지 풀기
	    		}else if(status == "N"){
					if(confirm("정지를 푸시겠습니까?")){
	    				location.href='${contextPath}/mypage/admin/management/update?userid=' + userid + '&page=${ pi.currentPage }&status=' + "Y";
	    			}else{
	    				alert("취소하였습니다.")
	    			}
	    			
	    		}else{
	    			alert("뭐여이건 콘솔확인");
	    			console.log(status);
	    		}
    		}
    	}
    </script>
    </c:if>
        <c:if test="${ loginUser.classifyMem != '4' }">
    	<jsp:include page="errorpage.jsp"></jsp:include>
    </c:if>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paylist</title>
</head>
<body>
	<!-- 네비바 -->
	<jsp:include page="../../common/navbar.jsp"/>
	
	<!--소속사 정보 등록창 -->
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
                    <tr>
                        <td>활동중</td>
                        <td>cheonsik2323</td>
                        <td>신용카드</td>
                        <td>The 3st Album - Dark & Wild</td>
                        <td>18,000</td>
                        <td>구매확정</td>
                        <td>환불하기</td>
                    </tr>
                    <tr>
                        <td>2021.01.01</td>
                        <td>cheonsik2323</td>
                        <td>신용카드</td>
                        <td>The 3st Album - Dark & Wild</td>
                        <td>18,000</td>
                        <td>구매확정</td>
                        <td>환불하기</td>
                    </tr>
                    <tr>
                        <td>2021.01.01</td>
                        <td>cheonsik2323</td>
                        <td>신용카드</td>
                        <td>The 3st Album - Dark & Wild</td>
                        <td>18,000</td>
                        <td>구매확정</td>
                        <td>환불하기</td>
                    </tr>
                    <tr>
                        <td>2021.01.01</td>
                        <td>cheonsik2323</td>
                        <td>신용카드</td>
                        <td>The 3st Album - Dark & Wild</td>
                        <td>18,000</td>
                        <td>구매확정</td>
                        <td>환불하기</td>
                    </tr>
                    <tr>
                        <td>2021.01.01</td>
                        <td>cheonsik2323</td>
                        <td>신용카드</td>
                        <td>The 3st Album - Dark & Wild</td>
                        <td>18,000</td>
                        <td>구매확정</td>
                        <td>환불하기</td>
                    </tr>
                    <tr>
                        <td>2021.01.01</td>
                        <td>cheonsik2323</td>
                        <td>신용카드</td>
                        <td>The 3st Album - Dark & Wild</td>
                        <td>18,000</td>
                        <td>구매확정</td>
                        <td>환불하기</td>
                    </tr>
                    <tr>
                        <td>2021.01.01</td>
                        <td>cheonsik2323</td>
                        <td>신용카드</td>
                        <td>The 3st Album - Dark & Wild</td>
                        <td>18,000</td>
                        <td>구매확정</td>
                        <td>환불하기</td>
                    </tr>
                    <tr>
                        <td>2021.01.01</td>
                        <td>cheonsik2323</td>
                        <td>신용카드</td>
                        <td>The 3st Album - Dark & Wild</td>
                        <td>18,000</td>
                        <td>구매확정</td>
                        <td>환불하기</td>
                    </tr>
                    <tr>
                        <td>2021.01.01</td>
                        <td>cheonsik2323</td>
                        <td>신용카드</td>
                        <td>The 3st Album - Dark & Wild</td>
                        <td>18,000</td>
                        <td>구매확정</td>
                        <td>환불하기</td>
                    </tr>
                    <tr>
                        <td>2021.01.01</td>
                        <td>cheonsik2323</td>
                        <td>신용카드</td>
                        <td>The 3st Album - Dark & Wild</td>
                        <td>18,000</td>
                        <td>구매확정</td>
                        <td>환불하기</td>
                    </tr>
                </tbody>
            </table>
            <!-- 나중에 페이징처리 따로 -->
            <p style="text-align: center; margin-top: 50px;"> &lt;&lt;&nbsp; &lt;&nbsp; 1  2  3  4  5  6  7  8  9  10 &nbsp;&gt; &nbsp;&gt;&gt;</p>
        </article>
    </section>
</body>
</html>
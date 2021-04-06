<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>report</title>
</head>
<body>
	<!-- 네비바 -->
	<jsp:include page="../../common/navbar.jsp"></jsp:include>
<%-- 	<jsp:include page="${ contextPath }'WEB-INF/views/common/navbar.jsp'"></jsp:include> --%>

	<!-- 밑에 섹션 -->
	<section id="mypageAdminSection">
	
        <!-- 왼쪽메뉴 -->
        <article id="mypageAdminMenu">
        	<jsp:include page="adminMenu.jsp"/>
        </article>


        <!-- 오른쪽 테이블 -->
        <article id="mypageContent">
            <h3>신고내역</h3>
            <table id="mypageAdminReportlist">
                <thead>
                    <tr>
                        <th>신고날짜</th>
                        <th>신고인</th>
                        <th>피의자</th>
                        <th>신고 게시물 정보</th>
                        <th>신고유형</th>
                        <th>주소</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>2021.01.01</td>
                        <td>cheonsik2323</td>
                        <td>badman</td>
                        <td>✅️파워볼✅️사설토토사이트✓✅바다이야기</td>
                        <td>불법게시물</td>
                        <td><a href="#">링크</a></td>
                    </tr>

                    <tr>
                        <td>2021.01.01</td>
                        <td>cheonsik2323</td>
                        <td>badman</td>
                        <td>✅️파워볼✅️사설토토사이트✓✅바다이야기</td>
                        <td>불법게시물</td>
                        <td><a href="#">링크</a></td>
                    </tr>
                    <tr>
                        <td>2021.01.01</td>
                        <td>cheonsik2323</td>
                        <td>badman</td>
                        <td>✅️파워볼✅️사설토토사이트✓✅바다이야기</td>
                        <td>불법게시물</td>
                        <td><a href="#">링크</a></td>
                    </tr>
                    <tr>
                        <td>2021.01.01</td>
                        <td>cheonsik2323</td>
                        <td>badman</td>
                        <td>✅️파워볼✅️사설토토사이트✓✅바다이야기</td>
                        <td>불법게시물</td>
                        <td><a href="#">링크</a></td>
                    </tr>
                    <tr>
                        <td>2021.01.01</td>
                        <td>cheonsik2323</td>
                        <td>badman</td>
                        <td>✅️파워볼✅️사설토토사이트✓✅바다이야기</td>
                        <td>불법게시물</td>
                        <td><a href="#">링크</a></td>
                    </tr>
                    <tr>
                        <td>2021.01.01</td>
                        <td>cheonsik2323</td>
                        <td>badman</td>
                        <td>✅️파워볼✅️사설토토사이트✓✅바다이야기</td>
                        <td>불법게시물</td>
                        <td><a href="#">링크</a></td>
                    </tr>
                    <tr>
                        <td>2021.01.01</td>
                        <td>cheonsik2323</td>
                        <td>badman</td>
                        <td>✅️파워볼✅️사설토토사이트✓✅바다이야기</td>
                        <td>불법게시물</td>
                        <td><a href="#">링크</a></td>
                    </tr>
                    <tr>
                        <td>2021.01.01</td>
                        <td>cheonsik2323</td>
                        <td>badman</td>
                        <td>✅️파워볼✅️사설토토사이트✓✅바다이야기</td>
                        <td>불법게시물</td>
                        <td><a href="#">링크</a></td>
                    </tr>
                    <tr>
                        <td>2021.01.01</td>
                        <td>cheonsik2323</td>
                        <td>badman</td>
                        <td>✅️파워볼✅️사설토토사이트✓✅바다이야기</td>
                        <td>불법게시물</td>
                        <td><a href="#">링크</a></td>
                    </tr>
                    <tr>
                        <td>2021.01.01</td>
                        <td>cheonsik2323</td>
                        <td>badman</td>
                        <td>✅️파워볼✅️사설토토사이트✓✅바다이야기</td>
                        <td>불법게시물</td>
                        <td><a href="#">링크</a></td>
                    </tr>
                </tbody>
            </table>
            <!-- 나중에 페이징처리 따로 -->
            <p style="text-align: center; margin-top: 50px;"> &lt;&lt;&nbsp; &lt;&nbsp; 1  2  3  4  5  6  7  8  9  10 &nbsp;&gt; &nbsp;&gt;&gt;</p>
        </article>
    </section>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin notice detail</title>
</head>
<body>
<!-- 	<div id="mypageAdminSignInWrap"> -->
	<!-- 네비바 -->
	<jsp:include page="../../common/navbar.jsp"></jsp:include>
	
	<!-- 회원가입창 -->
	<jsp:include page="insertAgency.jsp"/>
	
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
                        <th>연락처</th>
                        <th>가입일</th>
                        <th>활동정지일</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>222</td>
                        <td>아티스트</td>
                        <td>manager22</td>
                        <td>010-1234-1234</td>
                        <td>2021.03.14</td>
                        <td>2021.03.14</td>
                    </tr>
                    <tr>
                        <td>222</td>
                        <td>아티스트</td>
                        <td>manager22</td>
                        <td>010-1234-1234</td>
                        <td>2021.03.14</td>
                        <td>2021.03.14</td>
                    </tr>
                    <tr>
                        <td>222</td>
                        <td>아티스트</td>
                        <td>manager22</td>
                        <td>010-1234-1234</td>
                        <td>2021.03.14</td>
                        <td>2021.03.14</td>
                    </tr>
                    <tr>
                        <td>222</td>
                        <td>아티스트</td>
                        <td>manager22</td>
                        <td>010-1234-1234</td>
                        <td>2021.03.14</td>
                        <td>2021.03.14</td>
                    </tr>
                    <tr>
                        <td>222</td>
                        <td>아티스트</td>
                        <td>manager22</td>
                        <td>010-1234-1234</td>
                        <td>2021.03.14</td>
                        <td>2021.03.14</td>
                    </tr>
                    <tr>
                        <td>222</td>
                        <td>아티스트</td>
                        <td>manager22</td>
                        <td>010-1234-1234</td>
                        <td>2021.03.14</td>
                        <td>2021.03.14</td>
                    </tr>
                    <tr>
                        <td>222</td>
                        <td>아티스트</td>
                        <td>manager22</td>
                        <td>010-1234-1234</td>
                        <td>2021.03.14</td>
                        <td>2021.03.14</td>
                    </tr>
                    <tr>
                        <td>222</td>
                        <td>아티스트</td>
                        <td>manager22</td>
                        <td>010-1234-1234</td>
                        <td>2021.03.14</td>
                        <td>2021.03.14</td>
                    </tr>
                    <tr>
                        <td>222</td>
                        <td>아티스트</td>
                        <td>manager22</td>
                        <td>010-1234-1234</td>
                        <td>2021.03.14</td>
                        <td>2021.03.14</td>
                    </tr>
                    <tr>
                        <td>222</td>
                        <td>아티스트</td>
                        <td>manager22</td>
                        <td>010-1234-1234</td>
                        <td>2021.03.14</td>
                        <td>2021.03.14</td>
                    </tr>

                </tbody>
            </table>
            

            <!-- 나중에 페이징처리 따로 -->
            <p style="text-align: center; margin-top: 50px;"> &lt;&lt;&nbsp; &lt;&nbsp; 1  2  3  4  5  6  7  8  9  10 &nbsp;&gt; &nbsp;&gt;&gt;</p>
        </article>
    </section>
<!--     </div> -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin notice detail</title>
</head>
<body>
    <!-- 네비바 --> 
    <header class="main-header">
        <nav class="main-nav">
            <p class="main-logo">FANTIMATE</p>
            <div class="main-search">
                <img src="../resource/seedling-solid.svg" class="nav-icon" alt="">
                <input type="search" class="main-nav-search">
            </div>
            <div class="main-menu">
                <img src="../resource/carrot-solid.svg" alt="" class="nav-icon">
                <img src="../resource/canadian-maple-leaf-brands.svg" alt="" class="nav-icon">
                <img src="../resource/comments-solid.svg" alt="" class="nav-icon">
                <img src="../resource/headphones-alt-solid.svg" alt="" class="nav-icon">
                <img src="../resource/pagelines-brands.svg" alt="" class="nav-icon">
            </div>
        </nav>
    </header>

    <!-- 밑에 섹션 -->
    <section id="mypageAdminSection">
        <!-- 왼쪽메뉴 -->
        <article id="mypageAdminMenu">
            <div id="mypageAdminMenuDiv">
                <!-- <h2 id="mypageUserContentDivTitle">My Subscribes</h2> -->
                <h2>Menu</h2>
                    <ul>
                        <li><a href="#">소속사등록</a></li>
                        <li><a href="#">신고관리</a></li>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">회원관리</a></li>
                        <li><a href="#">결제내역</a></li>
                    </ul>
            </div>
        </article>


        <!-- 오른쪽 테이블 -->
        <article id="mypageContent">
            <h3>공지사항</h3>
            <div></div>
            <table id="mypageAdminNotice">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>날짜</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>222</td>
                        <td>카카오페이 시스템 점검으로 인한 서비스 일시중단 안내</td>
                        <td>2021.03.14</td>
                    </tr>
                    <tr>
                        <td>221</td>
                        <td>외화보험 시스템 이관 작업에 따른 서비스 일시중단 안내</td>
                        <td>2021.03.14</td>
                    </tr>
                    <tr>
                        <td>220</td>
                        <td>전자금융거래 이용약관 변경안내</td>
                        <td>2021.03.14</td>
                    </tr>
                    <tr>
                        <td>219</td>
                        <td>국민카드 오픈API 시스템 작업에 따른 일부 서비스 중단 안내</td>
                        <td>2021.03.14</td>
                    </tr>
                    <tr>
                        <td>218</td>
                        <td>네트워크 장비 교체에 따른 서비스 일시중단 안내</td>
                        <td>2021.03.14</td>
                    </tr>
                    <tr>
                        <td>217</td>
                        <td>은행 전산시스템 업그레이드에 따른 업무 일시중단안내</td>
                        <td>2021.03.14</td>
                    </tr>
                    <tr>
                        <td>216</td>
                        <td>모바일인증서 로그인 서비스 일시 중단안내</td>
                        <td>2021.03.14</td>
                    </tr>

                </tbody>
            </table>
            <button>글쓰기</button>
            <!-- 나중에 페이징처리 따로 -->
            <p style="text-align: center; margin-top: 50px;"> &lt;&lt;&nbsp; &lt;&nbsp; 1  2  3  4  5  6  7  8  9  10 &nbsp;&gt; &nbsp;&gt;&gt;</p>
        </article>
    </section>
</body>
</html>
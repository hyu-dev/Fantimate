<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resource/font/font.css">
    <link rel="stylesheet" href="jw.css">
    <title>My Payments</title>
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

    <!-- 프로필 -->
    <section id="mypageUserProfile">
        <div id="mypageUserProfileWrap">
            <div id="mypageUserProfileImgDiv">
                <img id="mypageUserProfileImg" src="mansik.png">
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
        </div>
    </section>
    
    <!-- 프로필 밑에 섹션 -->
    <section id="mypageUserSection">
        <!-- 왼쪽 -->
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

                        <tr>
                            <td>2021.03.03</td>
                            <td><img src="mansik.png" alt="대체이미지"></td>
                            <td>The 3st Album - Dark & Wild</td>
                            <td>
                                18,000원<br>
                                (1개)
                            </td>
                            <td>결제완료</td>
                            <td>
                                <div class="mypage-user-pay-btn-div"><!--수정 class로-->
                                    <button>구매확정</button>
                                    <button>환불신청</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2021.03.03</td>
                            <td><img src="mansik.png" alt="대체이미지"></td>
                            <td>The 3st Album - Dark & Wild</td>
                            <td>
                                18,000원<br>
                                (1개)
                            </td>
                            <td>결제완료</td>
                            <td>
                                <div class="mypage-user-pay-btn-div"><!--수정 class로-->
                                    <button>구매확정</button>
                                    <button>환불신청</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2021.03.03</td>
                            <td><img src="mansik.png" alt="대체이미지"></td>
                            <td>The 3st Album - Dark & Wild</td>
                            <td>
                                18,000원<br>
                                (1개)
                            </td>
                            <td>결제완료</td>
                            <td>
                                <div class="mypage-user-pay-btn-div"><!--수정 class로-->
                                    <button>구매확정</button>
                                    <button>환불신청</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2021.03.03</td>
                            <td><img src="mansik.png" alt="대체이미지"></td>
                            <td>The 3st Album - Dark & Wild</td>
                            <td>
                                18,000원<br>
                                (1개)
                            </td>
                            <td>결제완료</td>
                            <td>
                                <div class="mypage-user-pay-btn-div"><!--수정 class로-->
                                    <button>구매확정</button>
                                    <button>환불신청</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2021.03.03</td>
                            <td><img src="mansik.png" alt="대체이미지"></td>
                            <td>The 3st Album - Dark & Wild</td>
                            <td>
                                18,000원<br>
                                (1개)
                            </td>
                            <td>결제완료</td>
                            <td>
                                <div class="mypage-user-pay-btn-div"><!--수정 class로-->
                                    <button>구매확정</button>
                                    <button>환불신청</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2021.03.03</td>
                            <td><img src="mansik.png" alt="대체이미지"></td>
                            <td>The 3st Album - Dark & Wild</td>
                            <td>
                                18,000원<br>
                                (1개)
                            </td>
                            <td>결제완료</td>
                            <td>
                                <div class="mypage-user-pay-btn-div"><!--수정 class로-->
                                    <button>구매확정</button>
                                    <button>환불신청</button>
                                </div>
                            </td>
                        </tr>
                        <!-- 하나라도 구매한 제품이있다면 c:if문안에 for문 바깥에 리뷰작성 테이블도 같이 생성. -->
                        <tr>
                            <td colspan="6" ><button>리뷰작성</button></td>
                            
                        </tr>


                    </table>
                </div>
            
            
            
            
            </div>
        </article>
        <!-- 오른쪽 -->
        <article id="mypageMenu">
            <h3 id="mypageMenuTop">MENU</h3>
            <div id="mypageMenuBtn">
                <button href="#" class="mypage-menu-Btn">My Subscribes</button>
                <button class="mypage-menu-Btn">My Dibs</button>
                <button class="mypage-menu-Btn">My Friends</button>
                <button class="mypage-menu-Btn">My Comments</button>
                <button class="mypage-menu-Btn">My Bookmarks</button>
                <button class="mypage-menu-Btn">PayMents</button>
                <button class="mypage-menu-Btn">My FanStore</button>
            </div>
        </article>
    </section>
</body>
</html>
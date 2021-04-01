<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resource/font/font.css">
    <link rel="stylesheet" href="jw.css">
    <title>My Friends_list</title>
</head>
<body>
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
                <h2>My Friends</h2>
                
                <div class="toggle-area">
                    <div class="toggle-switch" tabindex="0">
                        <input type="checkbox" name="my_checkbox" value="yes" id="checkbox-id" />
                        <label for="checkbox-id">
                            <div class="area" aria-hidden="true">
                                <div class="background">
                                    <div class="handle"></div>
                                </div>
                                <p>NEW</p>
                            </div>
                        </label>
                    </div>
                </div>

                <!-- 토글으로 대체.
                <h3 class="mypage-friend-list">친구목록 / </h3>
                <h3 class="mypage-friend-list">친구신청 목록</h3> -->

                    <div class="mypage-content-friends">
                        <img src="mansik.png">
                        <h3>ManSik</h3>
                        <button>친구삭제</button>
                    </div>
                    <div class="mypage-content-friends">
                        <img src="mansik.png">
                        <h3>ManSik</h3>
                        <button>친구삭제</button>
                    </div>
                    <div class="mypage-content-friends">
                        <img src="mansik.png">
                        <h3>ManSik</h3>
                        <button>친구삭제</button>
                    </div>
                    <div class="mypage-content-friends">
                        <img src="mansik.png">
                        <h3>ManSik</h3>
                        <button>친구삭제</button>
                    </div>
                    <div class="mypage-content-friends">
                        <img src="mansik.png">
                        <h3>ManSik</h3>
                        <button>친구삭제</button>
                    </div>
                    <div class="mypage-content-friends">
                        <img src="mansik.png">
                        <h3>ManSik</h3>
                        <button>친구삭제</button>
                    </div>
                    <div class="mypage-content-friends">
                        <img src="mansik.png">
                        <h3>ManSik</h3>
                        <button>친구삭제</button>
                    </div>
                    <div class="mypage-content-friends">
                        <img src="mansik.png">
                        <h3>ManSik</h3>
                        <button>친구삭제</button>
                    </div>
                    <div class="mypage-content-friends">
                        <img src="mansik.png">
                        <h3>ManSik</h3>
                        <button>친구삭제</button>
                    </div>
                    <div class="mypage-content-friends">
                        <img src="mansik.png">
                        <h3>ManSik</h3>
                        <button>친구삭제</button>
                    </div>
                    <div class="mypage-content-friends">
                        <img src="mansik.png">
                        <h3>ManSik</h3>
                        <button>친구삭제</button>
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
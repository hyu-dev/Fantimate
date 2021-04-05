<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/main.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Fantimate</title>
    <script>
    
    </script>
</head>
<body>
	<jsp:include page="navSearch.jsp"></jsp:include>
	 <!-- 메인 페이지 -->
    <section class="mainPage-section">
        <div class="mainPage-artistList">
            <div class="artistList-move" onclick="subscribePage()">            
                <img src="${ contextPath }/resources/images/main/artist1.svg" alt="" class="artist-pic">
                <span class="artist-name">Alexander 23</span>
            </div>
            <div class="artistList-move">
                <img src="${ contextPath }/resources/images/main/artist2.svg" alt="" class="artist-pic">
                <span class="artist-name">Alexander 23</span>
            </div>
            <div class="artistList-move">
                <img src="${ contextPath }/resources/images/main/artist3.svg" alt="" class="artist-pic">
                <span class="artist-name">Alexander 23</span>
            </div>
            <div class="artistList-move">
                <img src="${ contextPath }/resources/images/main/artist4.svg" alt="" class="artist-pic">
                <span class="artist-name">Alexander 23</span>
            </div>
            <div class="artistList-move">
                <img src="${ contextPath }/resources/images/main/artist5.svg" alt="" class="artist-pic">
                <span class="artist-name">Alexander 23</span>
            </div>
            <div class="artistList-move">
                <img src="${ contextPath }/resources/images/main/artist6.svg" alt="" class="artist-pic">
                <span class="artist-name">Alexander 23</span>
            </div>
            <div class="artistList-move">
                <img src="${ contextPath }/resources/images/main/artist7.svg" alt="" class="artist-pic">
                <span class="artist-name">Alexander 23</span>
            </div>
            <div class="artistList-move">
                <img src="${ contextPath }/resources/images/main/artist8.svg" alt="" class="artist-pic">
                <span class="artist-name">Alexander 23</span>
            </div>
            <div class="artistList-move">
                <img src="${ contextPath }/resources/images/main/artist9.svg" alt="" class="artist-pic">
                <span class="artist-name">Alexander 23</span>
            </div>
            <div class="artistList-move">
                <img src="${ contextPath }/resources/images/main/artist10.svg" alt="" class="artist-pic">
                <span class="artist-name">Alexander 23</span>
            </div>
            <div class="artistList-move">
                <img src="${ contextPath }/resources/images/main/artist11.svg" alt="" class="artist-pic">
                <span class="artist-name">Alexander 23</span>
            </div>
            <div class="artistList-move">
                <img src="${ contextPath }/resources/images/main/artist12.svg" alt="" class="artist-pic">
                <span class="artist-name">Alexander 23</span>
            </div>
        </div>
        
        <!-- 아티스트 인기 게시물 (좋아요 순)-->
        <div class="mainPage-artistFeed">
            <input type="radio" name="slide" id="slide01" checked>
            <input type="radio" name="slide" id="slide02">
            <input type="radio" name="slide" id="slide03">
                <!-- 제목 -->
                <div class="feed-title">
                    <p class="mainPage-artistFeed-title">Artist Popular Feed</p>
                </div>
            <div class="slide-wrap">
                <ul class="slide-list">
                    <li>
                        <!-- 슬라이드 공간 -->
                        <div class="feed-slide-section">
                            <!-- 슬라이드 왼쪽 버튼 -->
                            <label for="slide03" class="left"></label>
                            <!-- 아티스트 인기 피드 1번-->
                            <div class="artist-feed-info">
                                <!-- 인기 피드 사진 또는 글 (크게)-->
                                <a href="#" class="img-box">
                                    <img src="${ contextPath }/resources/images/main/feed1.svg" alt="" class="feed-pic">
                                </a>
                                <!-- 프로필 정보와 좋아요 정보 -->
                                <div class="feed-info-section">
                                    <!-- 프로필사진 , 이름-->
                                    <div class="profile-info">
                                        <div class="profile-circle">
                                            <img src="${ contextPath }/resources/images/main/feed1.svg" alt="" class="feed-profile">
                                        </div>
                                        <p class="profile-name">SUNMI</p>
                                    </div>
                                    <!-- 좋아요 갯수 -->
                                    <div class="like-info">
                                        <img src="${ contextPath }/resources/images/main/like.svg" alt="" class="like-img">
                                        <p class="like-count">1,200</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 아티스트 인기 피드 2번-->
                            <div class="artist-feed-info">
                                <a href="#" class="img-box">
                                    <img src="${ contextPath }/resources/images/main/feed2.svg" alt="" class="feed-pic">
                                </a>
                                <div class="feed-info-section">
                                    <div class="profile-info">
                                        <div class="profile-circle">
                                            <img src="${ contextPath }/resources/images/main/feed2.svg" alt="" class="feed-profile">
                                        </div>
                                        <p class="profile-name">SUNMI</p>
                                    </div>
                                    <div class="like-info">
                                        <img src="${ contextPath }/resources/images/main/like.svg" alt="" class="like-img">
                                        <p class="like-count">1,200</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 아티스트 인기 피드 3번-->
                            <div class="artist-feed-info">
                                <!-- 사진없이 글만 있을 경우-->
                                <div class="feed-text-section">
                                    <img src="${ contextPath }/resources/images/main/feed3.svg" alt="" class="feed-pic">
                                    <span class="feed-text">
                                        으허어어어엉엉으허어어어얼
                                        으허어어어어엉어어ㅓㅇ어엉
                                        우헤에에에어아엉아아아아앙
                                        으허어어어엉엉으허어어어얼
                                        으허어어어어엉어어ㅓㅇ어엉
                                        우헤에에에어아엉아아아아앙
                                        어허어어ㅜ우라ㅏ핳하ㅏ아앙
                                        메에우어아ㅐ애애알유ㅠ아아
                                        대충 잘자란 소리....😊
                                    </span>
                                </div>
                                <div class="feed-info-section">
                                    <div class="profile-info">
                                        <div class="profile-circle">
                                            <img src="${ contextPath }/resources/images/main/feed1.svg" alt="" class="feed-profile">
                                        </div>
                                        <p class="profile-name">SUNMI</p>
                                    </div>
                                    <div class="like-info">
                                        <img src="${ contextPath }/resources/images/main/like.svg" alt="" class="like-img">
                                        <p class="like-count">1,200</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 슬라이드 오른쪽 버튼 -->
                            <label for="slide02" class="right"></label>
                        </div> 
                    </li>
                    <!-- SLIDE #2-->
                    <li>
                            <!-- 슬라이드 공간 -->
                            <div class="feed-slide-section">
                                <!-- 슬라이드 왼쪽 버튼 -->
                                <label for="slide01" class="left"></label>
                                <!-- 아티스트 인기 피드 1번-->
                                <div class="artist-feed-info">
                                    <!-- 인기 피드 사진 또는 글 (크게)-->
                                    <a href="#" class="img-box">
                                        <img src="${ contextPath }/resources/images/main/feed1.svg" alt="" class="feed-pic">
                                    </a>
                                    <!-- 프로필 정보와 좋아요 정보 -->
                                    <div class="feed-info-section">
                                        <!-- 프로필사진 , 이름-->
                                        <div class="profile-info">
                                            <div class="profile-circle">
                                                <img src="${ contextPath }/resources/images/main/feed1.svg" alt="" class="feed-profile">
                                            </div>
                                            <p class="profile-name">SUNMI</p>
                                        </div>
                                        <!-- 좋아요 갯수 -->
                                        <div class="like-info">
                                            <img src="${ contextPath }/resources/images/main/like.svg" alt="" class="like-img">
                                            <p class="like-count">1,200</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- 아티스트 인기 피드 2번-->
                                <div class="artist-feed-info">
                                    <a href="#" class="img-box">
                                        <img src="${ contextPath }/resources/images/main/feed2.svg" alt="" class="feed-pic">
                                    </a>
                                    <div class="feed-info-section">
                                        <div class="profile-info">
                                            <div class="profile-circle">
                                                <img src="${ contextPath }/resources/images/main/feed2.svg" alt="" class="feed-profile">
                                            </div>
                                            <p class="profile-name">SUNMI</p>
                                        </div>
                                        <div class="like-info">
                                            <img src="${ contextPath }/resources/images/main/like.svg" alt="" class="like-img">
                                            <p class="like-count">1,200</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- 아티스트 인기 피드 3번-->
                                <div class="artist-feed-info">
                                    <!-- 사진없이 글만 있을 경우-->
                                    <div class="feed-text-section">
                                        <img src="${ contextPath }/resources/images/main/feed3.svg" alt="" class="feed-pic">
                                        <span class="feed-text">
                                            으허어어어엉엉으허어어어얼
                                            으허어어어어엉어어ㅓㅇ어엉
                                            우헤에에에어아엉아아아아앙
                                            으허어어어엉엉으허어어어얼
                                            으허어어어어엉어어ㅓㅇ어엉
                                            우헤에에에어아엉아아아아앙
                                            어허어어ㅜ우라ㅏ핳하ㅏ아앙
                                            메에우어아ㅐ애애알유ㅠ아아
                                            대충 잘자란 소리....😊
                                        </span>
                                    </div>
                                    <div class="feed-info-section">
                                        <div class="profile-info">
                                            <div class="profile-circle">
                                                <img src="${ contextPath }/resources/images/main/feed1.svg" alt="" class="feed-profile">
                                            </div>
                                            <p class="profile-name">SUNMI</p>
                                        </div>
                                        <div class="like-info">
                                            <img src="${ contextPath }/resources/images/main/like.svg" alt="" class="like-img">
                                            <p class="like-count">1,200</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- 슬라이드 오른쪽 버튼 -->
                                <label for="slide03" class="right"></label>
                            </div>
                    </li>
                     <!-- SLIDE #3-->
                     <li>
                        <!-- 슬라이드 공간 -->
                        <div class="feed-slide-section">
                            <!-- 슬라이드 왼쪽 버튼 -->
                            <label for="slide02" class="left"></label>
                            <!-- 아티스트 인기 피드 1번-->
                            <div class="artist-feed-info">
                                <!-- 인기 피드 사진 또는 글 (크게)-->
                                <a href="#" class="img-box">
                                    <img src="${ contextPath }/resources/images/main/feed1.svg" alt="" class="feed-pic">
                                </a>
                                <!-- 프로필 정보와 좋아요 정보 -->
                                <div class="feed-info-section">
                                    <!-- 프로필사진 , 이름-->
                                    <div class="profile-info">
                                        <div class="profile-circle">
                                            <img src="${ contextPath }/resources/images/main/feed1.svg" alt="" class="feed-profile">
                                        </div>
                                        <p class="profile-name">SUNMI</p>
                                    </div>
                                    <!-- 좋아요 갯수 -->
                                    <div class="like-info">
                                        <img src="${ contextPath }/resources/images/main/like.svg" alt="" class="like-img">
                                        <p class="like-count">1,200</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 아티스트 인기 피드 2번-->
                            <div class="artist-feed-info">
                                <a href="#" class="img-box">
                                    <img src="${ contextPath }/resources/images/main/feed2.svg" alt="" class="feed-pic">
                                </a>
                                <div class="feed-info-section">
                                    <div class="profile-info">
                                        <div class="profile-circle">
                                            <img src="${ contextPath }/resources/images/main/feed2.svg" alt="" class="feed-profile">
                                        </div>
                                        <p class="profile-name">SUNMI</p>
                                    </div>
                                    <div class="like-info">
                                        <img src="${ contextPath }/resources/images/main/like.svg" alt="" class="like-img">
                                        <p class="like-count">1,200</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 아티스트 인기 피드 3번-->
                            <div class="artist-feed-info">
                                <!-- 사진없이 글만 있을 경우-->
                                <div class="feed-text-section">
                                    <img src="${ contextPath }/resources/images/main/feed3.svg" alt="" class="feed-pic">
                                    <span class="feed-text">
                                        으허어어어엉엉으허어어어얼
                                        으허어어어어엉어어ㅓㅇ어엉
                                        우헤에에에어아엉아아아아앙
                                        으허어어어엉엉으허어어어얼
                                        으허어어어어엉어어ㅓㅇ어엉
                                        우헤에에에어아엉아아아아앙
                                        어허어어ㅜ우라ㅏ핳하ㅏ아앙
                                        메에우어아ㅐ애애알유ㅠ아아
                                        대충 잘자란 소리....😊
                                    </span>
                                </div>
                                <div class="feed-info-section">
                                    <div class="profile-info">
                                        <div class="profile-circle">
                                            <img src="${ contextPath }/resources/images/main/feed1.svg" alt="" class="feed-profile">
                                        </div>
                                        <p class="profile-name">SUNMI</p>
                                    </div>
                                    <div class="like-info">
                                        <img src="${ contextPath }/resources/images/main/like.svg" alt="" class="like-img">
                                        <p class="like-count">1,200</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 슬라이드 오른쪽 버튼 -->
                            <label for="slide01" class="right"></label>
                        </div>
                </li>

                </ul>
            </div>
           
        </div>

        <!-- 아티스트 인기 미디어 -->
         <div class="mainPage-media">
            <!-- 제목 -->
            <div class="media-title">
                <p class="mainPage-artistMedia-title">Artist Popular Media</p>
            </div>
            <!-- 슬라이드 공간 -->
            <div class="media-slide-section">
                <!-- 슬라이드 왼쪽 버튼 -->
                <img src="${ contextPath }/resources/images/main/left-arrow.svg" alt="" class="slide-btn">
                <!-- 아티스트 인기 미디어 1번-->
                <div class="media-feed-info">
                    <!-- 인기 미디어 영상 (크게)-->
                    <img src="${ contextPath }/resources/images/main/artist6.svg" alt="" class="media-pic">
                    <!-- 프로필 정보와 조회수 정보 -->
                    <div class="media-info-section">
                        <!-- 프로필사진 , 이름-->
                        <div class="profile-info">
                            <div class="profile-circle">
                                <img src="${ contextPath }/resources/images/main/artist6.svg" alt="" class="feed-profile">
                            </div>
                            <p class="profile-name">SUNMI</p>
                        </div>
                        <!-- 조회수 -->
                        <div class="play-info">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </div>
                <!-- 아티스트 인기 미디어 2번-->
                <div class="media-feed-info">
                    <img src="${ contextPath }/resources/images/main/artist12.svg" alt="" class="media-pic">
                    <div class="media-info-section">
                        <div class="profile-info">
                            <div class="profile-circle">
                                <img src="${ contextPath }/resources/images/main/artist12.svg" alt="" class="feed-profile">
                            </div>
                            <p class="profile-name">SUNMI</p>
                        </div>
                         <!-- 조회수 -->
                         <div class="play-info">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </div>
                <!-- 아티스트 인기 미디어 3번-->
                <div class="media-feed-info">
                    <img src="${ contextPath }/resources/images/main/artist9.svg" alt="" class="media-pic">
                    <div class="media-info-section">
                        <div class="profile-info">
                            <div class="profile-circle">
                                <img src="${ contextPath }/resources/images/main/artist9.svg" alt="" class="feed-profile">
                            </div>
                            <p class="profile-name">SUNMI</p>
                        </div>
                         <!-- 조회수 -->
                         <div class="play-info">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </div>
                <!-- 슬라이드 오른쪽 버튼 -->
                <img src="${ contextPath }/resources/images/main/right-arrow.svg" alt="" class="slide-btn">
            </div>
        </div>

        <!-- 아티스트 스토어 -->
        <div class="mainPage-media">
            <!-- 제목 -->
            <div class="store-title">
                <p class="mainPage-artistStore-title">Artist Store</p>
            </div>
            <!-- 슬라이드 공간 -->
            <div class="store-slide-section">
                <!-- 슬라이드 왼쪽 버튼 -->
                <img src="${ contextPath }/resources/images/main/left-arrow.svg" alt="" class="slide-btn">
                <!-- 스토어 상품 랜덤 1-->
                <div class="store-feed-info">
                    <img src="${ contextPath }/resources/images/main/storeBackground.svg" alt="" class="store-background">
                    <img src="${ contextPath }/resources/images/main/store1.svg" alt="" class="store-pic">
                </div>
                 <!-- 스토어 상품 랜덤 2-->
                 <div class="store-feed-info">
                    <img src="${ contextPath }/resources/images/main/storeBackground.svg" alt="" class="store-background">
                    <img src="${ contextPath }/resources/images/main/store2.svg" alt="" class="store-pic">
                </div>
                <!-- 스토어 상품 랜덤 3-->
                <div class="store-feed-info">
                    <img src="${ contextPath }/resources/images/main/storeBackground.svg" alt="" class="store-background">
                    <img src="${ contextPath }/resources/images/main/store3.svg" alt="" class="store-pic">
                </div>
                <!-- 슬라이드 오른쪽 버튼 -->
                <img src="${ contextPath }/resources/images/main/right-arrow.svg" alt="" class="slide-btn">
            </div>
        </div>

        <!-- 전체 순위 차트 -->
        <div class="mainPage-chart">
            <!-- 제목 -->
            <div class="chart-title">
                <p class="mainPage-artistChart-title">Fantimate Chart</p>
                <a href="chart.html" id="goTo-chart">더보기</a>
            </div>
            <!-- 슬라이드 공간 -->
            <div class="chart-slide-section">
                <!-- 아티스트 인기 미디어 1번-->
                <div class="media-feed-info">
                    <!-- 인기 미디어 영상 (크게)-->
                    <img src="${ contextPath }/resources/images/main/artist7.svg" alt="" class="chart-pic">
                    <!-- 프로필 정보와 조회수 정보 -->
                    <div class="chart-info-section">
                        <!-- 프로필사진 , 이름-->
                        <div class="profile-info">
                            <p class="chart-rank">#2</p>
                            <p class="profile-name">해피 버스데이 투</p>
                        </div>
                        <!-- 조회수 -->
                        <div class="play-info">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </div>
                <!-- 아티스트 인기 미디어 2번-->
                <div class="media-feed-info">
                    <img src="${ contextPath }/resources/images/main/artist3.svg" alt="" id="numberOneChart">
                    <!-- 프로필 정보와 조회수 정보 -->
                    <div class="rank1-info-section">
                        <!-- 프로필사진 , 이름-->
                        <div class="profile-info">
                            <p class="chart-rank">#1</p>
                            <p class="profile-name">해피 버스데이 투</p>
                        </div>
                        <!-- 조회수 -->
                        <div class="play-info">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </div>
                <!-- 아티스트 인기 미디어 3번-->
                <div class="media-feed-info">
                    <img src="${ contextPath }/resources/images/main/artist4.svg" alt="" class="chart-pic">
                    <!-- 프로필 정보와 조회수 정보 -->
                    <div class="chart-info-section">
                        <!-- 프로필사진 , 이름-->
                        <div class="profile-info">
                            <p class="chart-rank">#3</p>
                            <p class="profile-name">해피 버스데이 투</p>
                        </div>
                        <!-- 조회수 -->
                        <div class="play-info">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </section>

    <footer>
        <div id="footer-section">
            (주)Fantimate  |  KH정보교육원 사업자등록번호 : 851-87-00622  |  Fanther. 황유정, 고재우, 고성현, 이유리, 최승아<br><br>

            강남지원 1관 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F<br>
            강남지원 2관 : 서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩 4F, 5F, 7F<br>
            강남지원 3관 : 서울특별시 강남구 테헤란로 130 호산빌딩 5F, 6F<br><br>
        
            Copyright Fantimate <br>
        </div>   
    </footer>
</body>
</html>
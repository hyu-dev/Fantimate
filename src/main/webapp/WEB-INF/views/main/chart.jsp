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
    <link rel="stylesheet" href="${ contextPath }/resources/css/main/chart.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Chart</title>
    <script>
    
    </script>
</head>
<body>
	<jsp:include page="../common/navbar.jsp"></jsp:include>
    <section class="chart-section">
        <!-- 토클 -->
        <div class="toggle-title-section">
            <p class="chart-title">MEDIA CHART</p>
            <div class="toggle-area">
                <div class="toggle-switch" tabindex="0">
                    <input type="checkbox" name="my_checkbox" value="yes" id="checkbox-id" onclick="toggleChange()" />
                    <label for="checkbox-id">
                        <div class="area" aria-hidden="true">
                            <div class="background">
                                <div class="handle"></div>
                            </div>
                            <p class="toggle-friend">주간</p>
                            <p class="toggle-default">일간</p>
                        </div>
                    </label>
                </div>
            </div>
        </div>

        <!-- 1~3 순위 -->
        <div class="top3-section">
            <ul class="top3-info-section">
                <li class="top3-info">
                    <img src="${ contextPath }/resources/images/main/artist1.svg" alt="" class="artist-media">
                    <div class="media-info">
                        <div class="m-title">
                            <p class="rank-num">1</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
                <li class="top3-info">
                    <img src="${ contextPath }/resources/images/main/artist21.svg" alt="" class="artist-media">
                    <div class="media-info">
                        <div class="m-title">
                            <p class="rank-num">2</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
                <li class="top3-info">
                    <img src="${ contextPath }/resources/images/main/artist3.svg" alt="" class="artist-media">
                    <div class="media-info">
                        <div class="m-title">
                            <p class="rank-num">3</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <!-- 4~20 순위 -->
        <div class="rest-section">
            <ul class="rest-info-section">
                <li class="rest-info">
                    <img src="${ contextPath }/resources/images/main/artist1.svg" alt="" class="rest-media">
                    <div class="rest-media-info">
                        <div class="m-title">
                            <p class="rank-num">2</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info2">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
                <li class="rest-info">
                    <img src="${ contextPath }/resources/images/main/artist2.svg" alt="" class="rest-media">
                    <div class="rest-media-info">
                        <div class="m-title">
                            <p class="rank-num">2</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info2">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
                <li class="rest-info">
                    <img src="${ contextPath }/resources/images/main/artist3.svg" alt="" class="rest-media">
                    <div class="rest-media-info">
                        <div class="m-title">
                            <p class="rank-num">2</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info2">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
                <li class="rest-info">
                    <img src="${ contextPath }/resources/images/main/artist3.svg" alt="" class="rest-media">
                    <div class="rest-media-info">
                        <div class="m-title">
                            <p class="rank-num">2</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info2">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
                <li class="rest-info">
                    <img src="${ contextPath }/resources/images/main/artist3.svg" alt="" class="rest-media">
                    <div class="rest-media-info">
                        <div class="m-title">
                            <p class="rank-num">2</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info2">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
                <li class="rest-info">
                    <img src="${ contextPath }/resources/images/main/artist3.svg" alt="" class="rest-media">
                    <div class="rest-media-info">
                        <div class="m-title">
                            <p class="rank-num">2</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info2">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
                <li class="rest-info">
                    <img src="${ contextPath }/resources/images/main/artist3.svg" alt="" class="rest-media">
                    <div class="rest-media-info">
                        <div class="m-title">
                            <p class="rank-num">2</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info2">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
                <li class="rest-info">
                    <img src="${ contextPath }/resources/images/main/artist3.svg" alt="" class="rest-media">
                    <div class="rest-media-info">
                        <div class="m-title">
                            <p class="rank-num">2</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info2">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
                <li class="rest-info">
                    <img src="${ contextPath }/resources/images/main/artist3.svg" alt="" class="rest-media">
                    <div class="rest-media-info">
                        <div class="m-title">
                            <p class="rank-num">2</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info2">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
                <li class="rest-info">
                    <img src="${ contextPath }/resources/images/main/artist3.svg" alt="" class="rest-media">
                    <div class="rest-media-info">
                        <div class="m-title">
                            <p class="rank-num">2</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info2">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
                <li class="rest-info">
                    <img src="${ contextPath }/resources/images/main/artist3.svg" alt="" class="rest-media">
                    <div class="rest-media-info">
                        <div class="m-title">
                            <p class="rank-num">2</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info2">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
                <li class="rest-info">
                    <img src="${ contextPath }/resources/images/main/artist3.svg" alt="" class="rest-media">
                    <div class="rest-media-info">
                        <div class="m-title">
                            <p class="rank-num">2</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info2">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
                <li class="rest-info">
                    <img src="${ contextPath }/resources/images/main/artist3.svg" alt="" class="rest-media">
                    <div class="rest-media-info">
                        <div class="m-title">
                            <p class="rank-num">2</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info2">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
                <li class="rest-info">
                    <img src="${ contextPath }/resources/images/main/artist3.svg" alt="" class="rest-media">
                    <div class="rest-media-info">
                        <div class="m-title">
                            <p class="rank-num">2</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info2">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
                <li class="rest-info">
                    <img src="${ contextPath }/resources/images/main/artist3.svg" alt="" class="rest-media">
                    <div class="rest-media-info">
                        <div class="m-title">
                            <p class="rank-num">2</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info2">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
                <li class="rest-info">
                    <img src="${ contextPath }/resources/images/main/artist3.svg" alt="" class="rest-media">
                    <div class="rest-media-info">
                        <div class="m-title">
                            <p class="rank-num">2</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info2">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
                <li class="rest-info">
                    <img src="${ contextPath }/resources/images/main/artist3.svg" alt="" class="rest-media">
                    <div class="rest-media-info">
                        <div class="m-title">
                            <p class="rank-num">2</p>
                            <p class="rank-title">해피 버스데이 투 미</p>
                        </div>
                        <div class="m-time-area">
                            <p class="m-times">11시간 전 |</p>&nbsp;
                            <p class="m-artistName">BTS</p>
                        </div>
                        <div class="play-info2">
                            <img src="${ contextPath }/resources/images/main/play.svg" alt="" class="play-img">
                            <p class="like-count">1,200</p>
                        </div>
                    </div>
                </li>
            </ul>
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
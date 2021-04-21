<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/mypage/artist/main.css">
</head>
<body>
	<!-- 네비바 인클루드 -->
	<jsp:include page="../../common/navbar.jsp"/>
	
	<!-- 아티스트 프로필 인클루드 -->
	<jsp:include page="profile.jsp"/>
	
	<!-- 본문 시작 -->
	
	<!-- 메인 -->
    <section class="main-section">
        <div class="artist-mypage-container">
            <div class="content-box">
                <p class="content-title">My Feed</p>
                <div class="content-area">
                    <div class="top-content">
                        <p class="top-content-left">
                            <img class="profile-img" src="../../resource/official/뷔_프로필.jpg">&nbsp;&nbsp;
                            <span class="profile-name nanumsquare">뷔</span>
                            <img class="artist-check" src="../../resource/mypage-artist/tick.svg">
                        </p>
                        <p class="top-content-right">
                            <span class="feed-date nanumsquare">2021.03.08</span>
                        </p>
                    </div>                   
                    <div class="main-content">
                        <div class="photo-area">
                            <img src="../../resource/mypage-artist/뷔_피드.jpg">
                        </div>
                        <textarea class="text-area nanumsquare" style="resize:none;">영상 올라온 거 보셨나요??
                        영상 올라온 거 보셨나요??
                        영상 올라온 거 보셨나요??
                        영상 올라온 거 보셨나요??
                        영상 올라온 거 보셨나요??
                        영상 올라온 거 보셨나요??
                        </textarea>
                    </div>
                    <div class="bottom-content">
                        <div class="comment-search">
                            <span>댓글</span>&nbsp;<span>1000</span>&nbsp;
                            <select class="comment-category">
                                <option>&nbsp;최신순</option>
                                <option>&nbsp;인기순</option>
                            </select>
                        </div>
                        <!-- 원댓글 -->
                        <table class="original-comment">
                            <colgroup>
                                <col width="5%"/>
                                <col width="95%"/>
                            </colgroup>
                            <tr class="comment-line">
                                <td>
                                    <!-- <div class="profile-bubble">
                                        <p>프로필 보기</p>
                                        <p>피드로 이동</p>
                                    </div> -->
                                    <img class="profile-picture" src="../../resource/official/뷔_프로필.jpg">
                                </td>
                                <td>
                                    <div class="comment-box">
                                        <div id="artist-comment" class="comment-main comment-center nanumsquare">
                                            <span class="comment-name">뷔</span>
                                            <span class="comment-content">
                                                영상 재밌게 보셨나요?
                                            </span>
                                            <span class="re-commentBtn">답글 열기</span>
                                        </div>
                                    </div>
                                    <div class="comment-info comment-center nanumsquare">
                                        <img class="likeBtn" src="../../resource/official/like.svg">
                                        <span class="like-count">1,000</span><span class="comment-date">2021.03.08</span>
                                    </div>
                                    <!-- <div class="comment-toggle">
                                        <div class="re-comment-container">
                                            <div class="comment-area">
                                                <textarea class="nanumsquare" style="resize: none;" rows="1">댓글을 입력하세요.</textarea>
                                            </div>&nbsp;&nbsp;&nbsp;
                                            <img class="re-send-btn" src="../../resource/official/send.svg">
                                        </div>
                                    </div> -->
                
                                    <!-- 대댓글 -->
                                    <table class="re-comment">
                                        <colgroup>
                                            <col width="5%"/>
                                            <col width="95%"/>
                                        </colgroup>
                                        <tr class="comment-line">
                                            <td>
                                                <!-- <div class="re-profile-bubble">
                                                    <p>친구 신청</p>
                                                    <p>쪽지 보내기</p>
                                                </div> -->
                                                <img class="re-profile-picture" src="../../resource/official/noPicture.png">
                                            </td>
                                            <td>
                                                <div class="comment-box">
                                                    <div class="comment-main comment-center nanumsquare">
                                                        <span class="comment-name">뷔바라기</span>
                                                        <span class="comment-content">
                                                            당연하죠. 완전 꿀잼ㅠㅠㅠㅠㅠ
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="re-comment-info comment-center nanumsquare">
                                                    <img class="likeBtn" src="../../resource/official/like.svg">
                                                    <span class="like-count">10</span><span class="comment-date">2021.03.08</span>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr class="comment-line">
                                <td>
                                    <!-- <div class="profile-bubble">
                                        <p>피드로 이동</p>
                                        <p>쪽지 보내기</p>
                                    </div> -->
                                    <img class="profile-picture" src="../../resource/official/스마일.jpg">
                                </td>
                                <td>
                                    <div class="comment-box">
                                        <div class="comment-main comment-center nanumsquare">
                                            <span class="comment-name">방탄1호팬</span>
                                            <span class="comment-content">
                                                풀영상 기대하고 있어요!!
                                            </span>
                                            <span class="re-commentBtn">답글 열기</span>
                                        </div>
                                    </div>
                                    <div class="comment-info comment-center nanumsquare">
                                        <img class="likeBtn" src="../../resource/official/like.svg">
                                        <span class="like-count">100</span><span class="comment-date">2021.03.08</span>
                                    </div>
                                    <div class="comment-toggle">
                                        <div class="re-comment-container">
                                            <div class="comment-area">
                                                <textarea class="nanumsquare" style="resize: none;" rows="1">댓글을 입력하세요.</textarea>
                                            </div>&nbsp;&nbsp;&nbsp;
                                            <img class="re-send-btn" src="../../resource/official/send.svg">
                                        </div>
                                    </div>
                
                                    <!-- 대댓글 -->
                                    <table class="re-comment">
                                        <colgroup>
                                            <col width="5%"/>
                                            <col width="95%"/>
                                        </colgroup>
                                        <tr class="comment-line">
                                            <td>
                                                <!-- <div class="re-profile-bubble">
                                                    <p>친구 신청</p>
                                                    <p>쪽지 보내기</p>
                                                </div> -->
                                                <img class="re-profile-picture" src="../../resource/official/noPicture.png">
                                            </td>
                                            <td>
                                                <div class="comment-box">
                                                    <div class="comment-main comment-center nanumsquare">
                                                        <span class="comment-name">뷔바라기</span>
                                                        <span class="comment-content">
                                                            저두요ㅎㅎ
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="re-comment-info comment-center nanumsquare">
                                                    <img class="likeBtn" src="../../resource/official/like.svg">
                                                    <span class="like-count">10</span><span class="comment-date">2021.03.08</span>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr class="comment-line">
                                <td>
                                    <!-- <div class="profile-bubble">
                                        <p>피드로 이동</p>
                                        <p>쪽지 보내기</p>
                                    </div> -->
                                    <img class="profile-picture" src="../../resource/official/스마일.jpg">
                                </td>
                                <td>
                                    <div class="comment-box">
                                        <div class="comment-main comment-center nanumsquare">
                                            <span class="comment-name">불타오르네</span>
                                            <span class="comment-content">
                                                풀영상 기대하고 있어요!!
                                            </span>
                                            <span class="re-commentBtn">답글 열기</span>
                                        </div>
                                    </div>
                                    <div class="comment-info comment-center nanumsquare">
                                        <img class="likeBtn" src="../../resource/official/like.svg">
                                        <span class="like-count">100</span><span class="comment-date">2021.03.08</span>
                                    </div>
                                    <div class="comment-toggle">
                                        <div class="re-comment-container">
                                            <div class="comment-area">
                                                <textarea class="nanumsquare" style="resize: none;" rows="1">댓글을 입력하세요.</textarea>
                                            </div>&nbsp;&nbsp;&nbsp;
                                            <img class="re-send-btn" src="../../resource/official/send.svg">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div class="last-btn">
                            <button class="detail-btn nanumsquare" type="button">···</button>
                        </div>
                    </div>
                </div>
                <div class="content-area">
                    <div class="top-content">
                        <p class="top-content-left">
                            <img class="profile-img" src="../../resource/official/뷔_프로필.jpg">&nbsp;&nbsp;
                            <span class="profile-name nanumsquare">뷔</span>
                            <img class="artist-check" src="../../resource/mypage-artist/tick.svg">
                        </p>
                        <p class="top-content-right">
                            <span class="feed-date nanumsquare">2021.03.08</span>
                        </p>
                    </div>                   
                    <div class="main-content">
                        <div class="photo-area">
                            <img src="../../resource/mypage-artist/뷔_피드.jpg">
                        </div>
                        <textarea class="text-area nanumsquare" style="resize:none;">영상 올라온 거 보셨나요??
                        영상 올라온 거 보셨나요??
                        영상 올라온 거 보셨나요??
                        영상 올라온 거 보셨나요??
                        영상 올라온 거 보셨나요??
                        영상 올라온 거 보셨나요??
                        </textarea>
                    </div>
                    <div class="bottom-content">
                        <div class="comment-search">
                            <span>댓글</span>&nbsp;<span>1000</span>&nbsp;
                            <select class="comment-category">
                                <option>&nbsp;최신순</option>
                                <option>&nbsp;인기순</option>
                            </select>
                        </div>
                        <!-- 원댓글 -->
                        <table class="original-comment">
                            <colgroup>
                                <col width="5%"/>
                                <col width="95%"/>
                            </colgroup>
                            <tr class="comment-line">
                                <td>
                                    <!-- <div class="profile-bubble">
                                        <p>프로필 보기</p>
                                        <p>피드로 이동</p>
                                    </div> -->
                                    <img class="profile-picture" src="../../resource/official/뷔_프로필.jpg">
                                </td>
                                <td>
                                    <div class="comment-box">
                                        <div id="artist-comment" class="comment-main comment-center nanumsquare">
                                            <span class="comment-name">뷔</span>
                                            <span class="comment-content">
                                                영상 재밌게 보셨나요?
                                            </span>
                                            <span class="re-commentBtn">답글 열기</span>
                                        </div>
                                    </div>
                                    <div class="comment-info comment-center nanumsquare">
                                        <img class="likeBtn" src="../../resource/official/like.svg">
                                        <span class="like-count">1,000</span><span class="comment-date">2021.03.08</span>
                                    </div>
                                    <!-- <div class="comment-toggle">
                                        <div class="re-comment-container">
                                            <div class="comment-area">
                                                <textarea class="nanumsquare" style="resize: none;" rows="1">댓글을 입력하세요.</textarea>
                                            </div>&nbsp;&nbsp;&nbsp;
                                            <img class="re-send-btn" src="../../resource/official/send.svg">
                                        </div>
                                    </div> -->
                
                                    <!-- 대댓글 -->
                                    <table class="re-comment">
                                        <colgroup>
                                            <col width="5%"/>
                                            <col width="95%"/>
                                        </colgroup>
                                        <tr class="comment-line">
                                            <td>
                                                <!-- <div class="re-profile-bubble">
                                                    <p>친구 신청</p>
                                                    <p>쪽지 보내기</p>
                                                </div> -->
                                                <img class="re-profile-picture" src="../../resource/official/noPicture.png">
                                            </td>
                                            <td>
                                                <div class="comment-box">
                                                    <div class="comment-main comment-center nanumsquare">
                                                        <span class="comment-name">뷔바라기</span>
                                                        <span class="comment-content">
                                                            당연하죠. 완전 꿀잼ㅠㅠㅠㅠㅠ
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="re-comment-info comment-center nanumsquare">
                                                    <img class="likeBtn" src="../../resource/official/like.svg">
                                                    <span class="like-count">10</span><span class="comment-date">2021.03.08</span>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr class="comment-line">
                                <td>
                                    <!-- <div class="profile-bubble">
                                        <p>피드로 이동</p>
                                        <p>쪽지 보내기</p>
                                    </div> -->
                                    <img class="profile-picture" src="../../resource/official/스마일.jpg">
                                </td>
                                <td>
                                    <div class="comment-box">
                                        <div class="comment-main comment-center nanumsquare">
                                            <span class="comment-name">방탄1호팬</span>
                                            <span class="comment-content">
                                                풀영상 기대하고 있어요!!
                                            </span>
                                            <span class="re-commentBtn">답글 열기</span>
                                        </div>
                                    </div>
                                    <div class="comment-info comment-center nanumsquare">
                                        <img class="likeBtn" src="../../resource/official/like.svg">
                                        <span class="like-count">100</span><span class="comment-date">2021.03.08</span>
                                    </div>
                                    <div class="comment-toggle">
                                        <div class="re-comment-container">
                                            <div class="comment-area">
                                                <textarea class="nanumsquare" style="resize: none;" rows="1">댓글을 입력하세요.</textarea>
                                            </div>&nbsp;&nbsp;&nbsp;
                                            <img class="re-send-btn" src="../../resource/official/send.svg">
                                        </div>
                                    </div>
                
                                    <!-- 대댓글 -->
                                    <table class="re-comment">
                                        <colgroup>
                                            <col width="5%"/>
                                            <col width="95%"/>
                                        </colgroup>
                                        <tr class="comment-line">
                                            <td>
                                                <!-- <div class="re-profile-bubble">
                                                    <p>친구 신청</p>
                                                    <p>쪽지 보내기</p>
                                                </div> -->
                                                <img class="re-profile-picture" src="../../resource/official/noPicture.png">
                                            </td>
                                            <td>
                                                <div class="comment-box">
                                                    <div class="comment-main comment-center nanumsquare">
                                                        <span class="comment-name">뷔바라기</span>
                                                        <span class="comment-content">
                                                            저두요ㅎㅎ
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="re-comment-info comment-center nanumsquare">
                                                    <img class="likeBtn" src="../../resource/official/like.svg">
                                                    <span class="like-count">10</span><span class="comment-date">2021.03.08</span>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr class="comment-line">
                                <td>
                                    <!-- <div class="profile-bubble">
                                        <p>피드로 이동</p>
                                        <p>쪽지 보내기</p>
                                    </div> -->
                                    <img class="profile-picture" src="../../resource/official/스마일.jpg">
                                </td>
                                <td>
                                    <div class="comment-box">
                                        <div class="comment-main comment-center nanumsquare">
                                            <span class="comment-name">불타오르네</span>
                                            <span class="comment-content">
                                                풀영상 기대하고 있어요!!
                                            </span>
                                            <span class="re-commentBtn">답글 열기</span>
                                        </div>
                                    </div>
                                    <div class="comment-info comment-center nanumsquare">
                                        <img class="likeBtn" src="../../resource/official/like.svg">
                                        <span class="like-count">100</span><span class="comment-date">2021.03.08</span>
                                    </div>
                                    <div class="comment-toggle">
                                        <div class="re-comment-container">
                                            <div class="comment-area">
                                                <textarea class="nanumsquare" style="resize: none;" rows="1">댓글을 입력하세요.</textarea>
                                            </div>&nbsp;&nbsp;&nbsp;
                                            <img class="re-send-btn" src="../../resource/official/send.svg">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div class="last-btn">
                            <button class="detail-btn nanumsquare" type="button">···</button>
                        </div>
                    </div>
                </div>
                <div class="content-area">
                    <div class="top-content">
                        <p class="top-content-left">
                            <img class="profile-img" src="../../resource/official/뷔_프로필.jpg">&nbsp;&nbsp;
                            <span class="profile-name nanumsquare">뷔</span>
                            <img class="artist-check" src="../../resource/mypage-artist/tick.svg">
                        </p>
                        <p class="top-content-right">
                            <span class="feed-date nanumsquare">2021.03.08</span>
                        </p>
                    </div>                   
                    <div class="main-content">
                        <div class="photo-area">
                            <img src="../../resource/mypage-artist/뷔_피드.jpg">
                        </div>
                        <textarea class="text-area nanumsquare" style="resize:none;">영상 올라온 거 보셨나요??
                        영상 올라온 거 보셨나요??
                        영상 올라온 거 보셨나요??
                        영상 올라온 거 보셨나요??
                        영상 올라온 거 보셨나요??
                        영상 올라온 거 보셨나요??
                        </textarea>
                    </div>
                    <div class="bottom-content">
                        <div class="comment-search">
                            <span>댓글</span>&nbsp;<span>1000</span>&nbsp;
                            <select class="comment-category">
                                <option>&nbsp;최신순</option>
                                <option>&nbsp;인기순</option>
                            </select>
                        </div>
                        <!-- 원댓글 -->
                        <table class="original-comment">
                            <colgroup>
                                <col width="5%"/>
                                <col width="95%"/>
                            </colgroup>
                            <tr class="comment-line">
                                <td>
                                    <!-- <div class="profile-bubble">
                                        <p>프로필 보기</p>
                                        <p>피드로 이동</p>
                                    </div> -->
                                    <img class="profile-picture" src="../../resource/official/뷔_프로필.jpg">
                                </td>
                                <td>
                                    <div class="comment-box">
                                        <div id="artist-comment" class="comment-main comment-center nanumsquare">
                                            <span class="comment-name">뷔</span>
                                            <span class="comment-content">
                                                영상 재밌게 보셨나요?
                                            </span>
                                            <span class="re-commentBtn">답글 열기</span>
                                        </div>
                                    </div>
                                    <div class="comment-info comment-center nanumsquare">
                                        <img class="likeBtn" src="../../resource/official/like.svg">
                                        <span class="like-count">1,000</span><span class="comment-date">2021.03.08</span>
                                    </div>
                                    <!-- <div class="comment-toggle">
                                        <div class="re-comment-container">
                                            <div class="comment-area">
                                                <textarea class="nanumsquare" style="resize: none;" rows="1">댓글을 입력하세요.</textarea>
                                            </div>&nbsp;&nbsp;&nbsp;
                                            <img class="re-send-btn" src="../../resource/official/send.svg">
                                        </div>
                                    </div> -->
                
                                    <!-- 대댓글 -->
                                    <table class="re-comment">
                                        <colgroup>
                                            <col width="5%"/>
                                            <col width="95%"/>
                                        </colgroup>
                                        <tr class="comment-line">
                                            <td>
                                                <!-- <div class="re-profile-bubble">
                                                    <p>친구 신청</p>
                                                    <p>쪽지 보내기</p>
                                                </div> -->
                                                <img class="re-profile-picture" src="../../resource/official/noPicture.png">
                                            </td>
                                            <td>
                                                <div class="comment-box">
                                                    <div class="comment-main comment-center nanumsquare">
                                                        <span class="comment-name">뷔바라기</span>
                                                        <span class="comment-content">
                                                            당연하죠. 완전 꿀잼ㅠㅠㅠㅠㅠ
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="re-comment-info comment-center nanumsquare">
                                                    <img class="likeBtn" src="../../resource/official/like.svg">
                                                    <span class="like-count">10</span><span class="comment-date">2021.03.08</span>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr class="comment-line">
                                <td>
                                    <!-- <div class="profile-bubble">
                                        <p>피드로 이동</p>
                                        <p>쪽지 보내기</p>
                                    </div> -->
                                    <img class="profile-picture" src="../../resource/official/스마일.jpg">
                                </td>
                                <td>
                                    <div class="comment-box">
                                        <div class="comment-main comment-center nanumsquare">
                                            <span class="comment-name">방탄1호팬</span>
                                            <span class="comment-content">
                                                풀영상 기대하고 있어요!!
                                            </span>
                                            <span class="re-commentBtn">답글 열기</span>
                                        </div>
                                    </div>
                                    <div class="comment-info comment-center nanumsquare">
                                        <img class="likeBtn" src="../../resource/official/like.svg">
                                        <span class="like-count">100</span><span class="comment-date">2021.03.08</span>
                                    </div>
                                    <div class="comment-toggle">
                                        <div class="re-comment-container">
                                            <div class="comment-area">
                                                <textarea class="nanumsquare" style="resize: none;" rows="1">댓글을 입력하세요.</textarea>
                                            </div>&nbsp;&nbsp;&nbsp;
                                            <img class="re-send-btn" src="../../resource/official/send.svg">
                                        </div>
                                    </div>
                
                                    <!-- 대댓글 -->
                                    <table class="re-comment">
                                        <colgroup>
                                            <col width="5%"/>
                                            <col width="95%"/>
                                        </colgroup>
                                        <tr class="comment-line">
                                            <td>
                                                <!-- <div class="re-profile-bubble">
                                                    <p>친구 신청</p>
                                                    <p>쪽지 보내기</p>
                                                </div> -->
                                                <img class="re-profile-picture" src="../../resource/official/noPicture.png">
                                            </td>
                                            <td>
                                                <div class="comment-box">
                                                    <div class="comment-main comment-center nanumsquare">
                                                        <span class="comment-name">뷔바라기</span>
                                                        <span class="comment-content">
                                                            저두요ㅎㅎ
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="re-comment-info comment-center nanumsquare">
                                                    <img class="likeBtn" src="../../resource/official/like.svg">
                                                    <span class="like-count">10</span><span class="comment-date">2021.03.08</span>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr class="comment-line">
                                <td>
                                    <!-- <div class="profile-bubble">
                                        <p>피드로 이동</p>
                                        <p>쪽지 보내기</p>
                                    </div> -->
                                    <img class="profile-picture" src="../../resource/official/스마일.jpg">
                                </td>
                                <td>
                                    <div class="comment-box">
                                        <div class="comment-main comment-center nanumsquare">
                                            <span class="comment-name">불타오르네</span>
                                            <span class="comment-content">
                                                풀영상 기대하고 있어요!!
                                            </span>
                                            <span class="re-commentBtn">답글 열기</span>
                                        </div>
                                    </div>
                                    <div class="comment-info comment-center nanumsquare">
                                        <img class="likeBtn" src="../../resource/official/like.svg">
                                        <span class="like-count">100</span><span class="comment-date">2021.03.08</span>
                                    </div>
                                    <div class="comment-toggle">
                                        <div class="re-comment-container">
                                            <div class="comment-area">
                                                <textarea class="nanumsquare" style="resize: none;" rows="1">댓글을 입력하세요.</textarea>
                                            </div>&nbsp;&nbsp;&nbsp;
                                            <img class="re-send-btn" src="../../resource/official/send.svg">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div class="last-btn">
                            <button class="detail-btn nanumsquare" type="button">···</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 리모컨 -->
            <div id="menubar">
                <div class="mypage-menu">
                    <span class="nanumsquare">Menu</span>
                    <div class="btn-area">
                        <p class="mypage-btn nanumsquare">My Bookmarks</p>
                        <p class="mypage-btn nanumsquare">My Comments</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<!-- 본문 끝 -->
</body>
</html>
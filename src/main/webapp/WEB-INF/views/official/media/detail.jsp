<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/official/mediaDetail.css">
</head>
<body>
	<!-- 네비바 인클루드 -->
	<jsp:include page="../../common/navbar.jsp"/>
	
	<!-- 본문 시작 -->
    <section class="main-section">
        
        <!-- 왼쪽(카테고리) 인클루드 -->
		<jsp:include page="../../common/category.jsp"/>
        
        <!-- 중간 -->
        <section class="main-contents">
            <div class="media-container">
                <div class="media-upper">
                    <div id="mediaTitle">${ media.official.mediaTtl }</div>
                    <a href="media-list.html" id="backLink">뒤로 가기</a>
                </div>
                <div class="media-center">
                    <video src="${ contextPath }/resources/images/official/${ media.mediaFile.vidSvName }"
                    controls="controls" poster="${ contextPath }/resources/images/official/${ media.mediaFile.picSvName }"></video>
                    <div class="media-main">
                        <textarea class="media-content nanumsquare" style="resize:none;">${ media.official.mediaCtt }</textarea>
                        <img id="bookMark" src="${ contextPath }/resources/images/official/bookmark.svg" style="width: 30px; height: 30px;">
                        <div class="media-info">
                            <span>댓글</span>&nbsp;<span>1000</span>&nbsp;
                            <select class="comment-category">
                                <option>&nbsp;최신순</option>
                                <option>&nbsp;인기순</option>
                            </select>
                            <input type="checkbox" id="myComment" name="myComment" value="myComment" checked>
                            <label for="myComment">내 댓글만</label>
                            <span id="watchingCount" class="watching-count">${ media.hitCount.count }</span><span class="watching-count">조회수&nbsp;</span>
                        </div>
                    </div>
                </div>
                <div class="media-lower">
                    <div class="comment-container">
                        <div class="comment-area">
                            <textarea id="comment" class="nanumsquare" style="resize: none;" rows="1">댓글을 입력하세요.</textarea>
                        </div>&nbsp;&nbsp;&nbsp;
                        <img class="send-btn" src="${ contextPath }/resources/images/official/send.svg">
                    </div>
                    <!-- 원댓글 -->
                    <table class="original-comment">
                        <colgroup>
                            <col width="5%"/>
                            <col width="95%"/>
                        </colgroup>
                        <tr class="comment-line">
                            <td>
                                <div class="profile-bubble">
                                    <p>프로필 보기</p>
                                    <p>피드로 이동</p>
                                </div>
                                <img class="profile-picture" src="${ contextPath }/resources/images/official/뷔_프로필.jpg">
                            </td>
                            <td>
                                <div class="comment-box">
                                    <div id="artist-comment" class="comment-main comment-center nanumsquare">
                                        <div>
                                            <span class="comment-name">뷔</span>
                                            <div class="comment-content">
                                                영상 재밌게 보셨나요?
                                            </div>
                                        </div>
                                        <span class="re-commentBtn">답글 열기</span>
                                    </div>
                                    <div class="comment-etc">···
                                        <div class="comment-bubble">
                                            <p class="add-comment">답글 달기</p>
                                            <p>댓글 신고</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="comment-info comment-center nanumsquare">
                                    <img class="likeBtn" src="${ contextPath }/resources/images/official/like.svg">
                                    <span class="like-count">1,000</span><span class="comment-date">2021.03.08</span>
                                </div>
                                <div class="comment-toggle">
                                    <div class="re-comment-container">
                                        <div class="comment-area">
                                            <textarea class="nanumsquare" style="resize: none;" rows="1">댓글을 입력하세요.</textarea>
                                        </div>&nbsp;&nbsp;&nbsp;
                                        <img class="re-send-btn" src="${ contextPath }/resources/images/official/send.svg">
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
                                            <div class="re-profile-bubble">
                                                <p>친구 신청</p>
                                                <p>쪽지 보내기</p>
                                            </div>
                                            <img class="re-profile-picture" src="${ contextPath }/resources/images/official/noPicture.png">
                                        </td>
                                        <td>
                                            <div class="comment-box">
                                                <div class="comment-main comment-center nanumsquare">
                                                    <div>
                                                        <span class="comment-name">뷔바라기</span>
                                                        <div class="comment-content">
                                                            당연하죠. 완전 꿀잼ㅠㅠㅠㅠㅠ
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="re-comment-etc">···
                                                    <div class="re-comment-bubble">
                                                        <p>댓글 신고</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="re-comment-info comment-center nanumsquare">
                                                <img class="likeBtn" src="${ contextPath }/resources/images/official/like.svg">
                                                <span class="like-count">10</span><span class="comment-date">2021.03.08</span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr class="comment-line">
                            <td>
                                <div class="profile-bubble">
                                    <p>피드로 이동</p>
                                    <p>쪽지 보내기</p>
                                </div>
                                <img class="profile-picture" src="${ contextPath }/resources/images/official/스마일.jpg">
                            </td>
                            <td>
                                <div class="comment-box">
                                    <div class="comment-main comment-center nanumsquare">
                                        <div>
                                            <span class="comment-name">방탄1호팬</span>
                                            <div class="comment-content">
                                                풀영상 기대하고 있어요!!
                                                <br>완전 기대
                                                <br>또 뭐가 있나요??
                                            </div>
                                        </div>
                                        <span class="re-commentBtn">답글 열기</span>
                                    </div>
                                    <div class="comment-etc">···
                                        <div class="comment-bubble">
                                            <p class="add-comment">답글 달기</p>
                                            <p>댓글 신고</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="comment-info comment-center nanumsquare">
                                    <img class="likeBtn" src="${ contextPath }/resources/images/official/like.svg">
                                    <span class="like-count">100</span><span class="comment-date">2021.03.08</span>
                                </div>
                                <div class="comment-toggle">
                                    <div class="re-comment-container">
                                        <div class="comment-area">
                                            <textarea class="nanumsquare" style="resize: none;" rows="1">댓글을 입력하세요.</textarea>
                                        </div>&nbsp;&nbsp;&nbsp;
                                        <img class="re-send-btn" src="${ contextPath }/resources/images/official/send.svg">
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
                                            <div class="re-profile-bubble">
                                                <p>친구 신청</p>
                                                <p>쪽지 보내기</p>
                                            </div>
                                            <img class="re-profile-picture" src="${ contextPath }/resources/images/official/noPicture.png">
                                        </td>
                                        <td>
                                            <div class="comment-box">
                                                <div class="comment-main comment-center nanumsquare">
                                                    <div>
                                                        <span class="comment-name">뷔바라기</span>
                                                        <div class="comment-content">
                                                            저두요ㅎㅎ
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="re-comment-etc">···
                                                    <div class="re-comment-bubble">
                                                        <p>댓글 신고</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="re-comment-info comment-center nanumsquare">
                                                <img class="likeBtn" src="${ contextPath }/resources/images/official/like.svg">
                                                <span class="like-count">10</span><span class="comment-date">2021.03.08</span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr class="comment-line">
                            <td>
                                <div class="profile-bubble">
                                    <p>피드로 이동</p>
                                    <p>쪽지 보내기</p>
                                </div>
                                <img class="profile-picture" src="${ contextPath }/resources/images/official/스마일.jpg">
                            </td>
                            <td>
                                <div class="comment-box">
                                    <div class="comment-main comment-center nanumsquare">
                                        <div>
                                            <span class="comment-name">불타오르네</span>
                                            <div class="comment-content">
                                                풀영상 기대하고 있어요!!
                                            </div>
                                        </div>
                                        <span class="re-commentBtn">답글 열기</span>
                                    </div>
                                    <div class="comment-etc">···
                                        <div class="comment-bubble">
                                            <p class="add-comment">답글 달기</p>
                                            <p>댓글 신고</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="comment-info comment-center nanumsquare">
                                    <img class="likeBtn" src="${ contextPath }/resources/images/official/like.svg">
                                    <span class="like-count">100</span><span class="comment-date">2021.03.08</span>
                                </div>
                                <div class="comment-toggle">
                                    <div class="re-comment-container">
                                        <div class="comment-area">
                                            <textarea class="nanumsquare" style="resize: none;" rows="1">댓글을 입력하세요.</textarea>
                                        </div>&nbsp;&nbsp;&nbsp;
                                        <img class="re-send-btn" src="${ contextPath }/resources/images/official/send.svg">
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </section>
        
        <script>
        // 북마크 클릭 여부 확인하기
        $("#bookMark").click(function() {
            if(document.getElementById("bookMark").getAttribute('src') == "${ contextPath }/resources/images/official/bookmark.svg") {
                document.getElementById("bookMark").src = "${ contextPath }/resources/images/official/bookmark-black.svg";
            } else {
                document.getElementById("bookMark").src = "${ contextPath }/resources/images/official/bookmark.svg";
            }
        });
        
        // 댓글란 클릭하면 내용 지우기
        $("#comment").click(function() {
        	$(this).text("");
        })


        // 댓글 프로필 클릭했을 때 프로필 풍선 생성
        $('.profile-picture').click(function () {
        	$('.profile-picture').siblings(".profile-bubble").css("display", "none");
            $(this).siblings(".profile-bubble").toggleClass('open-area', 500);
        });

        // 대댓글 프로필 클릭했을 때 프로필 풍선 생성
        $('.re-profile-picture').click(function () {
            $(this).siblings(".re-profile-bubble").toggleClass('open-area', 500);
        });

        // 댓글 점 아이콘 클릭했을 때 댓글 풍선 생성
        $('.comment-etc').click(function () {
            $(this).children(".comment-bubble").toggleClass('open-area', 500);
        });

        // 대댓글 점 아이콘 클릭했을 때 댓글 풍선 생성
        $('.re-comment-etc').click(function () {
            $(this).children(".re-comment-bubble").toggleClass('open-area', 500);
        });

        // 답글 열기 문구 클릭했을 때
        $(".re-commentBtn").click(function () {

            if($(this).text() == "답글 열기") {
                $(this).text("답글 닫기");
            } else if($(this).text() == "답글 닫기") {
                $(this).text("답글 열기");
            }
            
            $(this).parent().parent().siblings(".re-comment").toggleClass('open-area', 500);
        });

        // 답글 달기를 클릭했을 때 대댓글 작성란 생성
        $(".add-comment").click(function () {
            $(this).parent().parent().parent().siblings(".comment-toggle").toggleClass('open-area', 500);
        });

        // 대댓글 작성란에서 보내기 버튼을 클릭했을 때 작성란 숨기기
		$(".re-send-btn").click(function () {
		
		    if($(this).parent().parent().siblings(".re-comment").css("display", "none")) {		
		        $(this).parent().parent().siblings(".re-comment").css("display", "block");
		        $(this).parent().parent().siblings(".comment-box").children().children(".re-commentBtn").text("답글 닫기");
		
		        $(this).parent().parent().siblings(".comment-box").children().children(".re-commentBtn").click(function() {		            
		            $(this).parent().parent().siblings(".re-comment").css("display", "none");
		        });
		
		        $(".re-commentBtn").click(function() {
		            $(this).parent().parent().siblings(".re-comment").css("display", "none")
		        })
		
		        $(this).parent().parent(".comment-toggle").toggleClass('open-area', 500);
		    }
		});

        // 대댓글이 있을 시에만 보여주기
        $(document).ready(function() {
            for(var i = 1; i <= $(".comment-line").length; i++) {
                if($(".comment-line:eq(" + i + ")").children().children(".re-comment").text()) {
                    $(".re-commentBtn:eq(" + i + ")").css("display","none");
                }
            }
        });
        </script>
        
        <!-- 오른쪽 -->
        <aside class="main-contents-right">
            <div class="toggle-area">
                <div class="toggle-switch" tabindex="0">
                    <input type="checkbox" name="my_checkbox" value="yes" id="checkbox-id" />
                    <label for="checkbox-id">
                      <div class="area" aria-hidden="true">
                        <div class="background">
                            <div class="handle"></div>
                        </div>
                        <p>미디어</p>
                      </div>
                    </label>
                  </div>
            </div>
            <p id="recommendTitle">추천 영상</p>
            <div class="recommend-container">
                <div class="recommend-media">
                    <img src="${ contextPath }/resources/images/official/category-media.jpg">
                    <div class="media-title nanumsquare">BREAK THE SILENCE : THE MOVIE COMMENTARY</div>
                    <div class="media-date nanumsquare">2021.03.21</div>
                </div>
                <div class="recommend-media">
                    <img src="${ contextPath }/resources/images/official/category-media.jpg">
                    <div class="media-title nanumsquare">BREAK THE SILENCE : THE MOVIE COMMENTARY</div>
                    <div class="media-date nanumsquare">2021.03.21</div>
                </div>
                <div class="recommend-media">
                    <img src="${ contextPath }/resources/images/official/category-media.jpg">
                    <div class="media-title nanumsquare">BREAK THE SILENCE : THE MOVIE COMMENTARY</div>
                    <div class="media-date nanumsquare">2021.03.21</div>
                </div>
            </div>
        </aside>
        
	    <script>
        // 해당 페이지에 대한 카테고리 색상 변경
		$(document).ready(function() {
		    $(".category a").eq(2).css("color", "#5C5F78");
		});
	    
	 	// 토글 스위치 클릭할 때 스케줄 페이지로 이동
	    $(".toggle-switch").click(function () {
		    location.href="${ contextPath }/official/schedule";
		});
	    </script>
   </section>
   <!-- 본문 끝 -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/feed/artistFeedList.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<!-- 네비바 인클루드 -->
	<jsp:include page="../common/navbar.jsp"/>
	
    <section class="main-section">
       
        <!-- 왼쪽(카테고리) 인클루드 -->
		<jsp:include page="../common/category.jsp"/>
		 <!-- 메인 컨텐츠 영역 -->
         <section class="main-contents">
             <!-- 모먼트 영역 -->
           <div class="moment-outer">
           
            <div class="momentArea">
                <p class="moment-introArea">모먼트</p>
                <button class="selectAll">모두보기</button>
            </div>

            <div class="member-profileArea">
                <table class="profileTable">
                    <tr>
                    <td><img src="../../resources/images/feed/스마일.jpg" class="profile-picture"></td>
                    <td><img src="../../resources/images/feed/스마일.jpg" class="profile-picture"></td>
                    <td><img src="../../resources/images/feed/스마일.jpg" class="profile-picture"></td>
                    <td><img src="../../resources/images/feed/스마일.jpg" class="profile-picture"></td>
                    <td><img src="../../resources/images/feed/스마일.jpg" class="profile-picture"></td>
                    <td><img src="../../resources/images/feed/스마일.jpg" class="profile-picture"></td>
                    <td><img src="../../resources/images/feed/스마일.jpg" class="profile-picture"></td>
                    </tr>
                    <tr>
                        <td align="center">RM</td>
                        <td align="center">제이홉</td>
                        <td align="center">진</td>
                        <td align="center">지민</td>
                        <td align="center">뷔</td>
                        <td align="center">슈가</td>
                        <td align="center">정국</td>
                    </tr>
                </table>
            </div>
            
           </div>
            
            <div class="post-outer">
                <div class="introArea">
                    <p class="post-intro">포스트 쓰기</p>    
                </div>
 <!-- 포스트 작성 -->
                <form>
                    <div class="postArea">   
                    <img src="../../resources/icon/faviconF.png" class="post-icon">
                    <textarea class="textArea" placeholder="FANTIMATE에 남겨보세요"></textarea>
                    <img src="../../resources/icon/photo-icon.png" class="photo-icon">
                    </div>
                    <!-- 이미지 미리보기 영역 -->
                    <div class="my-photo">
                        <div class="guide">* 첨부사진은 최대 4장까지 등록 가능합니다.</div>
                        <label for="mainPhoto" class="main-photo" style="display: none;"><input id="mainPhoto" class="photo" type="file" style="display: none;"></label>
                        <label class="add-photo click-btn" style="display: none;"><p class="plus">+</p></label>
                    </div>
                    <hr width="85%">
                    <br>
                    <div class="btnArea">
                    <button type="submit" class="post-insert-btn">등록하기</button>
                    </div>
                    <br>
                </form>
             </div>

             <!-- 게시글 리스트 영역 -->
             <div class="boardArea">

                <!-- 게시글 헤더 영역 -->
                <table class="board-top">
                    <col width="13%"/>
                    <col width="55%"/>
                    <col width="15%"/>
                    <col width="15%"/>
                    <tr>
                        <td>
                            <div class="profile-bubble">
                                <p class="friend-application">친구 신청</p>
                                <p class="send-message">쪽지 보내기</p>
                            </div>
                            <img class="profile-picture" src="../../resources/images/feed/스마일.jpg">
                        </td>
                        <td> 
                            <pre class="nicknameArea">성현2</pre>
                            <pre class="boarddateArea">2020.03.25</pre>
                        </td>
                        
                        <td>
                            <div class="board-menu">
                                <p>수정하기</p>
                                <p class="deleteboard">삭제하기</p>
                            </div>
                            <img class="board-more-icon" src="../../resources/images/feed/board-more-icon.png">
                        </td>
                        <td><img class="report-icon" src="../../resources/images/feed/report-icon.png"></td>   
                    </tr>
                </table>
                    <!-- 게시글 컨텐츠 영역 -->
                    <div class="contentArea">
                        <!-- 텍스트 영역 -->
                        <div>
                            <p class="board-text">사랑해요  방탄♥</p> 
                        </div>
                        <!-- 이미지 영역 -->
                        <div>
                            <img src="../../resources/images/feed/img1.jpg" class="board-img">
                        </div>
                    </div>
                    <br><br>
                    <!-- 좋아요 영역 -->
                    <table class="board-like">
                        <col width="13%"/>
                        <col width="55%"/>
                        <col width="15%"/>
                        <col width="15%"/>

                        <tr>
                            <td><img src="../../resources/images/feed/like-icon.png" class="like-icon"></td>
                            <td>5,000</td>
                            <td class="reply-info">댓글</td>
                            <td class="reply-count">2,300</td>
                        </tr>
                    </table>
                    <hr width="90%">
                    <br>
                    <!-- 댓글 리스트 영역 -->
                    <table class="original-comment">
                        <colgroup>
                            <col width="5%"/>
                            <col width="95%"/>
                        </colgroup>
                        <tr class="comment-line">
                            <td>
                                <div class="profile-bubble">
                                    <p>친구 신청</p>
                                    <p>쪽지 보내기</p>
                                </div>
                                <img class="profile-picture" src="../../resources/images/feed/스마일.jpg">
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
                                    <div class="comment-etc">···
                                        <div class="comment-bubble">
                                            <p class="add-comment">답글 달기</p>
                                            <p>댓글 신고</p>
                                        </div>
                                    </div>

                                    </div>
                                </div>
                                <div class="comment-info comment-center nanumsquare">
                                    <img class="likeBtn" src="../../resources/images/feed/like-icon.png">
                                    <span class="like-count">1,000</span><span class="comment-date">2021.03.08</span>
                                </div>
                                <div class="comment-toggle">
                                    <div class="re-comment-container">
                                        <div class="comment-area">
                                            <textarea class="nanumsquare" style="resize: none;" rows="1" placeholder="답글을 입력하세요..."></textarea>
                                        </div>&nbsp;&nbsp;&nbsp;
                                        <img class="re-send-btn" src="../resource/official/send.svg">
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
                                            <img class="re-profile-picture" src="../resource/official/noPicture.png">
                                        </td>
                                        <td>
                                            <div class="comment-box">
                                                <div class="comment-main comment-center nanumsquare">
                                                    <span class="comment-name">뷔바라기</span>
                                                    <span class="comment-content">
                                                        당연하죠. 완전 꿀잼ㅠㅠㅠㅠㅠ
                                                    </span>
                                                </div>
                                                <div class="re-comment-etc">···
                                                    <div class="re-comment-bubble">
                                                        <p>댓글 신고</div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="re-comment-info comment-center nanumsquare">
                                                <img class="likeBtn" src="../../resources/images/feed/like-icon.png">
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
                                    <p>친구 신청</p>
                                    <p>쪽지 보내기</p>
                                </div>
                                <img class="profile-picture" src="../../resources/images/feed/스마일.jpg">
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
                                    <div class="comment-etc">···
                                        <div class="comment-bubble">
                                            <p class="add-comment">답글 달기</p>
                                            <p>댓글 신고</p>
                                        </div>
                                    </div>

                                </div>
                                <div class="comment-info comment-center nanumsquare">
                                    <img class="likeBtn" src="../../resources/images/feed/like-icon.png">
                                    <span class="like-count">100</span><span class="comment-date">2021.03.08</span>
                                </div>
                                <div class="comment-toggle">
                                    <div class="re-comment-container">
                                        <div class="comment-area">
                                            <textarea class="nanumsquare" style="resize: none;" rows="1" placeholder="답글을 입력하세요..."></textarea>
                                        </div>&nbsp;&nbsp;&nbsp;
                                        <img class="re-send-btn" src="../resource/official/send.svg">
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
                                            <img class="re-profile-picture" src="../resource/official/noPicture.png">
                                        </td>
                                        <td>
                                            <div class="comment-box">
                                                <div class="comment-main comment-center nanumsquare">
                                                    <span class="comment-name">뷔바라기</span>
                                                    <span class="comment-content">
                                                        저두요ㅎㅎ
                                                    </span>
                                                </div>
                                                <div class="re-comment-etc">···
                                                    <div class="re-comment-bubble">
                                                        <p>댓글 신고</div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="re-comment-info comment-center nanumsquare">
                                                <img class="likeBtn" src="../../resources/images/feed/like-icon.png">
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
                                <img class="profile-picture" src="../../resources/images/feed/스마일.jpg">
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
                                    <div class="comment-etc">···
                                        <div class="comment-bubble">
                                            <p class="add-comment">답글 달기</p>
                                            <p>댓글 신고</p>
                                        </div>
                                    </div>

                                    </div>
                                </div>
                                <div class="comment-info comment-center nanumsquare">
                                    <img class="likeBtn" src="../../resources/images/feed/like-icon.png">
                                    <span class="like-count">100</span><span class="comment-date">2021.03.08</span>
                                </div>
                                <div class="comment-toggle">
                                    <div class="re-comment-container">
                                        <div class="comment-area">
                                            <textarea class="nanumsquare" style="resize: none;" rows="1" placeholder="답글을 입력하세요..."></textarea>
                                        </div>&nbsp;&nbsp;&nbsp;
                                        <img class="re-send-btn" src="../resource/official/send.svg">
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <button class="reply-more">. . .</button>
                    
                    <div class="insert-replyArea">
                        <div class="replyArea">
                            <div class="insert-reply">
                                <textarea class="nanumsquare" style="resize: none;" rows="1" placeholder="댓글을 입력하세요..."></textarea>
                            </div>&nbsp;&nbsp;&nbsp;
                            <img class="insert-replyBtn" src="../../resources/icon/send.png">
                        </div>
                    </div>
                    
                    
                        
                    
                    
                    
                    


             </div>
             
         </section>


         <!-- 오른쪽 영역 -->
         <aside class="main-contents-right">
            <div class="toggle-area">
                <div class="toggle-switch" tabindex="0">
                    <input type="checkbox" name="my_checkbox" value="yes" id="checkbox-id" />
                    <label for="checkbox-id">
                      <div class="area" aria-hidden="true">
                        <div class="background">
                            <div class="handle"></div>
                        </div>
                        <p>인기순</p>
                      </div>
                    </label>
                  </div>
            </div>
         </aside>
    </section>
    
</body>
</html>
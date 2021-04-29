<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <c:forEach var="f" items="${ feed }">
                <div class="content-area">
                    <div class="top-content">
                        <p class="top-content-left">
                            <img class="profile-img" src="${ contextPath }/resources/uploadFiles/${ arti.attachment.attSvName }">&nbsp;&nbsp;
                            <span class="profile-name nanumsquare">${ arti.artist.artiNickname }</span>
                            <img class="artist-check" src="${ contextPath }/resources/icon/tick.svg">
                        </p>
                        <p class="top-content-right">
                            <span class="feed-date nanumsquare">${ f.fcreate }</span>
                        </p>
                    </div>                   
                    <div class="main-content">
                        <div class="photo-area">
                         <c:set var="count" value="0"/>
                         <c:forEach var="attach" items="${ attachment }">
                          <c:if test="${ f.fid eq attach.attachment.refId }">
                          <c:set var="count" value="${ count + 1 }"/>
                          </c:if>
                         </c:forEach>
                        <c:forEach var="attach" items="${ attachment }">
                        <c:if test="${ f.fid eq attach.attachment.refId }">
                        	<c:choose>
                        	<c:when test="${ count eq 0 }">
                            <input class="p" type="hidden" value="Y">
                            <c:set var="no" value="${ count }"/>
                            <img class="pic" src="${ contextPath }/resources/uploadFiles/${ attach.attachment.attSvName }">
                            </c:when>
                        	<c:when test="${ count eq 1 }">
                        	<input class="p1" type="hidden" value="Y">
                            <img class="pic1" src="${ contextPath }/resources/uploadFiles/${ attach.attachment.attSvName }">
                            </c:when>
                            <c:when test="${ count eq 2 }">
                            <input class="p2" type="hidden" value="Y">
                            <img class="pic2" src="${ contextPath }/resources/uploadFiles/${ attach.attachment.attSvName }">
                            </c:when>
                            <c:when test="${ count eq 3 }">
                            <input class="p3" type="hidden" value="Y">
                            <img class="pic3" src="${ contextPath }/resources/uploadFiles/${ attach.attachment.attSvName }">
                            </c:when>
                            <c:when test="${ count eq 4 }">
                            <input class="p4" type="hidden" value="Y">
                            <img class="pic4" src="${ contextPath }/resources/uploadFiles/${ attach.attachment.attSvName }">
                            </c:when>
                            </c:choose>
                        </c:if>
                        </c:forEach>
                        </div>
                        <div class="text-area nanumsquare" style="resize:none;">${ f.fcontent }</div>
                    </div>
                    <div class="bottom-content">
                        <div class="comment-search">
		                    <c:set var="cnum" value="0"/>
		                    <c:forEach var="c" items="${ comment }">
		                	<c:if test="${ f.fid eq c.feedReply.refId }">
		                	<c:set var="cnum" value="${ cnum + 1 }"/>
		                	</c:if>
		                	</c:forEach>
                            <span>댓글</span>&nbsp;<span class="comment-num">${ cnum }</span>&nbsp;
                        </div>

                   <table class="original-comment">
                        <colgroup>
                            <col width="5%"/>
                            <col width="95%"/>
                        </colgroup>
                        <c:forEach var="c" items="${ comment }">
                        <c:if test="${  f.fid eq c.feedReply.refId }">
	                        <c:if test="${ c.feedReply.refRid eq '' }">
		                        <c:choose>
		                        <c:when test="${ c.artist.artiNickname ne null }">
		                        <tr class="comment-line">
		                            <td>
		                            	<c:if test="${ loginUser.id ne c.feedReply.writer }">
		                                <div class="profile-bubble">
		                                    <p>프로필 보기</p>
		                                    <p class="feed-link">피드로 이동</p>
		                                </div>
		                                </c:if>
		                                <img class="profile-picture" src="${ contextPath }/resources/uploadFiles/${ c.artiAttach.attSvName }">
		                            </td>
		                            <td>
		                                <div class="comment-box">
		                                    <div class="artist-comment comment-main comment-center nanumsquare">
		                                        <div>
		                                            <div class="comment-name">${ c.artist.artiNickname }</div>
		                                            <div class="comment-content">${ c.feedReply.rcontent }</div>
		                                        </div>
								                <c:set var="check" value="N"/>
							                    <c:forEach var="r" items="${ comment }">
							                	<c:if test="${ r.feedReply.refRid eq c.feedReply.rid }">
							                	<c:set var="check" value="Y"/>
							                	</c:if>
							                	</c:forEach>
							                	<c:if test="${ check eq 'Y' }">
		                                        <span class="re-commentBtn">답글 열기</span>
		                                        </c:if>
		                                    </div>
		                                    <c:choose>
		                                    <c:when test="${ loginUser.id eq c.feedReply.writer }">
		                                    <div class="comment-etc">···
		                                        <div class="comment-bubble">
		                                            <p class="delete-comment" onclick="deleteComment(this, ${ c.feedReply.rid })">댓글 삭제</p>
		                                        </div>
		                                    </div>
		                                    </c:when>
		                                    <c:otherwise>
		                                    <div class="comment-etc">&nbsp;&nbsp;</div>
		                                    </c:otherwise>
		                                    </c:choose>
		                                </div>
		                                <div class="comment-info comment-center nanumsquare">
		                                <c:choose>
	                                		<c:when test="${ c.feedLike.lid ne 0 }">
		                                    <img class="likeBtn" src="${ contextPath }/resources/icon/like-black.svg" onclick="checkLike(${ c.feedReply.rid }, ${ c.feedLike.lid })">
	                                    	</c:when>
	                                    	<c:otherwise>
	                                    	<img class="likeBtn" src="${ contextPath }/resources/icon/like.svg" onclick="checkUnlike(${ c.feedReply.rid })">
	                                    	</c:otherwise>
		                                </c:choose>
		                                    <span class="like-count">${ c.feedReply.likeCount }</span><span class="comment-date">${ c.feedReply.rcreate }</span>
		                                </div>
		                                <table class="re-comment">
		                                    <colgroup>
		                                        <col width="5%"/>
		                                        <col width="95%"/>
		                                    </colgroup>
		                                    <c:forEach var="r" items="${ comment }">
		                                    <c:if test="${ r.feedReply.refRid ne '' && (r.feedReply.refRid eq c.feedReply.rid) }">
		                                    	<c:choose>
			                                    <c:when test="${ r.artist.artiNickname ne null }">
			                                    <tr class="comment-line">
			                                        <td>
						                            	<c:if test="${ loginUser.id ne r.feedReply.writer }">
						                                <div class="re-profile-bubble">
						                                    <p>프로필 보기</p>
						                                    <p class="feed-link">피드로 이동</p>
						                                </div>
						                                </c:if>
			                                            <img class="re-profile-picture" src="${ contextPath }/resources/uploadFiles/${ r.artiAttach.attSvName }">
			                                        </td>
			                                        <td>
			                                            <div class="comment-box">
			                                                <div class="artist-comment comment-main comment-center nanumsquare">
			                                                    <div>
			                                                        <span class="comment-name">${ r.artist.artiNickname }</span>
			                                                        <div class="comment-content">${ r.feedReply.rcontent }</div>
			                                                    </div>
			                                                </div>
			                                                <div class="re-comment-etc">···
						                                        <c:if test="${ loginUser.id eq r.feedReply.writer }">
			                                                    <div class="re-comment-bubble">
						                                            <p class="delete-comment" onclick="deleteComment(this, ${ r.feedReply.rid })">댓글 삭제</p>
			                                                    </div>
						                                        </c:if>
			                                                </div>
			                                            </div>
			                                            <div class="re-comment-info comment-center nanumsquare">
					                                	<c:choose>
					                                		<c:when test="${ r.feedLike.lid ne 0 }">
						                                    <img class="likeBtn" src="${ contextPath }/resources/icon/like-black.svg" onclick="checkLike(${ r.feedReply.rid }, ${ r.feedLike.lid })">
					                                    	</c:when>
					                                    	<c:otherwise>
					                                    	<img class="likeBtn" src="${ contextPath }/resources/icon/like.svg" onclick="checkUnlike(${ r.feedReply.rid })">
					                                    	</c:otherwise>
					                                    </c:choose>
			                                                <span class="like-count">${ r.feedReply.likeCount }</span><span class="comment-date">${ r.feedReply.rcreate }</span>
			                                            </div>
			                                        </td>
			                                    </tr>
			                                    </c:when>
			                                    <c:otherwise>
			                                    <tr class="comment-line">
			                                        <td>
			                                            <img class="re-profile-picture" src="${ contextPath }/resources/uploadFiles/${ r.userAttach.attSvName }">
			                                        </td>
			                                        <td>
			                                            <div class="comment-box">
			                                                <div class="user-comment comment-main comment-center nanumsquare">
			                                                    <div>
			                                                        <span class="comment-name">${ r.subscribe.unickname }</span>
			                                                        <div class="comment-content">${ r.feedReply.rcontent }</div>
			                                                    </div>
			                                                </div>
			                                                <div class="re-comment-etc">···
			                                                    <div class="re-comment-bubble">
						                                        	<c:choose>
						                                            <c:when test="${ loginUser.id ne r.feedReply.writer }">
						                                            <p>댓글 신고</p>
						                                            </c:when>
						                                            <c:when test="${ loginUser.id eq r.feedReply.writer }">
						                                            <p class="delete-comment" onclick="deleteComment(this, ${ r.feedReply.rid })">댓글 삭제</p>
						                                            </c:when>
						                                            </c:choose>
			                                                    </div>
			                                                </div>
			                                            </div>
			                                            <div class="re-comment-info comment-center nanumsquare">
					                                	<c:choose>
					                                		<c:when test="${ r.feedLike.lid ne 0 }">
						                                    <img class="likeBtn" src="${ contextPath }/resources/icon/like-black.svg" onclick="checkLike(${ r.feedReply.rid }, ${ r.feedLike.lid })">
					                                    	</c:when>
					                                    	<c:otherwise>
					                                    	<img class="likeBtn" src="${ contextPath }/resources/icon/like.svg" onclick="checkUnlike(${ r.feedReply.rid })">
					                                    	</c:otherwise>
					                                    </c:choose>
			                                                <span class="like-count">${ r.feedReply.likeCount }</span><span class="comment-date">${ r.feedReply.rcreate }</span>
			                                            </div>
			                                        </td>
			                                    </tr>
			                                    </c:otherwise>
			                                    </c:choose>
		                                    </c:if>
		                                    </c:forEach>
		                                </table>
		                            </td>
		                        </tr>
		                        </c:when>
		                        <c:otherwise>
		                          <tr class="comment-line">
		                            <td>
		                                <img class="profile-picture" src="${ contextPath }/resources/uploadFiles/${ c.userAttach.attSvName }">
		                            </td>
		                            <td>
		                                <div class="comment-box">
		                                    <div class="user-comment comment-main comment-center nanumsquare">
		                                        <div>
		                                            <span class="comment-name">${ c.subscribe.unickname }</span>
		                                            <div class="comment-content">${ c.feedReply.rcontent }</div>
		                                        </div>
		                                        <c:set var="check" value="N"/>
							                    <c:forEach var="r" items="${ comment }">
							                	<c:if test="${ r.feedReply.refRid eq c.feedReply.rid }">
							                	<c:set var="check" value="Y"/>
							                	</c:if>
							                	</c:forEach>
							                	<c:if test="${ check eq 'Y' }">
		                                        <span class="re-commentBtn">답글 열기</span>
		                                        </c:if>
		                                    </div>
		                                    <div class="comment-etc">···
		                                        <div class="comment-bubble">
		                                            <p>댓글 신고</p>
		                                        </div>
		                                    </div>
		                                </div>
		                                <div class="comment-info comment-center nanumsquare">
	                                	<c:choose>
	                                		<c:when test="${ c.feedLike.lid ne 0 }">
		                                    <img class="likeBtn" src="${ contextPath }/resources/icon/like-black.svg" onclick="checkLike(${ c.feedReply.rid }, ${ c.feedLike.lid })">
	                                    	</c:when>
	                                    	<c:otherwise>
	                                    	<img class="likeBtn" src="${ contextPath }/resources/icon/like.svg" onclick="checkUnlike(${ c.feedReply.rid })">
	                                    	</c:otherwise>
	                                    </c:choose>
		                                    <span class="like-count">${ c.feedReply.likeCount }</span><span class="comment-date">${ c.feedReply.rcreate }</span>
		                                </div>
		                                <table class="re-comment">
		                                    <colgroup>
		                                        <col width="5%"/>
		                                        <col width="95%"/>
		                                    </colgroup>
		                                    <c:forEach var="r" items="${ comment }">
		                                    <c:if test="${ r.feedReply.refRid ne '' && r.feedReply.refRid eq c.feedReply.rid }">
			                                    <c:choose>
			                                    <c:when test="${ r.artist.artiNickname ne null }">
			                                    <tr class="comment-line">
			                                        <td>
						                            	<c:if test="${ loginUser.id ne r.feedReply.writer }">
						                                <div class="re-profile-bubble">
						                                    <p>프로필 보기</p>
						                                    <p class="feed-link">피드로 이동</p>
						                                </div>
						                                </c:if>
			                                            <img class="re-profile-picture" src="${ contextPath }/resources/uploadFiles/${ r.artiAttach.attSvName }">
			                                        </td>
			                                        <td>
			                                            <div class="comment-box">
			                                                <div class="artist-comment comment-main comment-center nanumsquare">
			                                                    <div>
			                                                        <span class="comment-name">${ r.artist.artiNickname }</span>
			                                                        <div class="comment-content">${ r.feedReply.rcontent }</div>
			                                                    </div>
			                                                </div>
			                                                <div class="re-comment-etc">···
			                                                    <div class="re-comment-bubble">
						                                            <c:if test="${ loginUser.id eq r.feedReply.writer }">
						                                            <p class="delete-comment" onclick="deleteComment(this, ${ r.feedReply.rid })">댓글 삭제</p>
						                                            </c:if>
			                                                    </div>
			                                                </div>
			                                            </div>
			                                            <div class="re-comment-info comment-center nanumsquare">
			   		                                	<c:choose>
					                                		<c:when test="${ r.feedLike.lid ne 0 }">
						                                    <img class="likeBtn" src="${ contextPath }/resources/icon/like-black.svg" onclick="checkLike(${ r.feedReply.rid }, ${ r.feedLike.lid })">
					                                    	</c:when>
					                                    	<c:otherwise>
					                                    	<img class="likeBtn" src="${ contextPath }/resources/icon/like.svg" onclick="checkUnlike(${ r.feedReply.rid })">
					                                    	</c:otherwise>
					                                    </c:choose>
			                                                <span class="like-count">${ r.feedReply.likeCount }</span><span class="comment-date">${ r.feedReply.rcreate }</span>
			                                            </div>
			                                        </td>
			                                    </tr>
			                                    </c:when>
			                                    <c:otherwise>
			                                      <tr class="comment-line">
			                                        <td>
			                                            <img class="re-profile-picture" src="${ contextPath }/resources/uploadFiles/${ r.userAttach.attSvName }">
			                                        </td>
			                                        <td>
			                                            <div class="comment-box">
			                                                <div class="user-comment comment-main comment-center nanumsquare">
			                                                    <div>
			                                                        <span class="comment-name">${ r.subscribe.unickname }</span>
			                                                        <div class="comment-content">${ r.feedReply.rcontent }</div>
			                                                    </div>
			                                                </div>
			                                                <div class="re-comment-etc">···
			                                                    <div class="re-comment-bubble">
			                                                        <c:choose>
						                                            <c:when test="${ loginUser.id ne r.feedReply.writer }">
						                                            <p>댓글 신고</p>
						                                            </c:when>
						                                            <c:when test="${ loginUser.id eq r.feedReply.writer }">
						                                            <p class="delete-comment" onclick="deleteComment(this, ${ r.feedReply.rid })">댓글 삭제</p>
						                                            </c:when>
						                                            </c:choose>
			                                                    </div>
			                                                </div>
			                                            </div>
			                                            <div class="re-comment-info comment-center nanumsquare">
			                                            <c:choose>
					                                		<c:when test="${ r.feedLike.lid ne 0 }">
						                                    <img class="likeBtn" src="${ contextPath }/resources/icon/like-black.svg" onclick="checkLike(${ r.feedReply.rid }, ${ r.feedLike.lid })">
					                                    	</c:when>
					                                    	<c:otherwise>
					                                    	<img class="likeBtn" src="${ contextPath }/resources/icon/like.svg" onclick="checkUnlike(${ r.feedReply.rid })">
					                                    	</c:otherwise>
					                                    </c:choose>
			                                                <span class="like-count">${ r.feedReply.likeCount }</span><span class="comment-date">${ r.feedReply.rcreate }</span>
			                                            </div>
			                                        </td>
			                                    </tr>
			                                    </c:otherwise>
			                                    </c:choose>
		                                    </c:if>
		                                    </c:forEach>
		                                </table>
		                            </td>
		                        </tr>
		                        </c:otherwise>
		                        </c:choose>
	                        </c:if>
                        </c:if>
                        </c:forEach>
                    </table>
                    	<c:if test="${ cnum > 3 }">
                        <div class="last-btn">
                            <button class="detail-btn nanumsquare" type="button" onclick="selectFeed(${ f.fid })">···</button>
                        </div>
                        </c:if>
                    </div>
                </div>
                </c:forEach>
            </div>
            <!-- 리모컨 -->
            <div id="menubar">
                <div class="mypage-menu">
                    <span class="nanumsquare">Menu</span>
                    <div class="btn-area">
                        <p id="bookmarkBtn" class="mypage-btn nanumsquare">My Bookmarks</p>
                        <p id="commentBtn" class="mypage-btn nanumsquare">My Comments</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<!-- 본문 끝 -->
	
	<script>
	var p1 = $(".p1").val();
	var p2 = $(".p2").val();
	var p3 = $(".p3").val();
	var p4 = $(".p4").val();
	var pic = $(".pic");
	var pic1 = $(".pic1");
	var pic2 = $(".pic2");
	var pic3 = $(".pic3:first-of-type");
	var not1 = $(".comment-line:nth-of-type(1)");
	var not2 = $(".comment-line:nth-of-type(2)");
	var not3 = $(".comment-line:nth-of-type(3)");
	
	$(document).ready(function() {
		// 사진 사이즈 지정하기(1/2/3/4개)
		console.log("pic1 : " + pic1);
		console.log("pic2 : " + pic2);
		console.log("pic3 : " + pic3);
		
		if(p1 == "Y") {
			pic1.addClass("pic-size1");
		}
		
		if(p2 == "Y") {
			pic2.addClass("pic-size2");
			$(".pic2:nth-of-type(1)").css({"border-top-left-radius":"10px", "border-bottom-left-radius":"10px"}); 
			$(".pic2:nth-of-type(2)").css({"border-top-right-radius":"10px", "border-bottom-right-radius":"10px"});
		} 
		
		if(p3 == "Y") {
			pic3.addClass("pic-size3");
			$(".pic3:nth-of-type(1)").css({"border-top-left-radius":"10px", "border-bottom-left-radius":"10px"}); 
			$(".pic3:nth-of-type(2)").css("border-top-right-radius","10px");
			$(".pic3:nth-of-type(3)").css("border-bottom-right-radius","10px");
		}
		
		if(p4 == "Y") {
			$(".pic4:nth-of-type(1)").css("border-top-left-radius","10px"); 
			$(".pic4:nth-of-type(2)").css("border-top-right-radius","10px");
			$(".pic4:nth-of-type(3)").css("border-bottom-left-radius","10px"); 
			$(".pic4:nth-of-type(4)").css("border-bottom-right-radius","10px");
		}
		
		// 댓글, 대댓글 3개씩 자르기
		not1.addClass("display-none");
		not2.addClass("display-none");
		not3.addClass("display-none");
		$('.comment-line').not('.display-none').css("display", "none");
		
		// 대댓글이 있을 시에만 보여주기
        for(var i = 1; i <= $(".comment-line").length; i++) {
            if($(".comment-line:eq(" + i + ")").children().children(".re-comment").text()) {
                $(".re-commentBtn:eq(" + i + ")").css("display","none");
            }
        }
	});
	
 	// '...' 버튼 클릭할 때 해당 피드 상세페이지로 이동
    function selectFeed(fid) {
    	location.href="${ contextPath }/artistfeed/detailView?fid" + fid;
 	}
 	
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
    
 	// '피드로 이동' 클릭했을 때 피드 페이지로 이동
    $("").click(function() {
	    location.href="${ contextPath }/official/schedule";
	});
    
    // 댓글 삭제하기
    function deleteComment(e, rid) {
    	console.log(e);
    	$(e).siblings(".comment-name").text("");
    	$(e).siblings(".comment-content").text("삭제된 댓글입니다.");
    	
    	if(confirm("댓글을 삭제하시겠습니까?")) {
    		
    		
    		$.ajax({
    			url : "${ contextPath }/mypage/deleteReply",
    			data : { rid : rid },
    			type : "post",
    			dataType : "json",
    			success : function() {
    			} 
    		});
    	}
    }
    
    // 댓글 신고하기
    function reportComment(refId, rptType, rptReason) {
   		$.ajax({
   			url : "${ contextPath }/mypage/reportReply",
   			data : { refId : refId, rptType : rptType, rptReason : rptReason },
   			type : "post",
   			dataType : "json",
   			success : function() {
   				alert("신고가 정상적으로 접수되었습니다.");
   			}
   		});
    }
    
    // 프로필 보기, 피드로 이동, 댓글 신고 링크 얻어오기
    
    // 북마크 페이지로 이동
    $("#bookmarkBtn").click(function() {
	    location.href="${ contextPath }/mypage/artist/bookmarks";
	});
    
    // 코멘트 페이지로 이동
    $("#commentBtn").click(function() {
	    location.href="${ contextPath }/mypage/artist/comments";
	});
	</script>
</body>
</html>
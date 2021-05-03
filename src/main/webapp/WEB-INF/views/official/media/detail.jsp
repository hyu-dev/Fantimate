<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/official/mediaDetail.css">
<!-- 모달  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style>
/* 모달 */
a { text-decoration:none }

#ex2 {
    display: none;
    vertical-align: middle;
    position: relative;
    z-index: 2;
    max-width: 1000px;
    box-sizing: border-box;
    width: 100%;
    background: #2c2828;
    padding: 15px 30px;
    -webkit-border-radius: 8px;
    -moz-border-radius: 8px;
    -o-border-radius: 8px;
    -ms-border-radius: 8px;
    border-radius: 8px;
    -webkit-box-shadow: 0 0 10px #000;
    -moz-box-shadow: 0 0 10px #000;
    -o-box-shadow: 0 0 10px #000;
    -ms-box-shadow: 0 0 10px #000;
    box-shadow: 0 0 10px #000;
    text-align: left;
    max-height: 510px;
    height: 100%;
} 
</style>
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
                </div>
                <div class="media-center">
                    <video src="${ contextPath }/resources/uploadFiles/${ media.mediaFile.vidSvName }"
                    controls="controls" poster="${ contextPath }/resources/uploadFiles/${ media.mediaFile.picSvName }"></video>
                    <div class="media-main">
                        <textarea class="media-content nanumsquare" style="resize:none;" readonly>${ media.official.mediaCtt }</textarea>
                        <c:choose>
                        <c:when test="${ bmark eq null }">
                        <img id="bookMark" src="${ contextPath }/resources/images/official/bookmark.svg" style="width: 30px; height: 30px;">
                        </c:when>
                        <c:otherwise>
                        <img id="bookMark" src="${ contextPath }/resources/images/official/bookmark-black.svg" style="width: 30px; height: 30px;">
                        </c:otherwise>
                        </c:choose>
                        <div class="media-info">
                            <span>댓글</span>&nbsp;<span>${ rcount }</span>&nbsp;
                            <select class="comment-category">
                                <option>&nbsp;최신순</option>
                                <option>&nbsp;인기순</option>
                            </select>
                            <input type="checkbox" id="myComment" name="myComment" value="myComment">
                            <label for="myComment">내 댓글만</label>
                            <span class="watching-count">${ media.official.mediaCount }</span><span class="watching-count">조회수&nbsp;</span>
                        </div>
                    </div>
                </div>
                    <div class="comment-container">
                        <div class="comment-area">
                            <input type="text" class="comment nanumsquare" value="댓글을 입력하세요." onclick="clearText(this);">
                        </div>&nbsp;&nbsp;&nbsp;
                        <img class="send-btn" src="${ contextPath }/resources/images/official/send.svg">
                    </div>
                    <table class="original-comment">
                        <colgroup>
                            <col width="5%"/>
                            <col width="95%"/>
                        </colgroup>
                        <c:forEach var="c" items="${ comment }">
                        <c:if test="${ c.mediaReply.refRid eq '' }">
	                        <c:choose>
	                        <c:when test="${ c.artist.artiId ne null }">
	                        <tr class="comment-line">
	                            <td>
	                            	<c:if test="${ loginUser.id ne c.mediaReply.writer }">
	                                <div class="profile-bubble">
	                                    <p><a href="#ex1" rel="modal:open" style="color:#5C5F78">프로필 보기</a></p>
	                                    <p onclick="artistFeed('${ c.artist.artiId }');">피드로 이동</p>
	                                </div>
	                                </c:if>
	                                <img class="profile-picture" src="${ contextPath }/resources/uploadFiles/${ c.artiAttach.attSvName }">
	                            </td>
	                            <td>
	                                <div class="comment-box">
	                                    <div class="artist-comment comment-main comment-center nanumsquare">
	                                        <div>
	                                            <span class="comment-name">${ c.mediaReply.nickname }</span>
	                                            <div class="comment-content">${ c.mediaReply.rcontent }</div>
	                                        </div>
							                <c:set var="check" value="N"/>
						                    <c:forEach var="r" items="${ comment }">
						                	<c:if test="${ r.mediaReply.refRid eq c.mediaReply.rid }">
						                	<c:set var="check" value="Y"/>
						                	</c:if>
						                	</c:forEach>
						                	<c:if test="${ check eq 'Y' }">
	                                        <span class="re-commentBtn">답글 열기</span>
	                                        </c:if>
	                                    </div>
	                                    <div class="comment-etc">···
	                                        <div class="comment-bubble">
	                                        	<c:choose>
	                                        	<c:when test="${ loginUser.id ne c.mediaReply.writer }">
	                                            <p class="add-comment">답글 달기</p>
	                                            </c:when>
	                                            <c:when test="${ loginUser.id eq c.mediaReply.writer }">
	                                            <p class="add-comment">답글 달기</p>
	                                            <p class="delete-comment" onclick="deleteComment(this, ${ c.mediaReply.rid });">댓글 삭제</p>
	                                            </c:when>
	                                            </c:choose>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="comment-info comment-center nanumsquare">
	                                    <c:if test="${ c.mediaLike.lstatus eq 'N' || c.mediaLike.lstatus eq null }">
                                        <img class="likeBtn" src="${ contextPath }/resources/images/official/like.svg" onclick="checkLike(this, ${ c.mediaReply.rid });">
                                        </c:if>
                                        <c:if test="${ c.mediaLike.lstatus eq 'Y' }">
                                        <img class="likeBtn" src="${ contextPath }/resources/images/official/like-black.svg" onclick="checkLike(this, ${ c.mediaReply.rid });">
                                        </c:if>
	                                    <span class="like-count">${ c.mediaReply.likeCount }</span>
	                                    <span class="comment-date"><fmt:formatDate value="${ c.mediaReply.rcreate }" pattern="yyyy.MM.dd HH:mm"/></span>
	                                </div>
	                                <div class="comment-toggle">
	                                    <div class="re-comment-container">
	                                        <div class="comment-area">
	                                            <input type="text" class="comment nanumsquare" value="댓글을 입력하세요." onclick="clearText(this);">
	                                        </div>&nbsp;&nbsp;&nbsp;
	                                        <img class="re-send-btn" src="${ contextPath }/resources/images/official/send.svg" onclick="insertRecomment(this, 
	                                        															${ c.mediaReply.rid }, ${ c.mediaReply.classify });">
	                                    </div>
	                                </div>
	                                <table class="re-comment">
	                                    <colgroup>
	                                        <col width="5%"/>
	                                        <col width="95%"/>
	                                    </colgroup>
	                                    <c:forEach var="r" items="${ comment }">
	                                    <c:if test="${ r.mediaReply.refRid ne '' && (r.mediaReply.refRid eq c.mediaReply.rid) }">
	                                    	<c:choose>
		                                    <c:when test="${ r.artist.artiId ne null }">
		                                    <tr class="comment-line">
		                                        <td>
					                            	<c:if test="${ loginUser.id ne r.mediaReply.writer }">
					                                <div class="re-profile-bubble">
					                                    <p><a href="#ex1" rel="modal:open" style="color:#5C5F78">프로필 보기</a></p>
					                                    <p onclick="artistFeed('${ r.artist.artiId }');">피드로 이동</p>
					                                </div>
					                                </c:if>
		                                            <img class="re-profile-picture" src="${ contextPath }/resources/uploadFiles/${ r.artiAttach.attSvName }">
		                                        </td>
		                                        <td>
		                                            <div class="comment-box">
		                                                <div class="artist-comment comment-main comment-center nanumsquare">
		                                                    <div>
		                                                        <span class="comment-name">${ r.mediaReply.nickname }</span>
		                                                        <div class="comment-content">${ r.mediaReply.rcontent }</div>
		                                                    </div>
		                                                </div>
		                                                <c:if test="${ loginUser.id eq r.mediaReply.writer }">
		                                                <div class="re-comment-etc">···
		                                                    <div class="re-comment-bubble">
					                                            <p class="delete-comment" onclick="deleteComment(this, ${ r.mediaReply.rid });">댓글 삭제</p>
		                                                    </div>
		                                                </div>
		                                                </c:if>
		                                            </div>
		                                            <div class="re-comment-info comment-center nanumsquare">
		                                            	<c:if test="${ r.mediaLike.lstatus eq 'N' || r.mediaLike.lstatus eq null }">
		                                                <img class="likeBtn" src="${ contextPath }/resources/images/official/like.svg" onclick="checkLike(this, ${ r.mediaReply.rid });">
		                                                </c:if>
		                                                <c:if test="${ r.mediaLike.lstatus eq 'Y' }">
		                                                <img class="likeBtn" src="${ contextPath }/resources/images/official/like-black.svg" onclick="checkLike(this, ${ c.mediaReply.rid });">
		                                                </c:if>
		                                                <span class="like-count">${ r.mediaReply.likeCount }</span>
		                                                <span class="comment-date"><fmt:formatDate value="${ r.mediaReply.rcreate }" pattern="yyyy.MM.dd HH:mm"/></span>
		                                            </div>
		                                        </td>
		                                    </tr>
		                                    </c:when>
		                                    <c:otherwise>
		                                    <tr class="comment-line">
		                                        <td>
					                            	<c:if test="${ loginUser.id ne r.mediaReply.writer }">
					                            		<c:choose>
					                            		<c:when test="${ (loginUser.id eq r.friend.frSend && r.mediaReply.writer eq r.friend.frRecId) || (loginUser.id eq r.friend.frRecId && r.mediaReply.writer eq r.friend.frSend) }">
			                            					   <c:choose>
			                            					   <c:when test="${ r.friend.frStatus eq 1 || r.friend.frStatus eq 3 }">
			                            					   	<div class="re-profile-bubble">
								                                    <p>쪽지 보내기</p>
								                                </div>
			                            					   </c:when>
			                            					   <c:when test="${ r.friend.frStatus eq 2 }">
			                            					   	<div class="re-profile-bubble">
								                                    <p>친구 피드로 이동</p>
								                                    <p>쪽지 보내기</p>
								                                </div>
			                            					   </c:when>
			                            					   </c:choose>
					                            		</c:when>
					                            		<c:when test="${ r.friend.frStatus eq '' }">
					                            		<div class="re-profile-bubble">
						                                    <p onclick="applyFriend(this, '${ r.mediaReply.nickname }', '${ r.mediaReply.writer }');">친구 신청</p>
						                                    <p>쪽지 보내기</p>
						                                </div>
					                            		</c:when>
					                            		</c:choose>
					                                </c:if>
		                                            <img class="re-profile-picture" src="${ contextPath }/resources/uploadFiles/${ r.userAttach.attSvName }">
		                                        </td>
		                                        <td>
		                                            <div class="comment-box">
		                                                <div class="re-user-comment comment-main comment-center nanumsquare">
		                                                    <div>
		                                                        <span class="comment-name">${ r.mediaReply.nickname }</span>
		                                                        <div class="comment-content">${ r.mediaReply.rcontent }</div>
		                                                    </div>
		                                                </div>
		                                                <div class="re-comment-etc">···
		                                                    <div class="re-comment-bubble">
					                                        	<c:choose>
					                                            <c:when test="${ loginUser.id ne r.mediaReply.writer }">
					                                            <p>댓글 신고</p>
					                                            </c:when>
					                                            <c:when test="${ loginUser.id eq r.mediaReply.writer }">
					                                            <p class="delete-comment" onclick="deleteComment(this, ${ r.mediaReply.rid });">댓글 삭제</p>
					                                            </c:when>
					                                            </c:choose>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <div class="re-comment-info comment-center nanumsquare">
		                                            	<c:if test="${ r.mediaLike.lstatus eq 'N' || r.mediaLike.lstatus eq null }">
		                                                <img class="likeBtn" src="${ contextPath }/resources/images/official/like.svg" onclick="checkLike(this, ${ r.mediaReply.rid });">
		                                                </c:if>
		                                                <c:if test="${ r.mediaLike.lstatus eq 'Y' }">
		                                                <img class="likeBtn" src="${ contextPath }/resources/images/official/like-black.svg" onclick="checkLike(this, ${ r.mediaReply.rid });">
		                                                </c:if>
		                                                <span class="like-count">10</span>
		                                                <span class="comment-date"><fmt:formatDate value="${ r.mediaReply.rcreate }" pattern="yyyy.MM.dd HH:mm"/></span>
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
	                                <c:if test="${ loginUser.id ne c.mediaReply.writer }">
	                                <c:choose>
                            		<c:when test="${ (loginUser.id eq c.friend.frSend && c.mediaReply.writer eq c.friend.frRecId)
                           					   || (loginUser.id eq c.friend.frRecId && c.mediaReply.writer eq c.friend.frSend) }">
                           					   <c:choose>
                           					   <c:when test="${ c.friend.frStatus eq 1 || c.friend.frStatus eq 3 }">
                           					   	<div class="re-profile-bubble">
				                                    <p>쪽지 보내기</p>
				                                </div>
                           					   </c:when>
                           					   <c:when test="${ c.friend.frStatus eq 2 }">
                           					   	<div class="re-profile-bubble">
				                                    <p>친구 피드로 이동</p>
				                                    <p>쪽지 보내기</p>
				                                </div>
                           					   </c:when>
                           					   </c:choose>
                            		</c:when>
                            		<c:when test="${ c.friend.frStatus eq '' }">
                            		<div class="re-profile-bubble">
	                                    <p onclick="applyFriend(this, '${ c.mediaReply.nickname }', '${ c.mediaReply.writer }');">친구 신청</p>
	                                    <p>쪽지 보내기</p>
	                                </div>
                            		</c:when>
                            		</c:choose>
	                                </c:if>
	                                <img class="profile-picture" src="${ contextPath }/resources/uploadFiles/${ c.userAttach.attSvName }">
	                            </td>
	                            <td>
	                                <div class="comment-box">
	                                    <div class="user-comment comment-main comment-center nanumsquare">
	                                        <div>
	                                            <span class="comment-name">${ c.mediaReply.nickname }</span>
	                                            <div class="comment-content">${ c.mediaReply.rcontent }</div>
	                                        </div>
	                                        <c:set var="check" value="N"/>
						                    <c:forEach var="r" items="${ comment }">
						                	<c:if test="${ r.mediaReply.refRid eq c.mediaReply.rid }">
						                	<c:set var="check" value="Y"/>
						                	</c:if>
						                	</c:forEach>
						                	<c:if test="${ check eq 'Y' }">
	                                        <span class="re-commentBtn">답글 열기</span>
	                                        </c:if>
	                                    </div>
	                                    <div class="comment-etc">···
	                                        <div class="comment-bubble">
	                                        	<c:choose>
	                                            <c:when test="${ loginUser.id ne c.mediaReply.writer }">
	                                            <p class="add-comment">답글 달기</p>
	                                            <p>댓글 신고</p>
	                                            </c:when>
	                                            <c:when test="${ loginUser.id eq c.mediaReply.writer }">
	                                            <p class="add-comment">답글 달기</p>
	                                            <p class="delete-comment" onclick="deleteComment(this, ${ c.mediaReply.rid });">댓글 삭제</p>
	                                            </c:when>
	                                            </c:choose>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="comment-info comment-center nanumsquare">
	                                    <c:if test="${ c.mediaLike.lstatus eq 'N' || c.mediaLike.lstatus eq null }">
                                        <img class="likeBtn" src="${ contextPath }/resources/images/official/like.svg" onclick="checkLike(this, ${ c.mediaReply.rid });">
                                        </c:if>
                                        <c:if test="${ c.mediaLike.lstatus eq 'Y' }">
                                        <img class="likeBtn" src="${ contextPath }/resources/images/official/like-black.svg" onclick="checkLike(this, ${ c.mediaReply.rid });">
                                        </c:if>
	                                    <span class="like-count">${ c.mediaReply.likeCount }</span>
	                                    <span class="comment-date"><fmt:formatDate value="${ c.mediaReply.rcreate }" pattern="yyyy.MM.dd HH:mm"/></span>
	                                </div>
	                                <div class="comment-toggle">
	                                    <div class="re-comment-container">
	                                        <div class="comment-area">
	                                            <input type="text" class="comment nanumsquare" value="댓글을 입력하세요." onclick="clearText(this);">
	                                        </div>&nbsp;&nbsp;&nbsp;
	                                        <img class="re-send-btn" src="${ contextPath }/resources/images/official/send.svg" onclick="insertRecomment(this,
	                                         															${ c.mediaReply.rid }, ${ c.mediaReply.classify });">
	                                    </div>
	                                </div>
	                                <table class="re-comment">
	                                    <colgroup>
	                                        <col width="5%"/>
	                                        <col width="95%"/>
	                                    </colgroup>
	                                    <c:forEach var="r" items="${ comment }">
	                                    <c:if test="${ r.mediaReply.refRid ne '' && r.mediaReply.refRid eq c.mediaReply.rid }">
		                                    <c:choose>
		                                    <c:when test="${ r.artist.artiId ne null }">
		                                    <tr class="comment-line">
		                                        <td>
					                            	<c:if test="${ loginUser.id ne r.mediaReply.writer }">
					                                <div class="re-profile-bubble">
					                                    <p><a href="#ex1" rel="modal:open" style="color:#5C5F78">프로필 보기</a></p>
					                                    <p onclick="artistFeed('${ r.artist.artiId }');">피드로 이동</p>
					                                </div>
					                                </c:if>
		                                            <img class="re-profile-picture" src="${ contextPath }/resources/uploadFiles/${ r.artiAttach.attSvName }">
		                                        </td>
		                                        <td>
		                                            <div class="comment-box">
		                                                <div class="re-artist-comment comment-main comment-center nanumsquare">
		                                                    <div>
		                                                        <span class="comment-name">${ r.mediaReply.nickname }</span>
		                                                        <div class="comment-content">${ r.mediaReply.rcontent }</div>
		                                                    </div>
		                                                </div>
		                                                <c:if test="${ loginUser.id eq r.mediaReply.writer }">
		                                                <div class="re-comment-etc">···
		                                                    <div class="re-comment-bubble">
					                                            <p class="delete-comment" onclick="deleteComment(this, ${ r.mediaReply.rid });">댓글 삭제</p>
		                                                    </div>
		                                                </div>
		                                                </c:if>
		                                            </div>
		                                            <div class="re-comment-info comment-center nanumsquare">
		                                                <c:if test="${ r.mediaLike.lstatus eq 'N' || r.mediaLike.lstatus eq null }">
		                                                <img class="likeBtn" src="${ contextPath }/resources/images/official/like.svg" onclick="checkLike(this, ${ r.mediaReply.rid });">
		                                                </c:if>
		                                                <c:if test="${ r.mediaLike.lstatus eq 'Y' }">
		                                                <img class="likeBtn" src="${ contextPath }/resources/images/official/like-black.svg" onclick="checkLike(this, ${ r.mediaReply.rid });">
		                                                </c:if>
		                                                <span class="like-count">${ r.mediaReply.likeCount }</span>
		                                                <span class="comment-date">${ r.mediaReply.rcreate }</span>
		                                            </div>
		                                        </td>
		                                    </tr>
		                                    </c:when>
		                                    <c:otherwise>
		                                      <tr class="comment-line">
		                                        <td>
					                                <c:if test="${ loginUser.id ne r.mediaReply.writer }">
					                                <c:choose>
				                            		<c:when test="${ (loginUser.id eq r.friend.frSend && r.mediaReply.writer eq r.friend.frRecId)
		                            					   || (loginUser.id eq r.friend.frRecId && r.mediaReply.writer eq r.friend.frSend) }">
		                            					   <c:choose>
		                            					   <c:when test="${ r.friend.frStatus eq 1 || r.friend.frStatus eq 3 }">
		                            					   	<div class="re-profile-bubble">
							                                    <p>쪽지 보내기</p>
							                                </div>
		                            					   </c:when>
		                            					   <c:when test="${ r.friend.frStatus eq 2 }">
		                            					   	<div class="re-profile-bubble">
							                                    <p>친구 피드로 이동</p>
							                                    <p>쪽지 보내기</p>
							                                </div>
		                            					   </c:when>
		                            					   </c:choose>
								                    </c:when>
				                            		<c:when test="${ r.friend.frStatus eq '' }">
				                            		<div class="re-profile-bubble">
					                                    <p onclick="applyFriend(this, '${ r.mediaReply.nickname }', '${ r.mediaReply.writer }');">친구 신청</p>
					                                    <p>쪽지 보내기</p>
					                                </div>
				                            		</c:when>
				                            		</c:choose>
					                                </c:if>
		                                            <img class="re-profile-picture" src="${ contextPath }/resources/uploadFiles/${ r.userAttach.attSvName }">
		                                        </td>
		                                        <td>
		                                            <div class="comment-box">
		                                                <div class="re-user-comment comment-main comment-center nanumsquare">
		                                                    <div>
		                                                        <span class="comment-name">${ r.mediaReply.nickname }</span>
		                                                        <div class="comment-content">${ r.mediaReply.rcontent }</div>
		                                                    </div>
		                                                </div>
		                                                <div class="re-comment-etc">···
		                                                    <div class="re-comment-bubble">
		                                                        <c:choose>
					                                            <c:when test="${ loginUser.id ne r.mediaReply.writer }">
					                                            <p>댓글 신고</p>
					                                            </c:when>
					                                            <c:when test="${ loginUser.id eq r.mediaReply.writer }">
					                                            <p class="delete-comment" onclick="deleteComment(this, ${ r.mediaReply.rid });">댓글 삭제</p>
					                                            </c:when>
					                                            </c:choose>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <div class="re-comment-info comment-center nanumsquare">
		                                                <c:if test="${ r.mediaLike.lstatus eq 'N' || r.mediaLike.lstatus eq null }">
		                                                <img class="likeBtn" src="${ contextPath }/resources/images/official/like.svg" onclick="checkLike(this, ${ r.mediaReply.rid });">
		                                                </c:if>
		                                                <c:if test="${ r.mediaLike.lstatus eq 'Y' }">
		                                                <img class="likeBtn" src="${ contextPath }/resources/images/official/like-black.svg" onclick="checkLike(this, ${ r.mediaReply.rid });">
		                                                </c:if>
		                                                <span class="like-count">${ r.mediaReply.likeCount }</span>
		                                                <span class="comment-date">${ r.mediaReply.rcreate }</span>
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
                        </c:forEach>
                    </table>
                </div>
        </section>
        
       <!-- 프로필 모달창 -->
	  <div id="ex1" class="modal" style="width:500px; height:300px;">
		 <h3>아티스트 프로필</h3>
	  <hr width="95%">
	  <br><br>
	 <table 
		style="border-right:none; border-left:none; border-top:none; border-bottom:none;">
	  <tr>
	      <td rowspan="3" colspan="2" width="150px">
	      <img class="prof-picture" src="${ contextPath }/resources/uploadFiles/${ r.artiAttach.attSvName }" 
	       style="border-radius:0; width:150px; height:80px" >    
    		  </td>
	      <td colspan="2" width="100px">이름</td>
	      <td colspan="3">${ r.artist.artiName }</td>
	      
	  </tr>
	  <tr>
	      <td colspan="2">SNS주소</td>
	      <td><a href="https://ko-kr.facebook.com/iu.loen" target='_blank'><img src="${ contextPath }/resources/images/mypage/artist/facebook.png" style="width:50px; height:32px"></a></td>
	      <td><img src="${ contextPath }/resources/images/mypage/artist/인스타그램.png" style="width:50px; height:32px"></td>
	      <td><img src="${ contextPath }/resources/images/mypage/artist/twitter.png" style="width:50px; height:32px"></td>
	  </tr>
	  <tr>
	      <td colspan="2">상태 메세지</td>
	      <td colspan="3" width="">${ r.artist.artiDailymsg }</td>
	  </tr>
	 </table>
	 
		<a href="#" rel="modal:close" style="color:black"></a>
	</div>
	<!-- 모달 끝 -->
        
        <script>
        // 북마크 클릭 여부 확인하기
        $("#bookMark").click(function() {
        	var mediaNum = ${ media.official.mediaNum };
        	
            if(document.getElementById("bookMark").getAttribute('src') == "${ contextPath }/resources/images/official/bookmark.svg") {
                document.getElementById("bookMark").src = "${ contextPath }/resources/images/official/bookmark-black.svg";
                
                return insertBookmark(mediaNum);
            } else {
                document.getElementById("bookMark").src = "${ contextPath }/resources/images/official/bookmark.svg";
                
                return deleteBookmark(mediaNum);
            }
        });
        
     	// 북마크 추가하기
        function insertBookmark(mediaNum) {
			console.log(mediaNum);
        	
        	$.ajax({
    			url : "${ contextPath }/official/insertBookmark",
    			dataType : "json",
    			data : { mediaNum : mediaNum },
    			type : "post",
    			success : function(data) {
    				console.log(data.msg);
    			},
    			error : function(e) {
    				alert(e);
    			}
    		});
        }
     	
     	// 북마크 삭제하기
        function deleteBookmark(mediaNum) {
        	$.ajax({
    			url : "${ contextPath }/official/deleteBookmark",
    			dataType : "json",
    			data : { mediaNum : mediaNum },
    			type : "post",
    			success : function(data) {
    				console.log(data.msg);
    			},
    			error : function(e) {
    				alert(e);
    			}
    		});
        }
        
        // 좋아요 여부 확인하기
        function checkLike(e, rid) {
        	var likeCount = $(e).siblings(".like-count").text();
        	console.log(e);
        	console.log("라이크카운트" + likeCount);
        	
        	if($(e).attr("src") == "${ contextPath }/resources/images/official/like.svg") {
				$(e).attr("src","${ contextPath }/resources/images/official/like-black.svg");
				likeCount2 = parseInt(likeCount) + 1;
				$(e).siblings(".like-count").text(likeCount2);
				
				return insertLike(rid);
				
            } else {
            	$(e).attr("src","${ contextPath }/resources/images/official/like.svg");
            	likeCount2 = parseInt(likeCount) - 1;
            	$(e).siblings(".like-count").text(likeCount2);
            	
            	return deleteLike(rid);
            }
        }
        
     	// 좋아요 추가하기
        function insertLike(rid) {
			console.log(rid);
        	
        	$.ajax({
    			url : "${ contextPath }/official/insertLike",
    			dataType : "json",
    			data : { rid : rid },
    			type : "post",
    			success : function(data) {
    				console.log(data.msg);
    			},
    			error : function(e) {
    				alert(e);
    			}
    		});
        }
     	
     	// 좋아요 삭제하기
        function deleteLike(rid) {
        	$.ajax({
    			url : "${ contextPath }/official/deleteLike",
    			dataType : "json",
    			data : { rid : rid },
    			type : "post",
    			success : function(data) {
    				console.log(data.msg);
    			},
    			error : function(e) {
    				alert(e);
    			}
    		});
        }
        
        // 댓글, 대댓글 작성칸 클릭하면 내용 지우기
        function clearText(e) {
        	$(e).val("");
        }
        
        // 댓글 입력
        $(".send-btn").click(function() {
        	var rcontent = $(".comment").val();
        	var id = "${ loginUser.id }";
        	var classifyMem = "${ loginUser.classifyMem }";
        	var refId = ${ media.official.mediaNum }
        	console.log(rcontent);
        	console.log(refId);
        	
        	// 댓글 입력
        	$.ajax({
    			url : "${ contextPath }/official/insertReply",
    			dataType : "json",
    			data : { rcontent : rcontent, refId : refId },
    			type : "post",
    			success : function(data) {
    				alert(data.msg);
    				location.href="${contextPath}/official/media/detail?mediaNum=" + refId;
    			},
    			error : function(e) {
    				alert(e);
    			}
    		});
        	
        	// 아티스트 알림
        	if(classifyMem == 2) {
        		console.log("아티스트 유저 알림");
        		
        		$.ajax({
        			url : "${ contextPath }/official/insertArtistReplyAlarm",
        			dataType : "json",
        			data : { refId : refId },
        			type : "post",
        			success : function(data) {
        				alert(data.msg);
        			},
        			error : function(e) {
        				alert(e);
        			}
        		});
        	}
        });
        
        // 대댓글 입력
        function insertRecomment(e, refRid, classify) {
        	var rcontent = $(e).siblings().children(".comment").val();
        	var id = "${ loginUser.id }";
        	var classifyMem = ${ loginUser.classifyMem };
        	var refId = ${ media.official.mediaNum };
        	console.log(rcontent);
        	console.log(refId);
        	console.log(refRid);
        	
        	// 대댓글 입력
    		$.ajax({
    			url : "${ contextPath }/official/insertRecomment",
    			dataType : "json",
    			data : { rcontent : rcontent, refId : refId, refRid : refRid },
    			type : "post",
    			success : function(data) {
    				alert(data.msg);
    				location.href="${contextPath}/official/media/detail?mediaNum=" + refId;
    			},
    			error : function(e) {
    				alert(e);
    			}
    		});
    		
        	// 일반 유저 알림
    		if(classify == 1 && classifyMem == 1 ) {
    			console.log("일반 유저 알림");
    			
    			$.ajax({
    				url : "${ contextPath }/official/insertUserReplyAlarm",
        			dataType : "json",
        			data : { refId : refId },
        			type : "post",
        			success : function(data) {
        				console.log(data);
        			},
        			error : function(e) {
        				console.log(e);
        			}
        		});
    			
    		// 아티스트 유저 알림
    		} else if(classify == 1 && classifyMem == 2 ) {
    			console.log("아티스트 유저 알림");
    			
    			$.ajax({
        			url : "${ contextPath }/official/insertArtistReplyAlarm",
        			dataType : "json",
        			data : { refId : refId },
        			type : "post",
        			success : function(data) {
        				console.log(data);
        			},
        			error : function(e) {
        				console.log(e);
        			}
        		});
    		}
        }
        
        // 댓글 삭제하기
        function deleteComment(e, rid) {
        	$(e).parent().parent().parent().parent().parent(".comment-line").css("display", "none");
        	$(e).parent().parent().siblings().children("re-commentBtn").css("display", "none");
        	
        	if(confirm("댓글을 삭제하시겠습니까?")) {
        		$.ajax({
        			url : "${ contextPath }/official/deleteReply",
        			dataType : "json",
        			data : { rid : rid },
        			type : "post",
        			success : function(data) {
        				alert(data.msg);
        			},
        			error : function(e) {
        				alert(e);
        			}
        		});
        	}
        }
        
        // 클릭한 프로필 풍선을 제외한 나머지 프로필 닫기
        $('.profile-picture').click(function () {
        	var me = $(this).siblings('profile-bubble');
        	console.log(me);
        	
        	$('.profile-bubble').removeClass("open-area");
        	$('.re-profile-bubble').removeClass("open-area");
        	$('.comment-bubble').removeClass("open-area");
        	$('.re-comment-bubble').removeClass("open-area");
        	me.css("display", "block");
        });
        
        $('.re-profile-picture').click(function () {
        	var me = $(this).children('re-profile-bubble');
        	console.log(me);
        	
        	$('.re-profile-bubble').not(me).css("display", "none");
        	$('.profile-bubble').css("display", "none");
        	$('.comment-bubble').css("display", "none");
        	$('.re-comment-bubble').css("display", "none");
        });
        
        // 클릭한 댓글 풍선을 제외한 나머지 프로필 닫기
        $('.comment-etc').click(function () {
        	var me = $(this).children('comment-bubble');
        	console.log(me);
        	
        	$('.comment-bubble').not(me).css("display", "none");
        	$('.re-profile-bubble').removeClass("open-area");
        	$('.profile-bubble').removeClass("open-area");
        	$('.re-comment-bubble').removeClass("open-area");
        });
        
        $('.re-comment-etc').click(function () {
        	var me = $(this).siblings('comment-bubble');
        	console.log(me);
        	
        	$('.re-comment-bubble').not(me).css("display", "none");
        	$('.re-profile-bubble').css("display", "none");
        	$('.comment-bubble').css("display", "none");
        	$('.profile-bubble').css("display", "none");
        });
        

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
        /*
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
		});*/

        // 대댓글이 있을 시에만 보여주기
        $(document).ready(function() {
            for(var i = 1; i <= $(".comment-line").length; i++) {
                if($(".comment-line:eq(" + i + ")").children().children(".re-comment").text()) {
                    $(".re-commentBtn:eq(" + i + ")").css("display","none");
                }
            }
        });
		
		// 친구 신청
		function applyFriend(e, nickname, frRecId) {
		   var frSend = "${loginUser.id}";
		   
		   if(confirm(nickname + "님에게 친구신청을 하시겠습니까?")){
		    	location.href='${contextPath}/fanfeed/insertFriend?frRecId=' + frRecId + '&frSend=' + frSend;
	    	}
		}
		
		// 아티스트 피드로 이동
		function artistFeed(writer) {
			location.href="${contextPath}/artistfeed/selectMember?writer=" + writer;
		}
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
            <c:if test="${ rcmd ne '' }">
            <p id="recommendTitle">추천 영상</p>
            <div class="recommend-container">
            	<c:forEach var="rcmd" items="${ rcmd }">
                <div class="recommend-media">
                    <img src="${ contextPath }/resources/uploadFiles/${ rcmd.mediaFile.picSvName }">
                    <div class="media-title nanumsquare">${ rcmd.official.mediaTtl }</div>
                    <div class="media-date nanumsquare">
                    <fmt:formatDate value="${ rcmd.official.mediaDate }" pattern="yyyy.MM.dd"/></div>
                </div>
                </c:forEach>
            </div>
            </c:if>
        </aside>
        
	    <script>
        // 해당 페이지에 대한 카테고리 색상 변경
		$(document).ready(function() {
		    $(".category a").eq(2).css("color", "#5C5F78");
		});
	    
	 	// 토글 스위치 클릭할 때 스케줄 페이지로 이동
	 	var artiName = "${ media.category.artiNameEn }";
	 	
	    $(".toggle-switch").click(function() {
		    location.href="${ contextPath }/official/schedule?artiName=" + artiName;
		});
	    </script>
   </section>
   <!-- 본문 끝 -->
</body>
</html>
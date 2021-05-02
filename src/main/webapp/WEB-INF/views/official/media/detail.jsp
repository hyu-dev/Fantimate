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
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
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
                <div class="media-lower">
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
	                                    <p>프로필 보기</p>
	                                    <p>피드로 이동</p>
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
	                                            <p class="delete-comment" onclick="deleteComment(this, ${ c.mediaReply.rid })">댓글 삭제</p>
	                                            </c:when>
	                                            </c:choose>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="comment-info comment-center nanumsquare">
	                                    <c:if test="${ c.mediaLike.lstatus eq 'N' || c.mediaLike.lstatus eq null }">
                                        <img class="likeBtn" src="${ contextPath }/resources/images/official/like.svg" onclick="checkLike(this, ${ c.mediaReply.rid })">
                                        </c:if>
                                        <c:if test="${ c.mediaLike.lstatus eq 'Y' }">
                                        <img class="likeBtn" src="${ contextPath }/resources/images/official/like-black.svg" onclick="checkLike(this, ${ c.mediaReply.rid })">
                                        </c:if>
	                                    <span class="like-count">${ c.mediaReply.likeCount }</span><span class="comment-date">${ c.mediaReply.rcreate }</span>
	                                </div>
	                                <div class="comment-toggle">
	                                    <div class="re-comment-container">
	                                        <div class="comment-area">
	                                            <input type="text" class="comment nanumsquare" value="댓글을 입력하세요." onclick="clearText(this);">
	                                        </div>&nbsp;&nbsp;&nbsp;
	                                        <img class="re-send-btn" src="${ contextPath }/resources/images/official/send.svg" onclick="insertRecomment(this, ${ c.mediaReply.rid })">
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
					                                    <p>프로필 보기</p>
					                                    <p>피드로 이동</p>
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
		                                                <div class="re-comment-etc">···
					                                        <c:if test="${ loginUser.id eq r.mediaReply.writer }">
		                                                    <div class="re-comment-bubble">
					                                            <p class="delete-comment" onclick="deleteComment(${ r.mediaReply.rid })">댓글 삭제</p>
		                                                    </div>
					                                        </c:if>
		                                                </div>
		                                            </div>
		                                            <div class="re-comment-info comment-center nanumsquare">
		                                            	<c:if test="${ r.mediaLike.lstatus eq 'N' || r.mediaLike.lstatus eq null }">
		                                                <img class="likeBtn" src="${ contextPath }/resources/images/official/like.svg" onclick="checkLike(this, ${ r.mediaReply.rid })">
		                                                </c:if>
		                                                <c:if test="${ r.mediaLike.lstatus eq 'Y' }">
		                                                <img class="likeBtn" src="${ contextPath }/resources/images/official/like-black.svg" onclick="checkLike(this, ${ c.mediaReply.rid })">
		                                                </c:if>
		                                                <span class="like-count">${ r.mediaReply.likeCount }</span><span class="comment-date">${ r.mediaReply.rcreate }</span>
		                                            </div>
		                                        </td>
		                                    </tr>
		                                    </c:when>
		                                    <c:otherwise>
		                                    <tr class="comment-line">
		                                        <td>
					                            	<c:if test="${ loginUser.id ne r.mediaReply.writer }">
					                                <div class="re-profile-bubble">
					                                    <p>프로필 보기</p>
					                                    <p>쪽지 보내기</p>
					                                </div>
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
					                                            <p class="delete-comment" onclick="deleteComment(${ r.mediaReply.rid })">댓글 삭제</p>
					                                            </c:when>
					                                            </c:choose>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <div class="re-comment-info comment-center nanumsquare">
		                                            	<c:if test="${ r.mediaLike.lstatus eq 'N' || r.mediaLike.lstatus eq null }">
		                                                <img class="likeBtn" src="${ contextPath }/resources/images/official/like.svg" onclick="checkLike(this, ${ r.mediaReply.rid })">
		                                                </c:if>
		                                                <c:if test="${ r.mediaLike.lstatus eq 'Y' }">
		                                                <img class="likeBtn" src="${ contextPath }/resources/images/official/like-black.svg" onclick="checkLike(this, ${ r.mediaReply.rid })">
		                                                </c:if>
		                                                <span class="like-count">10</span><span class="comment-date">${ r.mediaReply.rcreate }</span>
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
	                                <div class="profile-bubble">
	                                    <p>피드로 이동</p>
	                                    <p>쪽지 보내기</p>
	                                </div>
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
	                                            <p class="delete-comment" onclick="deleteComment(${ c.mediaReply.rid })">댓글 삭제</p>
	                                            </c:when>
	                                            </c:choose>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="comment-info comment-center nanumsquare">
	                                    <c:if test="${ c.mediaLike.lstatus eq 'N' || c.mediaLike.lstatus eq null }">
                                        <img class="likeBtn" src="${ contextPath }/resources/images/official/like.svg" onclick="checkLike(this, ${ c.mediaReply.rid })">
                                        </c:if>
                                        <c:if test="${ c.mediaLike.lstatus eq 'Y' }">
                                        <img class="likeBtn" src="${ contextPath }/resources/images/official/like-black.svg" onclick="checkLike(this, ${ c.mediaReply.rid })">
                                        </c:if>
	                                    <span class="like-count">${ c.mediaReply.likeCount }</span><span class="comment-date">${ c.mediaReply.rcreate }</span>
	                                </div>
	                                <div class="comment-toggle">
	                                    <div class="re-comment-container">
	                                        <div class="comment-area">
	                                            <input type="text" class="comment nanumsquare" value="댓글을 입력하세요." onclick="clearText(this);">
	                                        </div>&nbsp;&nbsp;&nbsp;
	                                        <img class="re-send-btn" src="${ contextPath }/resources/images/official/send.svg" onclick="insertRecomment(this, ${ c.mediaReply.rid })">
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
					                                    <p>프로필 보기</p>
					                                    <p>피드로 이동</p>
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
		                                                <div class="re-comment-etc">···
		                                                    <div class="re-comment-bubble">
					                                            <c:if test="${ loginUser.id eq r.mediaReply.writer }">
					                                            <p class="delete-comment" onclick="deleteComment(${ r.mediaReply.rid })">댓글 삭제</p>
					                                            </c:if>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <div class="re-comment-info comment-center nanumsquare">
		                                                <c:if test="${ r.mediaLike.lstatus eq 'N' || r.mediaLike.lstatus eq null }">
		                                                <img class="likeBtn" src="${ contextPath }/resources/images/official/like.svg" onclick="checkLike(this, ${ r.mediaReply.rid })">
		                                                </c:if>
		                                                <c:if test="${ r.mediaLike.lstatus eq 'Y' }">
		                                                <img class="likeBtn" src="${ contextPath }/resources/images/official/like-black.svg" onclick="checkLike(this, ${ r.mediaReply.rid })">
		                                                </c:if>
		                                                <span class="like-count">${ r.mediaReply.likeCount }</span><span class="comment-date">${ r.mediaReply.rcreate }</span>
		                                            </div>
		                                        </td>
		                                    </tr>
		                                    </c:when>
		                                    <c:otherwise>
		                                      <tr class="comment-line">
		                                        <td>
					                                <c:if test="${ loginUser.id ne r.mediaReply.writer }">
					                                <div class="re-profile-bubble">
					                                    <p>피드로 이동</p>
					                                    <p>쪽지 보내기</p>
					                                </div>
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
					                                            <p class="delete-comment" onclick="deleteComment(${ r.mediaReply.rid })">댓글 삭제</p>
					                                            </c:when>
					                                            </c:choose>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <div class="re-comment-info comment-center nanumsquare">
		                                                <c:if test="${ r.mediaLike.lstatus eq 'N' || r.mediaLike.lstatus eq null }">
		                                                <img class="likeBtn" src="${ contextPath }/resources/images/official/like.svg" onclick="checkLike(this, ${ r.mediaReply.rid })">
		                                                </c:if>
		                                                <c:if test="${ r.mediaLike.lstatus eq 'Y' }">
		                                                <img class="likeBtn" src="${ contextPath }/resources/images/official/like-black.svg" onclick="checkLike(this, ${ r.mediaReply.rid })">
		                                                </c:if>
		                                                <span class="like-count">${ r.mediaReply.likeCount }</span><span class="comment-date">${ r.mediaReply.rcreate }</span>
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
        
        function checkLike(e, rid) {
        	if($(e).attr("src") == "${ contextPath }/resources/images/official/like.svg") {
				$(e).attr("src","${ contextPath }/resources/images/official/like-black.svg");
				
				// 좋아요 추가하기
		        function insertLike(e, rid) {
		        	
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
            } else {
            	$(e).attr("src","${ contextPath }/resources/images/official/like.svg");
            	
            	 // 좋아요 삭제하기
                function deleteLike(e, rid) {
                	$(e).attr("src", "${ contextPath }/resources/images/official/like.svg");
                	
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
            }
        }
        
        // 댓글, 대댓글 작성칸 클릭하면 내용 지우기
        function clearText(e) {
        	$(e).val("");
        }
        
        // 댓글 입력
        $(".send-btn").click(function() {
        	var rcontent = $(".comment").val();
        	var id = "${ loginUser.id }";
        	var refId = ${ media.official.mediaNum }
        	console.log(rcontent);
        	console.log(refId);
        	
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
        });
        
        // 대댓글 입력
        function insertRecomment(e, refRid) {
        	var rcontent = $(e).siblings().children(".comment").val();
        	var id = "${ loginUser.id }";
        	var refId = ${ media.official.mediaNum }
        	console.log(rcontent);
        	console.log(refId);
        	console.log(refRid);
        	
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
        }
        
        // 댓글 삭제하기
        function deleteComment(e, rid) {
        	$(e).parent().parent().parent().parent().parent(".comment-line").css("display", "none");
        	
        	if(confirm("댓글을 삭제하시겠습니까?")) {
        		var refId = ${ media.official.mediaNum }
        		$.ajax({
        			url : "${ contextPath }/official/deleteReply",
        			data : { rid : rid },
        			type : "post",
        			dataType : "json",
        			success : function(data) {
        				alert(data.msg);
        			},
        			error : function(e) {
        				alert(e);
        			}
        		});
        	}
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
	    $(".toggle-switch").click(function() {
		    location.href="${ contextPath }/official/schedule";
		});
	    </script>
   </section>
   <!-- 본문 끝 -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/mypage/artist/comment.css">
</head>
<body>
	<!-- 네비바 인클루드 -->
	<jsp:include page="../../common/navbar.jsp"/>
	
	<!-- 아티스트 프로필 인클루드 -->
	<jsp:include page="profile.jsp"/>
	
	<!-- 본문 시작 -->
	
	<!-- 메인  -->
	<section class="main-section">
        <div class="artist-mypage-container">
            <div class="content-box">
                <div class="content-line">
                    <p class="content-title">My Comments</p>
                </div>
                <div class="content-area">                   
                    <div class="bottom-content">
                        <!-- 원댓글 -->
                        <table class="original-comment">
                            <colgroup>
                                <col width="90%"/>
                                <col width="10%"/>
                            </colgroup>
                            <c:forEach var="c" items="${ comment }">
                            <tr class="comment-line">
                                <td>
                                    <div class="comment-info">
                                        <img class="profile-img" src="${ contextPath }/resources/uploadFiles/${ arti.attachment.attSvName }">&nbsp;
                                        <span>▶</span>
                                        <span class="artist-name nanumsquare">${ arti.artist.artiNameEn }</span>&nbsp;
                                        <span class="nanumsquare">${ c.feedReply.category }</span>&nbsp;
                                        <span class="comment-date nanumsquare">${ c.feedReply.rcreate }</span>
                                    </div>
                                    <c:choose>
	                                    <c:when test="${ c.feedReply.nickname ne null }">
	                                    <p class="nanumsquare"><span class="send-comment">${ c.feedReply.nickname }</span><span class="send-comment">님에게 답장&nbsp;&nbsp;</span>${ c.feedReply.rcontent }</p>
	                                    </c:when>
	                                    <c:otherwise>
	                                    <p class="nanumsquare">${ c.feedReply.rcontent }</p>
	                                    </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <div>
                                        <button class="comment-btn" type="button" onclick="deleteMyComment(this, ${ c.feedReply.rid })">삭제하기</button>
                                    </div>
                                </td>
                            </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
            <!-- 리모컨 -->
            <div id="menubar">
                <div class="mypage-menu">
                    <span class="nanumsquare">Menu</span>
                    <div class="btn-area">
                        <p id="feedBtn" class="mypage-btn nanumsquare">My Feed</p>
                        <p class="mypage-btn nanumsquare">My Comments</p>
                    </div>
                </div>
            </div>
        </div>
    </section>	
	<!-- 본문 끝 -->
	
	<script>
    // 댓글 삭제하기
    function deleteMyComment(e, rid) {
    	if(confirm("댓글을 삭제하시겠습니까?")) {
    		$(e).parent().parent().parent(".comment-line").css("display", "none");
    		
    		$.ajax({
    			url : "${ contextPath }/mypage/deleteMyReply",
    			data : { rid : rid },
    			type : "post",
    			dataType : "json",
    			success : function() {
    				console.log(data);
    			} 
    		});
    	}
    }
	</script>
</body>
</html>
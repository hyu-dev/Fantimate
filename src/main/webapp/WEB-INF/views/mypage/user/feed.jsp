<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--     <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css"> --%>
<!--     <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> -->
<%--     <link rel="stylesheet" href="${ contextPath }/resources/css/common/navbar.css"> --%>
<%--     <link rel="stylesheet" href="${ contextPath }/resources/css/mypage/jw.css"> --%>
<%--     <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png"> --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>feed</title>
<style>
.main-contents-left{
	opacity: 0;
}
.post-outer{
	 display: none;
}

html, body {
    margin: 0;
    padding: 0;
    height: 100%;
    background: #fbf6f6;
    color: #5C5F78;
}

/* 메인 section 시작 */
.main-section {
    width: 100%;
    height: 100%;
    /* border: 2px solid red; */
    box-sizing: border-box;
    display: flex;
}

.main-contents {
    width: 60%;
    height: 100%;
    /* border: 2px solid blue; */
    box-sizing: border-box;
}

.main-contents-right {
    width: 20%;
    height: 100%;
    /* border: 2px solid blue; */
    box-sizing: border-box;
}

.artist-follower {
    width: 100%;
    height: 235px;
    margin: 0 auto;
    /* border: 2px solid blue; */
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
    text-align: center;
}

.artist-follower p {
    min-width: 180px;
    margin: 0;
    padding: 10px 0;
    font-family: "Wemakeprice-bold";
    box-sizing: border-box;
}

.artist-name {
    min-width: 180px;
    font-size: 40px;
    text-align: center;
    font-family: "Wemakeprice-bold";
    box-sizing: border-box;
}

.artist-follower p.artist-follower-count {
    min-width: 180px;
    padding-bottom: 35px;
    font-size: 20px;
    font-family: "Wemakeprice-bold";
    box-sizing: border-box;
}


.category {
    min-width: 180px;
    width: 50%;
    height: 290px;
    margin: 0 auto;
    /* border: 2px solid blue; */
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    justify-content: center;
    /* align-items: center; */
    text-align: left;
}

.category a {
    padding: 15px 10px;
    font-size: 30px;
    font-family: "Wemakeprice-bold";
    box-sizing: border-box;
    text-decoration: none;
    color:#E5D2D2
}

.category a:active {
    color: #5C5F78
}

.contents-search {
    width: 100%;
    min-width: 180px;
    height: 350px;
    /* border: 2px solid blue; */
    box-sizing: border-box;
    position: relative;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.search-area {
    width: 210px;
    position: relative;
    height: auto;
    /* background-color: aqua; */
    display: flex;
    justify-content: center;
    align-items: center;
}

.contents-search-input {
    width: 210px;
    border: none;
    border-bottom: 5px solid #F4D4D4;
    background: #fbf6f6;
    height: 50px;
    outline: none;
    padding: 0 30px 0 15px;
    font-size: 20px;
}

.search-icon {
    width: 30px;
    height: 30px;
    /* margin: 2px 5px; */
    position: absolute;
    right: 0px;
}

.search-result {
    background: white;
    width: 210px;
    margin: 0 auto;
    height: 100%;
}


.introArea {
    border: none;
    height: 50px;
    width : 100%;
    
}

.post-intro {
    font-size: 1.2em;
    color: black;
    padding-left: 40px;
    font-family: "Wemakeprice-bold";
    border : none;
}

.postArea {
    border : none;
    height : auto;
    display: flex;
    justify-content: space-around;
    flex-wrap: nowrap;
    width : 100%;
   
}

.post-icon {
    border : none;
    width: 50px;
    height: 50px;
    padding-top: 0px;
    padding-left: 4%;
       
}

.textArea {
    width : 750px;
    height : 80px;
    resize : none;
    border: none;
    padding-top: 15px;
    padding-left: 10px;
    font-size: 1.2em;
    
}

.photo-icon {
    width: 35px;
    height: 35px;
    margin: auto 0 0 auto;
    padding-bottom: 20px;
    padding-right: 20px;
    border : none;
    cursor : pointer;
    

}

.guide {
    position: absolute;
    top: 0;
    left: 10px;
    margin: 0;
    padding: 0;
    font-family: Wemakeprice;
    font-style: normal;
    font-weight: normal;
    font-size: 15px;
}

.guide-text {
    width: 90%;
    resize: none;
    border: 1px solid lightgray;
    outline: none;
    padding: 5px;
    box-sizing: border-box;
    color: #5C5F78;
}

.my-photo {
    width: 95%;
    /* border: 2px solid red; */
    margin: 20px auto 0;
    height: auto;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    flex-wrap: no-wrap;
    box-sizing: border-box;
    margin-top: 2%;
    overflow-y: hidden;
    position: relative;
}

.main-photo {
    width: 132px;
    height: 132px;
    background: #ebebeb;
    position: relative;
    margin-left: 5%;
}

.main-photo-img {
    width: 132px;
    height: 132px;
    position: absolute;
    
}

.add-photo {
    width: 132px;
    height: 132px;
    background: #ebebeb;
    position: relative;
    margin-left: 5%;
    text-align: center;
    vertical-align: middle;
}

.add-photo-img {
    width: 132px;
    height: 132px;
    position: absolute;
    top: 0;
    left: 0;
    border: none;
}

.add-photo1 {
    width: 132px;
    height: 132px;
    background: #ebebeb;
    position: relative;
    margin-left: 10%;
    text-align: center;
    vertical-align: middle;
}

.add-photo1-img {
    width: 132px;
    height: 132px;
    position: absolute;
    top: 0;
    left: 0;
    border: none;
}

.add-photo2 {
    width: 132px;
    height: 132px;
    background: #ebebeb;
    position: relative;
    margin-left: 10%;
    text-align: center;
    vertical-align: middle;
}

.add-photo2-img {
    width: 132px;
    height: 132px;
    position: absolute;
    top: 0;
    left: 0;
    border: none;
}

.click-btn {
    font-size: 40px;
}

.btnArea {
   border: none;
   width : 95%;
   display: flex;
   flex-wrap: wrap;
}

.post-insert-btn {
    background-color: #F4D4D4;
    color : white;
    border-radius: 8px;
    margin-left: auto;
    width : 110px;
    height : 40px;
    border: 0;
    outline: 0;
    padding-right: 10px;
    cursor: pointer;
}

/* 게시글 영역 */

/* 게시글 전체 영역 */
.boardArea {
    border : 1px solid #ebebeb;
    background-color: white;
    height : auto;
    margin-top: 100px;
    width : 90%;
    box-sizing: border-box;
}




.open-area {
    display: block !important;
}

/* 게시글 프로필사진, 닉네임, 작성날짜, 더보기,신고 아이콘 영역 */
.board-top {
    width : 100%;
    padding-top: 10px;
}

.board-top tr{
    text-align: right;
}

/* 프로필 사진 */
.profile-picture {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    vertical-align: top;
    cursor: pointer;
}

/* 닉네임 영역 */
.nicknameArea {
    text-align: left;
    font-size: 1.3em;
    color : black;
    font-family: "Wemakeprice-bold";
    padding-top: 5px;
    padding-left: 15px;
}

/* 게시글 등록날짜 영역 */
.boarddateArea {
    text-align: left;
    font-size: 1.2em;
    color : #575757;
    padding-left: 15px;
}

/* 더보기 아이콘 */
.board-more-icon {
    width : 40px;
    height : 30px;
    cursor: pointer;
    
}

/* 더보기 클릭 시 하위메뉴 */
.board-menu {
    border: 2px solid black;
    border-radius: 10px 0px 10px 10px;
    width: 100px;
    height: auto;
    background: white;
    text-align: center;
    font-family: "Wemakeprice-regular";
    box-sizing: border-box;
    cursor: pointer;
    position: absolute;
    z-index: 1;
    left: 1100px;
    margin-top: 10px;
    display: none;
}
/* 신고 아이콘 */
.report-icon {
    width : 30px;
    height : 30px;
    padding-right: 20px;
    cursor: pointer;
}

/* 게시글 리스트 -> 텍스트 영역 + 이미지 영역 */
.contentArea{
    cursor: pointer;
}

/* 게시글 리스트 -> 텍스트 영역 */
.board-text {
    border : none;
    padding-left: 100px;
    font-size : 20px;
    color : black; 
}

/* 게시글 리스트 -> 이미지 영역 */
.board-img {
    width: 500px;
    height : 400px;
    border-radius: 4%;
    margin-left: 25%;

}

/* 팬 피드랑 다른곳 체크********/
.imgArea {
	width: 100%;
    height: 225px;
}


/* 게시글 리스트 -> 좋아요 영역 */
.board-like {
    width : 100%;

}


/* 좋아요 아이콘 */

#cancelLike, #insertLike{
	 width : 30px;
    height : 30px;
    margin-left: 85px;
    cursor: pointer;
}

#cancelRLike, #insertRLike{
	 width : 20px;
    height : 20px;
    margin-left: 25px;
    cursor: pointer;
}

/* 댓글 텍스트 */
.reply-info {
    text-align: right;
}

/* 댓글 카운트 */



.comment-toggle {
    display: none;
}

.comment-container, .re-comment-container {
    display: flex;
}

.comment-area {
    width: 80%;
    height: 40px;
    background: #ebebeb;
    border: none;
    border-radius: 10px;
    margin-top: 10px;
    margin-bottom: 20px;
    margin-left: 70px;
    padding-left: 20px;
    position: relative;
}

.comment-area > textarea {
    border: none;
    width: 95%;
    height: 25px;
    outline-style: none;
    font-size: 17px;
    background: #ebebeb;
    box-sizing: border-box;
    position: absolute;
    top: 50%;
    margin-top: -12.5px;
}

.send-btn, .re-send-btn {
    cursor: pointer;
    margin-top: 10px;
    margin-bottom: 10px;
}

.open-area {
    display: block !important;
}

.original-comment {
    /* border: 1px solid green; */
    width: 90%;
    height: 100%;
    margin: auto;
    margin-top: 10px;
    box-sizing: border-box;
}

.comment-line {
    width: 100%;
    height: auto;
    position: relative;
}
.comment-line > td:first-child {
    height: 100%; 
    vertical-align: top; 
    padding-top: 5px;
}

.comment-line > td {
    position : relative;
}
/* 프로필 사진 클릭 시 하위메뉴 */
.profile-bubble {
    border: 2px solid black;
    border-radius: 10px 0px 10px 10px;
    width: 100px;
    height: auto;
    background: white;
    text-align: center;
    font-family: "Wemakeprice-regular";
    box-sizing: border-box;
    cursor: pointer;
    position: absolute;
    z-index: 1;
    top : 10px;
    left : -105px;
    display: none;
}

.re-profile-bubble {
    border: 2px solid black;
    border-radius: 10px 0px 10px 10px;
    width: 100px;
    height: auto;
    background: white;
    text-align: center;
    font-family: "Wemakeprice-regular";
    box-sizing: border-box;
    cursor: pointer;
    position: absolute;
    z-index: 1;
    left: 455px;
    margin-top: 20px;
    display: none;
}

.profile-picture, .re-profile-picture {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    vertical-align: top;
}

#artist-comment {
    background: #fceae5;
    border-radius: 10px;
}

.comment-box {
    /* border: 1px solid red; */
    width: 100%;
    height: auto;
    font-size: 17px;
    display: flex;
    box-sizing: border-box;
}

.comment-center {
    /* border: 1px solid blue; */
    margin: 10px 10px 0px 10px;
    box-sizing: border-box;
}

.comment-main {
    width: 95%;
    height: 100%;
    line-height: 40px;
    background: #f3f3f3;
    border-radius: 10px;
    box-sizing: border-box;
    padding-right: 30px;
}

.comment-name {
    font-family: "Wemakeprice-bold";
    font-weight: bolder;
    padding-left: 30px;
    padding-right: 30px;
    box-sizing: border-box;
}

.comment-content {
    padding-right: 30px;
    box-sizing: border-box;
    overflow: visible;
}

.re-commentBtn {
    float: right;
    color: #a9a9a9;
    font-family: "Wemakeprice-regular";
    font-size: 15px;
    cursor: pointer;
}

.comment-etc, .re-comment-etc {
    height: 100%;
    cursor: pointer;
    font-size: 35px; 
    padding-top: 6px;
    position : relative;
}

.comment-bubble {
    border: 2px solid black;
    border-radius: 0 10px 10px 10px;
    width: 100px;
    height: auto;
    background: white;
    text-align: center;
    font-family: "Wemakeprice-regular";
    box-sizing: border-box;
    cursor: pointer;
    position: absolute;
    z-index: 1;
    top: 20px;
    right : -110px;
    display: none;
    font-size : 16px !important;
}

.re-comment-bubble {
    border: 2px solid black;
    border-radius: 0 10px 10px 10px;
    width: 100px;
    height: 0px;
    background: white;
    text-align: center;
    font-family: "Wemakeprice-regular";
    box-sizing: border-box;
    cursor: pointer;
    position: absolute;
    z-index: 1;
    top: 20px;
    right : -110px;
    display: none;
    font-size : 16px !important;
}

.comment-info {
    width: 94.5%;
    font-size: 14px;
}

.re-comment-info {
    width: 94%;
    font-size: 14px;
}

.likeBtn {
    width: 20px;
    height: 20px;
}

.comment-date {
    float: right;
}

.re-comment {
    display: none;
}


.reply-more {
    text-align: center;
    width: 110px;
    height: 40px;
    font-size: 2.5em;
    background-color: white;
    font-weight: bolder;
    margin-left: 450px;
    border:none;
    cursor: pointer;
}

.replyArea {
    display: flex;
}

.insert-reply {
    width: 80%;
    height: auto;
    overflow: hidden;
    background: #ebebeb;
    border: none;
    border-radius: 10px;
    margin-top: 10px;
    margin-bottom: 20px;
    margin-left: 20px;
    padding-left: 20px;
    position: relative;
    min-height: 40px;
}

.insert-replyBtn {
    cursor: pointer;
    margin-top: 10px;
    margin-bottom: 20px;
    border : 0;
    outline: 0;
    background: white;
    
}

.insert-reply > textarea {
    border: none;
    width: 95%;
    height: 25px;
    outline-style: none;
    font-size: 17px;
    background: #ebebeb;
    box-sizing: border-box;
    position: absolute;
    top: 50%;
    margin-top: -12.5px;
    overflow: hidden;
}

/* 토글 스위치 */
.toggle-area {
    width: auto;
    height: auto;
    /* border: 2px solid red; */
    margin: 75px 0 0 10px;
}

.toggle-switch {
    --width: 80px;
    --height: 40px;
    --padding: 3px;
    --handle-size: calc(var(--height) - var(--padding) * 2);
    display: inline-block;
    outline-width: 0;
  }
  
  .toggle-switch > input {
    position: absolute;
    clip: rect(1px, 1px, 1px, 1px);
    clip-path: inset(50%);
    height: 1px;
    width: 1px;
    margin: -1px;
    overflow: hidden;
  }
  
  .area {
    padding: 4px;
    margin: -4px;
    position: relative;
    display: flex;
    align-items: center;
    /* border: 2px solid red; */
  }

  .area p {
      margin: 0;
      padding: 1px 3px 0;
      font-size: 13px;
     position: absolute;
     right: 13px;
     font-family: "Wemakeprice-bold";
  }

  .background,
  .handle,
  .area p {
    transition: all 0.3s ease;
  }
  
  .background {
    display: inline-flex;
    flex-direction: row;
    align-items: center;
    width: var(--width);
    height: var(--height);
    border-radius: var(--height);
    padding: 0 var(--padding);
    vertical-align: text-bottom;
    user-select: none;
    background-color: #ebebeb;
    box-shadow: inset 0px 0px 5px 2px rgba(0, 0, 0, 0.15);
    overflow: hidden;
    transition: background-color .15s ease;
    cursor: pointer;
  }

  
  .handle {
    width: var(--handle-size);
    height: var(--handle-size);
    background-color: white;
    border-radius: 50%;
    box-shadow:
      0 2px 4px rgba(0, 0, 0, 0.5),
      inset 0 2px 4px rgba(0, 0, 0, 0.15);
  }


  
  input:checked + label .area .background {
    background-color: #5C5F78;
  }
  
  input:checked + label .area .handle {
    /* background-color: white; */
    transform: translateX(calc(var(--width) - var(--handle-size)));
  }

  input:checked + label .area p {
    position: absolute;
    left: 12px;
    color: white;
  }
  
  
/* 게시글 사진 개수당 다르게 세팅*/
.photo-area {
    /* border: 1px solid red; */
    width: 100%;
    height: auto;
    display: grid;
    /* flex-wrap : wrap;
    display: grid; */ 
    grid-template-columns: 50% 50%;
    grid-template-rows: 50% 50%;
    margin: auto;
    margin-bottom: 30px;
}

.pic-size1 {
   grid-row-start: 1;
    grid-row-end: 3;
    grid-column-start: 1;
    grid-column-end: 3;
    height: 450px !important;
   border-radius: 10px;
}

.pic-size2 {
   grid-row-start: 1;
    grid-row-end: 3;
    height: 450px !important;
}

.pic-size3 {
   grid-row-start: 1;
    grid-row-end: 3;
    height: 450px !important;
}

.photo-area img {
    width: 100%;
    height: 225px;
}

</style>
</head>
<body>
<!-- 네비바 -->
	<jsp:include page="../../common/navbar.jsp"/>

	<!-- 유저 정보수정 팝업 -->
	<jsp:include page="updateUserPop.jsp"/>
	
	<!-- 	상단 -->
	<section id="mypageUserProfile">
		<jsp:include page="userDiv.jsp"/>
    </section>
    <!-- 프로필 밑에 섹션 -->
    <section id="mypageUserSection">
        <article id="mypageUserContent">
<!-- ---------------------------- -->			
<!-- ---------------------------- -->			
    <section class="main-section">
       
         <!-- 메인 컨텐츠 영역 -->
         <section class="main-contents">
 
			<!-- 게시글 구분할수 있는 조건문 큰 영역에 게시글 갯수만 불러올 수 있도록 -->
			
			<c:forEach var="f" items="${ list }">
			
             <!-- 게시글 리스트 영역 -->
             <div class="boardArea">

                <!-- 게시글 헤더 영역 -->
                <table class="board-top">
                    <col width="13%"/>
                    <col width="55%"/>
                    <col width="15%"/>
                    <col width="15%"/>
                    <tr>
                      <c:forEach var="at" items="${ atlist }">
                     		<c:if test="${ at.refuid eq f.writer }">
                        <td>
                            <div class="profile-bubble">
                                <p>친구 신청</p>
                                <p onclick="insertMessage();">쪽지 보내기</p>
                            </div>
                             
                            
                             <img class="profile-picture" src="${ contextPath }/resources/uploadFiles/${ at.attSvName }">
                        </td>
                        </c:if>
                        </c:forEach>
                        <td> 
                        	<!-- 게시글작성자의 아이디와 구독유저의 아이디가 같다면 닉네임 불러오기 -->
                        	 <c:forEach var="sb" items="${ subList }">
                        	 <c:if test="${ f.writer eq sb.uid }">
                            <pre class="nicknameArea">${ sb.unickname }</pre>
                            <input type="hidden" id="likeId"name="fid" value="${ f.fid }">
                        	 </c:if>
                        	 </c:forEach>
                          	
                            <pre class="boarddateArea"><fmt:formatDate value="${ f.fcreate }" pattern="yyyy.MM.dd HH:mm"/></pre>
                        </td>
                       
                        <!-- 게시글 작성자와 로그인 유저가 같다면 ...아이콘 띄우기(게시글 수정, 삭제) -->
                        <c:if test="${ loginUser.id eq f.writer }">
                        
                     
                    
                        <td>
                        	
                            <div class="board-menu">
                                <p onclick="showUpdateFeed(${f.fid},${pt.refId});">수정하기</p>
                                
                                <p onclick="deleteFeed(${f.fid});">삭제하기</p>
                            </div>
                            <img class="board-more-icon" src="../resources/images/feed/board-more-icon.png">
                        </td>
                        </c:if>
                      
                        
                        <td><img class="report-icon" src="../resources/images/feed/report-icon.png" id="siren" onclick="reportFeed(${f.fid});"></td>   
                    </tr>
                </table>
                    <!-- 게시글 컨텐츠 영역 -->
                    <div class="contentArea" id="detailPage" onclick="detailPage(${f.fid});">
                        <!-- 텍스트 영역 -->
                        <div>
                        	
                            <p class="board-text">${ f.fcontent }</p> 
                        </div>
                       
                        <!-- 이미지 영역 -->
                        <!-- 게시글 bid와 사진이 참조하고 있는 bid가 같고, 사진 리스트가 있다면 반복문돌려서 이미지 갯수만큼 불러오기 -->
                        <c:forEach var="pt" items="${ ptlist }">
                        <c:if test="${ f.fid eq pt.refId }">
                        <div class="imgArea">
                        	
                           <%--  <img src="${ contextPath }/resources/uploadFiles/${ pt.attSvName }" alt="이미지" width="600px" height="400px"> --%>
                           <img src="${ contextPath }/resources/uploadFiles/${ pt.attSvName }" alt="이미지" width="200px" height="400px" style="display:flex;">
                            <input type="hidden" name="attCode" value="${ pt.attCode }">
                            <input type="hidden" name="fid" value="${ f.fid }">
                            <input type="hidden" name="refId" value="${ pt.refId }">
                           
                        </div>
                        </c:if>
                        </c:forEach>
                       
                        
                    </div>
                    <br><br>
                    <!-- 좋아요 영역 -->
                    <table class="board-like">
                        <col width="13%"/>
                        <col width="55%"/>
                        <col width="15%"/>
                        <col width="15%"/>
						
                        <tr>
                        	
                        	
                        	<!-- 좋아요 누른애는 검정아이콘, 안누른애는 하얀아이콘 -->
                        	
                        <%-- 	<c:forEach var="l" items="${ lklist }">
                        	<c:choose>
                        	<c:when test="${f.fid eq l.refId}">
							</c:when>
							<c:otherwise>
							</c:otherwise>
							</c:choose>
							</c:forEach> --%>
							
							<c:set var="ddimCheck" value="0"/>
							<c:forEach var="l" items="${ lklist }">
                                 <c:if test="${ loginUser.id eq l.id && f.fid eq l.refId }">
                                
                            <td><img id="cancelLike" src="../resources/images/feed/likeblack-icon.png" class="like-icon" onclick="cancelLike(${f.fid},${f.flike});"></td>
                                <c:set var="ddimCheck" value="1"/>
                                 </c:if>
                              </c:forEach>
                              <c:if test="${ ddimCheck eq 0 }">
							<td><img id="insertLike" src="../resources/images/feed/like-icon.png" class="like-icon" onclick="insertLike(${f.fid},${f.flike});"></td>
                              </c:if>
							
						
							<%-- <td><img id="insertLike" src="../resources/images/feed/likeblack-icon.png" class="like-icon" onclick="insertLike(${f.fid},${f.flike});"></td> --%>
							                           
                            <%-- <td><img id="insertLike" src="../resources/images/feed/likeblack-icon.png" class="like-icon" onclick="insertLike(${f.fid},${f.flike});"></td> --%>
                            
                            
                           
                            <td>${ f.flike }</td>
                            <td class="reply-info">댓글</td>
                            <td class="reply-count">2,300</td>
                        </tr>
                    </table>
                    <hr width="90%">
                    <br>
                   
                   
                     <!-- 댓글 리스트 영역 -->
                   <c:forEach var="r" items="${ rlist }">
                   <c:if test="${ f.fid eq r.refId }">
                    <input type="hidden" value="${ r.writer }" name="messRecId" id="messRecId">
                   
                    <table id="replyTable" class="original-comment">
                    <tbody>
                        <colgroup>
                            <col width="5%"/>
                            <col width="95%"/>
                        </colgroup>
                        <tr class="comment-line">
                       
                         <c:forEach var="at" items="${ atlist }">
                     	 <c:if test="${ at.refuid eq r.writer }">
                            <td>
                            <c:if test="${ loginUser.id ne r.writer }">
                                <div class="profile-bubble">
                                    <p onclick="insertFriend('${r.writer}');">친구 신청</p>
                                    <p onclick="insertMessage('${r.writer}');">쪽지 보내기</p>
                                </div>
                            </c:if>
                             <c:if test="${ loginUser.id eq r.writer }">
                            	<div class="profile-bubble">
                                    <p onclick="insertFriend('${r.writer}');">친구 신청</p>
                                    <p onclick="insertMessage('${r.writer}');">쪽지 보내기</p>
                                </div>
                            </c:if>     
                               
                                <img class="profile-picture" src="${ contextPath }/resources/uploadFiles/${ at.attSvName }">
                            </td>
                            </c:if>
                            </c:forEach>
                             
                             
                             <c:forEach var="sb" items="${ subList }">
                             <c:if test="${ r.writer eq sb.uid }">
                        	 
                            <td>
                                <div class="comment-box">
                                    <div id="artist-comment" class="comment-main comment-center nanumsquare">
                                       <!-- 아티스트가 작성한다면 아티스트 닉네임이 보이게 설정 -->
                                       
                                        <span class="comment-name">${ sb.unickname }</span>
                                        <span class="comment-content">
                                            ${ r.rcontent }
                                        </span>
                                        <span class="re-commentBtn">답글 열기</span>
                                    </div>
                                    <div class="">
                                    	<span class="comment-etc" >···</span>
                                    	<c:if test="${ loginUser.id ne r.writer }">
                                        <div class="comment-bubble">
                                            <p class="add-comment">답글 달기</p>
                                            <p onclick="reportReply(${r.rid });">댓글 신고</p>
                                        </div>
                                        </c:if>
                                        <c:if test="${ loginUser.id eq r.writer }">
                                        <div class="comment-bubble">
                                            <p class="add-comment">답글 달기</p>
                                            <p onclick="deleteReply(${r.rid});">삭제하기</p>
                                            
                                        </div>
                                        </c:if>
                                    </div>

                                    </div>
                                   
                                   </td>
                                   </c:if>
                                   
                                   
                                   
                                    </c:forEach>
                                    
                                  
                                
                                <div class="comment-info comment-center nanumsquare">
                                
                                    <img class="likeBtn" src="../resources/images/feed/like-icon.png">
                                    <span class="like-count">1,000</span>
                                    <span class="comment-date"><fmt:formatDate value="${ r.rcreate }" pattern="yyyy.MM.dd HH:mm"/></span>
                                </div>
                               
                                <!-- 대댓글 등록 -->
                                <div class="comment-toggle">
                                    <div class="re-comment-container">
                                        <div class="comment-area">
                                            <textarea class="nanumsquare" style="resize: none;" rows="1" placeholder="답글을 입력하세요..."></textarea>
                                        </div>&nbsp;&nbsp;&nbsp;
                                        <img class="re-send-btn" src="">
                                    </div>
                                </div>
                                
								</tbody>
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
                                            <img class="re-profile-picture" src="">
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
                                                <img class="likeBtn" src="../resources/images/feed/like-icon.png">
                                                <span class="like-count">10</span><span class="comment-date">2021.03.08</span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                     	  </tr>   
             		</tbody>
                    </table>
                 	</c:if>
                 	</c:forEach>
                   
                   
                   
                   
                   
                   
                   
<!-- 댓글끝나는부분************************* -->                  
                 	<!-- 댓글 갯수가 3개 이상이면 버튼 보이게 하기 -->
                     <!-- <button class="reply-more">. . .</button> -->
                    
                    <!-- 댓글 등록 -->
                    <form action="${ contextPath }/fanfeed/insertReply" method="post">
                    <div class="insert-replyArea">
                     <input type="hidden" name="writer" value="${ loginUser.id }">
                     <input type="hidden" name="refId" value="${ f.fid }">
                        <div class="replyArea">
                            <div class="insert-reply">
                                <textarea class="nanumsquare" name="rcontent" style="resize: none;" rows="1" placeholder="댓글을 입력하세요..."></textarea>
                            </div>&nbsp;&nbsp;&nbsp;
                            <button type="submit" class="insert-replyBtn"><img id="addReply" src="../resources/icon/send.png" onclick="insertReply();"></button>
                            <!-- <img class="insert-replyBtn" id="addReply" src="../resources/icon/send.png" onclick="insertReply();"> -->
                        </div>
                    </div>
                    </form> 
                    
                        
               

             </div>
             
             </c:forEach>
          
             
            
             
             
             
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
<!-- ---------------------------- -->			
<!-- ---------------------------- -->			
        </article>
	
<!-- 	메뉴 -->
	<jsp:include page="menu.jsp"/>
	</section>
<!-- <script> -->
// //유저 팝업
//     $(document).ready(function(){
//             console.log("메소드 동작");
            
//             $("#mypageMenuBtn").children().removeClass("mypage-btn-DN");
//             console.log("removeClass 동작");
            
//             $("#mypageMenuBtn").children().eq(0).addClass("mypage-btn-DN");
//             console.log("addClass 동작");
            
//     });
<!-- </script> -->
	    <!-- 포스트 작성 첨부파일 아이콘 클릭 시 이벤트 -->
    <script>
    $('.photo-icon').click(function(){
        $('.main-photo').click();
        $('.main-photo').toggle();
    });
    </script>

	<script>  
    // 사진 불러오기
     $(document).on('change', ".photo", function(e) {
	     let target = $(this)
	     let files = e.target.files;
	     let filesArr = Array.prototype.slice.call(files);
	     let mainImg = $("<img class='main-photo-img'>");
	     let mainInput = $("<input id='mainPhoto' class='photo' type='file' name='uploadFile1' style='display: none;'>");
	     let addImg = $("<img class='add-photo-img'>");
	     let addInput = $("<input id='addPhoto' class='photo' type='file' name='uploadFile2' style='display: none;'>");
	     let addImg1 = $("<img class='add-photo1-img'>");
	     let addInput1 = $("<input id='addPhoto1' class='photo' type='file' name='uploadFile3' style='display: none;'>");
	     let addImg2 = $("<img class='add-photo2-img'>");
	     let addInput2 = $("<input id='addPhoto2' class='photo' type='file' name='uploadFile4' style='display: none;'>");
	     let label = $(this).parent();
	     
	     let id = $(this).attr('id');
	
	     console.log(target.prev());
	     filesArr.forEach(function(f) {
	         if(!f.type.match("image.*")) {
	             alert("확장자는 이미지 확장자만 가능합니다");
	             return;
	         }
	         
	         let reader = new FileReader();
	         if(id == 'mainPhoto') {
	             // 첫번째 사진
	             reader.onload = function(e) {
	                // label.html('');
	                // input type= file 의 name 벨류 값 받아와야 함
	                // $('uploadFile1').val();
	               // let label = $('input[name="uploadFile1"]').val();
	                 mainImg.attr("src", e.target.result);
	                 label.append(mainImg);  
	         		 $('.add-photo').toggle();
	             }
	         } else if(id == 'addPhoto') {
	             // 두번째 사진
	             reader.onload = function(e) {
	                // label.html('');
	                 addImg.attr("src", e.target.result);
	                 label.append(addImg);
	                 $('.add-photo1').toggle();
	             }
	         } else if(id == 'addPhoto1'){
	        	 // 세번째 사진
	        	 reader.onload = function(e){
	        		// label.html('');
	        		 addImg1.attr("src", e.target.result);
	        		 label.append(addImg1);
	        		 $('.add-photo2').toggle();
	        	 }
	         } else if(id == 'addPhoto2'){
	        	 // 네번째 사진
	        	 reader.onload = function(e){
	        		// label.html('');
	        		 addImg2.attr("src", e.target.result);
	        		 label.append(addImg2);
	        		 
	        	 }
	         }
	         reader.readAsDataURL(f);
	     });
	 });  
	  </script>
    <!-- 게시물 신고하기 창 열기  -->
    <script>
    function reportFeed(fid){
        // 팝업 가운데에 띄우기
        var popupWidth = 600;
        var popupHeight = 500;

        var popupX = Math.ceil((window.screen.width - popupWidth)/2);
        // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

        var popupY = Math.ceil((window.screen.width - popupHeight)/2);
        // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
        
        var url = "${ contextPath }/fanfeed/reportView?fid=" + fid;

        window.open(url, "신고하기", 'width=' + popupWidth  + ', height=' + popupHeight  + ', left='+ popupX + ', top='+ popupY);
    }
    </script>
    
    <!--  게시글 작성자와 로그인 유저 동일한 경우 ... 아이콘 누를 시 하위메뉴 열기 -->
	<script>	  
	$('.board-more-icon').click(function () {
    	$(this).siblings(".board-menu").toggleClass('open-area', 500);
	});
	</script>
	
	<!-- 게시글 수정 창 열기 -->
	 <script>
	  // 게시글 수정 팝업창
	  
     function showUpdateFeed(fid, refId){
		
			
         // 팝업 가운데에 띄우기
         var popupWidth = 1200;
         var popupHeight = 500;

         var popupX = Math.ceil((window.screen.width - popupWidth)/2);
         // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

         var popupY = Math.ceil((window.screen.width - popupHeight)/2);
         // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
        
         var url = "${ contextPath }/fanfeed/updateView?fid=" + fid + '&refId=' + refId;
        // var url = "${ contextPath }/fanfeed/updateView?fid=" + fid + '&attCode=' + attCode;
      
         window.open(url, "게시글 수정", 'width=' + popupWidth  + ', height=' + popupHeight  + ', left='+ popupX + ', top='+ popupY);
	 		
     }
      
     </script>
     
     <!-- 게시글 삭제하기 -->
    <script>
    function deleteFeed(fid){
    	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
    	 //   document.form.submit();
    		location.href='${contextPath}/fanfeed/delete?fid=' + fid;
    	} else {   //취소
    	    return;
    	}
    }
    </script>
    
   <!-- 프로필 사진 클릭 시 하위메뉴 열기 게시글 프로필 사진 누르면 왜 안열림?-->
   <script>  
	$('.profile-picture').click(function () {
    	$(this).siblings(".profile-bubble").toggleClass('open-area', 500);
	});
   </script>
   
   <!-- 댓글 ...메뉴 -->
   <script>
	$('.comment-etc').click(function () {
	    $(this).siblings(".comment-bubble").toggleClass('open-area', 500);
	});
   </script>
   
   <!-- 쪽지 창 열기 -->
   <script>
   function insertMessage(writer){
	// 팝업 가운데에 띄우기
       var popupWidth = 600;
       var popupHeight = 400;
       
     //  var messRecId = $("#messRecId").val();

       var popupX = Math.ceil((window.screen.width - popupWidth)/2);
       // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

       var popupY = Math.ceil((window.screen.width - popupHeight)/2);
       // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
      
       
    //   var messRecId = $('input[id=messRecId]').val();
       
       var url = "${ contextPath }/fanfeed/messageView?writer=" + writer;
      
    
       window.open(url, "쪽지", 'width=' + popupWidth  + ', height=' + popupHeight  + ', left='+ popupX + ', top='+ popupY);
	   
   }
   </script>
   
   <!-- 댓글 삭제 -->
   <script>
   function deleteReply(rid){
	   if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	    	 //   document.form.submit();
	    		location.href='${contextPath}/fanfeed/deleteReply?rid=' + rid;
	    	} else {   //취소
	    	    return;
	    	}
   }
   </script>
   
   <!-- 댓글 신고 -->
   <script>
	function reportReply(rid){
	        // 팝업 가운데에 띄우기
	        var popupWidth = 600;
	        var popupHeight = 500;

	        var popupX = Math.ceil((window.screen.width - popupWidth)/2);
	        // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

	        var popupY = Math.ceil((window.screen.width - popupHeight)/2);
	        // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
	        
	        var url = "${ contextPath }/fanfeed/reportReplyView?rid=" + rid;

	        window.open(url, "신고하기", 'width=' + popupWidth  + ', height=' + popupHeight  + ', left='+ popupX + ', top='+ popupY);
	}   
   </script>
   
   <!-- 좋아요 클릭시  누른 유저 추가 -->
   <script>
   function insertLike(fid,flike){
	   var id = "${ loginUser.id }";	 // 좋아요 누른 유저 아이디
	   var refId = fid;					 // 좋아요 누른 게시글 번호 
	   var flike = flike;		 		 // 좋아요 갯수
	   var artNameEn = "${ artiName }";
	   $.ajax({
		  	url : "${ contextPath }/fanfeed/insertLike?refId=" + refId + '&flike=' + flike,
			data : { id : id },
			type : "post",
			dataType : "json",
			success : function(data){
				console.log(data);	// (화면)좋아요 갯수 증가하면서 좋아요아이콘 검정색으로 바꾸기
				alert("좋아요 인서트 성공");
				 $("#insertLike").attr('src',"${ contextPath }/resources/images/feed/likeblack-icon.png");
				
					
				
				
		 }
	  });
   }
   </script>
   
   <!-- 좋아요 취소 시 누른 유저 삭제 -->
   <script>
   function	cancelLike(fid,flike){
	   var id = "${ loginUser.id }";	 // 좋아요 취소한 유저 아이디
	   var refId = fid;					 // 좋아요 취소한 게시글 번호 
	   var flike = flike;		 		 // 좋아요 갯수
	   $.ajax({
		  	url : "${ contextPath }/fanfeed/cancelLike?refId=" + refId + '&flike=' + flike,
			data : { id : id },
			type : "post",
			dataType : "json",
			success : function(data){
				console.log(data);	// (화면)좋아요 갯수 증가하면서 좋아요아이콘 검정색으로 바꾸기, db b_like테이블에 인서트 , BOARD테이블 B_LIKE 컬럼 +1 업데이트 
				alert("좋아요 취소 성공");
				
				$("#cancelLike").attr('src',"${ contextPath }/resources/images/feed/like-icon.png");

				
				
			}
	  });
   }
   </script>
   
   
   
   <!-- 친구 신청 -->
   <script>
   function insertFriend(writer){
	   var frRecId = writer;
	   var frSend = "${loginUser.id}";
	   if (confirm(frRecId + "님에게 친구신청을 하시겠습니까??") == true){    //확인
	    	 //   document.form.submit();
	    		location.href='${contextPath}/fanfeed/insertFriend?frRecId=' + frRecId + '&frSend=' + frSend;
	    	} else {   //취소 
	    	    return;
	    	}
   }
   </script> 
   
   <!-- 상세 페이지로 이동 -->
   <script>
   function detailPage(fid){
	   // 팝업 가운데에 띄우기
       var popupWidth = 1300;
       var popupHeight = 600;

       var popupX = 300;
       // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

       var popupY = 250;
       // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
	   
	   var url = "${ contextPath }/fanfeed/detailView?fid=" + fid;

       window.open(url, "상세페이지", 'width=' + popupWidth  + ', height=' + popupHeight  + ', left='+ popupX + ', top='+ popupY);
	 
       
   }
   </script>
  
  <!-- 대댓글  -->
  <script>


  $('.re-comment-etc').click(function () {
      $(this).siblings(".re-comment-bubble").toggleClass('open-area', 500);
  });

  $(".re-commentBtn").click(function () {

      if($(this).text() == "답글 열기") {
          $(this).text("답글 닫기");
      } else if($(this).text() == "답글 닫기") {
          $(this).text("답글 열기");
      }
      
      $(this).parent().parent().siblings(".re-comment").toggleClass('open-area', 500);
  });

  $(".add-comment").click(function () {
      $(this).parent().parent().siblings(".comment-toggle").toggleClass('open-area', 500);
  });

  $(".re-send-btn").click(function () {
      $(this).parent().parent(".comment-toggle").toggleClass('open-area', 500);
  });

  $(document).ready(function() {
      for(var i = 1; i <= $(".comment-line").length; i++) {
          if($(".comment-line:eq(" + i + ")").children().children(".re-comment").text()) {
              $(".re-commentBtn:eq(" + i + ")").css("display","none");
          }
      }
  });
  </script>
</body>
</html>
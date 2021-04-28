<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/feed/artistFeedList.css?aftr">
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
                <button class="selectAll" name="artNameEn" onclick="feedAll('${ artiName }')" >모두보기</button>
            </div>

            <div class="member-profileArea">
                <table class="profileTable">
                
                    <tr>
                    <c:forEach var="ac" items="${ aclist }">
                    <input type="text" name="writer" value="${ ac.artist.artiId }">
                    <td><img src="${ contextPath }/resources/uploadFiles/${ ac.attachment.attSvName }" class="profile-picture" onclick="selectmemberfeed('${ac.artist.artiId}');"></td>
                    </c:forEach>
                    
                    </tr>
                    <tr>
                    <c:forEach var="ac" items="${ aclist }">
                        <td align="center">${ ac.artist.artiName }</td>
                    </c:forEach>
                    </tr>
                    
                </table>
            </div>
            
           </div>
            
             <!-- 로그인 유저가 아티스트일때 포스트 작성 보이게 하기 -->
      <c:if test="${ loginUser.classifyMem == 2 }">
          <jsp:include page="../artistfeed/artistfeedinsert.jsp"/>
	  </c:if>	

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
                    <c:forEach var="ap" items="${ aplist }">
                     		<c:if test="${ ap.refuid eq f.writer }">
                        <td>
                            <div class="profile-bubble">
                                <p class="friend-application">친구 신청</p>
                                <p class="send-message">쪽지 보내기</p>
                            </div>
                             <img class="profile-picture" src="${ contextPath }/resources/uploadFiles/${ ap.attSvName }">
                        </td>
                        </c:if>
                        </c:forEach>
                        <td> 
                        	 <c:forEach var="a" items="${ alist }">
                        	 <c:if test="${ f.writer eq a.artiId }">
                            <pre class="nicknameArea">${ a.artiNickname }</pre>
                            
                             </c:if>
                             </c:forEach>
                            <pre class="boarddateArea"><fmt:formatDate value="${ f.fcreate }" pattern="yyyy.MM.dd HH:mm"/></pre>
                        </td>
                        
                         <!-- 게시글 작성자와 로그인 유저가 같다면 ...아이콘 띄우기(게시글 수정, 삭제) -->
                         <c:if test="${ loginUser.id eq f.writer }">
                       
                        <td>
                            <div class="board-menu">
                                <p onclick="showUpdateFeed(${f.fid});">수정하기</p>
                                <p onclick="deleteFeed(${f.fid});">삭제하기</p>
                            </div>
                            
                            <img class="board-more-icon" src="../resources/images/feed/board-more-icon.png">
                        </td>
                        </c:if>
                         
                    </tr>
                </table>
                    <!-- 게시글 컨텐츠 영역 -->
                    <div class="contentArea">
                        <!-- 텍스트 영역 -->
                        <div>
                            <p class="board-text">${ f.fcontent }</p> 
                        </div>
                        <!-- 이미지 영역 -->
                        <!-- 게시글 bid와 사진이 참조하고 있는 bid가 같고, 사진 리스트가 있다면 반복문돌려서 이미지 갯수만큼 불러오기 -->
                        <c:forEach var="fp" items="${ fplist }">
                        <c:if test="${ f.fid eq fp.refId }">
                        <div>
                            <img src="${ contextPath }/resources/uploadFiles/${ fp.attSvName }" alt="이미지" width="200px" height="400px" style="display:flex;">
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
	  
	<!--  게시글 작성자와 로그인 유저 동일한 경우 ... 아이콘 누를 시 하위메뉴 열기 -->
	<script>	  
	$('.board-more-icon').click(function () {
    	$(this).siblings(".board-menu").toggleClass('open-area', 500);
	});
	</script>
	
	<!-- 게시글 수정 창 열기 -->
	 <script>
	  // 게시글 수정 팝업창
	  
     function showUpdateFeed(fid){
		
         // 팝업 가운데에 띄우기
         var popupWidth = 1200;
         var popupHeight = 500;

         var popupX = Math.ceil((window.screen.width - popupWidth)/2);
         // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

         var popupY = Math.ceil((window.screen.width - popupHeight)/2);
         // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
        
         var refId = $('input[name=refId]').val();
         var url = "${ contextPath }/artistfeed/updateView?fid=" + fid + '&refId=' + refId;
        // var url = "${ contextPath }/fanfeed/updateView?fid=" + fid + '&attCode=' + attCode;
      
         window.open(url, "게시글 수정", 'width=' + popupWidth  + ', height=' + popupHeight  + ', left='+ popupX + ', top='+ popupY);
	 		
     }
     </script>
     
    <!-- 게시글 삭제하기 -->
    <script>
    function deleteFeed(fid){
    	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
    	 //   document.form.submit();
    		location.href='${contextPath}/artistfeed/delete?fid=' + fid;
    	} else {   //취소
    	    return;
    	}
    }
    </script>
    
    <!-- 모먼트에서 프로필 사진 클릭 시 해당 멤버 게시글 조회 -->
    <script>
    function selectmemberfeed(writer){
    	location.href='${contextPath}/artistfeed/selectMember?writer=' + writer;
    }
    </script>
    
    <!-- 모먼트에서 모두보기 클릭 시 -->
    <script>
    function feedAll(artNameEn){
    	location.href='${contextPath}/artistfeed/artistFeedList?artNameEn=' + artNameEn;
    }
    </script>
</body>
</html>
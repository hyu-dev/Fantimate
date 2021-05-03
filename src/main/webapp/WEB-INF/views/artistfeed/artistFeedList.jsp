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
    <link rel="stylesheet" href="${ contextPath }/resources/css/feed/artistFeedList.css?asfsr">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<c:if test="${ !empty msg }">
		<script>alert('${msg}')</script>
		<c:remove var="msg"/>
</c:if>

       <!-- 일반 유저가 아티스트 피드 이동 시 무료회원일 경우 결제 페이지로 넘기기 -->
      <%-- <c:if test="${ loginUser.classifyMem == 2 }">
          <jsp:include page="../artistfeed/artistfeedinsert.jsp"/>
	  </c:if> --%>



<!-- 네비바 인클루드 -->
	<jsp:include page="../common/navbar.jsp"/>
	
    <section class="main-section">
       
        <!-- 왼쪽(카테고리) 인클루드 -->
		<jsp:include page="../common/category.jsp"/>
		
		<!-- 메인 컨텐츠 영역 -->
        <section class="main-contents">
           
             
          <!-- 솔로면 모먼트 영역 안보이게 설정 display none-->
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
            
            
             <!-- 로그인 유저가 아티스트면서 들어간 피드가 자신의 피드일때 포스트 작성 보이게 하기 -->
          <c:forEach var="one" items="${ onelist }">     
      <c:if test="${ loginUser.classifyMem == 2 && one.artiNameEn eq artiName }"><!-- 두번째 조건?? -->
          <jsp:include page="../artistfeed/artistfeedinsert.jsp"/>
	  </c:if>	
		</c:forEach>
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
                             <img class="profile-picture" src="${ contextPath }/resources/uploadFiles/${ ap.attSvName }" onclick="profilePage()">
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
                                <p onclick="">수정하기</p>
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
                       	<div class="photo-area">
                        <c:set var="count" value="0"/>
                        <c:forEach var="fp" items="${ fplist }">
                        <c:if test="${ f.fid eq fp.refId }">
                        <c:set var="count" value="${ count + 1 }"/>	
                        </c:if>
                        </c:forEach>
                        <c:forEach var="fp" items="${ fplist }">
                        <c:if test="${ f.fid eq fp.refId }">
                        <c:choose>
                        <c:when test="${ count eq 0 }">
                        <input class="p" type="hidden" value="Y">
                        <c:set var="no" value="${ count }"/>
                           <img class="pic" src="${ contextPath }/resources/uploadFiles/${ fp.attSvName }">
						</c:when>
						<c:when test="${ count eq 1 }">
						<input class="p1" type="hidden" value="Y">
                            <img class="pic1" src="${ contextPath }/resources/uploadFiles/${ fp.attSvName }">
						</c:when>
						<c:when test="${ count eq 2 }">
                            <input class="p2" type="hidden" value="Y">
                            <img class="pic2" src="${ contextPath }/resources/uploadFiles/${ fp.attSvName }">
                        </c:when>
						<c:when test="${ count eq 3 }">
                            <input class="p3" type="hidden" value="Y">
                            <img class="pic3" src="${ contextPath }/resources/uploadFiles/${ fp.attSvName }">
                        </c:when>
                        <c:when test="${ count eq 4 }">
                            <input class="p4" type="hidden" value="Y">
                            <img class="pic4" src="${ contextPath }/resources/uploadFiles/${ fp.attSvName }">
                        </c:when>
						</c:choose>
						 </c:if>                       
                         </c:forEach>  
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
                            <c:set var="ddimCheck" value="0"/>
							<c:forEach var="l" items="${ lklist }">
                                <c:if test="${ loginUser.id eq l.id && f.fid eq l.refId }">
                                <!-- 좋아요를 누른 상태 -->
                           		<td><img id="cancelLike" src="../resources/images/feed/likeblack-icon.png" class="like-icon${f.fid}" onclick="insertLike(${f.fid})"></td>
                                <c:set var="ddimCheck" value="1"/>
                                </c:if>
                             </c:forEach>
                              <c:if test="${ ddimCheck eq 0 }">
							<td><img id="insertLike" src="../resources/images/feed/like-icon.png" class="like-icon${f.fid}" onclick="insertLike(${f.fid})"></td>
                              </c:if>
                        
                            
                            <td id="likeCount${f.fid}">${f.flike}<!-- 카운트 ajax --></td>
                            <td class="reply-info">댓글</td>
                            <td class="reply-count"></td>
                        </tr>
                    </table>
                    <hr width="90%">
                    <br>
                  
                    <!-- 댓글 리스트 영역 -->
                   
                    <table class="original-comment">
                    <c:forEach var="r" items="${ rlist }">
                   <c:if test="${ f.fid eq r.refId }">
                    <!-- 쪽지 관련 히든 태그 -->
                   <input type="hidden" value="${ r.writer }" name="messRecId" id="messRecId">
                    <!-- <tbody>비교해서 다른부분**************** --> 
                        <colgroup>
                            <col width="5%"/>
                            <col width="95%"/>
                        </colgroup>
                        <tr class="comment-line">
                       
                       	<!-- 일반 유저가 댓글 달 경우 닉네임,사진 ,내용 출력-->
                       <c:choose>
                       <c:when test="${r.classify == 1 }">
                         <c:forEach var="at" items="${ atlist }">
                     	 <c:if test="${ at.refuid eq r.writer }">
                            <td>
                            <c:if test="${ loginUser.id ne r.writer }">
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
                                          
                                    </div>
                                    <div class="comment-etc">
                                   	 <span class="comment-etc" >···</span> 
                                    	<c:if test="${ loginUser.id ne r.writer }">
                                        <div class="comment-bubble">
                                              
                                            <p onclick="reportReply(${r.rid });">댓글 신고</p>
                                        </div>
                                        </c:if>
                                        <c:if test="${ loginUser.id eq r.writer }">
                                        <div class="comment-bubble">
                                            
                                            <p onclick="deleteReply(${r.rid});">삭제하기</p>
                                            
                                        </div>
                                        </c:if>
                                    </div>

                                    </div>
                                   </c:if>
                               </c:forEach>
                              </c:when>
                               
                               <c:otherwise>
                               <c:forEach var="ap" items="${ aplist }">
                     	 		<c:if test="${ ap.refuid eq r.writer }">
                            <td>
                            <c:if test="${ loginUser.id ne r.writer }">
                                <div class="profile-bubble">
                                    <p onclick="">프로필 보기</p>
                                    
                                </div>
                            </c:if>
                             
                               
                                <img class="profile-picture" src="${ contextPath }/resources/uploadFiles/${ ap.attSvName }">
                            </td>
                            </c:if>
                            </c:forEach> 

                             <c:forEach var="al" items="${ alist }">
                             <c:if test="${ r.writer eq al.artiId }">
                        	 
                            <td>
                                <div class="comment-box">
                                    <div id="artist-comment" class="comment-main comment-center nanumsquare">
                                       <!-- 아티스트가 작성한다면 아티스트 닉네임이 보이게 설정 -->
                                       
                                        <span class="comment-name">${ al.artiNickname }</span>
                                        <span class="comment-content">
                                            ${ r.rcontent }
                                        </span>
                                        
                                    </div>
                                    <div class="comment-etc">
                                   	 <span class="comment-etc" >···</span> 
                                    	<c:if test="${ loginUser.id ne r.writer }">
                                        <div class="comment-bubble">
                                            
                                            <p onclick="reportReply(${r.rid });">댓글 신고</p>
                                        </div>
                                        </c:if>
                                        <c:if test="${ loginUser.id eq r.writer }">
                                        <div class="comment-bubble">
                                            
                                            <p onclick="deleteReply(${r.rid});">삭제하기</p>
                                            
                                        </div>
                                        </c:if>
                                    </div>

                                    </div>
                                   </c:if>
                               </c:forEach>
                              
                              </c:otherwise> 
                              </c:choose>
                               
                                   
                                   
                                   
                                    
                              
                          
                              
                              
                              
                              
                                  
                                <!-- 댓글 좋아요 영역 -->
                                <div class="comment-info comment-center nanumsquare">
                                <c:set var="check" value="0"/>
                                	<c:forEach var="rl" items="${ rlklist }">
                                		<c:if test="${ loginUser.id eq rl.id && r.rid eq rl.refId }">
                                    		<img id="cancelRLike" class="likeBtn${ r.rid }" src="../resources/images/feed/likeblack-icon.png" onclick="insertRLike(${r.rid})">
											<c:set var="check" value="1"/>
										</c:if>
									</c:forEach>
										<c:if test="${ check eq 0 }">
											<img id="insertRLike" class="likeBtn${ r.rid }" src="../resources/images/feed/like-icon.png" onclick="insertRLike(${r.rid})">
										</c:if>                                  
                                	    	<span id="likeRCount${r.rid}"> ${ r.likeCount } </span>
                                    		<span class="comment-date"><fmt:formatDate value="${ r.rcreate }" pattern="yyyy.MM.dd HH:mm"/></span>
                                </div>
                               
                       
                 	</c:if>
                 	</c:forEach>
                    </table>
                    <!-- <button class="reply-more">. . .</button> -->
                    
                    <!-- 댓글 등록 영역 -->
                    <form action="${ contextPath }/artistfeed/insertReply" method="post">
                    <div class="insert-replyArea">
                     <input type="hidden" name="classify" value="${ loginUser.classifyMem }">
                     <input type="hidden" name="writer" value="${ loginUser.id }">
                     <input type="hidden" name="refId" value="${ f.fid }">
                     <input type="hidden" name="id" value="${ f.writer }">
                        <div class="replyArea">
                            <div class="insert-reply">
                                <textarea class="nanumsquare" name="rcontent" style="resize: none;" rows="1" placeholder="댓글을 입력하세요..."></textarea>
                            </div>&nbsp;&nbsp;&nbsp;
                            <button type="submit" class="insert-replyBtn"><img id="addReply" src="../resources/icon/send.png" onclick="insertReply();"></button>
                            
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
    
   <!-- 게시글 사진 개수에 따라 css 조절 -->
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
	
	$(document).ready(function(){
		
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
	});
  </script>
  
  <!-- 게시글 좋아요 ajax -->
  <script>
             function insertLike(fid){
            	 var data;
            	 var fid = fid;
            	 var img = $(".like-icon" + fid);
            	 if($(".like-icon" + fid).attr('src') == "../resources/images/feed/like-icon.png"){
            		 data = {
            			fid : fid,
            			id : "${loginUser.id}",
            			type: '등록'
            				 
            		 }
            	 } else if($(".like-icon" + fid).attr('src') == "../resources/images/feed/likeblack-icon.png"){
            		 data = {
            				fid : fid,
                 			id : "${loginUser.id}",
                 			type: '취소'
                 				 
                 		 }
            	 }
            	 var url = "${pageContext.request.contextPath}/fanfeed/like"
         	     callAjaxWishx(url, data, img, fid);
             
             }
             
             // 좋아요 ajax
             function callAjaxWishx(url, data, img ,fid){
            	 console.log(img.attr("src"));
            	 $.ajax({
            		 url : url,
            		 method : "POST",
            		 data : data,
            		 dateType : "json",
            		 success : function(map) {
            			 alert(map.msg)
            			 var src = "../resources/images/feed/"
            			 if(map.msg == "좋아요가 등록 되었습니다"){
            				 img.attr("src", src + "likeblack-icon.png");
              				 document.getElementById("likeCount"+fid).innerHTML = map.count;
            			 } else if(map.msg == "좋아요가 취소되었습니다"){
            				 img.attr("src", src + "like-icon.png");
              				 document.getElementById("likeCount"+fid).innerHTML = map.count;
            			 }
            			 console.log("적용후 : " , img.attr("src"))
            			 
            		 },
            		 error : function(e) {
     	        		console.log(e)
     	        	}
            	 });
            	 
             }
             
          
         	function likeCount(fid){
         		
       		 var fid = fid;
       		
       		$.ajax({
       			url: "${contextPath}/fanfeed/likeCount",
       			data : {fid : fid},
       			dataType : "json",
       			success : function(data){
       				console.log(data);
       				
       				document.getElementById("likeCount"+fid).innerHTML = data;
       				
       				
       			},
       			error : function(e){
       				alert("code : " + e.status + "\n"
       						+ "message : " + e.responseText);
       			}
       			
       		}); 
       		
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
   
 <!-- 댓글 삭제 -->
   <script>
   function deleteReply(rid){
	   if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	    	 //   document.form.submit();
	    		location.href='${contextPath}/artistfeed/deleteReply?rid=' + rid;
	    	} else {   //취소
	    	    return;
	    	}
   }
   </script>
   
 <!-- 댓글 좋아요 -->
<script>
    function insertRLike(rid){
   	 var data;
   	 var rid = rid;
   	 var img = $(".likeBtn" + rid);
   	 if($(".likeBtn" + rid).attr('src') == "../resources/images/feed/like-icon.png"){
   		 data = {
   			rid : rid,
   			id : "${loginUser.id}",
   			type: '등록'
   				 
   		 }
   	 } else if($(".likeBtn" + rid).attr('src') == "../resources/images/feed/likeblack-icon.png"){
   		 data = {
   				rid : rid,
        			id : "${loginUser.id}",
        			type: '취소'
        				 
        		 }
   	 }
   	 var url = "${pageContext.request.contextPath}/fanfeed/rlike"
	     callAjaxWish(url, data, img, rid);
      
    }
      
    // 댓글좋아요 ajax
    function callAjaxWish(url, data, img ,rid){
   	 console.log(img.attr("src"));
   	 $.ajax({
   		 url : url,
   		 method : "POST",
   		 data : data,
   		 dateType : "json",
   		 success : function(map) {
   			 alert(map.msg)
   			 var src = "../resources/images/feed/"
   			 if(map.msg == "좋아요가 등록 되었습니다"){
   				 img.attr("src", src + "likeblack-icon.png");
     				 document.getElementById("likeRCount"+rid).innerHTML = map.count;
   			 } else if(map.msg == "좋아요가 취소되었습니다"){
   				 img.attr("src", src + "like-icon.png");
     				 document.getElementById("likeRCount"+rid).innerHTML = map.count;
   			 }
   			 console.log("적용후 : " , img.attr("src"))
   			 
   		 },
   		 error : function(e) {
     		console.log(e)
     	}
   	 });
     	 
   }
      
   
  	function likeRCount(rid){
  		
		 var rid = rid;
		
		$.ajax({
			url: "${contextPath}/fanfeed/likeRCount",
			data : {rid : rid},
			dataType : "json",
			success : function(data){
				console.log(data);
				
				document.getElementById("likeRCount"+rid).innerHTML = data;
				
				
			},
			error : function(e){
				alert("code : " + e.status + "\n"
						+ "message : " + e.responseText);
			}
			
		}); 
  		
  	}
</script>

  <!-- 댓글 신고하기 창 열기  -->
    <script>
	function reportReply(rid){
        // 팝업 가운데에 띄우기
        var popupWidth = 600;
        var popupHeight = 500;
        var popupX = Math.ceil((window.screen.width - popupWidth)/2);
        // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
        var popupY = Math.ceil((window.screen.width - popupHeight)/2);
        // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
        
        var url = "${ contextPath }/artistfeed/reportReplyView?rid=" + rid;
        window.open(url, "신고하기", 'width=' + popupWidth  + ', height=' + popupHeight  + ', left='+ popupX + ', top='+ popupY);
	}   
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
       
       var url = "${ contextPath }/artistfeed/messageView?writer=" + writer;
      
    
       window.open(url, "쪽지", 'width=' + popupWidth  + ', height=' + popupHeight  + ', left='+ popupX + ', top='+ popupY);
	   
   }
   </script>
   
  <!-- 친구 신청 -->
   <script>
   function insertFriend(writer){
	   var frRecId = writer;
	   var frSend = "${loginUser.id}";
	   if (confirm(frRecId + "님에게 친구신청을 하시겠습니까??") == true){    //확인
	    	 //   document.form.submit();
	    		location.href='${contextPath}/artistfeed/insertFriend?frRecId=' + frRecId + '&frSend=' + frSend;
	    	} else {   //취소 
	    	    return;
	    	}
   }
   </script> 
       
</body>
</html>
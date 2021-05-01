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
    <link rel="stylesheet" href="${ contextPath }/resources/css/feed/fanFeedList.css?aftrs">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<c:if test="${ !empty msg }">
		<script>alert('${msg}')</script>
		<c:remove var="msg"/>
	</c:if>
	
	<!-- 네비바 인클루드 -->
	<jsp:include page="../common/navbar.jsp"/>
	
    <section class="main-section">
       
        <!-- 왼쪽(카테고리) 인클루드 -->
		<jsp:include page="../common/category.jsp"/>
         
         <!-- 메인 컨텐츠 영역 -->
         <section class="main-contents">
 
         <!-- 로그인 유저가 일반일때 포스트 작성 보이게 하기 -->
        <c:if test="${ loginUser.classifyMem == 1 }">
          <jsp:include page="../fanfeed/fanfeedinsert.jsp"/>
		</c:if>
			
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
                     	<!--  -->	
                        <td>
                            <!-- <div class="profile-bubble">
                                <p>친구 신청</p>
                                <p onclick="insertMessage();">쪽지 보내기</p>
                            </div> -->
                             <c:if test="${ loginUser.id ne f.writer }">
                            	<div class="profile-bubble">
                                    <p onclick="insertFriend('${f.writer}');">친구 신청</p>
                                    <p onclick="insertMessage('${f.writer}');">쪽지 보내기</p>
                                </div>
                            </c:if>     
                      <c:forEach var="at" items="${ atlist }">
                            <c:if test="${ at.refuid eq f.writer }">
                             <img class="profile-picture" src="${ contextPath }/resources/uploadFiles/${ at.attSvName }" >
                        </c:if>
                        </c:forEach>
                        </td>
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
                        <div class="photo-area">
                        <c:set var="count" value="0"/>
                        <c:forEach var="pt" items="${ ptlist }">
                        <c:if test="${ f.fid eq pt.refId }">
                        <c:set var="count" value="${ count + 1 }"/>	
                        </c:if>
                        </c:forEach>
                        <c:forEach var="pt" items="${ ptlist }">
                        <c:if test="${ f.fid eq pt.refId }">
                        <c:choose>
                        <c:when test="${ count eq 0 }">
                        <input class="p" type="hidden" value="Y">
                        <c:set var="no" value="${ count }"/>
                           <img class="pic" src="${ contextPath }/resources/uploadFiles/${ pt.attSvName }">
						</c:when>
						<c:when test="${ count eq 1 }">
						<input class="p1" type="hidden" value="Y">
                            <img class="pic1" src="${ contextPath }/resources/uploadFiles/${ pt.attSvName }">
						</c:when>
						<c:when test="${ count eq 2 }">
                            <input class="p2" type="hidden" value="Y">
                            <img class="pic2" src="${ contextPath }/resources/uploadFiles/${ pt.attSvName }">
                        </c:when>
						<c:when test="${ count eq 3 }">
                            <input class="p3" type="hidden" value="Y">
                            <img class="pic3" src="${ contextPath }/resources/uploadFiles/${ pt.attSvName }">
                        </c:when>
                        <c:when test="${ count eq 4 }">
                            <input class="p4" type="hidden" value="Y">
                            <img class="pic4" src="${ contextPath }/resources/uploadFiles/${ pt.attSvName }">
                        </c:when>
						</c:choose>
						 </c:if>                       
                         </c:forEach>  
                        </div>
                       
                        
                    </div>
                    <br><br>
                    <input type="hidden" name="attCode" value="${ pt.attCode }">
                    <input type="hidden" name="fid" value="${ f.fid }">
                    <input type="hidden" name="refId" value="${ pt.refId }">
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
                                <!-- 좋아요를 누른 상태 -->
                           		<td><img id="cancelLike" src="../resources/images/feed/likeblack-icon.png" class="like-icon${f.fid}" onclick="insertLike(${f.fid})"></td>
                                <c:set var="ddimCheck" value="1"/>
                                </c:if>
                             </c:forEach>
                              <c:if test="${ ddimCheck eq 0 }">
							<td><img id="insertLike" src="../resources/images/feed/like-icon.png" class="like-icon${f.fid}" onclick="insertLike(${f.fid})"></td>
                              </c:if>
							
						
							<%-- <td><img id="insertLike" src="../resources/images/feed/likeblack-icon.png" class="like-icon" onclick="insertLike(${f.fid},${f.flike});"></td> --%>
							                           
                            <%-- <td><img id="insertLike" src="../resources/images/feed/likeblack-icon.png" class="like-icon" onclick="insertLike(${f.fid},${f.flike});"></td> --%>
                            
                         
                           
                            <td id="likeCount${f.fid}"><!-- 카운트 ajax --></td>
                            <td class="reply-info">댓글</td>
                            <td class="reply-count">2,300</td>
                        </tr>
                    </table>
                    <hr width="90%">
                    <br> <!-- 이 다음부터 복사함 -->
                        <!-- 댓글 리스트 영역 -->
                   
                   <!-- 쪽지 관련 히든 태그 -->
                    
                   
                    <table class="original-comment">
                    <c:forEach var="r" items="${ rlist }">
                   <c:if test="${ f.fid eq r.refId }">
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
                                        <!-- <span class="re-commentBtn">답글 열기</span> -->
                                    </div>
                                    <div class="comment-etc">
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
                                   </c:if>
                               </c:forEach>
                              </c:when>
                               <c:otherwise>
                               <c:forEach var="ap" items="${ aplist }">
                     	 		<c:if test="${ ap.refuid eq r.writer }">
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
                               
                                <img class="profile-picture" src="${ contextPath }/resources/uploadFiles/${ ap.attSvName }">
                            </td>
                            </c:if>
                            </c:forEach> 

                             <c:forEach var="ar" items="${ artist }">
                             <c:if test="${ r.writer eq ar.artiId }">
                        	 
                            <td>
                                <div class="comment-box">
                                    <div id="artist-comment" class="comment-main comment-center nanumsquare">
                                       <!-- 아티스트가 작성한다면 아티스트 닉네임이 보이게 설정 -->
                                       
                                        <span class="comment-name">${ ar.artiNickname }</span>
                                        <span class="comment-content">
                                            ${ r.rcontent }
                                        </span>
                                        <span class="re-commentBtn">답글 열기</span>
                                    </div>
                                    <div class="comment-etc">
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
                                   </c:if>
                               </c:forEach>
                              
                              </c:otherwise> 
                              </c:choose>
                               <!-- 아티스트가 댓글 달 경우 닉네임,사진 ,내용 출력  -->  
                                   
                                   
                                   
                                    
                              
                              
                              
                              
                              
                              
                                  
                                <!-- 댓글 좋아요 영역 -->
                                <div class="comment-info comment-center nanumsquare">
                                
                                    <img class="likeBtn" src="../resources/images/feed/like-icon.png">
                                    <span class="like-count">1,000</span>
                                    <span class="comment-date"><fmt:formatDate value="${ r.rcreate }" pattern="yyyy.MM.dd HH:mm"/></span>
                                </div>
                               
                                
                                
								<!-- </tbody> -->
                                <!-- 대댓글 -->
                               <%--  <table class="re-comment">
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
                             
                                </table> --%>
                     	 	</td>
                     	  </tr>   
             		<!-- </tbody> -->
                 	</c:if>
                 	</c:forEach>
                    </table>
                   
                 
                   
                   
                  <!-- 여기 전까지 --> 
                   
                   
                   
                   
<!-- 댓글끝나는부분************************* -->                  
                 	<!-- 댓글 갯수가 3개 이상이면 버튼 보이게 하기 -->
                     <!-- <button class="reply-more">. . .</button> -->
                    
                    <!-- 댓글 등록 -->
                    <form action="${ contextPath }/fanfeed/insertReply" method="post">
                    <div class="insert-replyArea">
                     <input type="hidden" name="classify" value="${ loginUser.classifyMem }">
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
                    
                    
                     <script>
                            // 좋아요 카운트 
                         	$(function(){
                         		likeCount(${f.fid});
                         	});
                     </script>
             </div>
             
             
             
             </c:forEach>
          <!-- fList 끝 -->
          
             <!-- 좋아요 ajax 수정************************** -->
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
         	     callAjaxWish(url, data, img, fid);
             
             }
             
             // 좋아요 ajax
             function callAjaxWish(url, data, img ,fid){
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
 <!--   <script>
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
				
					
				
				
				//	 var change = document.getElementById("insertLike");
			//	 document.querySelector(change).setAttribute("src", "https://placeimg.com/200/200/" + i);
				//$('#insertLike').attr('src','../resources/images/feed/likeblack-icon.png')
//				url : "${ contextPath }/fanfeed/fanFeedList?artNameEn=" + artNameEn;
			//	document.getElementById("insertLike").src = "${ contextPath }/resources/images/feed/likeblack-icon.png";
//				if(document.getElementById("insertLike").getAttribute('src') == "${ contextPath }/resources/images/feed/like-icon.png") {
//	                document.getElementById("insertLike").src = "${ contextPath }/resources/images/feed/likeblack-icon.png";
	               
//	            } else {
//	                document.getElementById("insertLike").src = "${ contextPath }/resources/images/feed/like-icon.png";
//	            }
//			}
		 }
	  });
   }
   </script> -->
   
   <!-- 좋아요 취소 시 누른 유저 삭제 -->
  <!--  <script>
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
				
				//				document.getElementById("cancelLike").src = "${ contextPath }/resources/images/feed/like-icon.png";
//				if(document.getElementById("insertLike").getAttribute('src') == "${ contextPath }/resources/images/feed/like-icon.png") {
//	                document.getElementById("insertLike").src = "${ contextPath }/resources/images/feed/likeblack-icon.png";
	               
//	            } else {
//	                document.getElementById("insertLike").src = "${ contextPath }/resources/images/feed/like-icon.png";
//	            }
				
			}
	  });
   }
   </script>
    -->
   
   
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
	 
       
   //    window.open('fanFeedDetail.html','상세페이지','width=1300, height=600, left=300, top=250');
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
</body>
</html>
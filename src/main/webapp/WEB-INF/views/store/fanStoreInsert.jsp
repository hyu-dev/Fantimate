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
    <link rel="stylesheet" href="${ contextPath }/resources/css/store/fanStoreInsert.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Fantimate</title>
</head>
<body>
	<section class="insert-section">
        <form class="main-template" action="" method="POST" enctype="multipart/form-data">
        	<c:if test="${ fsFlag eq 'yes' }">
        		<input type="hidden" name="fcode" id="fcode" value="${ fanStore.get(0).fstore.fcode }">
        	</c:if>
        	<input type="hidden" name="id" id="loginUser" value="${ loginUser.id }">
        	<h3 class="store-write-title">
        	<c:choose>
        		<c:when test="${ fsFlag eq 'yes' }">팬스토어수정</c:when>
        		<c:otherwise>팬스토어등록</c:otherwise>
        	</c:choose>
            </h3>
            <table class="store-write">
                <tbody>
                    <tr>
                        <th>상품출처 *</th>
                        <td>
                            <div class="artist-search">
                                <img src="${ contextPath }/resources/icon/search-icon.svg" alt="" width="30" height="30">
                                <c:choose>
	                                <c:when test="${ fsFlag eq 'yes' }">
		                                <input type="text" name="artiNameEn" class="input-data artist-source" placeholder="아티스트 검색" value="${ fanStore.get(0).fstore.artiNameEn }">
	                                </c:when>
	                                <c:otherwise>
		                                <input type="text" name="artiNameEn" class="input-data artist-source" placeholder="아티스트 검색">
		                            </c:otherwise>
                                </c:choose>
                                <div class="artist-search-area"></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>상품명 *</th>
                        <td>
                        	<c:choose>
                               <c:when test="${ fsFlag eq 'yes' }">
	                            <input type="text" name="fname" placeholder="30자 이내 입력" class="input-data" maxlength="30" value="${ fanStore.get(0).fstore.fname }">
                               </c:when>
                               <c:otherwise>
	                            <input type="text" name="fname" placeholder="30자 이내 입력" class="input-data" maxlength="30">
                           	   </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>제안가격 *</th>
                        <td>
                            <c:choose>
                               <c:when test="${ fsFlag eq 'yes' }">
	                            <input type="number" name="offerPrice" min="100" step="100" class="input-data" value="${ fanStore.get(0).fstore.offerPrice }">
                               </c:when>
                               <c:otherwise>
	                            <input type="number" name="offerPrice" min="100" step="100" class="input-data">
                           	   </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>해시태그 *</th>
                        <td>
                            <div class="artist-search tag-search">
		                        <img src="${ contextPath }/resources/icon/hash-gray.png" alt="" width="30" height="30">
		                        <input type="text" class="input-data tag-source">
		                        <div class="search-area"></div>
                                <ul class="tagArea">
                            	<c:choose>
	                                <c:when test="${ fsFlag eq 'yes' }">
                                		<c:set var="atcode" value="${ fanStore.get(0).att.attCode }"/>
			                        	<c:forEach var="tagList" items="${ fanStore }" varStatus="status">
			                        	<c:if test="${ atcode eq tagList.att.attCode }">
			                            <li>${ tagList.hash.tagName }<input type="hidden" name="tagName" class="tag" id="tag${ status.index + 1 }" value="${ tagList.hash.tagName }"><button type="button">❌</button></li>
			                            </c:if>
			                            </c:forEach>
	                                </c:when>
                            	</c:choose>
                               	</ul>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>내 지역 *</th>
                        <td>
                            <input type="text" value="${ user.get(0).area.areaName }" class="input-data" disabled>
                            <input type="hidden" name="areaCode" value="${ user.get(0).area.areaCode }">
                        </td>
                    </tr>
                    <tr>
                        <th>선호연락방식</th>
                        <td>
                            <select name="contact" id="contactCategory" class="select">
                                <option <c:if test="${ fsFlag eq 'yes' && fanStore.get(0).fstore.contact eq null }">selected</c:if>>연락방식 선택</option>
                                <option value="쪽지" <c:if test="${ fsFlag eq 'yes' && fanStore.get(0).fstore.contact eq '쪽지' }">selected</c:if>>쪽지</option>
                                <option value="댓글" <c:if test="${ fsFlag eq 'yes' && fanStore.get(0).fstore.contact eq '댓글' }">selected</c:if>>댓글</option>
                                <option value="상품소개글" <c:if test="${ fsFlag eq 'yes' && fanStore.get(0).fstore.contact eq '상품소개글' }">selected</c:if>>상품소개글로 안내</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>선호거래방식</th>
                        <td>
                            <select name="deal" id="transferCategory" class="select">
                                <option <c:if test="${ fsFlag eq 'yes' && fanStore.get(0).fstore.deal eq null }">selected</c:if>>거래방식 선택</option>
                                <option value="직거래" <c:if test="${ fsFlag eq 'yes' && fanStore.get(0).fstore.deal eq '직거래' }">selected</c:if>>직거래</option>
                                <option value="택배" <c:if test="${ fsFlag eq 'yes' && fanStore.get(0).fstore.deal eq '택배' }">selected</c:if>>택배</option>
                                <option value="상품소개글" <c:if test="${ fsFlag eq 'yes' && fanStore.get(0).fstore.deal eq '상품소개글' }">selected</c:if>>상품소개글로 안내</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>상품소개글 *</th>
                        <td>
                            <textarea onkeyup="chkword(this, 1000)" name="finfo" class="guide-text" cols="30" rows="10"><c:if test="${ fsFlag eq 'yes' }">${ fanStore.get(0).fstore.finfo }</c:if></textarea>
                            <div class="limit-text">0 / 1000</div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="my-photo">
             	<sub class="addGuide">* 대표사진 등록 필수 / 추가사진은 최대 4장 등록가능</sub>
	            <c:choose>
	            <c:when test="${ fsFlag eq 'yes' }">
	            	<c:set var="count" value="1" />
	            	<c:set var="tagCode" value="${ fanStore.get(0).hash.tagCode }" />
	            	<c:forEach var="att" items="${ fanStore }">
	            	<c:if test="${ att.hash.tagCode eq tagCode }">
	            	<c:choose>
	            		<c:when test="${ att.att.attMain eq 'Y' }">
			            	<label for="mainPhoto" class="main-photo"><img src="${ contextPath }/resources/uploadFiles/${ att.att.attSvName }" width="150px"></label>
			                <input id="mainPhoto" name="mainPhoto" class="photo" type="file" style="display: none;">
			                <input type="hidden" name="mainClName" value="${ att.att.attClName }">
							<input type="hidden" name="mainSvName" value="${ att.att.attSvName }">
	                	</c:when>
	                	<c:otherwise>
		                	<label for="addPhoto${ count }" class="add-photo"><img src="${ contextPath }/resources/uploadFiles/${ att.att.attSvName }" width="130px"></label>
			                <input id="addPhoto${ count }" name="subPhotos" class="photo" type="file" style="display: none;">
			                <input type="hidden" name="subClName" value="${ att.att.attClName }">
							<input type="hidden" name="subSvName" value="${ att.att.attSvName }">
			                <c:set var="count" value="${ count + 1 }" />
	                	</c:otherwise>
	                </c:choose>
	                </c:if>
	                </c:forEach>
	            </c:when>
	            <c:otherwise>
	                <label for="mainPhoto1" class="main-photo">대표사진첨부</label>
	                <input id="mainPhoto1" name="mainPhoto" class="photo" type="file" style="display: none;">
	                <label class="add-photo click-btn">+</label>
	            </c:otherwise>
	            </c:choose>
            </div>
            <div class="btn-area">
                <c:choose>
                	<c:when test="${ fsFlag eq 'yes' }">
                		<button type="button" class="update-btn">수정하기</button>
                	</c:when>
                	<c:otherwise>
                		<button type="button" class="enroll-btn">등록하기</button>
                	</c:otherwise>
                </c:choose>
                <button type="button" class="cancel-btn">취소하기</button>
            </div>
        </form>
    </section>
    <script>
	     let num = 1;
	     let keyCount = 1;
    	 $(function() {
    		var fsFlag = "${ fsFlag }";
    		if(fsFlag == 'yes') {
    			$(".tagArea").css("display", "flex");
    			num = $(".tagArea li").length + 1;
    			keyCount = $(".tagArea li").length + 1;
    		}
    	 });
		 // 사진변경시(첨부시)
		 $(document).on('change', ".photo", function(e) {
		     let files = e.target.files;
		     let filesArr = Array.prototype.slice.call(files);
		     let mainImg = $("<img class='main-photo-img'>");
		     let addImg = $("<img class='add-photo-img'>");
		     let label = $(this).prev("label");
		     let id = $(this).attr('id');
		     console.log(id)
		
		     filesArr.forEach(function(f) {
		         if(!f.type.match("image.*")) {
		             alert("확장자는 이미지 확장자만 가능합니다");
		             return;
		         }
		
		         let reader = new FileReader();
		         if(id == 'mainPhoto' || id == 'mainPhoto1') {
		             // 대표사진을 변경한 경우
		             reader.onload = function(e) {
		                 label.html('');
		                 mainImg.attr("src", e.target.result);
		                 label.append(mainImg);
		             }
		         } else {
		             // 추가사진을 변경한 경우
		             reader.onload = function(e) {
		                 label.html('');
		                 addImg.attr("src", e.target.result);
		                 label.append(addImg);
		             }
		         }
		         reader.readAsDataURL(f);
		     });
		 });
		
		 let count = 0;
		 let n = 1;
		 // 사진 추가시
		 $(document).on('click', '.click-btn', function() {
		     let addInput = $("<input id='addPhoto"+ n +"' name='subPhotos' class='photo' type='file' style='display: none;'>");
		     let label = $("<label for='addPhoto" + n + "' class='add-photo'>추가사진첨부</label>")
		     if(count < 4) {
		    	 $('.click-btn').before(label);
		         label.after(addInput);
		         $('.my-photo').stop().animate( { scrollLeft : '+=1000' } )
		         count++;
		         n++;
		     } else {
		         $('.click-btn').remove()
		         alert('사진 첨부는 최대 5장만 가능합니다')
		     }
		 })
		
		 // 글자수 제한
		 function chkword(obj, maxlength) {
		     let str = obj.value; // 이벤트가 일어난 컨트롤의 value 값
		     let str_length = str.length; // 전체길이
		     // 변수초기화     
		     let max_length = maxlength; // 제한할 글자수 크기
		     let i = 0; // for문에 사용     
		     let ko_byte = 0; // 한글일경우는 2 그밗에는 1을 더함     
		     let li_len = 0; // substring하기 위해서 사용     
		     let one_char = ""; // 한글자씩 검사한다 
		     let str2 = ""; // 글자수를 초과하면 제한할수 글자전까지만 보여준다.
		     for (i = 0; i < str_length; i++) {
		         // 한글자추출 
		         one_char = str.charAt(i);             
		         ko_byte++;
		         $('.limit-text').text(ko_byte + " / 1000");
		     }           
		     // 전체 크기가 max_length를 넘지않으면         
		     if (ko_byte <= max_length) {             
		         li_len = i + 1;         
		     }            
		     // 전체길이를 초과하면     
		     if (ko_byte > max_length) {         
		         alert(max_length + " 글자 이상 입력할 수 없습니다. \n 초과된 내용은 자동으로 삭제 됩니다. ");         
		         str2 = str.substr(0, max_length);         
		         obj.value = str2;     
		         $('.limit-text').text("1000 / 1000");
		     }     
		     obj.focus(); 
		 }  
		
		 // 상품등록 취소시
		 $('.cancel-btn').click(function() {
		     if(confirm('상품등록 취소시 입력한 정보가 모두 삭제됩니다. 취소하시겠습니까?')) {
		    	 $(".insert-section").fadeOut()
		    	 location.reload(true);
		     }
		 })
		
		 // 아티스트 검색란에 데이터 입력시
		 $(document).on('keyup', '.artist-source', function(e) {
			 var artiName = $(this).val();
		     if(artiName == '') {
		    	 // 검색란에 데이터가 없는 경우
		         $('.artist-source').siblings('.artist-search-area').css('display', 'none');
		     } else {
		    	 // 검색란에 데이터가 있는 경우
		         $('.artist-source').siblings('.artist-search-area').css('display', 'block');
		         var url = "${pageContext.request.contextPath}/fanStore/search/artiName"
		         var data = {
		        		 search : artiName
		         };
		         var type = "아티스트";
		         // ajax불러오기
		         callInsertPageSearch(url, data, type)
		     }
		     
		     if(e.keyCode == 13) {
		    	 $('.artist-source').siblings('.artist-search-area').css('display', 'none');
		     }
		 })
		 // 검색된 아티스트 명 클릭시
		 $(document).on("click", ".artist-search-area p", function() {
			$(".artist-source").val($(this).text());
			$('.artist-source').siblings('.artist-search-area').css('display', 'none');
		 });
		 // 아티스트 검색란에 데이터 포커스 해제시
		 $(document).on('blur', '.artist-source', function() {
			 if(!$(".artist-search-area").is(":hover")) {
				$('.artist-source').siblings('.artist-search-area').css('display', 'none');
			}
		 })
		
		 // 해시태그 검색란에 데이터 입력시
		 $(document).on('keyup', '.tag-source', function(e) {
			 var tagName = $(this).val();
		     if(tagName == '') {
		         $('.tag-source').siblings('.search-area').css('display', 'none');
		     } else {
		         $('.tag-source').siblings('.search-area').css('display', 'block');
		         var url = "${pageContext.request.contextPath}/fanStore/search/hashTag"
		         var data = {
		        		 search : tagName
		         };
		         var type = "해시태그";
		         callInsertPageSearch(url, data, type)
		     }
		     var flag = false;
		     // 엔터키 입력시
		     if(e.keyCode == 13) {
		    	 for(var i = 0; i < num; i++) {
		    		 if(tagName == $("#tag" + i).val()) {
		    			 alert("중복된 태그명입니다")
		    			 $(".tag-source").val("").focus()
		    			 flag = true;
		    			 break;
		    		 }
		    	 }
		         if(!flag) {
		        	 appendTag(tagName);
		         }
		     }
		 })
		 // 해시태그 삭제시
		 $(document).on("click", ".tagArea button", function() {
			 $(this).parent("li").remove();
			 keyCount--;
			 num--;
		 })
		 // 해시태그 검색란 포커스시
		 $(document).on('focus', '.tag-source', function() {
			 $('.tag-search img').attr("src", "${ contextPath }/resources/icon/hash-pink.png");
		 })
		 // 해시태그 검색란 포커스 해제시
		 $(document).on('blur', '.tag-source', function() {
			 if(!$(".search-area").is(":hover")) {
				 $(".search-area").css('display', 'none');
				 $('.tag-search img').attr("src", "${ contextPath }/resources/icon/hash-gray.png");
			 }
		 })
		 // 검색된 해시태그 명 클릭시
		 $(document).on("click", ".search-area p", function() {
			 var flag = false;
			 var text = $(this).text();
	    	 for(var i = 0; i < num; i++) {
	    		 if(text == $("#tag" + i).val()) {
	    			 alert("중복된 태그명입니다")
	    			 $(".tag-source").val("").focus()
	    			 flag = true;
	    			 break;
	    		 }
	    	 }
	         if(!flag) {
	        	 appendTag(text);
	         }
			$(this).parent('.search-area').css('display', 'none');
		 });
		 // 해시태그 등록 함수
		 function appendTag(tagName) {
			 $(".search-area").css('display', 'none');
	    	 $(".tagArea").css("display", "flex");
	    	 // 태그생성
	    	 var button = $("<button type='button'>").text("❌");
	    	 var input = $("<input type='hidden' name='tagName' class='tag' id='tag" + num + "'>").val(tagName);
	    	 var li = $("<li>")
	    	 if(keyCount < 6) {
	    		 li.append(tagName, input, button);
			     $(".tagArea").append(li);
			     $(".tag-source").val("").focus()
	    	 } else {
	    		 alert('최대 5개까지 등록가능합니다')
	    		 $(".tag-source").val("").focus()
	    		 keyCount--;
				 num--;
	    	 }
	    	 keyCount++;
	    	 num++;
		 }
		 
		// 반복하는 AJAX 공통 함수로 구분(검색 리스트 호출)
		function callInsertPageSearch(url, data, type) {
			$.ajax({
	        	url : url,
	        	method : "POST",
	        	data : data,
				dateType : "json",
	        	success : function(list) {
	        		var artistResult = $(".artist-search-area");
	        		var tagResult = $(".search-area");
	        		artistResult.html("");
	        		tagResult.html("");
	        		if(list.length < 1) {
		        		// 리스트에 정보가 없는 경우
	        			var p = $("<p>").text("찾으시는 정보가 없습니다");
	        			artistResult.append(p);
	        			tagResult.append(p);
	        		} else {
						// 리스트에 정보가 있는 경우
						switch(type) {
						case '아티스트' :
							for(var i in list) {
			        			var p = $("<p>").text(list[i].artNameEn);
			        			artistResult.append(p);
			        		}
							break;
						case '해시태그' :
							for(var i in list) {
			        			var p = $("<p>").text(list[i].tagName);
			        			tagResult.append(p);
			        		}
							break;
						}
	        		}
	        	},
	        	error : function(e) {
	        		console.log(e);
	        	}
	        });
		}
		
		// 등록하기 버튼을 클릭했을 때
		 $(".enroll-btn").click(function() {
			 if($(".input-data").val() == '') {
				 alert("필수항목을 입력하세요")
			 } else if($("#contactCategory").val() == '연락방식 선택' || $("#transferCategory").val() == '거래방식 선택') {
				 alert("카테고리를 선택하세요")
			 } else if($(".guide-text").val() == '') {
				 alert("상품소개글을 등록하세요")
			 } else if($("#mainPhoto1").val() == '') {
				 alert('대표사진을 등록하세요')
			 } else if($(".tagArea li").length == 0) {
				 alert('최소 1개의 태그를 등록하세요') 
			 } else {
				 var url = "${contextPath}/fanStore/insert";
				 $(".main-template").attr("action", url);
				 $(".input-data:nth-of-type(5)").attr("disabled", false);
				 $(".main-template").submit();
			 } 
		 });
		 
		 // 수정하기 버튼을 클릭했을 때
		 $(".update-btn").click(function() {
			 if($(".input-data").val() == '') {
				 alert("필수항목을 입력하세요")
			 } else if($("#contactCategory").val() == '연락방식 선택' || $("#transferCategory").val() == '거래방식 선택') {
				 alert("카테고리를 선택하세요")
			 } else if($(".guide-text").val() == '') {
				 alert("상품소개글을 등록하세요")
			 } else if($("#mainPhoto").val() == '') {
				 alert('대표사진을 등록하세요')
			 } else if($(".tagArea li").length == 0) {
				 alert('최소 1개의 태그를 등록하세요') 
			 } else {
				 var url = "${contextPath}/fanStore/update";
				 $(".main-template").attr("action", url);
				 $(".input-data:nth-of-type(5)").attr("disabled", false);
				 $(".main-template").submit(); 
			 } 
			 
		 });
    </script>
</body>
</html>
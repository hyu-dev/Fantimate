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
    <link rel="stylesheet" href="${ contextPath }/resources/css/store/storeInsert.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Fantimate</title>
</head>
<body>
	<section class="insert-section">
        <form class="main-template" action="" method="POST" enctype="multipart/form-data">
        	<c:if test="${ flag eq 'yes' }">
        		<input type="hidden" name="pcode" id="pcode" value="${ sc.get(0).store.pcode }">
        		<input type="hidden" name="cateCode" id="cateCode" value="${ sc.get(0).storeCate.cateCode }">
        	</c:if>
            <h3 class="store-write-title">
            
            <c:choose>
            	<c:when test="${ flag eq 'yes' }">스토어수정</c:when>
            	<c:otherwise>스토어등록</c:otherwise>
            </c:choose>
            </h3>
            <table class="store-write">
                <tbody>
                    <tr>
                        <th>소속아티스트</th>
                        <td>
                            <input type="text" name="artiNameEn" value="${ artiName }" class="arti input-data" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td>
                            <select name="cateName" id="selectCategory" class="select">
                                <option <c:if test="${ flag eq 'yes' && sc.get(0).storeCate.cateName eq null }">selected</c:if>>카테고리선택</option>
                                <option value="ALBUM" <c:if test="${ flag eq 'yes' && sc.get(0).storeCate.cateName eq 'ALBUM' }">selected</c:if>>ALBUM</option>
                                <option value="GOODS" <c:if test="${ flag eq 'yes' && sc.get(0).storeCate.cateName eq 'GOODS' }">selected</c:if>>GOODS</option>
                                <option value="TICKET" <c:if test="${ flag eq 'yes' && sc.get(0).storeCate.cateName eq 'TICKET' }">selected</c:if>>TICKET</option>
                                <option value="PHOTO" <c:if test="${ flag eq 'yes' && sc.get(0).storeCate.cateName eq 'PHOTO' }">selected</c:if>>PHOTO</option>
                                <option value="ETC" <c:if test="${ flag eq 'yes' && sc.get(0).storeCate.cateName eq 'ETC' }"></c:if>>ETC</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>상품명</th>
                        <td>
                            <input type="text" name="pname" placeholder="30자 이내 입력" 
                            maxlength="30" class="input-data" required 
                            value="<c:if test="${ flag eq 'yes' }">${ sc.get(0).store.pname }</c:if>">
                        </td>
                    </tr>
                    <tr>
                        <th>판매수량</th>
                        <td>
                            <div class="input-area">
                                <input type="number" name="salesQ" min="100" step="100" class="input-data" required 
                                value="<c:if test="${ flag eq 'yes' }">${ sc.get(0).store.salesQ }</c:if>">
                                <p>개</p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>개당가격</th>
                        <td>
                            <div class="input-area">
                                <input type="number" name="qprice" min="100" step="100" class="input-data" required 
                                value="<c:if test="${ flag eq 'yes' }">${ sc.get(0).store.qprice }</c:if>">
                                <p>원</p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>멤버십할인</th>
                        <td>
                            <div class="input-area">
                                <input type="number" name="discount" min="0" step="1" class="input-data" required
                                value="<c:if test="${ flag eq 'yes' }">${ sc.get(0).store.discount }</c:if>">
                                <p>%</p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>상품정보</th>
                        <td>
                            <table class="product-info">
                                <tr>
                                    <th>제조사/원산지</th>
                                    <td>
                                        <input type="text" name="origin" placeholder="제조사를 등록하세요" required
                                        value="<c:if test="${ flag eq 'yes' }">${ sc.get(0).storeInfo.origin }</c:if>">
                                    </td>
                                </tr>
                                <tr>
                                    <th>브랜드</th>
                                    <td>
                                        <input type="text" name="brand" placeholder="판매처 브랜드를 입력하세요" required
                                        value="<c:if test="${ flag eq 'yes' }">${ sc.get(0).storeInfo.brand }</c:if>">
                                    </td>
                                </tr>
                                <tr>
                                    <th>소비자 상담 연락처</th>
                                    <td>
                                        <input type="text" name="contact" placeholder="A/S 책임자 : 000, 전화번호 : 000-000-0000" required
                                        value="<c:if test="${ flag eq 'yes' }">${ sc.get(0).storeInfo.contact }</c:if>">
                                    </td>
                                </tr>
                                <tr>
                                    <th>이용조건, 기간</th>
                                    <td>
                                        <input type="text" name="useTerm" placeholder="전체이용가능, 이용기간제한없음" required 
                                        value="<c:if test="${ flag eq 'yes' }">${ sc.get(0).storeInfo.useTerm }</c:if>">
                                    </td>
                                </tr>
                                <tr>
                                    <th>상품 제공 방식</th>
                                    <td>
                                        <input type="text" name="offerings" placeholder="예) CD" required 
                                        value="<c:if test="${ flag eq 'yes' }">${ sc.get(0).storeInfo.offerings }</c:if>">
                                    </td>
                                </tr>
                                <tr>
                                    <th>청약철회/계약의 해제</th>
                                    <td>
                                        <input type="text" name="cancelInfo" placeholder="판매자 귀책사유(15일 이내) 구매자 귀책사유(7일 이내)" required 
                                        value="<c:if test="${ flag eq 'yes' }">${ sc.get(0).storeInfo.cancelInfo }</c:if>">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <th>안내문구</th>
                        <td>
                            <textarea onkeyup="chkword(this, 1000)" 
                            name="info" 
                            class="guide-text" 
                            cols="30" 
                            rows="10"><c:if test="${ flag eq 'yes' }">${ sc.get(0).store.info }</c:if></textarea>
                            <div class="limit-text">0 / 1000</div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <c:choose>
            <c:when test="${ flag eq 'yes' }">
            <div class="my-photo">
            	<c:set var="count" value="1" />
            	<c:forEach var="att" items="${ sc }">
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
                </c:forEach>
            </div>
            </c:when>
            <c:otherwise>
            <div class="my-photo">
                <label for="mainPhoto" class="main-photo">대표사진첨부</label>
                <input id="mainPhoto" name="mainPhoto" class="photo" type="file" style="display: none;">
                <label class="add-photo click-btn">+</label>
            </div>
            </c:otherwise>
            </c:choose>
            <div class="phrases">
                <label class="jelly-checkbox">
                    <input type="checkbox" name="isView" <c:if test="${ flag eq 'yes' && sc.get(0).store.isView eq 'Y' }">checked</c:if>>
                    <span class="jelly-icon"></span>
                    <span class="jelly-text">추가사진을 화면에 표시합니다</span>
                </label>
            </div>
            <div class="btn-area">
                <c:choose>
                	<c:when test="${ flag eq 'yes' }">
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
    <script type="text/javascript">
		 // 사진첨부시
		 $(document).on('change', ".photo", function(e) {
		     let files = e.target.files;
		     let filesArr = Array.prototype.slice.call(files);
		     let mainImg = $("<img class='main-photo-img'>");
		     let addImg = $("<img class='add-photo-img'>");
		     let label = $(this).prev("label");
		     let id = $(this).attr('id');
		     
		     filesArr.forEach(function(f) {
		         if(!f.type.match("image.*")) {
		             alert("확장자는 이미지 확장자만 가능합니다");
		             return;
		         }
		
		         let reader = new FileReader();
		         if(id == 'mainPhoto') {
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
		 // 추가사진 첨부시
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
		 // 취소하기 버튼을 클릭했을 때
		 $('.cancel-btn').click(function() {
		     if(confirm('상품등록 취소시 입력한 정보가 모두 삭제됩니다. 취소하시겠습니까?')) {
			     $(".main-template").css("display", "none");
				 $(".insert-section").css("display", "none"); 
				 location.reload(true);
		     }
		 })
		 
		 // 등록하기 버튼을 클릭했을 때
		 $(".enroll-btn").click(function() {
			 if($("#selectCategory").val() == null || $("#selectCategory").val() == '카테고리선택') {
				 alert("카테고리를 선택하세요")
			 } else if($("#mainPhoto").attr("src") == '') {
	        	 alert('대표사진을 등록하세요')
			 } else {
				 var url = "${contextPath}/store/insert";
				 $(".main-template").attr("action", url);
				 $(".input-data:nth-of-type(1)").attr("disabled", false);
				 $(".main-template").submit();
			 }
		 });
		 
		 // 수정하기 버튼을 클릭했을 때
		 $(".update-btn").click(function() {
			 var url = "${contextPath}/store/update";
			 $(".main-template").attr("action", url);
			 $(".input-data:nth-of-type(1)").attr("disabled", false);
			 $(".main-template").submit(); 
		 });
    </script>
    
</body>
</html>
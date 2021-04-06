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
	<section class="main-section">
        <form class="main-template" action="" method="">
            <h3 class="store-write-title">스토어등록</h3>
            <table class="store-write">
                <tbody>
                    <tr>
                        <th>소속아티스트</th>
                        <td>
                            <input type="text" value="BTS" class="input-data" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td>
                            <select name="category" id="selectCategory" class="select">
                                <option selected>카테고리 선택</option>
                                <option value="">ALBUM</option>
                                <option value="">GOODS</option>
                                <option value="">TICKET</option>
                                <option value="">PHOTO</option>
                                <option value="">ETC</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>상품명</th>
                        <td>
                            <input type="text" name="pName" placeholder="30자 이내 입력" class="input-data">
                        </td>
                    </tr>
                    <tr>
                        <th>판매수량</th>
                        <td>
                            <div class="input-area">
                                <input type="number" name="quantity" min="100" step="100" class="input-data">
                                <p>개</p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>개당가격</th>
                        <td>
                            <div class="input-area">
                                <input type="number" name="priceQ" min="100" step="100" class="input-data">
                                <p>원</p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>멤버십할인</th>
                        <td>
                            <div class="input-area">
                                <input type="number" name="discount" min="0" step="1" class="input-data">
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
                                        <input type="text" name="" placeholder="제조사를 등록하세요">
                                    </td>
                                </tr>
                                <tr>
                                    <th>브랜드</th>
                                    <td>
                                        <input type="text" name="" placeholder="판매처 브랜드를 입력하세요">
                                    </td>
                                </tr>
                                <tr>
                                    <th>소비자 상담 연락처</th>
                                    <td>
                                        <input type="text" name="" placeholder="A/S 책임자 : 000, 전화번호 : 000-000-0000">
                                    </td>
                                </tr>
                                <tr>
                                    <th>이용조건, 기간</th>
                                    <td>
                                        <input type="text" name="" placeholder="전체이용가능, 이용기간제한없음">
                                    </td>
                                </tr>
                                <tr>
                                    <th>상품 제공 방식</th>
                                    <td>
                                        <input type="text" name="" placeholder="예) CD">
                                    </td>
                                </tr>
                                <tr>
                                    <th>청약철회/계약의 해제</th>
                                    <td>
                                        <input type="text" name="" placeholder="판매자 귀책사유(15일 이내) 구매자 귀책사유(7일 이내)">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <th>안내문구</th>
                        <td>
                            <textarea onkeyup="chkword(this, 1000)" name="" class="guide-text" cols="30" rows="10"></textarea>
                            <div class="limit-text">0 / 1000</div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="my-photo">
                <label for="mainPhoto" class="main-photo">대표사진첨부<input id="mainPhoto" class="photo" type="file" style="display: none;"></label>
                <!-- <label for="addPhoto" class="add-photo">추가사진첨부<input id="addPhoto" class="photo" type="file" style="display: none;"></label> -->
                <label class="add-photo click-btn">+</label>
            </div>
            <div class="phrases">
                <label class="jelly-checkbox">
                    <input type="checkbox">
                    <span class="jelly-icon"></span>
                    <span class="jelly-text">추가사진을 화면에 표시합니다</span>
                </label>
            </div>
            <div class="btn-area">
                <button type="button" class="enroll-btn">등록하기</button>
                <button type="button" class="cancel-btn">취소하기</button>
            </div>
        </form>
    </section>
    <script type="text/javascript">
		 // 사진첨부시
		 // 문제 : 추가사진이 왜 ㅠㅠ 0번째만 적용되지?
		 $(document).on('change', ".photo", function(e) {
			 console.log(e);
		     let target = $(this)
		     let files = e.target.files;
		     let filesArr = Array.prototype.slice.call(files);
		     let mainImg = $("<img class='main-photo-img'>");
		     let mainInput = $("<input id='mainPhoto' class='photo' type='file' style='display: none;'>");
		     let addImg = $("<img class='add-photo-img'>");
		     let addInput = $("<input id='addPhoto' class='photo' type='file' style='display: none;'>");
		     let label = $(this).parent();
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
		                 label.append(mainImg, mainInput);
		             }
		         } else {
		             // 추가사진을 변경한 경우
		             reader.onload = function(e) {
		                 label.html('');
		                 addImg.attr("src", e.target.result);
		                 label.append(addImg, addInput);
		             }
		         }
		         reader.readAsDataURL(f);
		     });
		 });
		
		 let count = 0;
		 let n = 1;
		 // 추가사진 첨부시
		 $(document).on('click', '.click-btn', function() {
		     let addImg = $("<img class='add-photo-img'>");
		     let addInput = $("<input id='addPhoto"+ n +"' class='photo' type='file' style='display: none;'>");
		     let label = $("<label for='addPhoto" + n + "' class='add-photo'>추가사진첨부</label>")
		     if(count < 4) {
		         $('.click-btn').before(label.append(addImg, addInput));
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
		
		 $('.cancel-btn').click(function() {
		     confirm('상품등록 취소시 입력한 정보가 모두 삭제됩니다. 취소하시겠습니까?')
		 })
    </script>
</body>
</html>
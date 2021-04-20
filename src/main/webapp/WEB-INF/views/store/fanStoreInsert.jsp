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
            <h3 class="store-write-title">팬스토어등록</h3>
            <table class="store-write">
                <tbody>
                    <tr>
                        <th>상품출처 *</th>
                        <td>
                            <div class="artist-search">
                                <img src="${ contextPath }/resources/icon/search-icon.svg" alt="" width="30" height="30">
                                <input type="text" value="" class="input-data artist-source" placeholder="아티스트 검색">
                                <div class="search-area">
                                    <p>BTS</p>
                                    <p>Bravegirls</p>
                                    <p>Brown eyed girls</p>
                                    <p>Brown eyed girls</p>
                                    <p>Brown eyed girls</p>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>상품명 *</th>
                        <td>
                            <input type="text" placeholder="30자 이내 입력" class="input-data">
                        </td>
                    </tr>
                    <tr>
                        <th>제안가격 *</th>
                        <td>
                            <input type="number" min="100" step="100" class="input-data">
                        </td>
                    </tr>
                    <tr>
                        <th>해시태그 *</th>
                        <td>
                            <div class="artist-search tag-search">
                                <img src="${ contextPath }/resources/icon/hash-gray.png" alt="" width="30" height="30">
                                <input type="text" value="" class="input-data tag-source">
                                <div class="search-area">
                                    <p>BTS</p>
                                    <p>Bravegirls</p>
                                    <p>Brown eyed girls</p>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>지역설정 *</th>
                        <td>
                            <input type="text" value="" class="input-data" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th>선호연락방식</th>
                        <td>
                            <select name="contact" id="selectCategory" class="select">
                                <option selected>연락방식 선택</option>
                                <option value="">쪽지</option>
                                <option value="">댓글</option>
                                <option value="">상품소개글로 안내</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>선호거래방식</th>
                        <td>
                            <select name="transfer" id="selectCategory" class="select">
                                <option selected>거래방식 선택</option>
                                <option value="">직거래</option>
                                <option value="">택배</option>
                                <option value="">상품소개글로 안내</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>상품소개글 *</th>
                        <td>
                            <textarea onkeyup="chkword(this, 1000)" name="" class="guide-text" cols="30" rows="10"></textarea>
                            <div class="limit-text">0 / 1000</div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="my-photo">
                <sub class="guide">* 대표사진 등록 필수 / 추가사진은 최대 4장 등록가능</sub>
                <label for="mainPhoto" class="main-photo">대표사진첨부<input id="mainPhoto" class="photo" type="file" style="display: none;"></label>
                <!-- <label for="addPhoto" class="add-photo">추가사진첨부<input id="addPhoto" class="photo" type="file" style="display: none;"></label> -->
                <label class="add-photo click-btn">+</label>
            </div>
            <div class="btn-area">
                <button type="button" class="enroll-btn">등록하기</button>
                <button type="button" class="cancel-btn">취소하기</button>
            </div>
        </form>
    </section>
    <script>
		 // 사진첨부시
		 $(document).on('change', ".photo", function(e) {
		     let target = $(this)
		     let files = e.target.files;
		     let filesArr = Array.prototype.slice.call(files);
		     let mainImg = $("<img class='main-photo-img'>");
		     let addImg = $("<img class='add-photo-img'>");
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
		 // 사진 추가시
		 $(document).on('click', '.click-btn', function() {
		     let addImg = $("<img class='add-photo-img'>");
		     let addInput = $("<input id='addPhoto' class='photo' type='file' style='display: none;'>");
		     let label = $("<label for='addPhoto' class='add-photo'>추가사진첨부</label>")
		     if(count < 4) {
		         $('.click-btn').before(label.append(addImg, addInput));
		         $('.my-photo').stop().animate( { scrollLeft : '+=1000' } )
		         count++;
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
		     if(confirm('상품등록 취소시 입력한 정보가 모두 삭제됩니다. 취소하시겠습니까?')) {
		    	 $(".insert-section").fadeOut()
		     }
		 })
		
		 // 아티스트 검색란에 데이터 입력시
		 $(document).on('keyup', '.artist-source', function() {
		     if($('.artist-source').val() == '') {
		         $('.artist-source').siblings('.search-area').css('display', 'none');
		     } else {
		         $('.artist-source').siblings('.search-area').css('display', 'block');
		     }
		 })
		
		 // 해시태그 검색란에 데이터 입력시
		 $(document).on('keyup', '.tag-source', function() {
		     if($('.tag-source').val() == '') {
		         $('.tag-source').siblings('.search-area').css('display', 'none');
		     } else {
		         $('.tag-source').siblings('.search-area').css('display', 'block');
		     }
		 })
    </script>
</body>
</html>
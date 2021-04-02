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
    <link rel="stylesheet" href="${ contextPath }/resources/css/pay/reviewInsert.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Fantimate</title>
</head>
<body>
	<section class="main-section">
        <form class="main-template" action="" method="">
            <div class="my-score">
                <article>
                    <div class="product-background">
                        <img src="${ contextPath }/resources/images/store/1stAlbumBts.png" alt="">
                    </div>
                    <div class="product-info">
                        <p>BTS</p>
                        <b>The 1st Album - Dark & Wild</b>
                    </div>
                </article>
                <article>
                    <p>내 평점</p>
                    <div class="my-score-star">
                        <img src="${ contextPath }/resources/images/store/star-gray.png" alt="">
                        <img src="${ contextPath }/resources/images/store/star-gray.png" alt="">
                        <img src="${ contextPath }/resources/images/store/star-gray.png" alt="">
                        <img src="${ contextPath }/resources/images/store/star-gray.png" alt="">
                        <img src="${ contextPath }/resources/images/store/star-gray.png" alt="">
                    </div>
                    <p class="score-number">0.0</p>
                </article>
            </div>
            <div class="my-review">
                <input type="text" name="" placeholder="제목을 입력하세요 (20자 이내)">
                <div>
                    <textarea onkeyup="chkword(this, 100)" name="" placeholder="내용을 입력하세요 (100자 이내)"></textarea>
                    <div class="limit-text">0 / 100</div>
                </div>
            </div>
            <div class="my-photo">
                <label for="mainPhoto" class="main-photo">대표사진첨부<input id="mainPhoto" class="photo" type="file" style="display: none;"></label>
                <!-- <label for="addPhoto" class="add-photo">추가사진첨부<input id="addPhoto" class="photo" type="file" style="display: none;"></label> -->
                <label class="add-photo click-btn">+</label>
            </div>
            <div class="review-btn">
                <button type="button" class="enroll-review">등록하기</button>
                <button type="button" class="cancel-review">취소하기</button>
            </div>
        </form>
    </section>
    <script>
	 	// 리뷰 작성
	    let sum = 0;
	    // 평점 (별 클릭)을 클릭 했을 때
	    $('.my-score-star > img').click(function() {
	        sum = 0;
	        $('.my-score-star > img').attr('src', '${contextPath}/resources/images/store/star-gray.png')
	        $(this).prevAll().attr('src', '${contextPath}/resources/images/store/star-pink.png');
	        $(this).attr('src', '${contextPath}/resources/images/store/star-pink.png');
	        // src의 pink.png 개수만큼 숫자 적용...
	        let test = document.getElementsByClassName('my-score-star')[0];
	        let img = test.getElementsByTagName('img');
	        for(let i = 0; i < img.length; i++) {
	            if(img[i].getAttribute('src') == "${contextPath}/resources/images/store/star-pink.png") {
	                sum += 1;
	            }
	        }
	        // 평점 숫자로 변환
	        $('.score-number').text(sum + ".0");
	    })
	
	    // 사진첨부시
	    // 문제 : 추가사진이 왜 ㅠㅠ 0번째만 적용되지?
	    $(document).on('change', ".photo", function(e) {
	        let target = $(this)
	        let files = e.target.files;
	        let filesArr = Array.prototype.slice.call(files);
	        let mainImg = $("<img class='main-photo-img'>");
	        let mainInput = $("<input id='mainPhoto' class='photo' type='file' style='display: none;'>");
	        let addImg = $("<img class='add-photo-img'>");
	        let addInput = $("<input id='addPhoto' class='photo' type='file' style='display: none;'>");
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
	                    label.append(mainImg, mainInput);
	                }
	            } else {
	                // 추가사진을 변경한 경우
	                reader.onload = function(e) {
	                    label.html('');
	                    label.append(addImg, addInput);
	                    // target.attr("src", e.target.result);
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
	            $('.limit-text').text(ko_byte + " / 100");
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
	            $('.limit-text').text("100 / 100");
	        }     
	        obj.focus(); 
	    }    
	
	    // 등록하기를 클릭했을 떄
	     $(document).on('click', '.enroll-review', function() {
	         if(sum == 0) { // 평점이 0점(누락) 된 경우
	            alert('평점을 등록하세요(최소 1점)')
	         } else if($('.my-review > input').val() == '') { // 제목이 누락된 경우
	            alert('제목을 입력하세요')
	         } else if($('.my-review textarea').val() == '') {
	            alert('내용을 입력하세요')
	         } else if($('.main-photo').children('img').attr('src') == undefined) {
	            alert('대표사진을 등록하세요')
	         } else {
	            $('.main-template').submit();
	         }
	     })
	
	     // 취소하기를 클릭했을 때
	     $('.cancel-review').click(function() {
	        $('.main-template').fadeOut();
	     })
    </script>
</body>
</html>
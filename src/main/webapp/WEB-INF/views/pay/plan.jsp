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
    <link rel="stylesheet" href="${ contextPath }/resources/css/pay/plan.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/typeit@7.0.4/dist/typeit.min.js"></script>
    <title>Fantimate</title>
</head>
<body>
	<!-- 네비바 인클루드 -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	
	 <section class="main-section">
         <h1 class="pay-title pay-text">아티스트의 모든 것</h1>
         <div class="pay-images-area">
             <article class="pay-image color-red hideme">
                 <img src="${ contextPath }/resources/images/pay/play.png" alt="">
                 <h3 class="img-text pay-text">무제한 시청</h3>
             </article>
             <article class="pay-image color-yellow hideme">
                 <img src="${ contextPath }/resources/images/pay/comments.png" alt="">
                 <h3 class="img-text pay-text">다이렉트 소통</h3>
             </article>
         </div>
         <h3 class="pay-comment pay-text hideme">내 최애 아티스트의 비하인드영상 무제한 시청과<br>실시간 알림(피드)를 통한 소통까지</h3>
         <h2 class="pay-comment pay-text hideme">원해? 구독!</h2>
         <div id="selectSubscription" class="hideme">
             <article class="pay-rec pay-one-month">
                <img class="pay-icon" src="${ contextPath }/resources/images/pay/seed-white.png" alt="">
                 <h2 class="pay-date date one-month">1개월 만</h2>
                 <h5 class="pay-date">(30% 이벤트 할인 적용 중)</h5>
             </article>
             <article class="pay-rec pay-six-month">
                <img class="pay-icon pay-icon2" src="${ contextPath }/resources/images/pay/brands-white.png" alt="">
                <h2 class="pay-date date six-month">6개월 만</h2>
                <h5 class="pay-date" >(40% 이벤트 할인 적용 중)</h5>
            </article>
            <article class="pay-rec pay-subscription">
                <img class="pay-icon" src="${ contextPath }/resources/images/pay/carrot-white.png" alt="">
                <h2 class="pay-date date subscription">정기구독</h2>
                <h5 class="pay-date">(35% 이벤트 할인 적용 중)</h5>
            </article>
         </div>
         <div id="confirmSubscription" class="hideme">
             <img src="${ contextPath }/resources/images/pay/carrot-white.png" alt="">
             <h1>정기구독<sub><s>원가 8,000원</s>(35% 이벤트 할인)</sub></h1>
             <h2 class="pay-text">월 5,200원</h2>
             <h2>구독하시겠습니까?</h2>
        </div>
        <div class="subscription-btn-area" class="hideme">
            <button class="subscription-btn">구독하기</button>
        </div>
         <div id="paymentInformation">
             <div class="payment-info">
                <table>
                    <tr>
                        <td>아이디</td>
                        <td>youjeong</td>
                    </tr>
                    <tr>
                       <td>이름</td>
                       <td>황유정</td>
                   </tr>
                   <tr>
                       <td>이메일</td>
                       <td>hyu630115@gmail.com</td>
                   </tr>
                   <tr>
                       <td>결제수단</td>
                       <td>카카오페이</td>
                   </tr>
                </table>
                <aside>
                    <p>결제금액</p>
                    <b class="pay-text">5,200원</b>
                </aside>
             </div>
             <div class="payment-choice">
                 <button class="payment-btn">결제하기</button>
                 <button class="payment-cancel-btn">취소하기</button>
             </div>
         </div>
    </section>
    <script>
	    new TypeIt('.pay-title', {
	        strings: "",
	        speed: 100,
	        lifeLike: true,
	        cursor: false
			//   loop: true
	    }).go().reset();
	    
	 	// 구독하기 버튼 클릭시
	    $('.subscription-btn').click(function() {
	        $('#paymentInformation').css('display', 'flex');
	        $( 'html, body' ).stop().animate( { scrollTop : '+=1000' } )
	    })

	    // 결제취소버튼 클릭시
	    $('.payment-cancel-btn').click(function() {
	        $('#paymentInformation').css('display','none');
	    })

	    // 플랜 선택시
	    $('.pay-rec').click(function() {
	        moveCard($(this));
	    })

	    async function moveCard(obj) {
	        await $(obj).addClass('moveCenter');
	        await $(obj).css('z-index', '3');
	    }

	    $(document).ready(function() {
	        /* 1 */
	        $(window).scroll( function(){
	            /* 2 */
	            $('.hideme').each( function(i){
	                var bottom_of_object = $(this).offset().top + $(this).outerHeight();
	                var bottom_of_window = $(window).scrollTop() + $(window).height();
	                /* 3 */
	                if( bottom_of_window > bottom_of_object/2 ){
	                    $(this).animate({'opacity':'1'},500);
	                }
	            }); 
	        });
	    });
    </script>
</body>
</html>
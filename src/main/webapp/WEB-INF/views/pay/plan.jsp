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
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <title>Fantimate</title>
</head>
<body>
	<c:if test="${ !empty msg }">
		<script>
			$(function() {
				alert('${msg}')
			}) 
		</script>
		<c:remove var="msg"/>
	</c:if>
	<c:if test="${ !empty loginUser }">
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
                <h2 class="pay-date date one-month">1개월 간</h2>
                <h5 class="pay-date">(30% 이벤트 할인 적용 중)</h5>
                <input type="hidden" class="plan" value="1">
             </article>
             <article class="pay-rec pay-six-month">
                <img class="pay-icon pay-icon2" src="${ contextPath }/resources/images/pay/brands-white.png" alt="">
                <h2 class="pay-date date six-month">6개월 간</h2>
                <h5 class="pay-date" >(40% 이벤트 할인 적용 중)</h5>
                <input type="hidden" class="plan" value="6">
            </article>
            <article class="pay-rec pay-subscription">
                <img class="pay-icon" src="${ contextPath }/resources/images/pay/carrot-white.png" alt="">
                <h2 class="pay-date date subscription">12개월 간</h2>
                <h5 class="pay-date">(50% 이벤트 할인 적용 중)</h5>
                <input type="hidden" class="plan" value="12">
            </article>
         </div>
         <div id="confirmSubscription" class="hideme">
             <img src="${ contextPath }/resources/images/pay/carrot-white.png" alt="">
             <h1>정기구독<sub><s>원가 8,000원</s><span>(35% 이벤트 할인)</span></sub></h1>
             <h2 class="pay-text pay-month">월 5,200원</h2>
             <h2>구독하시겠습니까?</h2>
        </div>
        <div class="subscription-btn-area" class="hideme">
            <button class="subscription-btn">구독하기</button>
        </div>
         <div id="paymentInformation">
             <div class="payment-info">
                <table>
                   <tr>
                       <th>아이디</th>
                       <td>${ loginUser.id }</td>
                   </tr>
                   <tr>
                       <th>이메일</th>
                       <td>${ user.uemail }</td>
                   </tr>
                   <tr>
                   		<th>결제플랜</th>
                   		<td></td>
                   </tr>
                   <tr>
                   		<th>구독기간</th>
                   		<td></td>
                   </tr>
                </table>
                <aside>
                    <p>결제금액</p>
                    <b class="pay-text total-pay">5,200원</b>
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
	    
	    // 플랜 선택시
	    var plan = 0;
	    var totalPrice = 0;
	    $('.pay-rec').click(function() {
	    	// 결제플랜
	        plan = parseInt($(this).children(".plan").val());
	    	// 결제시작일
	        var start = getFormatDate(new Date());
	    	// 결제종료일
	        var end = getCalcMonth(new Date(), plan);
	        switch(plan) {
	        case 1 :
	        	// 동작
	        	$('.pay-rec').css('z-index', '1');
	        	$('.pay-rec:nth-of-type(2)').css('z-index', '2');
	       		$(this).css('z-index', '3');
				// 구독구간 css 적용
				$("#confirmSubscription").css("background", "rgba(192, 235, 117, 0.9)")
				$(".subscription-btn").css("background", "#F4FCE3")
				$(".subscription-btn").removeClass("sixMonth");
				$(".subscription-btn").removeClass("oneYear");
				$(".subscription-btn").addClass("oneMonth");
				// 구독구간 텍스트삽입
	       		$("#confirmSubscription img").attr("src", "${ contextPath }/resources/images/pay/seed-white.png")
				var h1 = $("#confirmSubscription h1")
				h1.html("")
				var sub = $("<sub>")
				var s = $("<s>").text("원가 8,000원");
				var span = $("<span>").text(" (30% 이벤트 할인)");
				sub.append(s, span);
				h1.append("1개월 간", sub)
				$(".pay-month").text("월 5,600원")
	       		// 결제구간 텍스트 삽입
	        	$(".payment-info tr:nth-of-type(3) td").text("1개월 간");
				totalPrice = 5600;
	        	break;
	        case 6 :
	        	// 동작
	        	$('.pay-rec').css('z-index', '1');
	       		$(this).css('z-index', '3');
	       		// 구독구간 css 적용
				$("#confirmSubscription").css("background", "rgba(116, 192, 252, 0.9)")
				$(".subscription-btn").css("background", "#E7F5FF")
				$(".subscription-btn").removeClass("oneMonth");
				$(".subscription-btn").removeClass("oneYear");
				$(".subscription-btn").addClass("sixMonth");
	       		// 구독구간 텍스트삽입
	       		$("#confirmSubscription img").attr("src", "${ contextPath }/resources/images/pay/brands-white.png")
	       		var h1 = $("#confirmSubscription h1")
				h1.html("")
				var sub = $("<sub>")
				var s = $("<s>").text("원가 8,000원");
				var span = $("<span>").text(" (40% 이벤트 할인)");
				sub.append(s, span);
				h1.append("6개월 간", sub)
				$(".pay-month").text("월 4,800원")
	       		// 결제구간 텍스트삽입
	        	$(".payment-info tr:nth-of-type(3) td").text("6개월 간");
				totalPrice = 6*4800;
	        	break;
	        case 12 :
	        	// 동작 
	        	$('.pay-rec').css('z-index', '1');
	       		$(this).css('z-index', '3');
	       		// 구독구간 css 적용
				$("#confirmSubscription").css("background", "rgba(145, 167, 255, 0.9)")
				$(".subscription-btn").css("background", "#EDF2FF")
				$(".subscription-btn").removeClass("sixMonth");
				$(".subscription-btn").removeClass("oneMonth");
				$(".subscription-btn").addClass("oneYear");
				// 구독구간 텍스트삽입
				$("#confirmSubscription img").attr("src", "${ contextPath }/resources/images/pay/carrot-white.png")
	       		var h1 = $("#confirmSubscription h1")
				h1.html("")
				var sub = $("<sub>")
				var s = $("<s>").text("원가 8,000원");
				var span = $("<span>").text(" (50% 이벤트 할인)");
				sub.append(s, span);
				h1.append("12개월 간", sub)
				$(".pay-month").text("월 4,000원")
	       		// 결제구간 텍스트삽입
	        	$(".payment-info tr:nth-of-type(3) td").text("12개월 간");
				totalPrice = 12*4000;
	        	break;
	        }
	        // 결제구간 텍스트삽입
	        $(".payment-info tr:nth-of-type(4) td").text(start + " ~ " + end);
	        // 결제구간 숨기기
	        $('#paymentInformation').css('display', 'none');
	        // 구독구간 보이기
	        $("#confirmSubscription").css("display","flex");
	        $(".subscription-btn-area").css("display", "block");
	        $( 'html, body' ).stop().animate( { scrollTop : '+=1000' } )
	       
	    })
	    
	    // 날짜 포맷팅
	    function getFormatDate(date) {
	 		var year = date.getFullYear();
	 		var month = (1 + date.getMonth());
	 		month = month >= 10 ? month : '0' + month;
	 		var day = date.getDate();
	 		day = day >= 10 ? day : '0' + day;
	 		return year + "-" + month + "-" + day;
	 	}
	 	function getCalcMonth(date, plan) {
	 		var year = date.getFullYear();
	 		var month = ((1 + plan) + date.getMonth());
	 		if(month > 12) {
	 			year += 1;
	 			month = (1 + date.getMonth());
	 		}
	 		month = month >= 10 ? month : '0' + month;
	 		var day = date.getDate();
	 		day = day >= 10 ? day : '0' + day;
	 		return year + "-" + month + "-" + day;
	 	}
	 	// 숫자 3 단위마다 콤마찍기
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		// 구독하기 버튼 클릭시
	    $('.subscription-btn').click(function() {
	    	if($(".payment-info tr:nth-of-type(3) td").text() == '') {
	    		alert("결제플랜을 선택하세요");
	    	} else {
		        $('#paymentInformation').css('display', 'flex');
		        $( 'html, body' ).stop().animate( { scrollTop : '+=1000' } )
		        // 결제금액 수정
		        $(".total-pay").text(numberWithCommas(totalPrice) + "원")
	    	}
	    })

	    // 결제취소버튼 클릭시
	    $('.payment-cancel-btn').click(function() {
	        $('#paymentInformation').css('display','none');
	    })
	    
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
	    
		// 결제하기 클릭시
	    $(".payment-btn").click(function() {
	    	IMP.init("imp85435791");
	    	// 결제번호
	    	var uid = 'cart_' + new Date().getTime();
	    	// 주문자명
	    	var name = "${ loginUser.id }";
	    	// 주문자 이메일
	    	var email = "${ user.uemail }";
	    	// 상품명
	    	var pname = $(".payment-info tr:nth-of-type(3) td").text();
			// 결제 진행
		    IMP.request_pay({ // param
		      pg: "html5_inicis",
		      pay_method: "card",
		      merchant_uid: uid,
		      amount: totalPrice,
		      name: pname,
		      buyer_email: email,
		      buyer_name: name,
		      buyer_tel: "010-6301-0115",
		    }, function (rsp) { // callback
		      if (rsp.success) {
		          // 결제 성공 시 로직
	        	  $.ajax({
		        	 url : "${ pageContext.request.contextPath }/pay/membership",
		        	 data : {
		        		 		payCode : rsp.merchant_uid,
		        		 		payMethod : "kakaopay_" + rsp.pay_method,
		        		 		payStatus : 1,
		        		 		payPrice : rsp.paid_amount,
		        		 		id : rsp.buyer_name,
		        		 		payDivision : 2,
		        		 		payPlan : plan,
		        		 	},
		        	 method : "POST",
		        	 dateType : "json",
		        	 success : function(msg) {
		        		 alert(msg.msg)
		        		 location.href="${ pageContext.request.contextPath }/pay/plan"
		        	 },
		        	 error: function(e) {
		        		 console.log(e)
		        	 }
		          })
		      } else {
		          // 결제 실패 시 로직,
		          console.log("결제실패")
		          alert("결제를 취소하였습니다")
		      }
		    });
	    });
    </script>
    </c:if>
	<c:if test="${ empty loginUser }">
	<script>
		$(function() {
			alert("로그인을 해주세요");
			location.href="${contextPath}/main"
		})
	</script>
	</c:if>
</body>
</html>
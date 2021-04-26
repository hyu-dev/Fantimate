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
    <link rel="stylesheet" href="${ contextPath }/resources/css/pay/cart.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
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
        <h1 class="cart-title">CART</h1>
        <table class="cart-table">
            <colgroup>
                <col width="5%">
                <col width="50%">
                <col width="11%">
                <col width="11%">
                <col width="12%">
                <col width="11%">
            </colgroup>
            <tr>
                <th>
                    <label class="jelly-checkbox">
                        <input type="checkbox">
                        <span class="jelly-icon"></span>
                    </label>
                </th>
                <th>상품정보</th>
                <th>수량</th>
                <th>배송비</th>
                <th>주문금액</th>
                <th>삭제</th>
            </tr>
            <!-- 합계금액 sum 선언 -->
            <c:set var="sum" value="0" />
            
            <c:forEach var="cl" items="${ cartList }">
            <c:choose>
            <c:when test="${ cl.store.pcode eq null }">
	            <c:if test="${ cl.attMedia.picSvName ne ''}">
	           	<tr>
	                <td>
	                    <label class="jelly-checkbox">
	                        <input type="checkbox">
	                        <span class="jelly-icon"></span>
	                    </label>
	                </td>
	                <td>
	                    <div class="product-area">
	                        <div class="product-img">
	                            <img src="${ contextPath }/resources/uploadFiles/${ cl.attMedia.picSvName }" alt="">
	                        </div>
	                        <p><sub>${ cl.mcategory.artiNameEn }</sub><br>${ cl.official.mediaTtl }</p>
	                        <input type="hidden" class="cart-mCode" value="${ cl.cart.mediaNum }">
	                        <input type="hidden" class="media-ttl" value="${ cl.official.mediaTtl }">
	                    </div>
	                </td>
	                <td>
	                    <div class="quantity">
	                        <p class="product-quantity">${ cl.cart.buyQ }</p>
	                        <input type="hidden" class="buyPrice" value="${ cl.cart.buyPrice }">
	                    </div>
	                </td>
	                <td>${ cl.cart.fee }</td>
	                <td>\ <fmt:formatNumber type="number" value="${ cl.cart.buyPrice }"/></td>
	                <td>
	                    <img class="delete-product" src="${ contextPath }/resources/images/pay/trash.png" alt="">
	                    <input type="hidden" class="cartCode" value="${ cl.cart.cartCode }">
	                </td>
	            </tr>
	            <c:set var="sum" value="${ sum + cl.cart.buyPrice }" />
	            </c:if>
            </c:when>
            <c:otherwise>
	           	<c:if test="${ cl.att.attMain eq 'Y'}">
	           	<tr>
	                <td>
	                    <label class="jelly-checkbox">
	                        <input type="checkbox">
	                        <span class="jelly-icon"></span>
	                    </label>
	                </td>
	                <td>
	                    <div class="product-area">
	                        <div class="product-img">
	                            <img src="${ contextPath }/resources/uploadFiles/${ cl.att.attSvName }" alt="">
	                        </div>
	                        <p><sub>${ cl.storeCate.artiNameEn }</sub><br>${ cl.store.pname }<br><sub>재고 : ${ cl.store.salesQ }</sub></p>
	                        <input type="hidden" class="cart-pCode" value="${ cl.cart.pcode }">
	                        <input type="hidden" class="cart-pName" value="${ cl.store.pname }">
	                        <input type="hidden" class="salesQ" value="${ cl.store.salesQ }">
	                    </div>
	                </td>
	                <td>
	                    <div class="quantity">
	                        <button class="minus-btn">-</button>
	                        <p class="product-quantity">${ cl.cart.buyQ }</p>
	                        <button class="plus-btn">+</button>
	                        <input type="hidden" class="buyPrice" value="${ cl.cart.buyPrice }">
	                    </div>
	                </td>
	                <td>${ cl.cart.fee }</td>
	                <td>\ <fmt:formatNumber type="number" value="${ cl.cart.buyPrice }"/></td>
	                <td>
	                    <img class="delete-product" src="${ contextPath }/resources/images/pay/trash.png" alt="">
	                    <input type="hidden" class="cartCode" value="${ cl.cart.cartCode }">
	                </td>
	            </tr>
	            <c:set var="sum" value="${ sum + cl.cart.buyPrice }" />
	            </c:if>
            </c:otherwise>
            </c:choose>
            </c:forEach>
        </table>
        <div class="cart-guidance">
            <button class="delete-select-product">선택상품삭제</button>
            <p>장바구니에 담긴 상품은 7일 동안 보관됩니다.</p>
        </div>
        <table class="cart-total-table">
            <colgroup>
                <col width="20%">
                <col width="15%">
                <col width="7.5%">
                <col width="15%">
                <col width="7.5%">
                <col width="15%">
                <col width="20%">
            </colgroup>
            <tr>
                <td></td>
                <td><p id="totalPrice" style="margin: 0; padding: 0;">\ 0</p><sub>총 액</sub></td>
                <td>+</td>
                <td>\ 0<br><sub>배송비</sub></td>
                <td>=</td>
                <td><p id="paymentPrice" style="margin: 0; padding: 0;">\ 0</p><sub>결제예정금액</sub></td>
                <td></td>
            </tr>
        </table>
        <div class="cart-payment">
            <button class="cart-payment-btn">결제하기</button>
        </div>
    </section>
    <script>
    	// 임시 (컬렉션 넘어가기)
    	$(".cart-title").click(function() {
    		location.href="${contextPath}/store/collectionStore";
    	})
	 	// 삭제 아이콘 호버시, 클릭시
	    $('.delete-product').hover(function() {
	        $(this).attr('src', '${ contextPath }/resources/images/pay/trash-red.png')
	    }, function() {
	        $(this).attr('src', '${ contextPath }/resources/images/pay/trash.png')
	    }).click(function() {
	        // 장바구니 상품 삭제
	        var cartCode = $(this).siblings(".cartCode").val();
	        location.href = "${contextPath}/pay/deleteStoreByCart?cartCode=" + cartCode;
	    })
	
	    let totalPrice = 0;
	    // th 전체 체크박스 클릭시
	    $('th .jelly-checkbox input').click(function() {
	    	// 담을 곳 비우기
	    	$("#totalPrice").html("");
	    	$("#paymentPrice").html("");
	    	// 전체 체크박스가 클릭되었다면
	        if($(this).prop('checked')) {
	            $('td .jelly-checkbox input').prop('checked', true)
	            totalPrice = ${sum};
	            let text = "\\ " + numberWithCommas(totalPrice);
	            $("#totalPrice").append(text);
	    		$("#paymentPrice").append(text);
	        } else {
	            $('td .jelly-checkbox input').prop('checked', false)
	            totalPrice = 0;
	            let text = "\\ " + numberWithCommas(totalPrice);
	            $("#totalPrice").append(text);
	    		$("#paymentPrice").append(text);
	        }
	    })
	    // td 체크박스 클릭시
	    $("td .jelly-checkbox input").click(function() {
	    	// 금액 출력
	    	buyPrice = parseInt($(this).parents("td").next().next().children().children(".buyPrice").val());
	    	// 담을 곳 비우기
	    	$("#totalPrice").html("");
	    	$("#paymentPrice").html("");
	    	// 체크박스가 체크되었다면
	    	if($(this).prop('checked')) {
	    		totalPrice += buyPrice;
	    		let text = "\\ " + numberWithCommas(totalPrice);
	    		$("#totalPrice").append(text);
	    		$("#paymentPrice").append(text);
	    	} else {
	    		totalPrice -= buyPrice;
	    		let text = "\\ " + numberWithCommas(totalPrice);
	    		$("#totalPrice").append(text);
	    		$("#paymentPrice").append(text);
	    	}
	    });
	 	// 숫자 3 단위마다 콤마찍기
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	
	    // 수량 클릭시
	    $('.minus-btn').click(function() {
	    	var cartCode = $(this).parent().parent().siblings("td").children(".cartCode").val();
	    	var price = $(this).siblings(".buyPrice").val();
	    	var quantity = $(this).siblings(".product-quantity").text();
	    	var flag = 'minus';
	    	price = price / quantity;
	    	if($(this).siblings(".product-quantity").text() > 1) {
	    		location.href = "${contextPath}/pay/updateQuantity?cartCode=" + cartCode + "&flag=" + flag + "&price=" + price;
	    	}
	    })
	    $('.plus-btn').click(function() {
	    	var cartCode = $(this).parent().parent().siblings("td").children(".cartCode").val();
	    	var price = $(this).siblings(".buyPrice").val();
	    	var quantity = $(this).siblings(".product-quantity").text();
	    	var flag = 'plus';
	    	price = price / quantity;
	    	location.href = "${contextPath}/pay/updateQuantity?cartCode=" + cartCode + "&flag=" + flag + "&price=" + price;
	    })
	
	
	    // 선택상품 삭제
	    $('.delete-select-product').click(function() {
	    	var cartCodes = [];
	    	$("td .jelly-checkbox input:checked").each(function(index){
	    		cartCodes.push($(this).parent().parent().siblings("td").children(".cartCode").val())
	    	})
	    	location.href = "${contextPath}/pay/deleteChooseByCart?cartCodes=" + cartCodes;
	    })
	    
	    // 상품 영역 클릭시
	    $(".product-area").click(function() {
	    	var pcode = 0;
	    	var mediaNum = 0;
	    	if($(this).children(".cart-pCode").val() != null) {
	    		// 상품 코드가 있는 경우
	    		pcode = $(this).children(".cart-pCode").val()
	    		location.href='${ contextPath }/store/detail?pcode=' + pcode;
	    	} 
	    	if($(this).children(".cart-mCode").val() != null) {
	    		// 상품 코드가 없는 경우(미디어 번호가 있는 경우)
	    		mediaNum = $(this).children(".cart-mCode").val()
	    		location.href="${ contextPath }/official/media/detail?mediaNum=" + mediaNum;
	    	}
	        
	    });
	    
	    // 결제하기 클릭시
	    $(".cart-payment-btn").click(function() {
	    	IMP.init("imp85435791");
	    	// 결제번호
	    	var uid = 'cart_' + new Date().getTime();
	    	// 주문자명
	    	var name = "${ loginUser.id }";
	    	// 주문자 이메일
	    	var email = "${ user.uemail }";
	    	// 상품명, 상품코드, 상품수량, 장바구니코드
	    	var pname = []
	    	var pcode = []
	    	var buyQ = []
	    	var cartCodes = []
			var flag = true;
			$('td .jelly-checkbox input:checked').each(function(index) {
				if($(this).parents("td").next().children().children(".cart-pCode").val() != null) {
					pcode.push($(this).parents("td").next().children().children(".cart-pCode").val());
					buyQ.push($(this).parents("td").next().next().children().children(".product-quantity").text())
					pname.push($(this).parents("td").next().children().children(".cart-pName").val())
					var quantity = parseInt($(this).parents("td").next().next().children().children(".product-quantity").text())
					var salesQ = parseInt($(this).parents("td").next().children().children(".salesQ").val())
					if(quantity > salesQ) {
						flag = false
					}
				} else {
					pname.push($(this).parents("td").next().children().children(".media-ttl").val())
				}
				cartCodes.push($(this).parents("td").siblings("td").children(".cartCode").val())
			})
			// 상품코드가 없다면
			if(pcode.length < 1) {
				pcode.push(0)
				buyQ.push(0)
			}
			// 구매전 재고확인
			if(!flag) {
				alert("재고 수량을 초과한 상품이 있습니다");
				return;
			}
			
			// 결제 진행
		    IMP.request_pay({
		      pg: "html5_inicis",
		      pay_method: "card",
		      merchant_uid: uid,
		      amount: totalPrice,
		      name: pname[0] + " 외 " + (pname.length -1) + "건",
		      buyer_email: email,
		      buyer_name: name,
		      buyer_tel: "010-6301-0115",
		    }, function (rsp) {
		    	if (rsp.success) {
			          // 결제 성공 시 로직
		        	  $.ajax({
			        	 url : "${ pageContext.request.contextPath }/pay/cart/payment",
			        	 data : {
			        		 		payCode : rsp.merchant_uid,
			        		 		payMethod : "kakaopay_" + rsp.pay_method,
			        		 		payStatus : 1,
			        		 		payPrice : rsp.paid_amount,
			        		 		id : rsp.buyer_name,
			        		 		payDivision : 1,
			        		 		buyQ : buyQ,
			        		 		pcode : pcode,
			        		 		cartCodes : cartCodes
			        		 	},
			        	 method : "POST",
			        	 dateType : "json",
			        	 success : function(msg) {
			        		 alert(msg.msg)
			        		 location.href="${ pageContext.request.contextPath }/pay/cart"
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
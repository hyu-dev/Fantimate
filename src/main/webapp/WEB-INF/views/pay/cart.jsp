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
    <link rel="stylesheet" href="${ contextPath }/resources/css/pay/cart.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Fantimate</title>
</head>
<body>
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
                            <img src="../resource/images/1stAlbumBts.png" alt="">
                        </div>
                        <p><sub>BTS</sub><br>The 1st Album - Dark & Wild<br><sub>재고 : 0</sub></p>
                    </div>
                </td>
                <td>
                    <div class="quantity">
                        <button class="minus-btn">-</button>
                        <p class="product-quantity">1</p>
                        <button class="plus-btn">+</button>
                    </div>
                </td>
                <td>무료</td>
                <td>\ 14,900</td>
                <td>
                    <img class="delete-product" src="../resource/images/pay/trash.png" alt="">
                </td>
            </tr>
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
                            <img src="../resource/images/1stAlbumBts.png" alt="">
                        </div>
                        <p><sub>BTS</sub><br>The 1st Album - Dark & Wild<br><sub>재고 : 0</sub></p>
                    </div>
                </td>
                <td>
                    <div class="quantity">
                        <button class="minus-btn">-</button>
                        <p class="product-quantity">1</p>
                        <button class="plus-btn">+</button>
                    </div>
                </td>
                <td>무료</td>
                <td>\ 14,900</td>
                <td>
                    <img class="delete-product" src="../resource/images/pay/trash.png" alt="">
                </td>
            </tr>
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
                            <img src="../resource/images/1stAlbumBts.png" alt="">
                        </div>
                        <p><sub>BTS</sub><br>The 1st Album - Dark & Wild<br><sub>재고 : 0</sub></p>
                    </div>
                </td>
                <td>
                    <div class="quantity">
                        <button class="minus-btn">-</button>
                        <p class="product-quantity">1</p>
                        <button class="plus-btn">+</button>
                    </div>
                </td>
                <td>무료</td>
                <td>\ 14,900</td>
                <td>
                    <img class="delete-product" src="../resource/images/pay/trash.png" alt="">
                </td>
            </tr>
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
                            <img src="../resource/images/1stAlbumBts.png" alt="">
                        </div>
                        <p><sub>BTS</sub><br>The 1st Album - Dark & Wild<br><sub>재고 : 0</sub></p>
                    </div>
                </td>
                <td>
                    <div class="quantity">
                        <button class="minus-btn">-</button>
                        <p class="product-quantity">1</p>
                        <button class="plus-btn">+</button>
                    </div>
                </td>
                <td>무료</td>
                <td>\ 14,900</td>
                <td>
                    <img class="delete-product" src="../resource/images/pay/trash.png" alt="">
                </td>
            </tr>
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
                <td>\ 29,800<br><sub>총 액</sub></td>
                <td>+</td>
                <td>\ 0<br><sub>배송비</sub></td>
                <td>=</td>
                <td>\ 29,800<br><sub>결제예정금액</sub></td>
                <td></td>
            </tr>
        </table>
        <div class="cart-payment">
            <button class="cart-payment-btn">결제하기</button>
        </div>
    </section>
    <script>
	 	// 삭제 아이콘 호버시, 클릭시
	    $('.delete-product').hover(function() {
	        $(this).attr('src', '../resource/images/pay/trash-red.png')
	    }, function() {
	        $(this).attr('src', '../resource/images/pay/trash.png')
	    }).click(function() {
	        $(this).parent().parent().remove();
	    })
	
	    // th 전체 체크박스 클릭시
	    $(document).on('click', 'th .jelly-checkbox input', function() {
	        if($('th .jelly-checkbox input').prop('checked')) {
	            $('td .jelly-checkbox input').prop('checked', true)
	        } else {
	            $('td .jelly-checkbox input').prop('checked', false)
	        }
	    })
	
	    // 수량 클릭시
	    let quantity = 0;
	    $('.minus-btn').click(function() {
	        quantity = parseInt($(this).siblings('.product-quantity').text());
	        if($(this).siblings('.product-quantity').text() > 1) {
	            quantity -= 1;
	            $(this).siblings('.product-quantity').text(quantity);
	        }
	    })
	    $('.plus-btn').click(function() {
	        quantity = parseInt($(this).siblings('.product-quantity').text());
	        quantity += 1;
	        $(this).siblings('.product-quantity').text(quantity);
	    })
	
	
	    // 선택상품 삭제
	    $('.delete-select-product').click(function() {
	        $('td .jelly-checkbox input:checked').parent().parent().parent().remove()
	    })
    </script>
</body>
</html>
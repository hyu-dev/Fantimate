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
    <link rel="stylesheet" href="${ contextPath }/resources/css/store/storeDetail.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Fantimate</title>
</head>
<body>
	<jsp:include page="storeInsert.jsp"/>
	<!-- 네비바 인클루드 -->
	<jsp:include page="../common/navbar.jsp"/>
	<section class="main-section">
		<section class="left-contents">
            <article class="main-photo-area">
            	<c:forEach var="attList" items="${ sc }">
            	<c:if test="${ attList.att.attMain eq 'Y' }">
                <img src="${ contextPath }/resources/uploadFiles/${ attList.att.attSvName }" alt="">
                </c:if>
                </c:forEach>
                <img class="photo-icon ddim" src="${ contextPath }/resources/icon/heart.png" alt="">
                <c:if test="${ sc.get(0).store.isView eq 'Y' }">
                <div class="is-view">
                	<c:forEach var="attList" items="${ sc }">
                	<img class="small-img" src="${ contextPath }/resources/uploadFiles/${ attList.att.attSvName }" alt="">
                	</c:forEach>
                </div>
                </c:if>
            </article>
            <article class="product-guide">
                <div class="guide">${ sc.get(0).store.info }</div>
            </article>
            <div class="sub-photo-area">
            	<c:forEach var="attList" items="${ sc }">
            	<c:if test="${ attList.att.attMain eq 'N' }">
                <article class="sub-photo">
                    <img src="${ contextPath }/resources/uploadFiles/${ attList.att.attSvName }" alt="">
                </article>
                </c:if>
                </c:forEach>
            </div>
            <div class="product-information">
                <div class="product-title">
                    <p>상세정보</p>
                    <p>포토리뷰 (6)</p>
                </div>
                <div class="product-info">
                    <table>
                        <tr> 
                            <th>제작자/원산지</th>
                            <td>${ sc.get(0).storeInfo.origin }</td>
                        </tr>
                        <tr>
                            <th>브랜드</th>
                            <td>${ sc.get(0).storeInfo.brand }</td>
                        </tr>
                        <tr>
                            <th>소비자 상담 연락처</th>
                            <td>${ sc.get(0).storeInfo.contact }</td>
                        </tr>
                        <tr>
                            <th>이용조건/기간</th>
                            <td>${ sc.get(0).storeInfo.useTerm }</td>
                        </tr>
                        <tr>
                            <th>상품제공방식</th>
                            <td>${ sc.get(0).storeInfo.offerings }</td>
                        </tr>
                        <tr>
                            <th>청약철회 / 계약의 해제</th>
                            <td>${ sc.get(0).storeInfo.cancelInfo }</td>
                        </tr>
                    </table>
                </div>
                <div class="product-review">
                    <section class="top">
                        <div class="top-review">
                            <div class="top-photo">
                                <img src="${ contextPath }/resources/images/store/1stAlbumBts.png" alt="" width="150px">
                                <img src="${ contextPath }/resources/images/store/1stAlbumBts2.png" alt="" width="150px">
                                <img src="${ contextPath }/resources/images/store/1stAlbumBts3.png" alt="" width="150px">
                            </div>
                            <div class="index-area">
                                <div class="index index1"></div>
                                <div class="index index2"></div>
                                <div class="index index3"></div>
                            </div>
                        </div>
                        <div class="top-review-content">
                            <img class="user-profile" src="${ contextPath }/resources/images/mypage/만식프로필.png" alt="" width="50px">
                            <span class="user-info">
                                <span class="top-title">울 옵빠 만나고 싶어효~!</span>
                                <span class="top-score">
                                    <img src="${ contextPath }/resources/images/store/star-pink.png" alt="" width="20px">
                                    <img src="${ contextPath }/resources/images/store/star-pink.png" alt="" width="20px">
                                    <img src="${ contextPath }/resources/images/store/star-pink.png" alt="" width="20px">
                                    <img src="${ contextPath }/resources/images/store/star-pink.png" alt="" width="20px">
                                    <img src="${ contextPath }/resources/images/store/star-gray.png" alt="" width="20px">
                                    <span class="top-user-id">at******</span>
                                    <span class="top-enroll-date">2021. 03. 06</span>
                                </span>
                            </span>
                            <div class="user-review-content">
                                BTS 오빠의 과거 앨범을 이렇게 영접하다니 넘나 좋은 것 ~~ ㅠㅠ
                            </div>
                        </div>
                    </section>

                    <section class="bottom">
                        <img class="left-move" src="${ contextPath }/resources/icon/slide-left-btn.png" alt="" width="30px">
                        <div class="bottom-review">
                            <div class="review">
                                <div class="bottom-photo">
                                    <img src="${ contextPath }/resources/images/store/1stAlbumBts3.png" alt="" width="150px">
                                </div>
                                <div class="completed-review">
                                    <div class="date-created">
                                        <span class="top-score">
                                            <img src="${ contextPath }/resources/images/store/star-pink.png" alt="" width="15px">
                                            <img src="${ contextPath }/resources/images/store/star-pink.png" alt="" width="15px">
                                            <img src="${ contextPath }/resources/images/store/star-pink.png" alt="" width="15px">
                                            <img src="${ contextPath }/resources/images/store/star-pink.png" alt="" width="15px">
                                            <img src="${ contextPath }/resources/images/store/star-gray.png" alt="" width="15px">
                                            <span class="user-id">at******</span>
                                            <span class="enroll-date">2021. 03. 07</span>
                                        </span>
                                    </div>
                                    <div class="review-content">
                                        <b>울 옵빠 만나고 싶어효!</b>
                                        <p>몇 번이나 사는지 몰라요 이번에는 제발 팬싸인회 당첨 좀ㅠㅠㅠㅠ 이렇게나 원하는데</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <img class="right-move" src="${ contextPath }/resources/icon/slide-right-btn.png" alt="" width="30px">
                    </section>
                </div>
            </div>
         </section>

		 <c:set var="price" value="${ sc.get(0).store.qprice }" />
		 <c:set var="discountPrice" value="${ sc.get(0).store.qprice * (1 - sc.get(0).store.discount/100) }"/>
         <section class="right-contents">
             <table>
                 <tr>
                     <td colspan="4">${ artiName }</td>
                 </tr>
                 <tr>
                     <td colspan="4">${ sc.get(0).store.pname }</td>
                 </tr>
                 <tr>
                     <td colspan="1">
                     <c:if test="">
                     	\ <fmt:formatNumber type="number" value="${ discountPrice }"/>
                     </c:if>
                     <c:if test="false">
                     	\ <fmt:formatNumber type="number" value="${ price }"/>
                     </c:if>
                     </td>
                     <td colspan="3">
                     	<c:if test="">
                     	<s>\ <fmt:formatNumber type="number" value="${ price }"/></s>
                     	<span>&nbsp;&nbsp; ${ sc.get(0).store.discount }% D.C.</span>
                     	</c:if>
                     </td>
                 </tr>
                 <tr>
                     <td colspan="4">
                         <div>
                             <p>${ sc.get(0).store.pname }</p>
                             <div class="quantity">
                                <button class="minus-btn">-</button>
                                <p class="product-quantity">1</p>
                                <button class="plus-btn">+</button>
                            </div>
                         </div>
                     </td>
                 </tr>
                 <tr>
                     <td colspan="2">TOTAL</td>
                     <td colspan="2">
                     	<c:if test="">
	                    	\ <fmt:formatNumber type="number" value="${ discountPrice }"/>
	                    </c:if>
	                    <c:if test="false">
	                     	\ <fmt:formatNumber type="number" value="${ price }"/>
	                    </c:if>
                     	<span>(1개)</span>
                     </td>
                 </tr>
                 <tr>
                     <td colspan="4">
                         <button>바로 구매하기</button>
                     </td>
                 </tr>
                 <tr>
                     <td colspan="2">
                         <button>찜하기</button>
                     </td>
                     <td colspan="2">
                         <button>장바구니 담기</button>
                     </td>
                 </tr>
             </table>
             <h4 class="recommand-title">추천 상품</h4>
             <div class="recommand">
                <article>
                    <div>
                        <img src="${ contextPath }/resources/images/store/btsGoods2.png" alt="">
                    </div>
                    <aside>
                        <p>BTS캐릭터 피규어 에어팟 wefwefwefwefef</p>
                        <b>\ 19,900</b>
                    </aside>
                </article>
                <article>
                    <div>
                        <img src="${ contextPath }/resources/images/store/btsGoods3.png" alt="">
                    </div>
                    <aside>
                        <p>BTS캐릭터 굿즈 페이스컬we wefwef</p>
                        <b>\ 28,900</b>
                    </aside>
                </article>
             </div>
         </section>
	</section>
	<script>
		// 왼쪽 컨텐츠 하단 버튼 클릭시
		$(".product-title p").click(function() {
		    $(".product-title p").css("color", "#E5D2D2");
		    $(this).css("color", "#5C5F78");
		    if($(this).text() == "상세정보") {
		        $(".product-info").css("display", "block");
		        $(".product-review").css("display", "none");
		    } else {
		        $(".product-info").css("display", "none");
		        $(".product-review").css("display", "block");
		    }
		})
	
		// 왼쪽 컨텐츠 포토리뷰의 메인 포토 사진 이동 버튼 클릭시
		$(".index").on('click', function() {
		    $(".index").css("background", "#fbf6f6");
		    $(this).css("background", "#5C5F78");
		    for(let i = 0; i < $(".index").length; i++) {
		        if($(this).hasClass("index" + (i+1))) {
		            $(".top-photo img").css("display", "none")
		            $(".top-photo img:nth-of-type(" + (i+1) + ")").css("display", "block")
		        }
		    }
		})
	
		// 왼쪽 컨텐츠 포토리뷰 하단의 좌로이동 클릭시
		$(".left-move").click(function() {
		    // 가장 처음에 있는 데이터가 숨겨져 있다면
		    if($(".review:nth-of-type(1)").css("display") == "none") {
		        // 이전으로 돌아가기 위해서 어디까지 숨겨져있는지 체크 후
		        // 해당 부분의 전 단계까지 block 
		        // 가장 뒤에 있는 부분을 none 처리한다
		        let i = 1;
		        for( ; i < $(".review").length; i++) {
		            if($(".review:nth-of-type(" + i + ")").css("display") == "flex") {
		                console.log(i + "번째부터 표시 됨")
		                break;
		            }
		        }
		        console.log(i);
		    } else {
	
		    }
		    console.log($(".review:nth-of-type(1)").css("display"))
		})
	
	
	
		// 오른쪽 컨텐츠 
		// 수량 클릭시
		let quantity = 0;
		// 마이너스 버튼
		$('.minus-btn').click(function() {
		    $(".right-contents tr:nth-of-type(5) td:last-of-type").text("")
		    quantity = parseInt($(this).siblings('.product-quantity').text());
		    let price = 14900;  // 임시 가격 (데이터 바인딩시 해당 금액으로)
		    if($(this).siblings('.product-quantity').text() > 1) {
		        quantity -= 1;
		        $(this).siblings('.product-quantity').text(quantity);
		    }
		    price = price * quantity;
		    let text = "\\ " + numberWithCommas(price)
		    let span = $("<span>").text(" (" + quantity +"개)");
	
		    $(".right-contents tr:nth-of-type(5) td:last-of-type").append(text, span);
		})
		// 플러스 버튼
		$('.plus-btn').click(function() {
		    $(".right-contents tr:nth-of-type(5) td:last-of-type").text("")
		    quantity = parseInt($(this).siblings('.product-quantity').text());
		    let price = 14900;  // 임시 가격 (데이터 바인딩시 해당 금액으로)
		    quantity += 1;
		    $(this).siblings('.product-quantity').text(quantity);
		    price = price * quantity;
		    let text = "\\ " + numberWithCommas(price)
		    let span = $("<span>").text(" (" + quantity +"개)");
	
		    $(".right-contents tr:nth-of-type(5) td:last-of-type").append(text, span);
		})
		// 숫자 3 단위마다 콤마찍기
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	
		// 오른쪽 컨텐츠 찜하기 버튼 클릭시
		let flag = true;
		$("tr:nth-of-type(7) td:first-of-type").click(function() {
		    if(flag == true) {
		        alert("찜목록에 등록되었습니다")
		        $(".ddim").attr("src", "${ contextPath }/resources/icon/heart-pink.png")
		        flag = false;
		    } else {
		        alert("찜목록에서 제거되었습니다")
		        $(".ddim").attr("src", "${ contextPath }/resources/icon/heart.png")
		        flag = true;
		    }
		})
	
		// 오른쪽 컨텐츠 장바구니 담기 클릭시
		$("tr:nth-of-type(7) td:last-of-type").click(function() {
		    if(confirm("장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?")) {
		        location.href = "../pay/cart.html";
		    } else {
	
		    }
		})
	
		// 오른쪽 컨텐츠 바로구매하기 클릭시
		$("tr:nth-of-type(6) td").click(function() {
		    alert("결제를 위해 장바구니페이지로 이동합니다");
		    location.href="../pay/cart.html";
		})
	
		// 추천 상품 클릭시
		$(".recommand article").click(function() {
		    console.log("추천 상품 상세페이지로 이동")
		})

	</script>
</body>
</html>
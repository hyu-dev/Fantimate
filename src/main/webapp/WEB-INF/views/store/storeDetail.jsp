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
    <script>
    	document.cookie = "crossCookie=bar; SameSite=None; Secure";
    </script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <title>Fantimate</title>
</head>
<body>  
	<c:if test="${ !empty loginUser }">
	<jsp:include page="storeInsert.jsp"/>
	<!-- 네비바 인클루드 -->
	<jsp:include page="../common/navbar.jsp"/>
	<section class="main-section">
		<section class="left-contents">
            <article class="main-photo-area">
            	<!-- 메인 사진 -->
            	<c:forEach var="attList" items="${ sc }">
	            	<c:if test="${ attList.att.attMain eq 'Y' }">
	                <img class="main-img" src="${ contextPath }/resources/uploadFiles/${ attList.att.attSvName }" alt="">
	                </c:if>
                </c:forEach>
                <!-- 찜아이콘 -->
                <c:choose>
                	<c:when test="${ wish.isWish eq 'Y' }">
	                <img class="photo-icon ddim" src="${ contextPath }/resources/icon/heart-pink.png" alt="">
	                </c:when>
	                <c:otherwise>
	                <img class="photo-icon ddim" src="${ contextPath }/resources/icon/heart.png" alt="">
	                </c:otherwise>
                </c:choose>
                <!-- 축소된 뷰 영역 -->
                <div class="is-view">
                	<c:forEach var="attList" items="${ sc }">
                	<img class="small-img" src="${ contextPath }/resources/uploadFiles/${ attList.att.attSvName }" alt="">
                	</c:forEach>
                </div>
            </article>
            <article class="product-guide">
                <div class="guide">${ sc.get(0).store.info }</div>
            </article>
            <c:if test="${ sc.get(0).store.isView eq 'Y' }">
            <div class="sub-photo-area">
            	<c:forEach var="attList" items="${ sc }">
	            	<c:if test="${ attList.att.attMain eq 'N' }">
	                <article class="sub-photo">
	                    <img src="${ contextPath }/resources/uploadFiles/${ attList.att.attSvName }" alt="">
	                </article>
	                </c:if>
                </c:forEach>
            </div>
            </c:if>
            <div class="product-information">
                <div class="product-title">
                    <p>상세정보</p>
                    <p id="reviewBtn">포토리뷰 (6)</p>
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
                <c:if test="${ empty review }">
                	<div class="product-review">
                		<div class="empty-review">등록 된 리뷰가 없습니다</div>
                	</div>
                </c:if>
                <c:if test="${ !empty review }">
                <div class="product-review">
                    <section class="top">
                        <div class="top-review">
                            <div class="top-photo">
                            	<c:forEach var="i" begin="0" end="${ review.size() - 1 }" step="1">
                        		<c:if test="${ review.get(0).review.id eq review.get(i).review.id }">
                            		<img src="${ contextPath }/resources/uploadFiles/${ review.get(i).attReview.attSvName }" alt="" width="150px">
                            	</c:if>
                            	</c:forEach>
                            </div>
                            <div class="index-area">
                            	<c:forEach var="r" items="${ review }" varStatus="state">
                                <div class="index index${ state.index + 1 }"></div>
                                </c:forEach>
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
                </c:if>
            </div>
         </section>
		 
		 
		 <!-- 오른쪽 영역 -->
		 <c:set var="price" value="${ sc.get(0).store.qprice }" />
		 <c:set var="discountPrice" value="${ sc.get(0).store.qprice * (1 - sc.get(0).store.discount/100) }"/>
         <section class="right-contents">
             <table>
             	 <colgroup>
             	 	<col width="25%">
             	 	<col width="25%">
             	 	<col width="25%">
             	 	<col width="25%">
             	 </colgroup>
                 <tr>
                     <td colspan="3">${ artiName }</td>
                     <td colspan="1"><a href="${ contextPath }/store/storeList">목록으로</a></td>
                 </tr>
                 <tr>
                     <td colspan="4">${ sc.get(0).store.pname }</td>
                 </tr>
                 <tr>
                     <td colspan="1">
                     <c:choose>
	                     <c:when test="${ user.isMembership eq 'Y' }">
	                     	\ <fmt:formatNumber type="number" value="${ discountPrice }"/>
	                     </c:when>
	                     <c:otherwise>
	                     	\ <fmt:formatNumber type="number" value="${ price }"/>
	                     </c:otherwise>
                     </c:choose>
                     </td>
                     <td colspan="3">
                     	<s>\ <fmt:formatNumber type="number" value="${ price }"/></s>
                     	<span>
                     		&nbsp;&nbsp; ${ sc.get(0).store.discount }% D.C.
                     		<c:if test="${ user.isMembership ne 'Y' }">
                     		(멤버십전용 : \ <fmt:formatNumber type="number" value="${ discountPrice }"/>)
                     		</c:if>
                     	</span>
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
                     	<c:choose>
	                     	<c:when test="${ user.isMembership eq 'Y' }">
		                    	\ <fmt:formatNumber type="number" value="${ discountPrice }"/>
		                    </c:when>
		                    <c:otherwise>
		                     	\ <fmt:formatNumber type="number" value="${ price }"/>
		                    </c:otherwise>
                     	</c:choose>
                     	<span>(1개)</span>
                     </td>
                 </tr>
                 <tr>
                     <td colspan="4">
                     	<c:if test="${ loginUser.classifyMem eq 1 }">
                        <button class="buy">바로 구매하기</button>
                        </c:if>
                        <c:if test="${ loginUser.classifyMem eq 2 }">
                        <button class="update-store">수정하기</button>
                        </c:if>
                     </td>
                 </tr>
                 <tr>
                 	 <c:if test="${ loginUser.classifyMem eq 1 }">
                     <td colspan="2">
                   	 <c:choose>
                    	<c:when test="${ wish.isWish eq 'Y' }">
                        <button class="enroll-wish-btn">찜등록해제</button>
                        </c:when>
                        <c:otherwise>
                        <button class="enroll-wish-btn">찜등록</button>
                        </c:otherwise>
                   	 </c:choose>
                     </td>
                     <td colspan="2">
                         <button class="insert-cart">장바구니 담기</button>
                     </td>
                     </c:if>
                 </tr>
             </table>
             <h4 class="recommand-title">추천 상품</h4>
             <div class="recommand">
             	<c:forEach var="recmd" items="${ recmd }" varStatus="status">
             	<c:if test="${ status.index < 2 && recmd.store.pcode != sc.get(0).store.pcode }">
                <article>
                	<input type="hidden" value="${ recmd.store.pcode }">
                    <div>
                        <img src="${ contextPath }/resources/uploadFiles/${ recmd.att.attSvName }" alt="">
                    </div>
                    <aside>
                        <p>${ recmd.store.pname }</p>
                        <b>\ <fmt:formatNumber type="number" value="${ recmd.store.qprice }"/></b>
                    </aside>
                </article>
                </c:if>
                </c:forEach>
             </div>
         </section>
	</section>
	
	<!-- 스크립트 -->
	<script>
		// 왼쪽 컨텐츠 메인 사진의 작은 사진 클릭시
		$(".small-img").click(function() {
			var url = $(this).attr("src");
			$(".main-img").attr("src", url);
		});
		
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
		let quantity = 0;
		let price = 0;
		let memberShip = '';
		// 수량 클릭시
		$(function() {
			memberShip = "${ user.isMembership }";
		    memberShip == "Y" ? price = "${ discountPrice }" : price = "${ price }";
		});
		// 마이너스 버튼
		$('.minus-btn').click(function() {
		    $(".right-contents tr:nth-of-type(5) td:last-of-type").text("")
		    quantity = parseInt($(this).siblings('.product-quantity').text());
		    let memberShip = "${ user.isMembership }";
		    memberShip == "Y" ? price = "${ discountPrice }" : price = "${ price }";
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
		    let memberShip = "${ user.isMembership }";
		    memberShip == "Y" ? price = "${ discountPrice }" : price = "${ price }";
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
		$(".enroll-wish-btn").click(function() {
		    if($(".enroll-wish-btn").text() == "찜등록") {
		    	location.href="${contextPath}/store/enroll/wish";
		        alert("찜목록에 등록되었습니다")
		        $(".enroll-wish-btn").text("찜등록해제");
		    } else {
		    	location.href="${contextPath}/store/cancel/wish";
		        alert("찜목록에서 제거되었습니다")
		        $(".enroll-wish-btn").text("찜등록");
		    }
		})
	
		// 오른쪽 컨텐츠 장바구니 담기 클릭시
		$(".insert-cart").click(function() {
			var salesQ = $(".product-quantity").text();
			location.href="${contextPath}/store/insert/cart?salesQ=" + salesQ + "&price=" + price;
		    if(confirm("장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?")) {
		        location.href = "${contextPath}/pay/cart";
		    }
		})
	
		// 오른쪽 컨텐츠 바로구매하기 클릭시
		$(".buy").click(function() {
		    // 결제 API 호출
		    console.log("결제 API 호출")
		})
	
		// 추천 상품 클릭시
		$(".recommand article").click(function() {
			var pcode = $(this).children("input").val();
			location.href='${ contextPath }/store/detail?pcode=' + pcode;
		})
		
		// 수정하기 버튼 클릭시
		$(".update-store").click(function() {
			$(".main-template").css("display", "block");
			$(".insert-section").css("display", "block");
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
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
    <link rel="stylesheet" href="${ contextPath }/resources/css/store/fanStoreDetail.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Fantimate</title>
</head>
<body>
	<!-- 네비바 인클루드 -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	<section class="main-section">
         <section class="left-contents">
            <article class="main-photo">
                <img src="${ contextPath }/resources/images/store/1stAlbumBts.png" alt="">
                <img class="photo-icon" src="${ contextPath }/resources/icon/slide-left-btn.png" alt="">
                <img class="photo-icon" src="${ contextPath }/resources/icon/slide-right-btn.png" alt="">
                <img class="photo-icon ddim" src="${ contextPath }/resources/icon/heart.png" alt="">
            </article>
            <article class="product-guide">
                <div class="product-title">
                    <p>상품소개</p>
                    <p>[연락] 쪽지 / [거래] 직거래</p>
                </div>
                <div class="guide-text">
                    무슨 말이든 작성해보아요~
                    <br>이렇게 저렇게~~
                    <br>이렇게
                    <br>저렇게
                    <br>ㅎㅎㅎ
                </div>
            </article>
         </section>


         <section class="right-contents">
             <table>
                 <tr>
                     <td colspan="4">경기도 광주시 목현리</td>
                 </tr>
                 <tr>
                     <td colspan="4">The 1st Album - Dark & Wild</td>
                 </tr>
                 <tr>
                    <td colspan="4">
                        <ul>
                            <li>앨범wefwefwe</li>
                            <li>BTSwe</li>
                            <li>정규</li>
                            <li>유물we</li>
                            <li>검정wefw</li>
                        </ul>
                    </td>
                 </tr>
                 <tr>
                     <td colspan="2">OFFER PRICE</td>
                     <td colspan="2">\ 14,900</td>
                 </tr>
                 <tr>
                     <td colspan="4">
                         <button>쪽지 보내기</button>
                     </td>
                 </tr>
                 <tr>
                     <td colspan="2">
                         <button>찜하기</button>
                     </td>
                     <td colspan="2">
                         <button>신고하기</button>
                     </td>
                 </tr>
             </table>
             <h4 class="reply">댓글(2) <span><img src="${ contextPath }/resources/icon/hand-point-left-solid.svg" alt="" width="25px"></span></h4>
             <div class="reply-area">
                 <div class="reply-list">
                    <ul>
                        <li>
                            <div>
                                <img class="user-profile" src="${ contextPath }/resources/images/mypage/만식프로필.png" alt="">
                                <span>bt******* 님이 댓글을 남겼습니다</span>
                            </div>
                            <span>2021. 03. 01</span>
                        </li>
                    </ul>
                 </div>
                 <div class="reply-content">
                     <div class="content-view">
                         <article>
                             <img class="user-profile" src="${ contextPath }/resources/images/mypage/만식프로필.png" alt="">
                             <div class="text-content">bt******* 님이 댓글을 남겼습니다 bt******* 님이 댓글을 남겼습니다
                                 bt******* 님이 댓글을 남겼습니다
                                 bt******* 님이 댓글을 남겼습니다
                                 bt******* 님이 댓글을 남겼습니다
                                 bt******* 님이 댓글을 남겼습니다
                             </div>
                             <span class="text-write-date">2021. 03. 01</span>
                             <div class="controller">
                                 <img src="${ contextPath }/resources/icon/dot.png" alt="">
                             </div>
                             <div class="reply-controller">
                                 <div class="reply-controll">쪽지보내기</div>
                                 <div class="reply-controll">신고하기</div>
                                 <div class="reply-controll">삭제하기</div>
                             </div>
                         </article>
                     </div>
                    <form class="reply-write">
                       <img class="user-profile" src="${ contextPath }/resources/images/mypage/만식프로필.png" alt="">
                       <textarea name="replyContent"></textarea>
                       <img src="${ contextPath }/resources/icon/send.png" alt="">
                    </form>
                 </div>
             </div>
         </section>
    </section>
    <script>
	 	// 댓글 내용에 마우스 호버시
	    $(".content-view article").hover(function() {
	        console.log('호버함')
	        $(this).children(".controller").css("display", "flex")
	    }, function() {
	        $(this).children(".controller").css("display", "none")
	    })
	
	    // 댓글 컨트롤러 클릭시
	    $(".controller").on('click', function() {
	    	if($(this).next().css("display") == "block") {
	    		$(this).next().css("display", "none")
	    	} else {
	    		$(this).next().css("display", "block")
	    	}
	    })
	
	    // 댓글 리스트 중 하나 클릭시
	    $(".reply-list").on('click', function() {
	        $(this).css("display", "none")
	        $(".reply-content").css("display", "flex")
	    })
	    
	    // 오른쪽 컨텐츠 찜하기 버튼 클릭시
		let flag = true;
		$("tr:nth-of-type(6) td:first-of-type").click(function() {
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

    </script>
</body>
</html>
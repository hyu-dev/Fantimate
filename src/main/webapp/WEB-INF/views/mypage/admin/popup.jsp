<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/font.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<%--     <link rel="stylesheet" href="${ contextPath }/resources/css/common/navbar.css"> --%>
    <link rel="stylesheet" href="${ contextPath }/resources/css/mypage/jw.css">
<%--     <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png"> --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>insertAgency</title>
<style>

		/* 전체 감싸는 부분 */
		/* #popwarp {
			margin: 0;
			height: 100%;
			overflow: hidden;
		} */

		/* 팝업 wrapDiv */
		#pop {
			position: absolute;
			z-index: 1;
			top: 0;
			width: 100%;
			height: 100%;
			display: none;
		}

		/* 팝업 구성 */
		#pop>article {
			width: 700px;
			height: 400px;
			position: relative;
			z-index: 2;
			background: gold;
			box-shadow: 3px 3px 5px black;
			margin: auto;
			cursor: pointer;
		}

		/* 밑에 섹션 */
		#list {
			width: 800px;
			height: 500px;
			background: pink;
			margin: auto;
		}

		/* 추가할 클래스(배경색) */
		.black {
			background: rgba(0, 0, 0, 0.6);
		}
</style>
</head>
<body>
	<div id="popwrap">

		<!-- 주석부분 -->
		<div id="pop">
			<article>
				<h1>큰이미지</h1>
			</article>
		</div>

		<!--원래부분-->
		<section id="list">
			<h1>컨텐츠영역</h1>
			<button>큰이미지 보기!</button>
		</section>
	</div>

	<script>
		$(document).ready(
			function() {
				// 팝업띄우기
				$("#mypageAdminMenuDiv > ul > li > a").text('소속사등록하기').click(function() { //버튼 클릭했을떄
					$("#pop").fadeIn();
					$("#pop").addClass("black"); // 페이드인하고, 클래스 추가
				});

// 				$(".mypage-Btn-align-center > .mypage-pop-Btn-navi").text(
// 						'취소하기').click(function() { //버튼 클릭했을떄
// 					$(this).parent().fadeOut(); // 페이드인하고, 클래스 추가
// 				});
// 				$("")
// 				$("#pop>article").click(function() { // article
// 					$(this).parent().fadeOut();
// 				});
			});
	</script>
</body>
</html>
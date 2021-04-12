<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <script src="${pageContext.request.contextPath}/resources/css/mypage/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/mypage/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/summernote/summernote-lite.css">
  <script>var summernote = jQuery.noConflict();</script>
<title>admin notice Write</title>
</head>
<body>
	<!-- 네비바 -->
	<jsp:include page="../../common/navbar.jsp"></jsp:include>
	
	<!--소속사 정보 등록창 -->
	<jsp:include page="insertAgency.jsp"/>
	
    <!-- 밑에 섹션 -->
    <section id="mypageAdminSection">
    
        <!-- 왼쪽메뉴 -->
        <article id="mypageAdminMenu">
        	<jsp:include page="adminMenu.jsp"/>
        </article>


               <!-- 오른쪽 테이블 -->
		<article id="mypageContent">
			<h3 id="mypageContentTitle">공지사항 수정</h3>
			<div id="NoticeDetailWrap">

				<form method="post" action="${ contextPath }/notice/update">
					<div id="mypageContentTitleWrap">
						<input type="text" name="ntitle" id="NoticeDetailTitle" placeholder="제목" value="${ notice.ntitle }"></input>
						<select name="rlevel" id="rlevelSelect">
							<option value="0" <c:if test="${ notice.rlevel eq 0 }">selected</c:if>>전체공개</option>
							<option value="1" <c:if test="${ notice.rlevel eq 1 }">selected</c:if>>회원만공개</option>
							<option value="2" <c:if test="${ notice.rlevel eq 2 }">selected</c:if>>아티스트공개</option>
							<option value="3" <c:if test="${ notice.rlevel eq 3 }">selected</c:if>>소속사공개</option>
							<option value="4" <c:if test="${ notice.rlevel eq 4 }">selected</c:if>>관리자만보기</option>
						</select>
						<input type="hidden" name="id" value="${ loginUser.id }">
					</div>


					<div id="NoticeDetailContent">
						<div class="container">
							<textarea class="summernote" name="ncontent">${ notice.ncontent }</textarea>
						</div>
					</div>
					<input type="hidden" name="nid" value="${ notice.nid }">
					<div class="mypage-Btn-align-right">
						<button type="button" onclick="location.href='${ contextPath }/notice/list?page=${ param.page }'">취소하기</button>
						<button onclick="return noticeWrite(this.form)">수정하기</button>
					</div>
				</form>
			</div>
		</article>
	</section>
    
    
<!-- 섬머노트     -->
	<script type="text/javascript">
		summernote(function() {

			summernote('.summernote').summernote({
				minHeight : 370,
				maxHeight : null,
				focus : true,
				lang : "ko-KR"
			});
		});
		
		
		function noticeWrite(frm) {
			var title = frm.ntitle.value;
			var content = frm.ncontent.value;
			
			if (title.trim() == ''){
				alert("제목을 입력해주세요");
				return false;
			}
			if (content.trim() == ''){
				alert("내용을 입력해주세요");
				return false;
			}
			frm.submit();
		}
	</script>
</body>
</html>
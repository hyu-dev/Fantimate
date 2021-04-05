<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/official/scheduleMain.css"">
</head>
<body>
	<!-- 네비바 인클루드 -->
	<jsp:include page="../../common/navbar.jsp"/>
	
	<!-- 본문 시작 -->
    <section class="main-section">

        <!-- 왼쪽(카테고리) 인클루드 -->
		<jsp:include page="../../common/category.jsp"/>
		
        <!-- 중간 -->
        <section class="main-contents">
            <div class="calendar-date">
                <span class="month-direct">&lt;</span>
                <span>2021</span>&nbsp;
                <span>January</span>
                <span class="month-direct">&gt;</span>
            </div>
            <table class="calendar-main">
                <colgroup>
                    <col width="14.28%"/>
                    <col width="14.28%"/>
                    <col width="14.28%"/>
                    <col width="14.28%"/>
                    <col width="14.28%"/>
                    <col width="14.28%"/>
                    <col width="14.28%"/>
                </colgroup>
                <tr>
                    <td style="color: red;">일</td>
                    <td>월</td>
                    <td>화</td>
                    <td>수</td>
                    <td>목</td>
                    <td>금</td>
                    <td>토</td>
                </tr>
                <tr>
                    <!-- <td><div>1</div><img class="day-check" src="../resource/mypage-artist/tick.svg"></td> -->
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
            <div class="detail-schedule">
                <div class="detail-date nanumsquare">2021.01.25 토요일</div>
                <hr>
                <textarea class="detail-content nanumsquare" style="resize:none;" readonly>14:00 - 두시의 데이트 (정국, 뷔, 지민)</textarea>
                <span class="plus-btn nanumsquare">+</span>
                <span class="minus-btn nanumsquare">-</span>
            </div>
        </section>


        <!-- 오른쪽 -->
        <aside class="main-contents-right">
            <div class="toggle-area">
                <div class="toggle-switch" tabindex="0">
                    <input type="checkbox" name="my_checkbox" value="yes" id="checkbox-id" />
                    <label for="checkbox-id">
                      <div class="area" aria-hidden="true">
                        <div class="background">
                            <div class="handle"></div>
                        </div>
                        <p>스케줄</p>
                      </div>
                    </label>
                </div>
            </div>
        </aside>
        
        <script>
        // 해당 페이지에 대한 카테고리 색상 변경
		$(document).ready(function() {
		    $(".category a").eq(2).css("color", "#5C5F78");
		});
        
		// 스케줄 페이지에 검색창 숨김처리하기
		$('.category a').click(function() {
			if($(this).text() == 'OFFICIAL') {
				$(".contents-search").css("display", "none")
			}
		});
        
		// 토글 스위치 클릭할 때 미디어 메인페이지로 이동
	    $(".toggle-switch").click(function () {
		    location.href="${ contextPath }/official/media/main";
		});
	    </script>
   </section>
   <!-- 본문 끝 -->
</body>
</html>
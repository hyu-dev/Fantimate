<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/official/scheduleMain.css">
</head>
<body>
	<!-- 스케줄 작성폼 영역 -->
	<section class="writing-form-container">
        <div class="black-back"></div>
        <form class="schedule-writing-form" action="" method="">
            <span class="schedule-enroll nanumsquare">스케줄 등록</span>
            <hr>
            <table class="schedule-writing nanumsquare">
                <colgroup>
                    <col width="15%"/>
                    <col width="85%"/>
                </colgroup>
                <tr>
                    <td style="text-align: right;">날짜&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>2021.01.07</td>
                </tr>
                <tr>
                    <td style="text-align: right; vertical-align: top;">상세 내용&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        <textarea class="schedule-content nanumsquare" placeholder="스케쥴을 입력해주세요." style="resize:none;"></textarea>
                    </td>
                </tr>
            </table>
            <br>
            <div class="btn-area">
                <button id="enrollBtn" class="nanumsquare">등록하기</button>&nbsp;&nbsp;
                <button id="cancelBtn" class="nanumsquare" type="button">취소하기</button>
            </div>
        </form>
    </section>

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
                <span>April</span>
                <span class="month-direct">&gt;</span>
            </div>
            <table class="calendar-main nanumsquare">
                <colgroup>
                    <col width="14.28%"/>
                    <col width="14.28%"/>
                    <col width="14.28%"/>
                    <col width="14.28%"/>
                    <col width="14.28%"/>
                    <col width="14.28%"/>
                    <col width="14.28%"/>
                </colgroup>
                <tr height="40">
                    <td style="color: red;">일</td>
                    <td>월</td>
                    <td>화</td>
                    <td>수</td>
                    <td>목</td>
                    <td>금</td>
                    <td>토</td>
                </tr>
                <tr height="80">
                    <td><div class="calendar-num">28</div></td>
                    <td><div class="calendar-num">29</div></td>
                    <td><div class="calendar-num">30</div></td>
                    <td><div class="calendar-num">31</div></td>
                    <td><div class="calendar-num">1</div></td>
                    <td><div class="calendar-num">2</div></td>
                    <td><div class="calendar-num">3</div></td>
                </tr>
                <tr height="80">
                    <td><div class="calendar-num">4</div></td>
                    <td><div class="calendar-num">5</div></td>
                    <td><div class="calendar-num">6</div></td>
                    <td><div class="calendar-num">7</div></td>
                    <td><div class="calendar-num">8</div></td>
                    <td><div class="calendar-num">9</div></td>
                    <td><div class="calendar-num">10</div></td>
                </tr>
                <tr height="80">
                    <td><div class="calendar-num">11</div></td>
                    <td><div class="calendar-num">12</div></td>
                    <td><div class="calendar-num">13</div></td>
                    <td><div class="calendar-num">14</div><div class="schedule-on">schedule</div></td>
                    <td><div class="calendar-num">15</div></td>
                    <td><div class="calendar-num">16</div></td>
                    <td><div class="calendar-num">17</div></td>
                </tr>
                <tr height="80">
                    <td><div class="calendar-num">18</div></td>
                    <td><div class="calendar-num">19</div></td>
                    <td><div class="calendar-num">20</div></td>
                    <td><div class="calendar-num">21</div></td>
                    <td><div class="calendar-num">22</div></td>
                    <td><div class="calendar-num">23</div><div class="schedule-on">schedule</div></td>
                    <td><div class="calendar-num">24</div></td>
                </tr>
                <tr height="80">
                    <td><div class="calendar-num">25</div></td>
                    <td><div class="calendar-num">26</div></td>
                    <td><div class="calendar-num">27</div></td>
                    <td><div class="calendar-num">28</div></td>
                    <td><div class="calendar-num">29</div></td>
                    <td><div class="calendar-num">30</div></td>
                    <td><div class="calendar-num">31</div></td>
                </tr>
            </table>
            <div class="detail-schedule">
                <div class="detail-date nanumsquare">2021.04.23 금요일</div>
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
				$(".contents-search").css("display", "none");
			}
		});
        
		// 토글 스위치 클릭할 때 미디어 메인페이지로 이동
	    $(".toggle-switch").click(function() {
		    location.href="${ contextPath }/official/media/main";
		});
		
		// +버튼 눌렀을 때 스케줄 작성폼 오픈
		$(".plus-btn").click(function() {
		    $(".writing-form-container").css("display", "block");
		});
		
		// 스케줄 작성폼 '등록하기' 버튼 클릭했을 때 작성폼 닫기
		$("#enrollBtn").click(function() {
			alert("스케줄이 등록되었습니다.");
			
			/* newSchedule = $(".schedule-content").val();			
			$(".detail-content").text(newSchedule); */
		});
		
		// 스케줄 작성폼 '취소하기' 버튼 클릭했을 때 작성폼 닫기
		$("#cancelBtn").click(function() {
			if(confirm("스케줄 등록을 취소하시겠습니까?")) {
				$(".writing-form-container").css("display", "none");
            }
		});
		
		// -버튼 눌렀을 때 확인창 표시
		$(".minus-btn").click(function() {
			if(confirm("스케줄 등록을 취소하시겠습니까?")) {
				$(".detail-content").text("");
            }
		});
	    </script>
   </section>
   <!-- 본문 끝 -->
</body>
</html>
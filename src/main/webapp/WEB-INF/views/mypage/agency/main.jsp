<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/mypage/agency/comment.css">
</head>
<body>
	<!-- 스토어 관리 팝업 -->
    <section class="store-form-container">
        <div class="black-back"></div>
        <div class="store-admin-form">
            <span class="pop-up-text nanumsquare">스토어 관리</span>
            <br><br>
            <div class="choose-artist nanumsquare">아티스트를 선택하세요</div>
            <br>
            <div class="select-area">
                <select class="artist-category">
                    <option>검색</option>
                    <option>BTS</option>
                    <option>아이유</option>
                </select>
                <br><br><br>
                <button id="storeAdminBtn" class="nanumsquare" type="button">확인</button>
            </div>
        </div>
    </section>
    
	<!-- 네비바 인클루드 -->
	<jsp:include page="../../common/navbar.jsp"/>
	
	<!-- 아티스트 프로필 인클루드 -->
	<jsp:include page="profile.jsp"/>
	
	<!-- 본문 시작 -->
	
	<!-- 메인 -->
	<section class="main-section">
        <div class="artist-list-container">
            <div class="artist-list">
                <p class="list-title nanumsquare">My Artist List (solo)</p>
                <hr class="list-line">
                <div class="list-box">
                    <table class="solo-list nanumsquare">
                        <tbody>
                            <tr>
                                <td><span>SUNMY</span></td>
                            </tr>
                            <tr>
                                <td><span>HENRY</span></td>
                            </tr>
                            <tr>
                                <td><span>CL</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <span class="artist-plus nanumsquare">+</span>
                <span class="artist-minus nanumsquare">-</span>
            </div>
            <div class="artist-list">
                <p class="list-title nanumsquare">My Artist List (group)</p>
                <hr class="list-line">
                <div class="list-box">
                    <table class="group-list nanumsquare">
                        <tbody>
                            <tr>
                                <td>
                                    <span>BTS</span>
                                    <table class="group-member nanumsquare">
                                        <tbody>
                                            <colgroup>
                                                <col width="7%"/>
                                                <col width="93%"/>
                                            </colgroup>
                                            <tr>
                                                <td>┕</td>
                                                <td><span>RM</span></td>
                                            </tr>
                                            <tr>
                                                <td>┕</td>
                                                <td><span>뷔</span></td>
                                            </tr>
                                            <tr>
                                                <td>┕</td>
                                                <td><span>슈가</span></td>
                                            </tr>
                                            <tr>
                                                <td>┕</td>
                                                <td><span>정국</span></td>
                                            </tr>
                                            <tr>
                                                <td>┕</td>
                                                <td><span>제이홉</span></td>
                                            </tr>
                                            <tr>
                                                <td>┕</td>
                                                <td><span>지민</span></td>
                                            </tr>
                                            <tr>
                                                <td>┕</td>
                                                <td><span>진</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>TXT</span>
                                    <table class="group-member nanumsquare">
                                        <tbody>
                                            <colgroup>
                                                <col width="7%"/>
                                                <col width="93%"/>
                                            </colgroup>
                                            <tr>
                                                <td>┕</td>
                                                <td><span>범규</span></td>
                                            </tr>
                                            <tr>
                                                <td>┕</td>
                                                <td><span>수빈</span></td>
                                            </tr>
                                            <tr>
                                                <td>┕</td>
                                                <td><span>연준</span></td>
                                            </tr>
                                            <tr>
                                                <td>┕</td>
                                                <td><span>태현</span></td>
                                            </tr>
                                            <tr>
                                                <td>┕</td>
                                                <td><span>휴닝카이</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <span class="artist-plus nanumsquare">+</span>
                <span class="artist-minus nanumsquare">-</span>
            </div>
        </div>
    </section>
	<!-- 본문 끝 -->
	
    <script type="text/javascript">
    $("#storeBtn").click(function() {
    	location.href="${ contextPath }/mypage/agency/store?artist=" + ;
    })
    </script>
</body>
</html>
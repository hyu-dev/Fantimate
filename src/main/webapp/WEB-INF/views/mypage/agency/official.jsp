<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/mypage/agency/official.css">
</head>
<body>
	<!-- 네비바 인클루드 -->
	<jsp:include page="../../common/navbar.jsp"/>
	
	<!-- 아티스트 프로필 인클루드 -->
	<jsp:include page="profile.jsp"/>
	
	<!-- 본문 시작 -->
	
	<!-- 메인 -->
    <section class="main-section">
        <div class="official-list-container">
            <p class="list-title nanumsquare">My Official List</p>
            <hr class="list-line">
            <table class="official-list nanumsquare">
                <tbody>
                    <colgroup>
                        <col width="6%"/>
                        <col width="20%"/>
                        <col width="54%"/>
                        <col width="10%"/>
                    </colgroup>
                    <tr>
                        <td>글번호</td>
                        <td>
                            <select class="category-box nanumsquare" name="category">
                                <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;카테고리</option>
                                <option value="앨범">앨범</option>
                                <option value="굿즈">굿즈</option>
                                <option value="티켓">티켓</option>
                                <option value="포토">포토</option>
                            </select>
                        </td>
                        <td id="itemName">미디어명</td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <hr class="list-line">
            <div class="list-box">
                <table class="official-list nanumsquare">
                    <tbody>
                        <colgroup>
                            <col width="6%"/>
                            <col width="20%"/>
                            <col width="54%"/>
                            <col width="10%"/>
                        </colgroup>
                        <tr>
                            <td>1</td>
                            <td>BREAK THE SILENCE</td>
                            <td>The 1st Album - Dark & Wild</td>
                            <td><button type="button" class="official-link-Btn">이동하기</button></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>BREAK THE SILENCE</td>
                            <td>The 1st Album - Dark & Wild</td>
                            <td><button type="button" class="official-link-Btn">이동하기</button></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>BREAK THE SILENCE</td>
                            <td>The 1st Album - Dark & Wild</td>
                            <td><button type="button" class="official-link-Btn">이동하기</button></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>BREAK THE SILENCE</td>
                            <td>The 1st Album - Dark & Wild</td>
                            <td><button type="button" class="official-link-Btn">이동하기</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="search-area">
                <input type="search" class="contents-search-input">
                <img src="../../resource/icon/search-icon.svg" class="search-icon" alt="">
                <span class="official-plus nanumsquare">+</span>
                <span class="official-minus nanumsquare">-</span>
            </div>
        </div>
    </section>
	
	<!-- 본문 끝 -->
</body>
</html>
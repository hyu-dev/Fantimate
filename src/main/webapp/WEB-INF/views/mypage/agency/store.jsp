<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/mypage/agency/store.css">
</head>
<body>
	<!-- 네비바 인클루드 -->
	<jsp:include page="../../common/navbar.jsp"/>
	
	<!-- 아티스트 프로필 인클루드 -->
	<jsp:include page="profile.jsp"/>
	
	<!-- 본문 시작 -->
	
	<!-- 메인 -->
    <section class="main-section">
        <div class="store-list-container">
            <p class="list-title nanumsquare">My Store List</p>
            <hr class="list-line">
            <table class="store-list nanumsquare">
                <tbody>
                    <colgroup>
                        <col width="7%"/>
                        <col width="10%"/>
                        <col width="63%"/>
                        <col width="10%"/>
                        <col width="10%"/>
                    </colgroup>
                    <tr>
                        <td>글번호</td>
                        <td>
                            <select class="category-box nanumsquare" name="category">
                                <option value="">카테고리</option>
                                <option value="앨범">앨범</option>
                                <option value="굿즈">굿즈</option>
                                <option value="티켓">티켓</option>
                                <option value="포토">포토</option>
                            </select>
                        </td>
                        <td id="itemName">상품명</td>
                        <td>품절 여부</td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <hr class="list-line">
            <div class="list-box">
                <table class="store-list nanumsquare">
                    <tbody>
                        <colgroup>
                            <col width="7%"/>
                            <col width="10%"/>
                            <col width="63%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                        </colgroup>
                        <tr>
                            <td>1</td>
                            <td>앨범</td>
                            <td>The 1st Album - Dark & Wild</td>
                            <td></td>
                            <td><button type="button" class="store-link-Btn">이동하기</button></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>굿즈</td>
                            <td>The 1st Album - Dark & Wild</td>
                            <td>품절</td>
                            <td><button type="button" class="store-link-Btn">이동하기</button></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>티켓</td>
                            <td>The 1st Album - Dark & Wild</td>
                            <td></td>
                            <td><button type="button" class="store-link-Btn">이동하기</button></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>포토</td>
                            <td>The 1st Album - Dark & Wild</td>
                            <td>품절</td>
                            <td><button type="button" class="store-link-Btn">이동하기</button></td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>티켓</td>
                            <td>The 1st Album - Dark & Wild</td>
                            <td></td>
                            <td><button type="button" class="store-link-Btn">이동하기</button></td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>앨범</td>
                            <td>The 1st Album - Dark & Wild</td>
                            <td></td>
                            <td><button type="button" class="store-link-Btn">이동하기</button></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>굿즈</td>
                            <td>The 1st Album - Dark & Wild</td>
                            <td>품절</td>
                            <td><button type="button" class="store-link-Btn">이동하기</button></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>티켓</td>
                            <td>The 1st Album - Dark & Wild</td>
                            <td></td>
                            <td><button type="button" class="store-link-Btn">이동하기</button></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>포토</td>
                            <td>The 1st Album - Dark & Wild</td>
                            <td>품절</td>
                            <td><button type="button" class="store-link-Btn">이동하기</button></td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>티켓</td>
                            <td>The 1st Album - Dark & Wild</td>
                            <td></td>
                            <td><button type="button" class="store-link-Btn">이동하기</button></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>포토</td>
                            <td>The 1st Album - Dark & Wild</td>
                            <td>품절</td>
                            <td><button type="button" class="store-link-Btn">이동하기</button></td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>티켓</td>
                            <td>The 1st Album - Dark & Wild</td>
                            <td></td>
                            <td><button type="button" class="store-link-Btn">이동하기</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="search-area">
                <input type="search" class="contents-search-input">
                <img src="../../resource/icon/search-icon.svg" class="search-icon" alt="">
                <span class="store-plus nanumsquare">+</span>
                <span class="store-minus nanumsquare">-</span>
            </div>
        </div>
    </section>
	<!-- 본문 끝 -->
</body>
</html>
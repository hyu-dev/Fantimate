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
    <link rel="stylesheet" href="${ contextPath }/resources/css/account/join.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${ contextPath }/resources/icon/faviconF.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>회원가입</title>
     <script type="text/javascript">
 
        function firstStep(){
            if($('.firstStep-section').css('display') == 'none'){
                $('.firstStep-section').show();
            }else{
                $('.firstStep-section').hide();
                $('.secondStep-section').show();
            }
        }

        function secondStep(){
            if($('.secondStep-section').css('display') == 'none'){
                $('.secondStep-section').show();
            }else{
                $('.secondStep-section').hide();
                $('.thirdStep-section').show();
            }
        }

        function thirdStep(){
            if($('.thirdStep-section').css('display') == 'none'){
                $('.thirdStep-section').show();
            }else{
                $('.thirdStep-section').hide();
                $('.fourthStep-section').show();
            }
        }

        function fourthStep(){
            if($('.fourthStep-section').css('display') == 'none'){
                $('.fourthStep-section').show();
            }else{
                $('.fourthStep-section').hide();
                $('.fifthStep-section').show();
            }
        }

        function fifthStep(){
            if($('.fifthStep-section').css('display') == 'none'){
                $('.fifthStep-section').show();
            }else{
                $('.fifthStep-section').hide();
                $('.sixthStep-section').show();
            }
        }

        // 관심 아티스트 3개 선택 
        function selectArtist(e){

            const value = e.value;

            if(document.getElementById("artistOne").innerText == ""){
                $("#favArtists option:selected").attr("selected", "selected");
                document.getElementById("artistOne").innerText = value;
                
            } else if(document.getElementById("artistOne").innerText != "" && document.getElementById("artistTwo").innerText == "") {
                $("#favArtists option:selected").attr("selected", "selected");
                document.getElementById("artistTwo").innerText = value;
            } else if(document.getElementById("artistTwo").innerText != "" && document.getElementById("artistOne").innerText != ""){
                if($("#favArtists option[selected=selected]").length == 2){
                    $("#favArtists option:selected").attr("selected", "selected");
                    document.getElementById("artistThree").innerText = value;
                } else if($("#favArtists option[selected=selected]").length >= 3) {
                    alert("관심 아티스트는 3개만 선택 가능합니다!");
                   // $('#favArtists option[value="'+ $("#artistThree").text() + '"]').removeAttr("selected");
                }
               
            }
        } 



        // 관심 아티스트 호버시 x 버튼 보이게

        $(function(){
            $('#selectWrap1').mouseenter(function(){
                $('#cancel1').show();
            });
            $('#selectWrap1').mouseleave(function(){
                $('#cancel1').hide();
            });

            $('#selectWrap2').mouseenter(function(){
                $('#cancel2').show();
            });
            $('#selectWrap2').mouseleave(function(){
                $('#cancel2').hide();
            });

            $('#selectWrap3').mouseenter(function(){
                $('#cancel3').show();
            });
            $('#selectWrap3').mouseleave(function(){
                $('#cancel3').hide();
            });
        });

        // 관심 아티스트 x 클릭시 리스트에서 지우기 & option 태그 selected false 해주기 

        $(function(){

            $('#selectWrap1').on('click', function(){
                // 같은 value 값인 곳을 찾아서 select false 해주기
                $('#favArtists option[value="'+ $("#artistOne").text() + '"]').removeAttr("selected");
                $("#artistOne").empty();
            });

            $('#selectWrap2').on('click', function(){
                $('#favArtists option[value="'+ $("#artistTwo").text() + '"]').removeAttr("selected");
                $("#artistTwo").empty();
            });

            $('#selectWrap3').on('click', function(){
                $('#favArtists option[value="'+ $("#artistThree").text() + '"]').removeAttr("selected");
                $("#artistThree").empty();
            });
        });

        // 

        /* 비밀번호 텍스트 보이게 */
        $(function(){
            /* 눈표시 클릭 시 패스워드 보이기 */
            $('.eyes').on('click', function(){
                $('.join-pass').toggleClass('active');
                
                if( $('.join-pass').hasClass('active') == true ){
                    $(this).find('.eye-pass').attr('src',"/fantimate/resources/images/account/show.png").parents('.join-pass').find('#showPass').attr('type','text');
                } else {
                    $(this).find('.eye-pass').attr('src',"/fantimate/resources/images/account/hide.png").parents('.join-pass').find('#showPass').attr('type','password');
                }
            });
        });

        /* 비밀번호 텍스트 보이게 */
        $(function(){
            /* 눈표시 클릭 시 패스워드 보이기 */
            $('.eyes2').on('click', function(){
                $('.join-pass').toggleClass('active');
                
                if( $('.join-pass').hasClass('active') == true ){
                    $(this).find('.eye-pass2').attr('src',"../resource/show.png").parents('.join-pass').find('#showPass2').attr('type','text');
                } else {
                    $(this).find('.eye-pass2').attr('src',"../resource/hide.png").parents('.join-pass').find('#showPass2').attr('type','password');
                }
            });
        });

        // 기본 프로필 선택
        function checkOne(a){
            var obj = document.getElementsByName("profile");
            for(var i=0; i<obj.length; i++){
                if(obj[i] != a){
                    obj[i].checked = false;
                }
            }
        }

        // 약관동의 선택
        function checkAll(e){
            var checked = $(this).is(":checked");
            console.log(checked);

            if(checked){
                $(".checkbox-check").prop("checked", false);
            } else {
                $(".checkbox-check").prop("checked", true);
            }
        }


    </script>
</head>
<body>
 <!-- 첫번째 단계 -->
    <section class="firstStep-section">
        <header class="join-header">
            <p class="join-title">Fantimate Account</p>
            <p class="join-steps">6단계 중 1단계</p>
        </header>
        <p class="join-input-title">이름, 이메일을 입력하세요</p>
        <div class="join-input">
            <input type="text" class="join-input-info" name="firstName" placeholder="성 입력" required>
            <input type="text" class="join-input-info" name="name" placeholder="이름 입력" required>
            <input type="email" class="join-input-info" name="email" placeholder="이메일 입력" required>
        </div>
        <div class="join-btn-section">
            <button id="nextBtn" onclick="firstStep()">다음</button>
            <button id="backBtn">뒤로가기</button>
        </div>
    </section>

    <!-- 두번째 단계 -->
    <section class="secondStep-section">
        <header class="join-header">
            <p class="join-title">Fantimate Account</p>
            <p class="join-steps">6단계 중 2단계</p>
        </header>
        <p class="join-input-title">아이디, 패스워드를 입력하세요</p>
        <div class="join-id">
            <input type="text" id="join-input-id" name="id" placeholder="아이디 입력" required>
            <button id="idCheckBtn">중복 확인</button> 
            <p class="text-check">중복확인 하세요.</p>
        </div>
        <div class="join-pass">
            <p class="text-pass">비밀번호는 8-20자의 영문, 숫자, 특수문자를 조합하여 설정해주세요.</p>
            <input type="password" id="showPass" class="join-input-pass" name="pwd" placeholder="비밀번호 입력" required>
            <div class="eyes">
                <img src="${ contextPath }/resources/images/account/hide.png" alt="" class="eye-pass">
            </div>
            <p class="text-check">8-20자의 영문, 숫자, 특수문자</p>
            <input type="password" id="showPass2" class="join-input-pass" name="pwd" placeholder="비밀번호 확인" required>
            <div class="eyes2">
                <img src="${ contextPath }/resources/images/account/hide.png" alt="" class="eye-pass2">
            </div>
            <p class="text-check">비밀번호가 일치하지 않습니다.</p>
        </div>
        <div class="join-btn-section">
            <button id="nextBtn" onclick="secondStep()">다음</button>
            <button id="backBtn">뒤로가기</button>
        </div>
    </section>

    <!-- 세번째 단계 -->
    <section class="thirdStep-section">
        <header class="join-header">
            <p class="join-title">Fantimate Account</p>
            <p class="join-steps">6단계 중 3단계</p>
        </header>
        <p class="join-input-title">주소, 연락처, 국가를 입력하세요</p>
        <div class="join-address">
            <input type="text" id="inputAddress" name="address" placeholder="우편 번호" required>
            <button id="addressCheckBtn">우편 번호</button> 
            <input type="text" class="join-input-address" name="address" placeholder="도로명 주소" required>
            <input type="text" class="join-input-address" name="address" placeholder="상세 주소" required>
        </div>
        <div class="join-phone">
            <p class="text-phone">(-)포함하여 연락처를 입력해주세요.</p>
            <input type="tel" class="join-input-phone" name="phone" placeholder="연락처" required>
        </div>
        <div class="join-country">
            <p class="text-country">국가를 선택해주세요.</p>
            <select name="country" class="country-option">
                <option>선택</option>
                <option>대한민국</option>
                <option>대한민국 외</option>
            </select>
        </div>
        <div class="join-btn-section">
            <button id="nextBtn" onclick="thirdStep()">다음</button>
            <button id="backBtn">뒤로가기</button>
        </div>
    </section>

    <!-- 네번째 단계 -->
    <section class="fourthStep-section">
        <header class="join-header">
            <p class="join-title">Fantimate Account</p>
            <p class="join-steps">6단계 중 4단계</p>
        </header>
        <p class="join-input-title">관심 아티스트 3개 선택</p>
        <div class="join-artist">
            <select name="artist[]" multiple="multiple" id="favArtists" class="artist-option" onChange="selectArtist(this)">
                <option value="SUNMI">SUNMI</option>
                <option value="BTS">BTS</option>
                <option value="HENRY">HENRY</option>
                <option value="TEENTOP">TEENTOP</option>
                <option value="IU">IU</option>
                <option value="SUPERJUNIOR">SUPERJUNIOR</option>
                <option value="BRAVEGIRLS">BRAVEGIRLS</option>
                <option value="SUZI">SUZI</option>
            </select>
        </div>
        <div class="join-phone">
            <p class="text-artist">선택한 아티스트 미리보기</p>
            <div id="selected-artistList">
                <div id="selectWrap1"><li class="artist-select" id="artistOne"></li><img src="${ contextPath }/resources/images/account/cancel.png" alt="" id="cancel1" class="cancel-btn"></div>
                <div id="selectWrap2"><li class="artist-select" id="artistTwo"></li><img src="${ contextPath }/resources/images/account/cancel.png" alt="" id="cancel2" class="cancel-btn"></div>
                <div id="selectWrap3"><li class="artist-select" id="artistThree"></li><img src="${ contextPath }/resources/images/account/cancel.png" alt="" id="cancel3" class="cancel-btn"></div>
            </div>
        </div>
        <div class="join-btn-section">
            <button id="nextBtn" onclick="fourthStep()">다음</button>
            <button id="backBtn">뒤로가기</button>
        </div>
    </section>

     <!-- 다섯번째 단계 -->
     <section class="fifthStep-section">
        <header class="join-header">
            <p class="join-title">Fantimate Account</p>
            <p class="join-steps">6단계 중 5단계</p>
        </header>
        <p class="join-input-title">기본 프로필 사진 선택</p>
        <div class="join-profile">
            <p class="text-profile">3개중 택 1</p>
            <div id="selected-profile">
                <div class="profile-text-section">
                    <input type="checkbox" id="profile1" name="profile" class="check-profile" value="profile1.svg" onclick="checkOne(this)">
                    <span class="check-pic"></span>
                    <label for="profile1">
                    <img src="${ contextPath }/resources/images/account/profile1.png" alt="" class="userProfile-pic">
                    <span class="userName-text">승아</span>
                </label>
                </div>
                <div class="profile-text-section">
                    <input type="checkbox" id="profile2" name="profile" class="check-profile" value="profile2.svg" onclick="checkOne(this)">
                    <span class="check-pic"></span>
                    <label for="profile2">
                    <img src="${ contextPath }/resources/images/account/profile2.png" alt="" class="userProfile-pic">
                    <span class="userName-text">승아</span>
                </div>
                <div class="profile-text-section">
                    <input type="checkbox" id="profile3" name="profile" class="check-profile" value="profile3.svg" onclick="checkOne(this)">
                    <span class="check-pic"></span>
                    <label for="profile3">
                    <img src="${ contextPath }/resources/images/account/profile3.png" alt="" class="userProfile-pic">
                    <span class="userName-text">승아</span>
                </div>
            </div>
        </div>
        <div class="join-btn-section">
            <button id="nextBtn" onclick="fifthStep()">다음</button>
            <button id="backBtn">뒤로가기</button>
        </div>
    </section>

     <!-- 여섯번째 단계 (마지막)-->
     <section class="sixthStep-section">
        <header class="join-header">
            <p class="join-title">Fantimate Account</p>
            <p class="join-steps">6단계 중 6단계</p>
        </header>
        <p class="join-input-title">약관 동의</p>
            <label class="check-section">
                <input type="checkbox" name="checkAll" id="checkAll" class="checkbox-check" onclick="checkAll(this)"/>
                <span class="check-icon"></span>
                <label for="checkAll">모두 동의합니다.</label>
            </label>
        <div class="useCheck-section">
            <p class="check-title">이용 약관 동의(필수)</p>
            <div style="overflow:auto" class="check-content">
                여러분을 환영합니다. Fantimate 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다.
                본 약관은 다양한 Fantimate 서비스의 이용과 관련하여 Fantimate 서비스를 제공하는 Fantimate 주식회사(이하 Fantimate)와 이를 이용하는 Fantimate 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며,
                아울러 여러분의 Fantimate 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                Fantimate 서비스를 이용하시거나 Fantimate 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
            </div>
        </div>
        <label class="check-section">
            <input type="checkbox" name="agreement" id="termsOfService" class="checkbox-check"/>
            <span class="check-icon"></span>
            <label for="termsOfService">이용약관에 동의합니다</label>
        </label>

        <div class="infoCheck-section">
            <p class="check-title">개인정보 수집 및 이용(필수)</p>
            <div style="overflow:auto" class="check-content">
                개인정보보호법에 따라 Fantimate 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니
                자세히 읽은 후 동의하여 주시기 바랍니다.
                1. 수집하는 개인정보 이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다.
                이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
            </div>
        </div>
        <label class="check-section">
            <input type="checkbox" name="agreement" id="privacyPolicy" class="checkbox-check"/>
            <span class="check-icon"></span>
            <label for="privacyPolicy">개인정보 수집 및 이용에 동의합니다.</label>
        </label>

        <div class="join-btn-section">
            <button id="nextBtn" onclick="fifthStep()">다음</button>
            <button id="backBtn">뒤로가기</button>
        </div>
    </section>


</body>
</html>
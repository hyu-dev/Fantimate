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
 
     	// 다음 버튼 
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
        
        // 이전 버튼 
        
        // 이전 버튼 2단계 
        function beforeStep1(){
        	if($('.firstStep-section').css('display') == 'none'){
                $('.firstStep-section').show();
                $('.secondStep-section').hide();
        	}
        }
        
        // 이전 버튼 3단계 
        function beforeStep2(){
        	if($('.secondStep-section').css('display') == 'none'){
                $('.secondStep-section').show();
                $('.thirdStep-section').hide();
        	}
        }
        
        // 이전 버튼 4단계 
        function beforeStep3(){
        	if($('.thirdStep-section').css('display') == 'none'){
                $('.thirdStep-section').show();
                $('.fourthStep-section').hide();
        	}
        }
        
     	// 이전 버튼 5단계 
        function beforeStep4(){
        	if($('.fourthStep-section').css('display') == 'none'){
                $('.fourthStep-section').show();
                $('.fifthStep-section').hide();
        	}
        } 
     	
     	// 이전 버튼 6단계 
        function beforeStep5(){
        	if($('.fifthStep-section').css('display') == 'none'){
                $('.fifthStep-section').show();
                $('.sixthStep-section').hide();
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
                if($('.join-artist input[value="'+ $("#artistOne").text() + '"]').is(":checked"))
                $('.join-artist input[value="'+ $("#artistOne").text() + '"]').prop("checked", false);
                $("#artistOne").empty();
            });

            $('#selectWrap2').on('click', function(){
                // 같은 value 값인 곳을 찾아서 select false 해주기
                if($('.join-artist input[value="'+ $("#artistTwo").text() + '"]').is(":checked"))
                $('.join-artist input[value="'+ $("#artistTwo").text() + '"]').prop("checked", false);
                $("#artistTwo").empty();
            });

            $('#selectWrap3').on('click', function(){
                // 같은 value 값인 곳을 찾아서 select false 해주기
                if($('.join-artist input[value="'+ $("#artistThree").text() + '"]').is(":checked"))
                $('.join-artist input[value="'+ $("#artistThree").text() + '"]').prop("checked", false);
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
                    $(this).find('.eye-pass2').attr('src',"/fantimate/resources/images/account/show.png").parents('.join-pass').find('#showPass2').attr('type','text');
                } else {
                    $(this).find('.eye-pass2').attr('src',"/fantimate/resources/images/account/hide.png").parents('.join-pass').find('#showPass2').attr('type','password');
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
        function checkedAll(e){
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
 <!-- 메시지 -->
	 <c:if test="${ !empty msg }">
		 <c:choose>
			 <c:when test="${ msg eq 'success'}">
			 	<script>
				    alert("회원가입이 완료되었습니다!");
					opener.location.href="${ contextPath }";
					window.close();
			    </script>
			 </c:when>
			 <c:otherwise>
			 	<script>
				    alert("회원가입 실패!");
			    </script>
			 </c:otherwise>
		</c:choose>
	</c:if>
 
 <form action="${ contextPath }/member/join" method="post">
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
            <input type="email" class="join-input-info" name="uemail" placeholder="이메일 입력" required>
        </div>
        <div class="join-btn-section">
            <button class="nextBtn" type="button" onclick="firstStep()">다음</button>
            <button class="backBtn" type="button">뒤로가기</button>
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
            <input type="text" class="chk" id="join-input-id" name="id" placeholder="아이디 입력" title="아이디" required>
            <button type="button" id="idCheckBtn">중복 확인</button> 
            <p class="valid">아이디를 입력하세요. (영문 소문자, 숫자만 입력 가능)</p>
        </div>
        <div class="join-pass">
            <span class="text-pass">비밀번호는 8-20자의 영문, 숫자, 특수문자를 조합하여 설정해주세요.</span>
            <input type="password" id="showPass" class="chk" name="pwd" placeholder="비밀번호 입력" title="비밀번호" required>
            <p class="valid">8-20자의 영문, 숫자, 특수문자</p>
            <div class="eyes">
                <img src="${ contextPath }/resources/images/account/hide.png" alt="" class="eye-pass">
            </div>
            <input type="password" id="showPass2" class="chk" name="pwd2" placeholder="비밀번호 확인" title="비밀번호 확인" required>
            <p class="valid">비밀번호를 다시 입력하세요.</p>
            <div class="eyes2">
                <img src="${ contextPath }/resources/images/account/hide.png" alt="" class="eye-pass2">
            </div>
        </div>
        <div class="join-btn-section">
            <button id="goToNext" class="nextBtn" type="button" onclick="secondStep()">다음</button>
            <button type="button" class="backBtn" type="button" onclick="beforeStep1()">뒤로가기</button>
        </div>
    </section>
    
    <!-- 아이디 중복 확인 검사 -->
    <script>
	    $("#idCheckBtn").on('click', function(){
	    	id_check();
	    });
	    
	    function id_check(){
	    	var $id = $('[name=id]');
	    	if($id.hasClass('chked')) return;
	    	console.log('go check');
	    	
	    	var data = join.tag_status($id);
	    	if(data.code != 'valid') {
	    		alert('아이디 중복 확인 불필요\n' + data.desc);
	    		$id.focus();
	    		return;
	    	}
	    	
	    	$.ajax({
	    		type:'post',
	    		url: "${contextPath}/member/idCheck",
	    		data: {id: $id.val()},
	    		success: function(data) {
	    			data = join.id_usable(data);
	    			display_status($id.siblings('p'), data);
	    			$id.addClass('chked');
	    		},
	    		error: function(req, text){
	    			alert(text + ': ' + req.status);
	    		}
	    		
	    	});
	    	
	    }
	    
	    // 유효성 검사
	    $('.chk').on('keyup', function(){
	    	if($(this).attr('name') == 'id') {
	    		if(event.keyCode == 13) { id_check(); }
	    		else {
	    			$(this).removeClass('chked');
	    			validate( $(this) );
	    		}
	    	} else {
	    		validate($(this));
	    	}
	    });
	    
	    function validate(t) {
	    	var data = join.tag_status(t);
	    	display_status(t.siblings('p'), data);
	    }

	    function display_status(p, data) {
	    	p.text(data.desc);
	    	p.removeClass();
	    	p.addClass(data.code)
	    }
	    
	   /*  // 다음 눌렀을떄 
	    $("#goToNext").on('click', function(){

	    	//필수 항목의 유효성을 판단하도록 한다.
	    	//중복확인 한 경우
	    	if($('[name=id]').hasClass('chked') ) {
	    		//이미 사용중인 경우는 회원가입 불가
	    		if($('[name = id]').siblings('p').hasClass('invalid')) {
	    			alert('회원가입 불가\n' + join.id.unusable.desc);
	    			$('[name=id]').focus();
	    			return;
	    		}
	    	} else {
	    		//중복확인 하지 않은 경우
	    		if( !item_check($('[name=id]')) ) return;
	    		else {
	    			alert('회원가입 불가\n' + join.id.valid.desc);
	    			$('[name=id]').focus();
	    			return;
	    		}
	    	}
	    	
	    	if(!item_check($('[name=pwd]'))) return;
	    	if(!item_check($('[name=pwd2]'))) return;
	    	
	    	$('form').submit();
	    } */
	   
	    function item_check(item) {
	    	var data = join.tag_status(item);
	    	if(data.code == 'invalid') {
	    		alert('회원가입 불가! \n' + data.desc);
	    		item.focus();
	    		return false;
	    	} else return true;
	    }
	    
	    
	// 회원가입시 각 항목에 대한 입력 유효성 판단 
	var space = /\s/g;
	var title = "";
	var join = {
		common: {
			empty: {code: 'invalid', desc: title + '입력하세요.'},
			space: {code: 'invalid', desc: '공백 없이 입력하세요.'},
			min: {code: 'invalid', desc: '최소 5자 이상 입력하세요.'},
			max: {code: 'invalid', desc: '최대 10자 이내로 입력하세요.'}
		},
		
		id: {
			valid: { code:'valid', desc: '아이디를 중복확인하세요.' },
			invalid: { code:'invalid', desc: '아이디는 영문 소문자, 숫자만 입력하세요.' },
			usable: { code: 'valid', desc: '사용 가능한 아이디입니다.'},
			unusable: { code: 'invalid', desc: '이미 사용 중인 아이디입니다.	' }
		},
		
		id_usable: function(data) {
			if(data) return this.id.usable;
			else return this.id.unusable;
		},
		
		id_status: function(id) {
			var reg = /[^a-z0-9]/g;
			title = $('[name = id]').attr('title');
			if(id == '') { 
				return this.common.empty;
			} else if(id.match(space)) {
				return this.common.space;
			} else if(reg.test(id)) {
				return this.id.invalid;
			} else if(id.length < 5) {
				return this.common.min;
			} else if(id.length > 10) {
				return this.common.max;
			} else {
				return this.id.valid;
			}
		},
		
		pwd: {
			valid: { code:'valid', desc: '사용 가능한 비밀번호입니다.' },
			invalid: { code:'invalid', desc: '비밀번호는 영문 대/소문자, 숫자만 입력하세요.' },
			lack: { code:'invalid', desc: '비밀번호는 영문 대/소문자, 숫자를 모두 포함해야 합니다.' },
			equal: { code: 'valid', desc: '비밀번호가 일치합니다.' },
			notEqual: { code: 'invalid', desc: '비밀번호가 일치하지 않습니다.' }
		},
		
		pwd_status: function(pwd) {
			var reg = /[^a-zA-Z0-9]/g;
			title = $('[name = pwd]').attr('title');
			var upper = /[A-Z]/g, lower = /[a-z]/g, digit = /[0-9]/g;
			if(pwd == '') return this.common.empty;
			else if(pwd.match(space)) return this.common.space;
			else if(reg.test(pwd)) return this.pwd.invalid;
			else if(pwd.length < 5) return this.common.min;
			else if(pwd.length > 10) return this.common.max;
			else if ( !upper.test(pwd) || !lower.test(pwd) || !digit.test(pwd) ) return this.pwd.lack;
			else return this.pw.valid;
		},
		
		pwd2_status: function(pwd2) {
			title = $('[name = pwd2]').attr('title');
			if ( pwd2 =='' ) return this.common.empty;
			else if(pwd2 == $('[name=pwd]').val() ) return this.pwd.equal;
			else return this.pwd.notEqual; 
		},
		
		tag_status: function(tag) {
			var data = tag.val();
			tag = tag.attr('name');
			if(tag == 'id') {
				data = this.id_status(data);
			} else if(tag == 'pwd') {
				data = this.pwd_status(data);
			} else if(tag == 'pwd2') {
				data = this.pwd2_status(data);
			}
			
			return data;
		}
	}
		

    </script>

    <!-- 세번째 단계 -->
    <section class="thirdStep-section">
        <header class="join-header">
            <p class="join-title">Fantimate Account</p>
            <p class="join-steps">6단계 중 3단계</p>
        </header>
        <p class="join-input-title">주소, 연락처, 국가를 입력하세요</p>
        <div class="join-address">
            <input type="text" id="inputAddress" name="post" placeholder="우편 번호" required>
            <button id="addressCheckBtn">우편 번호</button> 
            <input type="text" class="join-input-address" name="address1" placeholder="도로명 주소" required>
            <input type="text" class="join-input-address" name="address2" placeholder="상세 주소" required>
        </div>
        <div class="join-phone">
            <p class="text-phone">(-)포함하여 연락처를 입력해주세요.</p>
            <input type="tel" class="join-input-phone" name="phone" placeholder="연락처" required>
        </div>
        <div class="join-country">
            <p class="text-country">국가를 선택해주세요.</p>
            <select name="ucountry" class="country-option">
                <option disabled>선택</option>
                <option value="대한민국">대한민국</option>
                <option value="대한민국 외">대한민국 외</option>
            </select>
        </div>
        <div class="join-btn-section">
            <button class="nextBtn" type="button" onclick="thirdStep();">다음</button>
            <button class="backBtn" type="button" onclick="beforeStep2()">뒤로가기</button>
        </div>
    </section>
    
    <!-- 우편 번호 API -->
    <!-- jQuery와 Postcodify를 로딩 -->
   <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
   <script>
      // 검색 단추를 누르면 팝업 레이어가 열리도록 설정
      $(function(){
            $("#addressCheckBtn").postcodifyPopUp();
      });
   </script>
    

    <!-- 네번째 단계 -->
    <section class="fourthStep-section">
        <header class="join-header">
            <p class="join-title">Fantimate Account</p>
            <p class="join-steps">6단계 중 4단계</p>
        </header>
        <p class="join-input-title">관심 아티스트 3개 선택</p>
        <div style="overflow:auto" class="join-artist">
            <!-- ajax 리스트 불러오기 -->
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
            <button class="nextBtn" type="button" onclick="fourthStep()">다음</button>
            <button class="backBtn" type="button" onclick="beforeStep3()">뒤로가기</button>
        </div>
    </section>
    
    <!-- Ajax로 전체 아티스트 불러오기 -->
    <script>
    $(function(){
       artistList();
    });    
    
    function artistList(){
       $.ajax({
          url : "${contextPath}/member/artistList",
          dataType : "json",
          success : function(data){
             console.log(data);
             
             selectOption = $(".join-artist");
             selectOption.html("");
             
             for(var i in data){
                //selectOption.append("<option value= '" + data[i].artNameEn + "'>" + data[i].artNameEn + "</option>");
                selectOption.append("<label><input type='checkbox' class='favcheck' name='favArtists' value= '" + data[i].artNameEn + "'>" + "<span>" + data[i].artNameEn + "</span></label>");
             }
             
           	 // 관심 아티스트 미리보기 
             $(".favcheck").click(function(){
                 
                    if($(this).is(":checked"))
                     if(document.getElementById("artistOne").innerText == ""){
 	                document.getElementById("artistOne").innerText = $(this).val();
 	            	} else if(document.getElementById("artistOne").innerText != "" && document.getElementById("artistTwo").innerText == "") {
 	                document.getElementById("artistTwo").innerText = $(this).val();
 	            	} else if(document.getElementById("artistTwo").innerText != "" && document.getElementById("artistOne").innerText != ""){
 	                    document.getElementById("artistThree").innerText = $(this).val();
 	                }
                 
             });
             
          },
          error : function(e){
             alert("code : " + e.status + "\n"
                  + "message : " + e.responseText);
          }
          
       });
       
    }
    </script>

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
                    <img src="${ contextPath }/resources/images/account/profile1.svg" alt="" class="userProfile-pic">
                    <span class="userName-text">승아</span>
                </label>
                </div>
                <div class="profile-text-section">
                    <input type="checkbox" id="profile2" name="profile" class="check-profile" value="profile2.svg" onclick="checkOne(this)">
                    <span class="check-pic"></span>
                    <label for="profile2">
                    <img src="${ contextPath }/resources/images/account/profile2.svg" alt="" class="userProfile-pic">
                    <span class="userName-text">승아</span>
                </div>
                <div class="profile-text-section">
                    <input type="checkbox" id="profile3" name="profile" class="check-profile" value="profile3.svg" onclick="checkOne(this)">
                    <span class="check-pic"></span>
                    <label for="profile3">
                    <img src="${ contextPath }/resources/images/account/profile3.svg" alt="" class="userProfile-pic">
                    <span class="userName-text">승아</span>
                </div>
            </div>
        </div>
        <div class="join-btn-section">
            <button class="nextBtn" type="button" onclick="fifthStep()">다음</button>
            <button class="backBtn" type="button" onclick="beforeStep4()">뒤로가기</button>
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
                <input type="checkbox" name="checkAll" id="checkAll" class="checkbox-check" onclick="checkedAll(this)"/>
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
            <button class="nextBtn">가입하기</button>
            <button class="backBtn" type="button" onclick="beforeStep5()">뒤로가기</button>
        </div>
    </section>      
    
</form>

</body>
</html>
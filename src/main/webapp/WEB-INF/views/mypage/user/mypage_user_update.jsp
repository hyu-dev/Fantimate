<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../mypage_user/jw.css">
    <link rel="stylesheet" href="../resource/font/font.css">
    <title>회원정보수정</title>
</head>
<body>
    <!-- <div id="mypageWrap" class="backcolor-pink"> -->

        <div id="mypageUserUpdate">
            <h2>회원정보 수정</h2>
            <div id="mypageUserUpdateContents">
                <div id="mypageUserUpdateLeft">
                    <img src="mansik.png" alt="프로필사진">
                    <button>사진 변경</button>
                </div>
                <div id="mypageUserUpdateMiddle">
                    <label>이름</label>
                    <label>아이디</label>
                    <label>비밀번호</label>
                    <label>비밀번호 확인</label>
                    <label>이메일</label>
                    <label>휴대전화</label> 
                </div>
                <div id="mypageUserUpdateRight">
                    <input type="text" name="name" value="김만식" readonly><!-- value="${}""-->
                    <input type="text" name="id" value="tenthousand" readonly>
                    <input type="password" name="pwd" placeholder="8~20자 영문, 숫자, 특수문자 포함하여 작성하세요">
                    <input type="password" name="pwd2" placeholder="8~20자 영문, 숫자, 특수문자 포함하여 작성하세요">
                    <input type="email" name="email" value="masik@gamil.com">
                    <input type="text" name="phone" value="01012345678">
                </div>
            </div>

            <div class="mypage-Btn-align-center">
                <button class="mypage-pop-Btn-pink" >수정하기</button>
                <button class="mypage-pop-Btn-navi">탈퇴하기</button>
            </div>
        </div>
        
    <!-- </div> -->
    </body>
    </html>
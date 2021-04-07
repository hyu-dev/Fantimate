function test(){
    alert('호출 확인');
}

$(document).ready(function() {
	// 팝업띄우기
	
	// 소속사등록 버튼클릭시
	$("#mypageAdminMenuDiv li:eq(0)").click(function() { 
		console.log('정상클릭');
		$("#mypageAdminSignInWrap").fadeIn().addClass("mypagebground");
		$("#mypageAdminSignIn").fadeIn();
	});
		
	// 취소하기
	$("#mypageAdminSignInWrap .mypage-pop-Btn-navi").click(function () {				// article
		$(this).closest("#mypageAdminSignInWrap").fadeOut();
		//$(this).fadeOut();
		console.log("닫기버튼");
	});
		
		
});
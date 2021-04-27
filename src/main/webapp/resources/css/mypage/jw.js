function test(){
    alert('호출 확인');
}

$(document).ready(function() {
	// 팝업띄우기
	
	// 소속사등록 버튼클릭시
	//$("#mypageAdminMenuDiv li:eq(0)").click(function() { 
	$("#insertAgency").click(function() { 
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
	
	// 쪽지 신고관리
    		$("#mypageAdminReportlist tbody tr").click(function() { 
    			console.log('정상클릭');
    			$("#reportDetail1").val($(this).children().eq(4).text());	// 유저아이디
    			$("#reportDetail2").val($(this).children().eq(3).text());
    			$("#reportDetail3").val($(this).children().eq(5).text());
    			$("#reportDetail4").val($(this).children().eq(6).text()); 
    			$("#reportDetail5").val($(this).children().eq(7).text());
    			$("#reportDetail6").val($(this).children().eq(1).val()); 
    			$("#mypageReportDetailWrap").fadeIn().addClass("mypagebground");
    			$("#mypageReportDetail").fadeIn();
    		});
    // 팬스토어 신고관리
    		$("#mypageAdminFanstorelist tbody tr").click(function() { 
    			console.log('정상클릭');
    			$("#reportDetail1").val($(this).children().eq(4).text());	// 유저아이디
    			$("#reportDetail2").val($(this).children().eq(3).text());
    			$("#reportDetail3").val($(this).children().eq(5).text());
    			$("#reportDetail4").val($(this).children().eq(6).text()); 
    			$("#reportDetail5").val($(this).children().eq(7).text());
    			$("#reportDetail6").val($(this).children().eq(1).val()); 
    			$("#mypageReportDetailWrap").fadeIn().addClass("mypagebground");
    			$("#mypageReportDetail").fadeIn();
    		});
    			
    		// 취소하기
    		$("#mypageReportDetailWrap .mypage-pop-Btn-navi").click(function () {				// article
    			$(this).closest("#mypageReportDetailWrap").fadeOut();
    			//$(this).fadeOut();
    			console.log("닫기버튼");
    		});
		
	// 유저 회원정보수정 팝업창
	$("#mypageUserProfile #userProfileUpdate").click(function() { 
		console.log('정상클릭');
		$("#mypageUserUpdateDivWrap").fadeIn().addClass("mypagebground");
		$("#mypageUserUpdateDiv").fadeIn();
		console.log('정상실행');
	});
		
	// 취소하기
	$("#userPopUpdateCancelBtn").click(function () {				// article
		console.log('정상클릭');
		$(this).closest("#mypageUserUpdateDivWrap").fadeOut();
		//$(this).fadeOut();
		console.log("닫기버튼");
	});
});
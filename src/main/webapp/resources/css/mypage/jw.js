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
    			console.log($(this).children().eq(0).val());
    			console.log($(this).children().eq(1).text());
    			console.log($(this).children().eq(2).text());
    			console.log($(this).children().eq(3).text());
    			console.log($(this).children().eq(4).text());
    			console.log($(this).children().eq(5).text());
    			console.log($(this).children().eq(6).text());
    			console.log($(this).children().eq(7).text());
    			console.log($(this).children().eq(8).text());
    			console.log($(this).children().eq(9).val());
    			console.log($(this).children().eq(11).val());
    			$("#reportDetail1").val($(this).children().eq(3).text());	// 유저아이디
    			$("#reportDetail2").val($(this).children().eq(2).text());
    			$("#reportDetail3").val($(this).children().eq(4).text());
    			$("#reportDetail4").val($(this).children().eq(5).text()); 
    			$("#reportDetail5").val($(this).children().eq(6).text());
	   			$("#reportDetail6").val($(this).children().eq(1).val()); 
    			// 여긴 - 안해도됨
    			$("#reportDetail7").val($(this).children().eq(9).val()); 
    			//$("#reportDetail8").val($(this).children().eq(4).text()); 
    			$("#reportDetail9").val($(this).children().eq(10).val()); 
    			$("#reportDetail10").val($(this).children().eq(11).val()); 
    			$("#mypageReportDetailWrap").fadeIn().addClass("mypagebground");
    			$("#mypageReportDetail").fadeIn();
    		});
    // 팬스토어 신고관리
    		$("#mypageAdminFanstorelist tbody tr").click(function() { 
    			console.log('정상클릭');
    			$("#reportDetail1").val($(this).children().eq(4).text());	// 유저아이디
    			$("#reportDetail2").val($(this).children().eq(3).text());	// 신고일자
    			$("#reportDetail3").val($(this).children().eq(5).text());	// 신고당한 유저아이디
    			$("#reportDetail4").val($(this).children().eq(6).text()); 	// 신고한 게시물 제목
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
    		
//			$("#reportThis").click(function(){
//				let reportDay = prompt("정지할 날짜를 적으세요");
//				let userId = $("#reportDetail1").val();
//				
////				if(reportDay){
//					if(confirm('해당 회원을 ' + reportDay + '일 만큼 정지하시겠습니까?')){
////					
//				    }
////				    //else{
//					//location.href='${contextPath}/mypage/admin/report';
//			    //}
//			    }
//			});
		
		/////////////////////////////////////////////////////////////////////////////////
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
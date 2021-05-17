package com.kh.fantimate.mypage1.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.member.model.service.MemberService;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.mypage1.model.Service.Mypage1Service;
import com.kh.fantimate.mypage1.model.vo.ReportAdmin;
import com.kh.fantimate.mypage1.model.vo.ReportPageInfo;
import com.kh.fantimate.mypage1.model.vo.UserPaymentCol2;
import com.kh.fantimate.mypage1.model.vo.UserUpdateVo;
import com.kh.fantimate.notice.model.Service.NoticeService;


@Controller
@RequestMapping("/mypage/admin")
public class MypageAdminController {
	
	@Autowired
	private Mypage1Service mService;
	
	@Autowired
	private MemberService memService;
	
	@Autowired
	private NoticeService nService;
	
	// 재우추가
		@GetMapping("/report")
		public ModelAndView requestReportList(ModelAndView mv,
				@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
				HttpSession session) {
			
			// 메세지 신고리스트 개수(신고 처리된 개수만으로 해야하나)
//			int listCount = mService.reportListCountMessage();
			int listCount = RListCountMethod(0);
			System.out.println("메세지 신고 개수 : " + listCount);
			
			// 요청 페이지에 맞는 리스트 조회
			ReportPageInfo pi = pagingReport(currentPage, listCount);
			List<Report> list = mService.selectMsgList(pi);
			System.out.println("읽어온 쪽지 리스트 : " + list);
			
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName("mypage/admin/reportList");
			}else{
				mv.addObject("msg", "조회에 실패하였습니다.");
				mv.setViewName("mypage/admin/errorpage");
			}
			return mv;
		}
		
		@GetMapping("/report/fanstore")
		public ModelAndView requestReportfanstoreList(ModelAndView mv,
				@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
				HttpSession session) {
			
			// 신고리스트 개수(신고 처리된 개수만해야하나)
//			int listCount = mService.reportListCountfanstore();
			int listCount = RListCountMethod(1);
			System.out.println("팬스토어신고 개수 : " + listCount);
			
			// 요청 페이지에 맞는 리스트 조회
			ReportPageInfo pi = pagingReport(currentPage, listCount);
			List<Report> list = mService.selectfanstoreList(pi);
			System.out.println("읽어온 팬스토어신고 : " + list);
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName("mypage/admin/reportListFanstore");
			}else{
				mv.addObject("msg", "조회에 실패하였습니다.");
				mv.setViewName("mypage/admin/errorpage");
			}
			return mv;
		}
		
		@GetMapping("/report/fanstoreReply")
		public ModelAndView requestReportfanstoreRList(ModelAndView mv,
				@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
				HttpSession session) {
			
			// 신고리스트 개수(신고 처리된 개수만해야하나)
			int listCount = RListCountMethod(2);
			System.out.println("팬스토어댓글신고 개수 : " + listCount);
			
			// 요청 페이지에 맞는 리스트 조회
			ReportPageInfo pi = pagingReport(currentPage, listCount);
			List<Report> list = mService.selectfanstoreRList(pi);
			System.out.println("읽어온 팬스토어댓글신고 : " + list);
			
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName("mypage/admin/reportListFanstoreReply");
			}else{
				mv.addObject("msg", "조회에 실패하였습니다.");
				mv.setViewName("mypage/admin/errorpage");
			}
			return mv;
		}
		
		@GetMapping("/report/media")
		public ModelAndView requestReportMediaList(ModelAndView mv,
				@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
				HttpSession session) {
			
			// 신고리스트 개수(신고 처리된 개수만해야하나)
//			int listCount = mService.reportListCountfanstoreR();
			int listCount = RListCountMethod(3);
			System.out.println("미디어댓글신고 개수 : " + listCount);
			
			// 요청 페이지에 맞는 리스트 조회
			ReportPageInfo pi = pagingReport(currentPage, listCount);
			List<Report> list = mService.requestReportMediaList(pi);
			System.out.println("읽어온 미디어댓글신고 : " + list);
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName("mypage/admin/reportListMediaReply");
			}else{
				mv.addObject("msg", "조회에 실패하였습니다.");
				mv.setViewName("mypage/admin/errorpage");
			}
			return mv;
		}
		@GetMapping("/report/feed")
		public ModelAndView requestReportFeedList(ModelAndView mv,
				@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
				HttpSession session) {
			
			// 신고리스트 개수(신고 처리된 개수만해야하나)
//			int listCount = mService.reportListCountfanstoreR();
			int listCount = RListCountMethod(4);
			System.out.println("피드 신고 개수 : " + listCount);
			
			// 요청 페이지에 맞는 리스트 조회
			ReportPageInfo pi = pagingReport(currentPage, listCount);
			List<Report> list = mService.requestReportFeedList(pi);	// 아직
			System.out.println("읽어온 피드 신고 : " + list);
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName("mypage/admin/reportListBoard");
			}else{
				mv.addObject("msg", "조회에 실패하였습니다.");
				mv.setViewName("mypage/admin/errorpage");
			}
			return mv;
		}
		@GetMapping("/report/feedReply")
		public ModelAndView requestReportFeedRList(ModelAndView mv,
				@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
				HttpSession session) {
			
			// 신고리스트 개수(신고 처리된 개수만해야하나)
//			int listCount = mService.reportListCountfanstoreR();
			int listCount = RListCountMethod(5);
			System.out.println("피드/아티스트 댓글신고 개수 : " + listCount);
			
			// 요청 페이지에 맞는 리스트 조회
			ReportPageInfo pi = pagingReport(currentPage, listCount);
			List<Report> list = mService.requestReportFeedRList(pi);	//아직 
			System.out.println("읽어온 피드아티스트 댓글신고 : " + list);
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName("mypage/admin/reportListBoardR");
			}else{
				mv.addObject("msg", "조회에 실패하였습니다.");
				mv.setViewName("mypage/admin/errorpage");
			}
			return mv;
		}
		// 신고관리
		@PostMapping("/report/user")
		public String reportUser(
				HttpSession session,
				Model model,
				ReportAdmin report,		// isReported에 테이블이름 담아서 넘어오기
				String reportDay,		// 정지일수
				HttpServletRequest request) {
			
			System.out.println("/report/user 제대로 작동");
			System.out.println("report : " + report);
			System.out.println("reportDay : " + reportDay);
			String rptTable = report.getIsReported();
			System.out.println("rptTable : " + rptTable );
			
			int rptDate = Integer.parseInt(reportDay);
			System.out.println("rptDate : " + rptDate);
			
			// 0이 들어왔다면 반려처리 ( C처리)
			if(rptDate == 0)
			report.setRptId("C");
			else report.setRptId("Y");
			
			// Y로 바꿔주기 (처리완료로 상태변경) --> 쪽지/팬스토어/팬스토어댓글
			int colupdate = mService.updateRpt(report);
			System.out.println("colupdate : " + colupdate);
			
			// 정지를 시킨다면 정지일수가 0보다큼
			if(rptDate > 0) {
			// 유저정보 업데이트
				
				report.setReportDate(rptDate*24);
				System.out.println("신고전 report : " + report);
				int result1 = mService.updateUserReport(report);
			
				if(rptDate > 0 && result1 >0) {
					System.out.println("회원제재 로직 성공");
				}
			// 해당 게시글 비활성화 처리	
//				rptTable
				//RPT_FREPLY가 아니라면(status가 없음)
				if(!report.getIsReported().equals("RPT_FREPLY")) {
				int result = mService.updateTableStatus(report);
				System.out.println("updateTableStatus 결과 : " + result);
				}
			}
			
			return "redirect:/mypage/admin/report";
		}
		
		// 회원 관리
		@GetMapping("/management")
		public ModelAndView memberManagement(ModelAndView mv,
				@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
				HttpSession session) {
				
			int listCount = RListCountMethod(6);
			System.out.println("읽어온 회원정보 갯수 : " + listCount);
			ReportPageInfo pi = pagingReport(currentPage, listCount);
			List<UserUpdateVo> list = mService.requestCommonList(pi);
			System.out.println("읽어온 회원정보 : " + list);
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName("mypage/admin/management");
			}else{
				mv.addObject("msg", "조회에 실패하였습니다.");
				mv.setViewName("mypage/admin/errorpage");
			}
			return mv;
		}
		// 회원 관리(정지,안정지)
		@GetMapping("/management/update")
		public String memberManagement(@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
				@RequestParam(value="userid", required=true) String parameterUserId,
				@RequestParam(value="status", required=true) String status,
				@RequestParam(value="reportDate", required=false, defaultValue="0") String reportDate,
				HttpSession session) {
			
			// parameterUserId라는 userid 받아서 정지 or 정지해제하기
			System.out.println("id,status, reportDate : " + parameterUserId);
			System.out.println(status);
			System.out.println(reportDate);
			
			// 정지해제하기
			if(reportDate.equals("")) {
				int updateDate = mService.deleteUserRDate(parameterUserId);
				int updateY = mService.updateUserStatusY(parameterUserId);
				System.out.println("유저 제재 결과1 : " + updateDate);
				System.out.println("유저 제재 결과2 : " + updateY);
			// 정지 하기
			}else {
				int rptDate = Integer.parseInt(reportDate);
				ReportAdmin report = new ReportAdmin();
				report.setId(parameterUserId);
				int result = mService.updateUserReport(report);
				System.out.println("정지 result : " + result);
				
				
				report.setReportDate(rptDate*24);
				System.out.println("신고전 report : " + report);
				int result1 = mService.updateUserReport(report);
				System.out.println("정지 result1 : " + result1);
			
				if(rptDate > 0 && result1 >0) {
					System.out.println("회원제재 로직 성공");
				}
			}
			
			
			return "redirect:/mypage/admin/management?page=" + currentPage;
		}
		
		
		// 결제일순으로 보기
		// 환불신청한것부터 보기
		@GetMapping("/paylist")
		public ModelAndView payList(ModelAndView mv,
				@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
				HttpSession session) {
			
//			if(session.getAttribute("loginUser") == null) {
//				mv.addObject("msg", "로그인이 필요합니다.");
//				mv.setViewName("mypage/admin/errorpage");
//				return mv;
//			}
			int listCount = mService.RListCountPayListAdmin();
			System.out.println("총 결제 수(멤버쉽제외??): " + listCount);
			
			// 요청 페이지에 맞는 리스트 조회
			ReportPageInfo pi = pagingReport(currentPage, listCount);
			List<UserPaymentCol2> list = mService.requestPayListAdmin(pi);	// 아직
			System.out.println("읽어온 결제정보 : " + list);
			
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName("mypage/user/payments");
			}else{
				mv.addObject("msg", "조회에 실패하였습니다.");
				mv.setViewName("mypage/admin/errorpage");
			}
						
						
			mv.setViewName("mypage/admin/payList");
			
			return mv;
		}

		
		// Ajax 중복확인 버튼
		@PostMapping("/idCheck")
		public void ajaxidCheck(String userId,
								HttpServletResponse response) {
			try {
				PrintWriter out = response.getWriter();
				
				int result = mService.checkId(userId);
				
				if(result == 0)
				out.write("success");
				else
				out.write("fail");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		// Agency 등록
		@PostMapping("/insertAgency")
		public String insertAgency(@ModelAttribute Member common,
										  @ModelAttribute Agency agency,
//										  Model model,
										  RedirectAttributes rd) {
			
			common.setName(agency.getAgName());
			System.out.println("common 객체 : " + common);
			System.out.println("agency 객체 : " + agency);
			// 아이디 중복검사 로직
			int idcheck = mService.checkId(common.getId());
			
			// 아이디 중복아닐때
			if(idcheck == 0) {
			// 1. COMMON 테이블에 insert
			int result1 = mService.insertCommon(common);
			System.out.println("result1 : " + result1);
			agency.setAgId(common.getId());
			int result2 = mService.insertAgency(agency);
			System.out.println("result2 : " + result2);
			
				// 가입 완료 로직
				if(result1 > 0 && result2 > 0) {
					System.out.println("정상회원가입");
//					model.addAttribute("msg", "success");
					rd.addFlashAttribute("msg","success");
					return "redirect:/notice/list";
				}else {
					System.out.println("Agency 등록 실패");
//					model.addAttribute("msg", "fail");
					rd.addFlashAttribute("msg","fail");
					return "redirect:/notice/list";
				}
				
			}else {
				System.out.println("회원가입 중 아이디 중복 발생");
				rd.addFlashAttribute("msg","회원가입 중 아이디 중복 발생");
				return "redirect:/notice/list";
			}
		}
		
		
		
		// 검색조건에 맞는 페이징 구하기
		public int RListCountMethod(int category) {
			/*
			 	--> 조회하고 싶은 카테고리를 인자로 전달
			 	0 : 쪽지
			 	1 : 팬스토어
			 	2 : 팬스토어 댓글
			 	3 : 미디어댓글
			 	4 : 피드, 아티스트
			 	5 : 피드, 아티스트 댓글
			 	6 : 회원관리(COMMON)
			 */ 
			String[] Reportcategory = { "RPT_MESSAGE",
										"RPT_FSTORE", 
										"RPT_FREPLY", 
										"MD_CMT_RPT",  
										"B_RPT", 
										"B_RE_RPT"
										, "COMMON" };
			System.out.println("RListName : " + Reportcategory[category]);
			
//			Rcategory rName = new Rcategory(Reportcategory[category]);
			
			int listCountResult = mService.RListCountMethod(Reportcategory[category]);
			System.out.println("페이징 처리 결과 listCountValue : " + listCountResult);
			return listCountResult;
		}
		
		// 신고 페이징처리
		public ReportPageInfo pagingReport(int currentPage, int listCount) {
				ReportPageInfo pi = null;	// 페이지 정보를 담아 줄 PageInfo 참조변수 선언
				
				int pageLimit = 10;	// 한 페이지에 보여질 페이징바의 갯수
				int boardLimit = 10;	// 한 페이지 보여질 게시글 개수
				
				int maxPage = (int)Math.ceil((double)listCount / boardLimit);
				int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
				int endPage = startPage + pageLimit - 1;
				
				// 마지막 페이지가 총 페이지 수보다 클 경우
				if(maxPage < endPage) {
					endPage = maxPage;
				}
				pi = new ReportPageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
				return pi;
			}
}


package com.kh.fantimate.mypage1.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.fantimate.common.model.vo.Notice;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.member.model.service.MemberService;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.mypage1.model.Service.Mypage1Service;
import com.kh.fantimate.mypage1.model.vo.ReportPageInfo;
import com.kh.fantimate.notice.model.Service.NoticeService;
import com.kh.fantimate.notice.model.vo.NoticePageInfo;


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
			int listCount = mService.reportListCountMessage();
			System.out.println("메세지 신고 개수 : " + listCount);
			
			// 요청 페이지에 맞는 리스트 조회
			ReportPageInfo pi = pagingReport(currentPage, listCount);
			List<Report> list = mService.selectMsgList(pi);
			
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
			int listCount = mService.reportListCountfanstore();
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
			int listCount = mService.reportListCountfanstoreR();
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
		
		
		
		/*
		@PostMapping("/detail")
		public String noticeDetail() {
			
			return "/mypage/admin/noticeDetail"; 
		}
		*/
		@GetMapping("/management")
		public ModelAndView memberManagement(ModelAndView mv) {
//			List<Feed> dibs = nService.selelctList();
			
//			if(dibs != null) {
//				mv.addObject("dibs", dibs);
				mv.setViewName("mypage/admin/management");
//			}else{
//				mv.addObject("msg", "피드 조회에 실패하였습니다.");
//				mv.setViewName("common/errorpage");
//			}
			return mv;
		}
		
		// 결제일순으로 보기
		// 환불신청한것부터 보기
		@GetMapping("/paylist")
		public ModelAndView payList(ModelAndView mv) {
			
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
		
		
		
		@PostMapping("/insertAgency")
		public String insertAgency(@ModelAttribute Member common,
										  @ModelAttribute Agency agency,
//										  Model model,
										  RedirectAttributes rd) {
			
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
					rd.addFlashAttribute("msg","Agency회원 정보 정상 입력");
					return "redirect:/notice/list";
				}else {
					System.out.println("Agency 등록 실패");
//					model.addAttribute("msg", "fail");
					rd.addFlashAttribute("msg","Agency회원 정보 정상 입력");
					return "redirect:/notice/list";
				}
				
			}else {
				System.out.println("회원가입 중 아이디 중복 발생");
				rd.addFlashAttribute("msg","회원가입 중 아이디 중복 발생");
				return "redirect:/notice/list";
			}
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


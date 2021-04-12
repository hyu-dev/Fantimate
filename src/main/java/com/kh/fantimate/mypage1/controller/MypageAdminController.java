package com.kh.fantimate.mypage1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fantimate.mypage1.model.Service.Mypage1Service;


@Controller
@RequestMapping("/mypage/admin")
public class MypageAdminController {
	
	@Autowired
	private Mypage1Service mService;
	
	// 재우추가
		@GetMapping("/report")
		public ModelAndView requestReportList(ModelAndView mv) {
//			List<Feed> feed = nService.selelctList();
			
//			if(feed != null) {
//				mv.addObject("feed", feed);
				mv.setViewName("mypage/admin/reportList");
//			}else{
//				mv.addObject("msg", "피드 조회에 실패하였습니다.");
//				mv.setViewName("common/errorpage");
//			}
			return mv;
		}
		
		@PostMapping("/write")
		public String noticeWrite() {
			
			return "/mypage/admin/noticeWrite"; 
		}
		
		@PostMapping("/detail")
		public String noticeDetail() {
			
			return "/mypage/admin/noticeDetail"; 
		}
		
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
		
		@PostMapping("/insertAgency")
		public ModelAndView insertAgency(ModelAndView mv) {
			
			mv.setViewName("mypage/admin/insertAgency");
			
			return mv;
		}
		
		// 결제일순으로 보기
		// 환불신청한것부터 보기
		@GetMapping("/paylist")
		public ModelAndView payList(ModelAndView mv) {
			
			mv.setViewName("mypage/admin/payList");
			
			return mv;
		}
		
		
		
		
		
		
		
		
		
		
}


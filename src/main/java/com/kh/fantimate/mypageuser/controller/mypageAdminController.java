package com.kh.fantimate.mypageuser.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mypage/admin")
public class mypageAdminController {
	
	// 재우추가
		@GetMapping("/report")
		public ModelAndView userMyFeed(ModelAndView mv) {
//			List<Feed> feed = nService.selelctList();
			
//			if(feed != null) {
//				mv.addObject("feed", feed);
				mv.setViewName("mypage/admin/report");
//			}else{
//				mv.addObject("msg", "피드 조회에 실패하였습니다.");
//				mv.setViewName("common/errorpage");
//			}
			return mv;
		}
		
		@GetMapping("/notice")
		public ModelAndView userMysubscribes(ModelAndView mv) {
			
			mv.setViewName("mypage/admin/notice");
			
			return mv;
		}
		
		@GetMapping("/management")
		public ModelAndView userMyDibs(ModelAndView mv) {
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
		
		@GetMapping("/insertAgency")
		public ModelAndView userMyFriends(ModelAndView mv) {
			
			mv.setViewName("mypage/admin/insertAgency");
			
			return mv;
		}
		
		@GetMapping("/paylist")
		public ModelAndView userMycomments(ModelAndView mv) {
			
			mv.setViewName("mypage/admin/paylist");
			
			return mv;
		}
		
		
		
		
		
		
		
		
		
}


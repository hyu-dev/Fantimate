package com.kh.fantimate.mypageuser.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mypage/user")
public class mypageUserController {
	
	// 재우추가
		@GetMapping("/feed")
		public ModelAndView userMyFeed(ModelAndView mv) {
//			List<Feed> feed = nService.selelctList();
			
//			if(feed != null) {
//				mv.addObject("feed", feed);
				mv.setViewName("mypage/user/feed");
//			}else{
//				mv.addObject("msg", "피드 조회에 실패하였습니다.");
//				mv.setViewName("common/errorpage");
//			}
			return mv;
		}
		
		@GetMapping("/dibs")
		public ModelAndView userMyDibs(ModelAndView mv) {
//			List<Feed> dibs = nService.selelctList();
			
//			if(dibs != null) {
//				mv.addObject("dibs", dibs);
				mv.setViewName("mypage/user/dibs");
//			}else{
//				mv.addObject("msg", "피드 조회에 실패하였습니다.");
//				mv.setViewName("common/errorpage");
//			}
			return mv;
		}
		
//		여기서부턴 상세조건 생략, 구현부터
		@GetMapping("/friends")
		public ModelAndView userMyFriends(ModelAndView mv) {
			
			mv.setViewName("mypage/user/dibs");
			
			return mv;
		}
		
		
		@GetMapping("/friends")
		public ModelAndView userMyFriends(ModelAndView mv) {
			
			mv.setViewName("mypage/user/dibs");
			
			return mv;
		}
		
		
		
		
		
}


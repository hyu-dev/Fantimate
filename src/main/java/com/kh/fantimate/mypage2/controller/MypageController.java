package com.kh.fantimate.mypage2.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fantimate.member.model.vo.ArtistCollection;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.member.model.vo.User;
import com.kh.fantimate.mypage2.model.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	private MypageService mService;

	// 마이페이지 아티스트 메인(피드)페이지 & 메인에 뿌려질 피드 전체 리스트 출력
	@GetMapping("/artist/feed")
	public ModelAndView officialMain(ModelAndView mv, HttpServletRequest request) {
		
		Member arti = (Member)request.getSession().getAttribute("artist");
		System.out.println("아티스트 정보 : " + arti);
		
		if(arti != null) {
			// 해당 아티스트 호출
			mv.addObject("arti", arti);
			mv.setViewName("mypage/artist/feed");
		}
		
		return mv;
	}
}

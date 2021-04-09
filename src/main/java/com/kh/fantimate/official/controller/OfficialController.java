package com.kh.fantimate.official.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fantimate.official.model.service.OfficialService;
import com.kh.fantimate.official.model.vo.MediaCategory;
import com.kh.fantimate.official.model.vo.MediaCollection;

@Controller
@RequestMapping("/official")
public class OfficialController {
	@Autowired
	private OfficialService oService;

	// 오피셜 메인페이지 & 메인에 뿌려질 미디어 전체 리스트 출력
	@GetMapping("/media/main")
	public ModelAndView officialMain(ModelAndView mv) {
		String artiName = "BTS";
		
		// 미디어 전체 리스트 호출을 위한 카테고리 선택
		List<MediaCategory> category = oService.selectCategory(artiName);
		
		// 미디어 전체 리스트 호출
		List<MediaCollection> list = oService.selectAllMediaList(artiName);
		
		// 업로드 최신순으로 4개의 미디어 리스트 호출
		List<MediaCollection> slide = oService.selectNewMediaList(artiName);

		// System.out.println(category);
		// System.out.println(list);
		// System.out.println(slide);
		
		if(list != null) {
			mv.addObject("category", category);
			mv.addObject("list", list);
			mv.addObject("slide", slide);
			mv.setViewName("official/media/main");
		} 
		
		return mv;
	}
	
	// 파라미터를 넘겨줘야 하므로 수정 예정
	/*
	@GetMapping("/media/list")
	public String listPageView() {
		return "official/media/list";
	}
	
	// 파라미터를 넘겨줘야 하므로 수정 예정
	@GetMapping("/media/detail")
	public String detailPageView() {
		return "official/media/detail";
	}
	
	// 파라미터를 넘겨줘야 하므로 수정 예정
	@GetMapping("/schedule")
	public String schedulePageView() {
		return "official/schedule/main";
	} */
}

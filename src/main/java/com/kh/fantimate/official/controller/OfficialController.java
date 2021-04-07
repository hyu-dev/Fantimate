package com.kh.fantimate.official.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/official")
public class OfficialController {

	@GetMapping("/media/main")
	public String mainPageView() {
		return "official/media/main";
	}
	
	// 파라미터를 넘겨줘야 하므로 수정 예정
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
	}
}

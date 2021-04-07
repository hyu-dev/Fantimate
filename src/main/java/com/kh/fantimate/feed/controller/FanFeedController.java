package com.kh.fantimate.feed.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/fanfeed")
public class FanFeedController {
	
	
	
	@GetMapping("/fanFeedList")
	public String listpageView() {
		
		return "fanfeed/fanFeedList";
	}

}

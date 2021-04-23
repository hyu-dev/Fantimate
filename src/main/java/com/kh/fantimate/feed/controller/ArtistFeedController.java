package com.kh.fantimate.feed.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/artistfeed")
public class ArtistFeedController {

	@GetMapping("/artistFeedList")
	public String listpageView(HttpServletRequest request, HttpSession session) {
		
		
		return "artistfeed/artistFeedList";
	}
}

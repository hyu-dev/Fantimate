package com.kh.fantimate.feed.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/artistfeed")
public class ArtistFeedController {

	@GetMapping("/artistFeedList")
	public String listpageView() {
		
		return "artistfeed/artistFeedList";
	}
}

package com.kh.fantimate.feed.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/feed")
public class ArtistFeedController {

	@GetMapping("/artist/artistFeedList")
	public String listpageView() {
		
		return "feed/artist/artistFeedList";
	}
}

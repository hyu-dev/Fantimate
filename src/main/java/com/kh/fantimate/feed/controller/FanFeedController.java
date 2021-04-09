package com.kh.fantimate.feed.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.feed.model.service.FanFeedService;
import com.kh.fantimate.feed.model.vo.Feed;


@Controller
@RequestMapping("/fanfeed")
public class FanFeedController {
	
	@Autowired
	private FanFeedService fService;
	
	// 팬 피드로 이동
	@GetMapping("/fanFeedList")
	public String listpageView() {
		
		return "fanfeed/fanFeedList";
	}
	
	// 게시글 작성 (작성자 닉네임, 작성자 프로필 사진, 아티스트의 그룹명 넘겨받아야 함) 
	@PostMapping("/insert")
	public void insertFeed(HttpServletResponse response,
							Feed f, 
							@RequestParam(value="uploadFile") MultipartFile file,
						   HttpServletRequest request)
							throws IOException{
		
		
		
		
		
		List<Attachment> attList = new ArrayList<>();
		Attachment att = null;
		
		// 업로드 파일 서버에 저장
		// 파일이 첨부 되었다면
		if(!file.getOriginalFilename().equals("")) {
			att = new Attachment();
			// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
			String renameFileName = saveFile(file, request);
			// DB에 저장하기 위한 파일명 세팅
			if(renameFileName != null) {
				att.setAttClName(file.getOriginalFilename());
				att.setAttSvName(renameFileName);
				attList.add(att);
			}
		}
		
		System.out.println(f);
		System.out.println(file);
		
		int result = fService.insertFeed(f, attList);
		
		if(result > 0) {
			response.sendRedirect("fanFeedList");
		} else {
			System.out.println("게시글 등록에 실패하였습니다");
		}
		
		
		
	}


	public String saveFile(MultipartFile main, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) folder.mkdirs(); // -> 해당 경로가 존재하지 않는다면 디렉토리 생성
		
		// 파일명 리네임 규칙 "년월일시분초_랜덤값.확장자"
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = main.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + "_"
							+ (int)(Math.random() * 100000) + "."
							+ originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName; // 저장하고자하는 경로 + 파일명
		
		try {
			main.transferTo(new File(renamePath));
			// => 업로드 된 파일 (MultipartFile) 이 rename명으로 서버에 저장
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 에러 : " + e.getMessage());
		} 
		return renameFileName;
	}
	

}

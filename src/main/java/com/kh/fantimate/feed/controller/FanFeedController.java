package com.kh.fantimate.feed.controller;

import java.io.File;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.common.model.vo.Subscribe;
import com.kh.fantimate.feed.model.service.FanFeedService;
import com.kh.fantimate.feed.model.vo.AttachmentF;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.feed.model.vo.FeedCollection;
import com.kh.fantimate.member.model.vo.Member;


@Controller
@RequestMapping("/fanfeed")
@SessionAttributes({"subList"})
public class FanFeedController {
	
	@Autowired
	private FanFeedService fService;
	
	// 팬 피드로 이동
//	@GetMapping("/fanFeedList")
//	public String listpageView() {
		
//		return "fanfeed/fanFeedList";
//	}
	
	// 구독유저 닉네임 조회
	
	
	
	
	
	// 게시글 조회
	@GetMapping("/fanFeedList")
	public ModelAndView fanFeedList(ModelAndView mv,
									@ModelAttribute Subscribe s,
									@ModelAttribute FeedCollection fc,
									@ModelAttribute Member m,
									@ModelAttribute Feed f,
									@ModelAttribute Attachment at,
									@ModelAttribute AttachmentF pt,
									@ModelAttribute Reply r,
									Model model,
									HttpServletRequest request) {
		
		// 세션에 로그인 유저 닉네임 담아서 리스트 페이지로 보내기
		
		// 게시글 불러올 때 필요한 리스트
		
		List<Subscribe> subList = fService.selectSubList();
	//	System.out.println("구독 유저 리스트 : " + subList);
		
		List<Feed> list = fService.selectFeedList();
		System.out.println("게시글 리스트 : " + list);
		
		List<Attachment> atlist = fService.selectatList();
	//	System.out.println("유저 프로필 사진 리스트 : " + atlist);
		
		List<AttachmentF> ptlist = fService.selectptList();
		System.out.println("게시글 사진 리스트 : " + ptlist);
		
		List<FeedCollection> flist = fService.selectfcList();
		System.out.println("컬렉션 리스트 : " + flist);
		
		List<Reply> rlist = fService.selectReplyList();
	//	System.out.println("댓글 리스트 : " + rlist);
		
		
		
		
		if(flist != null && !flist.isEmpty()) {
			mv.addObject("subList", subList);
			mv.addObject("list", list);
			mv.addObject("flist", flist);
			mv.addObject("rlist", rlist);
			mv.addObject("ptlist", ptlist);
			mv.addObject("atlist", atlist);
			mv.setViewName("fanfeed/fanFeedList");
			
		} else {
			mv.addObject("msg", "조회된 리스트가 없습니다.");
			mv.setViewName("fanfeed/fanFeedList");
		}
		return mv;
	}
	
	// 게시글 작성 (작성자 닉네임, 작성자 프로필 사진, 아티스트의 그룹명 넘겨받아야 함) 
	@PostMapping("/insert")
	public void insertFeed(HttpServletResponse response,
							Feed f,
							@RequestParam(value="uploadFile1") MultipartFile one,
							@RequestParam(value="uploadFile2") MultipartFile two,
							@RequestParam(value="uploadFile3") MultipartFile three,
							@RequestParam(value="uploadFile4") MultipartFile four,
						   HttpServletRequest request)
							throws IOException{
		
		List<AttachmentF> attList = new ArrayList<>();
		AttachmentF att = null;
		
		// 업로드 파일 서버에 저장
		// 파일이 첨부 되었다면
		if(!one.getOriginalFilename().equals("")) {
			att = new AttachmentF();
			String reNameFileName = saveFile(one, request);
			// DB에 저장하기 위한 파일명 세팅
			if(reNameFileName != null) {
				att.setAttClName(one.getOriginalFilename());
				att.setAttSvName(reNameFileName);
				attList.add(att);
			}
		} if(!two.getOriginalFilename().equals("")) {
			att = new AttachmentF();
			String reNameFileName = saveFile(two, request);
			// DB에 저장하기 위한 파일명 세팅
			if(reNameFileName != null) {
				att.setAttClName(two.getOriginalFilename());
				att.setAttSvName(reNameFileName);
				attList.add(att);
			}
		} if(!three.getOriginalFilename().equals("")) {
			att = new AttachmentF();
			String reNameFileName = saveFile(three, request);
			// DB에 저장하기 위한 파일명 세팅
			if(reNameFileName != null) {
				att.setAttClName(three.getOriginalFilename());
				att.setAttSvName(reNameFileName);
				attList.add(att);
			}
		} if(!four.getOriginalFilename().equals("")) {
			att = new AttachmentF();
			String reNameFileName = saveFile(four, request);
			// DB에 저장하기 위한 파일명 세팅
			if(reNameFileName != null) {
				att.setAttClName(four.getOriginalFilename());
				att.setAttSvName(reNameFileName);
				attList.add(att);
			}
		}
		//System.out.println(artiName);
		System.out.println(f);
		System.out.println("사진이름1 : " + one.getOriginalFilename());
		System.out.println("사진이름2 : " + two.getOriginalFilename());
		System.out.println("사진이름3 : " + three.getOriginalFilename());
		System.out.println("사진이름4 : " + four.getOriginalFilename());
		System.out.println("사진 리스트 : " + attList);
		
		int result = fService.insertFeed(f, attList);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "게시글이 등록되었습니다.");
			response.sendRedirect("fanFeedList");
		} else {
			System.out.println("게시글 등록에 실패하였습니다");
		}
		
		
		
	}


	public String saveFile(MultipartFile one, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) folder.mkdirs(); // -> 해당 경로가 존재하지 않는다면 디렉토리 생성
		
		// 파일명 리네임 규칙 "년월일시분초_랜덤값.확장자"
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = one.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + "_"
							+ (int)(Math.random() * 100000) 
							+ originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName; // 저장하고자하는 경로 + 파일명
		
		try {
			one.transferTo(new File(renamePath));
			// => 업로드 된 파일 (MultipartFile) 이 rename명으로 서버에 저장
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 에러 : " + e.getMessage());
		} 
		return renameFileName;
	}
	
	// 게시글 수정 팝업창 열기
	@GetMapping("/updateView")
	public String updateFeedView() {
		return "fanfeed/fanfeedupdate";
	}
	
	// 게시글 수정
	@RequestMapping("/update")
	public void updateFeed(HttpServletResponse response,
						   Feed f,
						   HttpServletRequest request,
						   @RequestParam(value="uploadFile1") MultipartFile one,
						   @RequestParam(value="uploadFile2") MultipartFile two,
						   @RequestParam(value="uploadFile3") MultipartFile three,
						   @RequestParam(value="uploadFile4") MultipartFile four) {
		
		List<Attachment> attList = new ArrayList<>();
		Attachment att = null;
		
		// 업로드 파일 서버에 저장
		// 파일 첨부가 정상적으로 동작했다면
		if(!one.getOriginalFilename().equals("")) {
			// 새로운 데이터가 담겼다면 기존 데이터 삭제
		}
	}
	
	// 게시글 삭제
	
	// 댓글 작성
	@PostMapping("/insertReply")
	public void insertReply(HttpServletResponse response,
							Reply r,
							HttpServletRequest request) throws IOException {
		
		System.out.println(r);
		
		int result = fService.insertReply(r);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "댓글이 등록되었습니다.");
			response.sendRedirect("fanFeedList");
		} else {
			System.out.println("댓글 등록에 실패하였습니다");
		}
	}
	
	// 게시글 신고 팝업창 열기
	@GetMapping("/reportView")
	public String reportView() {
		return "common/report";
	}
	
	
}

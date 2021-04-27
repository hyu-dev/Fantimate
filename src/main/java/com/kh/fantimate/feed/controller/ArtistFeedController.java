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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fantimate.common.model.vo.Alarm;
import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Like;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.Subscribe;
import com.kh.fantimate.feed.model.service.ArtistFeedService;
import com.kh.fantimate.feed.model.vo.AttachmentF;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.feed.model.vo.FeedCollection;
import com.kh.fantimate.member.model.vo.Artist;
import com.kh.fantimate.member.model.vo.ArtistCollection;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.member.model.vo.Member;

@Controller
@RequestMapping("/artistfeed")
public class ArtistFeedController {

	@Autowired
	private ArtistFeedService aService;
	
	// 게시글 조회
	@GetMapping("/artistFeedList")
	public ModelAndView fanFeedList(ModelAndView mv,
									@ModelAttribute ArtistGroup ag,
									@ModelAttribute Subscribe s,
									@ModelAttribute FeedCollection fc,
									@ModelAttribute Member m,
									@ModelAttribute Feed f,
									@ModelAttribute Attachment at,
									@ModelAttribute AttachmentF pt,
									@ModelAttribute Reply r,
									@ModelAttribute Like lk,
									@ModelAttribute Artist ar,
									@ModelAttribute ArtistCollection ac,
									Model model,
									@RequestParam(value="artNameEn") String artNameEn,
									HttpServletRequest request) {
		
		f.setArtiName(artNameEn);
		s.setArtiname(artNameEn);
		System.out.println(f);
		
		System.out.println("어떤 아티스트 피드인가? : " + artNameEn);
	
		// 게시글 불러올 때 필요한 리스트
		// 1. 게시글 리스트
		List<Feed> list = aService.selectFeedList(artNameEn);
		System.out.println("아티스트 피드 게시글 리스트 : " + list);
		
		// 2. 아티스트 프로필사진 리스트 불러오기
		List<Attachment> aplist = aService.selectapList();
		System.out.println("아티스트 프로필 사진 리스트 : " + aplist);
		
		// 3. 아티스트 정보 불러오기
		List<Artist> alist = aService.selectaList();
		System.out.println("아티스트 정보 조회 : " + alist);
		
		// 4. 게시글 사진 불러오기
		List<AttachmentF> fplist = aService.selectfpList();
		System.out.println("게시글 사진 리스트 : " + fplist);
		
		// 5. 그룹별 아티스트 멤버 불러오기
		List<Artist> gmlist = aService.selectgmList(artNameEn);
		System.out.println("그룹별 아티스트 멤버 정보 : " + gmlist);
		
		// 6. 그룹별 아티스트 정보(사진 포함) 불러오기
		List<ArtistCollection> aclist = aService.selectacList(artNameEn);
		System.out.println("그룹별 아티스트 멤버 정보 + 사진 조회 : " + aclist);
		
		// artiName 세션에 저장
		HttpSession session = request.getSession(); // 세션을 생성해서
		session.setAttribute("artiName", artNameEn); // userid로 uid값을 넘기자
	//	session.setAttribute("subList", subList);
		
		if(list != null && !list.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("aplist", aplist);
			mv.addObject("alist", alist);
			mv.addObject("fplist", fplist);
			mv.addObject("gmlist", gmlist);
			mv.addObject("aclist", aclist);
			mv.setViewName("artistfeed/artistFeedList");
		} else {
			mv.addObject("msg", "조회된 리스트가 없습니다.");
			mv.setViewName("artistfeed/artistFeedList");
		}
		
		return mv;
	}
	
	
	// 게시글 작성
	@PostMapping("/insert")
	public void insertFeed(HttpServletResponse response,
							Feed f,
							Alarm a,
							String writer,
							@RequestParam(value="uploadFile1") MultipartFile one,
							@RequestParam(value="uploadFile2") MultipartFile two,
							@RequestParam(value="uploadFile3") MultipartFile three,
							@RequestParam(value="uploadFile4") MultipartFile four,
						    HttpServletRequest request) throws IOException {
		
		String artiName = (String)request.getSession().getAttribute("artiName");
		
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
			    System.out.println("?? : " + artiName);
				System.out.println(f);
				System.out.println("아티스트사진이름1 : " + one.getOriginalFilename());
				System.out.println("아티스트사진이름2 : " + two.getOriginalFilename());
				System.out.println("아티스트사진이름3 : " + three.getOriginalFilename());
				System.out.println("아티스트사진이름4 : " + four.getOriginalFilename());
				System.out.println("아티스트게시글사진 리스트 : " + attList);
		
				// 1. 게시글내용과 첨부사진이 둘다 등록되거나
				// 2. 게시글은 없고 첨부사진만 등록되거나
				// 3. 게시글은 있고 첨부사진은 없거나
				
				
			
				
				// 1. 알람 받을 구독자들 (먼저 해당 아티스트 구독한 유저 조회) 
				
				List<Subscribe> sblist = aService.selectsblist(artiName);
				System.out.println("구독자 리스트 : " + sblist);
			
		//		System.out.println(writer);
		//		a.setAlContent(writer + "님이 새글을 작성하였습니다.");
				
				System.out.println(a);
				
				
				String alContent = a.getAlContent();
				System.out.println(alContent);
				// 알람 인서트
				
				int result = aService.insertFeed(f, attList, sblist);
			
				if(result > 0) {
					request.getSession().setAttribute("msg", "게시글이 등록되었습니다.");
					response.sendRedirect("artistFeedList?artNameEn=" + artiName);
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
	@RequestMapping("/updateView")
	public String updateFeedView(Model model,
								 HttpServletResponse response,
								 @RequestParam(value="fid") int fid,
								 @RequestParam(value="refId") int refId,
								 HttpServletRequest request) {
		
		// 피드 정보
//		List<Feed> f = aService.selectFeed(fid);
//		model.addAttribute("feed", f);
//		System.out.println("fid : " + fid);
		// 유저 프로필 사진 정보
//		List<Attachment> atlist = fService.selectatList(artNameEn);
//		model.addAttribute("atlist", atlist);
		// 게시글 사진 정보
//		List<AttachmentF> ptlist = aService.selectptList(refId);
//		model.addAttribute("ptlist", ptlist);
		
//		System.out.println("refId : " + refId);
		return "fanfeed/fanfeedupdate";
		
	}
	
	// 게시글 수정
	
	
	
	// 게시글 삭제
	@GetMapping("/delete")
	public void deleteFeed(HttpServletResponse response,
						   int fid,
						   HttpServletRequest request) throws IOException {
		
		String artiName = (String)request.getSession().getAttribute("artiName");
		
		// 1. 서버에서 첨부파일 있을 시 삭제 (deleteFile 메소드 호출)
//		List<AttachmentF> af = fService.selectptList(refId);
		
//		if(af.getRenameFileName() != null) {
//			deleteFile(af.getRenameFileName(), request);
//		}
		
		// 2. fid 가져가서 DB에서 update(bstatus -> N)
			 int result = aService.deleteFeed(fid);
			 
			 if(result > 0) {
				 request.getSession().setAttribute("msg", "게시글이 삭제되었습니다.");
				 response.sendRedirect("artistFeedList?artNameEn=" + artiName);
			 } else {
				 System.out.println("게시글 삭제에 실패하였습니다.");
			 }
	}
	
	// 파일 삭제
	private void deleteFile(String filePath, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
			
		File deleteFile = new File(root + filePath);
		
		if(deleteFile.exists()) {
			deleteFile.delete();
		}
			
	}
	
	// 모먼트 해당 멤버 클릭 시 해당 멤버 게시글 조회
	@RequestMapping("/selectMember")
	public ModelAndView selectMember(HttpServletResponse response,
							 		 ModelAndView mv,
							 		 String writer,
							 		 @ModelAttribute Feed f,
							 		 HttpServletRequest request,
							 		 HttpSession session) throws IOException {
		
		String artNameEn = (String)request.getSession().getAttribute("artiName");
		System.out.println(artNameEn);
	
		System.out.println(writer);
		
		List<Feed> list = aService.selectMember(writer);
		System.out.println(list);
		
		List<Attachment> aplist = aService.selectapList();
		
		List<Artist> alist = aService.selectaList();
		
		List<AttachmentF> fplist = aService.selectfpList();
		
		List<Artist> gmlist = aService.selectgmList(artNameEn);
		
		List<ArtistCollection> aclist = aService.selectacList(artNameEn);
		
		if(list != null && !list.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("aplist", aplist);
			mv.addObject("alist", alist);
			mv.addObject("fplist", fplist);
			mv.addObject("gmlist", gmlist);
			mv.addObject("aclist", aclist);
			mv.setViewName("artistfeed/artistFeedList");
		} else {
			request.getSession().setAttribute("msg", "존재하는 게시글이 없습니다.");
			
		}
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

package com.kh.fantimate.feed.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.fantimate.common.model.vo.Alarm;
import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Friend;
import com.kh.fantimate.common.model.vo.Like;
import com.kh.fantimate.common.model.vo.Message;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.Report;
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
	
		String artiId = ((Member)request.getSession().getAttribute("loginUser")).getId();
		System.out.println("로그인한 유저 아티스트 아이디 : " + artiId);
		
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
		
		// 로그인한 아티스트 정보 불러오기
		List<Artist> onelist = aService.selectaList(artiId);
		System.out.println("로그인한 아티스트 정보 조회 : " + onelist);
		
		// 4. 게시글 사진 불러오기
		List<AttachmentF> fplist = aService.selectfpList();
		System.out.println("게시글 사진 리스트 : " + fplist);
		
		// 5. 그룹별 아티스트 멤버 불러오기
		List<Artist> gmlist = aService.selectgmList(artNameEn);
		System.out.println("그룹별 아티스트 멤버 정보 : " + gmlist);
		
		// 6. 그룹별 아티스트 정보(사진 포함) 불러오기
		List<ArtistCollection> aclist = aService.selectacList(artNameEn);
		System.out.println("그룹별 아티스트 멤버 정보 + 사진 조회 : " + aclist);
		
		// 7.한 게시글에서 좋아요 누른 유저
		List<Like> lklist = aService.selectLikeList();
		System.out.println("좋아유 누른 유저 리스트 : " + lklist);
		
		// 8. 댓글 리스트
		List<Reply> rlist = aService.selectReplyList();
		System.out.println("댓글 리스트 : " + rlist);
		
		// 9. 유저 프로필 사진 리스트
		List<Attachment> atlist = aService.selectatList(artNameEn);
		System.out.println("유저 프로필 사진 리스트 : " + atlist);
		
		// 10. 댓글 좋아요 누른 유저
		List<Like> rlklist = aService.selectRLikeList();
		System.out.println("댓글 좋아유 누른 유저 리스트 : " + rlklist);
		
		// artiName 세션에 저장
		HttpSession session = request.getSession(); // 세션을 생성해서
		session.setAttribute("artiName", artNameEn); // userid로 uid값을 넘기자
	//	session.setAttribute("subList", subList);
		
		if(gmlist != null && !gmlist.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("aplist", aplist);
			mv.addObject("alist", alist);
			mv.addObject("fplist", fplist);
			mv.addObject("gmlist", gmlist);
			mv.addObject("aclist", aclist);
			mv.addObject("lklist", lklist);
			mv.addObject("rlist", rlist);
			mv.addObject("atlist", atlist);
			mv.addObject("onelist", onelist);
			
			mv.setViewName("artistfeed/artistFeedList");
		} else {
			mv.addObject("msg", "조회된 리스트가 없습니다.");
			mv.setViewName("artistfeed/artistFeedList");
		}
		
		return mv;
	}
	
	
	// 게시글 작성
	@PostMapping("/insert")
	public String insertFeed(HttpServletResponse response,
							Feed f,
							Alarm a,
							String writer,
							Model model,
							RedirectAttributes rd,
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
					rd.addFlashAttribute("msg", "게시글이 등록되었습니다.");
					return "redirect:/artistfeed/artistFeedList?artNameEn=" + artiName;
				} else {
					rd.addFlashAttribute("msg", "게시글 등록에 실패하였습니다.");
					return "redirect:/artistfeed/artistFeedList?artNameEn=" + artiName;
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
			mv.addObject("msg", "조회된 리스트가 없습니다.");
			
		}
		return mv;
	}
	
	// 좋아요 등록 / 취소 
	@PostMapping("/like")
	public @ResponseBody Map<String, String> feedLike(Like like,
			 				@RequestParam(value="type")String type,
		 				int fid,
		 				String id){
	
	System.out.println("피드번호뜨니??????" + fid);
	like.setId(id);
	like.setRefId(fid);
	
	String msg = "";
	int result = 0;
	int countLike = 0;
	switch(type) {
	case "등록" : 
		result = aService.insertLike2(like, fid);
		countLike = aService.selectLike2(fid);
		msg = result > 0 ? "좋아요가 등록 되었습니다" : "좋아요 등록에 실패하였습니다";
		break;
	case "취소" :
		result = aService.deleteLike2(like,fid);
		countLike = aService.selectLike2(fid);
		msg = result > 0 ? "좋아요가 취소되었습니다" : "좋아요 취소 실패하였습니다";
		break;
	
	}
	
	String count = Integer.toString(countLike);
	System.out.println("countㄴㄴㄴㄴㄴ:" + count);
	Map<String, String> map = new HashMap<>();
	map.put("msg", msg);
	map.put("count", count);
		return map;
		
		
	}
	
	//likeCount
	// 알람 갯수 카운트 (세션에 담기)
	@RequestMapping(value="/likeCount", produces="application/json; charset=utf-8")
	public @ResponseBody String countLike(int fid) {
		
		int countLike = aService.selectLike2(fid);
		
	
		return new Gson().toJson(countLike);
		
	}
	
	// 댓글 작성
	@PostMapping("/insertReply")
	public void insertReply(HttpServletRequest request,
							HttpServletResponse response,
							Reply r,
							Alarm a,
							@RequestParam(value="writer") String writer,
		   				@RequestParam(value="id") String id,
						HttpSession session) throws IOException {
	
	String artiName = (String)request.getSession().getAttribute("artiName");
	
	System.out.println("댓글에서 아트네임 넘어오냐: " + artiName);
	System.out.println(r);
	
	// 알람 내용에 댓글 작성자 들어가야하고 아이디에 게시글 작성자 들어가야댐
	a.setId(id);
	a.setAlContent(writer + " 님이  댓글을 작성하였습니다.");
	
	int result = aService.insertReply(r, a);
	
	if(result > 0) {
	
		request.getSession().setAttribute("msg", "댓글이 등록되었습니다.");
		response.sendRedirect("artistFeedList?artNameEn=" + artiName);
	
	} else {
		System.out.println("댓글 등록에 실패하였습니다");
		}
	}
	
	// 댓글 삭제
	@RequestMapping("/deleteReply")
	public void deleteReply(HttpServletResponse response,
							Reply r,
							int rid,
							HttpServletRequest request,
							HttpSession session) throws IOException {
		
		String artiName = (String)request.getSession().getAttribute("artiName");
	
	System.out.println(rid);
	
	int result = aService.deleteReply(rid);
	
	if(result > 0) {
		request.getSession().setAttribute("msg", "댓글이 삭제되었습니다.");
		response.sendRedirect("artistFeedList?artNameEn=" + artiName);
	} else {
		request.getSession().setAttribute("msg", "댓글삭제에 실패하였습니다.");
		}
	}
	
	// 댓글 좋아요 등록 / 취소 
		@PostMapping("/rlike")
		public @ResponseBody Map<String, String> feedRLike(Like like,
				 				@RequestParam(value="type")String type,
				 				int rid,
				 				String id){
			
			System.out.println("댓글번호뜨니??????" + rid);
			like.setId(id);
			like.setRefId(rid);
			
			String msg = "";
			int result = 0;
			int countLike = 0;
			switch(type) {
			case "등록" : 
				result = aService.insertLike3(like, rid);
				countLike = aService.selectLike3(rid);
				msg = result > 0 ? "좋아요가 등록 되었습니다" : "좋아요 등록에 실패하였습니다";
				break;
			case "취소" :
				result = aService.deleteLike3(like,rid);
				countLike = aService.selectLike3(rid);
				msg = result > 0 ? "좋아요가 취소되었습니다" : "좋아요 취소 실패하였습니다";
				break;
			
			}
			
			String count = Integer.toString(countLike);
			System.out.println("countㄴㄴㄴㄴㄴ:" + count);
			Map<String, String> map = new HashMap<>();
			map.put("msg", msg);
			map.put("count", count);
			return map;
			
			
		}
		
		//likeCount
		// 알람 갯수 카운트 (세션에 담기)
		@RequestMapping(value="/likeRCount", produces="application/json; charset=utf-8")
		public @ResponseBody String countRLike(int rid) {
			
			int countLike = aService.selectLike3(rid);
			
	
			return new Gson().toJson(countLike);
			
		}
	
		// 댓글 신고 팝업창 열기
		@RequestMapping("/reportReplyView")
		public String reportReplyView(Model model,
								HttpServletResponse response,
								int rid,
								HttpServletRequest request) {
			
			System.out.println("신고할 댓글 번호 : " + rid);
			
			List<Reply> r = aService.selectReply(rid);
			
			return "artistfeed/replyreport";
		}
	
	// 댓글 신고
	@RequestMapping("/reportReply")
	public String reportReply(HttpServletResponse response,
			   				Report r,
			   				Reply rp,
			   				Alarm a,
			   				HttpServletRequest request,
			   				@RequestParam(value="rptType") String rptType,
			   				@RequestParam(value="rptReason") String rptReason,
			   				@RequestParam(value="rptId") String rptId,
			   				@RequestParam(value="refId") int refId,
			   				Model model,
			   				HttpSession session) {
		System.out.println(rptType);
		System.out.println(rptReason);
		System.out.println(rptId);
		System.out.println(refId);
		
		System.out.println("알람 받을 아이디 : " + "admin");
		a.setRef_id(refId);
		a.setAlContent(rptId + " 님이 " + refId + "번 게시글을 신고하였습니다.");
		System.out.println(a);
		
		int result = aService.insertReplyReport(r, a);
		
		if(result > 0) {
			model.addAttribute("msg", "success");
			return "artistfeed/replyreport";
			
		} else {
			model.addAttribute("msg", "fail");
			return "artistfeed/replyreport";
		}	
	}
	
	// 쪽지 창 열기
	@RequestMapping("/messageView")
	
	public String messageView(Model model,
							  HttpServletResponse response,
							  String writer,
							  HttpServletRequest request,
							  HttpSession session) {
		
		System.out.println("받는이 : " + writer);
		
		return "artistfeed/amessage";
		
	}
	
	// 쪽지 보내기
	@RequestMapping("/message")
	public String insertMessage(HttpServletResponse response,
							  HttpServletRequest request,
							  Model model,
							  Message m,
							  @RequestParam(value="messRecId") String messRecId,
				   			  @RequestParam(value="messTitle") String messTitle,
				   			  @RequestParam(value="messContent") String messContent,
				   			  @RequestParam(value="messSendId") String messSendId) {
		
		System.out.println("받는이 : " + messRecId);
		System.out.println("제목 : " + messTitle);
		System.out.println("내용 : " + messContent);
		System.out.println("보내는 사람 : " + messSendId);
		
		int result = aService.insertMessage(m);
		
		if(result > 0) {
			model.addAttribute("msg", "success");
			return "artistfeed/amessage";
		} else {
			model.addAttribute("msg", "fail");
			return "artistfeed/amessage";
		}
		
	}
	
	// 친구 신청
	@RequestMapping("/insertFriend")
	public void insertFriend(HttpServletResponse response,
							Friend f,
							String frRecId,
							String frSend,
							Alarm a,
							HttpServletRequest request,
							HttpSession session) throws IOException { 
	
		String artiName = (String)request.getSession().getAttribute("artiName");
		
		System.out.println("친구 신청한 유저 : " + frSend);
		System.out.println("친구 신청 받은 유저 : " + frRecId);
		a.setId(frRecId);
		System.out.println("알람 받을 아이디 : " + frRecId);
		a.setAlContent(frSend + " 님이 친구신청을 하였습니다.");
		if(frSend.equals(frRecId)) {
			// 애초에 이렇게 넘어와서는 안되지만 혹시라도 넘어온다면
			request.getSession().setAttribute("msg", "본인에게 친구신청은 불가합니다");
			response.sendRedirect("artistFeedList?artNameEn=" + artiName);
		} else {
			System.out.println(a);
			// 친구신청이 중복인지 확인하기
			int isAlready = aService.isAlreadyAppliedFriend(frSend, frRecId);
			if(isAlready > 0) {
				// 친구신청이 되어있다면
				request.getSession().setAttribute("msg", "친구신청목록이 존재합니다. 마이페이지를 확인하세요");
				response.sendRedirect("artistFeedList?artNameEn=" + artiName);
			} else {
				// 친구신청이 안되어 있다면
				int result = aService.insertFriend(f, a);
				if(result > 0) { 
					request.getSession().setAttribute("msg", "친구신청이 완료되었습니다.");
					response.sendRedirect("artistFeedList?artNameEn=" + artiName);
				} else {
				  request.getSession().setAttribute("msg", "친구신청에 실패하였습니다.");
				  response.sendRedirect("artistFeedList?artNameEn=" + artiName);
				}  
			}
		}
	}
	
	
	
	
	
}

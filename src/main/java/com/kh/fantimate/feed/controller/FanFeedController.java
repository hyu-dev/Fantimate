package com.kh.fantimate.feed.controller;

import java.io.File;



import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Friend;
import com.kh.fantimate.common.model.vo.Like;
import com.kh.fantimate.common.model.vo.Message;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.common.model.vo.Subscribe;
import com.kh.fantimate.feed.model.service.FanFeedService;
import com.kh.fantimate.feed.model.vo.AttachmentF;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.feed.model.vo.FeedCollection;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.member.model.vo.Member;




@Controller
@RequestMapping("/fanfeed")
public class FanFeedController {
	
	@Autowired
	private FanFeedService fService;
	
	// 게시글 조회
	@GetMapping("/fanFeedList")
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
									
									Model model,
									@RequestParam(value="artNameEn") String artNameEn,
									HttpServletRequest request) {
		
		
		f.setArtiName(artNameEn);
		s.setArtiname(artNameEn);
		System.out.println(f);
		
		System.out.println("어떤 아티스트 팬 피드인가? : " + artNameEn);
		// 게시글 불러올 때 필요한 리스트
		
		List<Subscribe> subList = fService.selectSubList(artNameEn);
		System.out.println("구독 유저 리스트 : " + subList);
		
		List<Feed> list = fService.selectFeedList(artNameEn);
		System.out.println("게시글 리스트 : " + list);
		
		List<Attachment> atlist = fService.selectatList();
		System.out.println("유저 프로필 사진 리스트 : " + atlist);
		
		List<AttachmentF> ptlist = fService.selectptList();
		System.out.println("게시글 사진 리스트 : " + ptlist);
		
		List<FeedCollection> flist = fService.selectfcList();
		System.out.println("컬렉션 리스트 : " + flist);
		
		List<Reply> rlist = fService.selectReplyList();
		System.out.println("댓글 리스트 : " + rlist);
		
		List<Like> lklist = fService.selectLikeList();
		System.out.println("좋아유 누른 유저 리스트 : " + lklist);
		
		
		
		// artiName 세션에 저장
		HttpSession session = request.getSession(); // 세션을 생성해서
		session.setAttribute("artiName", artNameEn); // userid로 uid값을 넘기자
		
		if(list != null && !list.isEmpty()) {
			model.addAttribute("subList", subList);
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
	@RequestMapping("/updateView")
	public String updateFeedView(Model model,
								HttpServletResponse response,
			   					@RequestParam(value="fid") int fid,
			   					@RequestParam(value="refId") int refId,
			   					HttpServletRequest request) {
		// 피드 정보
		List<Feed> f = fService.selectFeed(fid);
		model.addAttribute("feed", f);
		System.out.println("fid : " + fid);
		// 유저 프로필 사진 정보
		List<Attachment> atlist = fService.selectatList();
		model.addAttribute("atlist", atlist);
		// 게시글 사진 정보
		List<AttachmentF> ptlist = fService.selectptList(refId);
		model.addAttribute("ptlist", ptlist);
		
		System.out.println("refId : " + refId);
		return "fanfeed/fanfeedupdate";
	}
	
	// 게시글 수정
	@RequestMapping("/update")
	public void updateFeed(HttpServletResponse response,
						   Feed f,
						   HttpServletRequest request,
						   @RequestParam(value="uploadFile1") MultipartFile one,
						   @RequestParam(value="oneSvName") String oneSvName,
						   @RequestParam(value="oneClName") String oneClName,
						   @RequestParam(value="uploadFile2") MultipartFile two,
						   @RequestParam(value="twoSvName") String twoSvName,
						   @RequestParam(value="twoClName") String twoClName,
						   @RequestParam(value="uploadFile3") MultipartFile three,
						   @RequestParam(value="threeSvName") String threeSvName,
						   @RequestParam(value="threeClName") String threeClName,
						   @RequestParam(value="uploadFile4") MultipartFile four,
						   @RequestParam(value="fourSvName") String fourSvName,
						   @RequestParam(value="fourClName") String fourClName
						  ) throws IOException {
		
		List<AttachmentF> attList = new ArrayList<>();
		AttachmentF att = null;
		
		// 업로드 파일 서버에 저장
		// 파일 첨부가 정상적으로 동작했다면
		if(!one.getOriginalFilename().equals("")) {
			// 새로운 데이터가 담겼다면 기존 데이터 삭제
			if(oneSvName != null) {
				deleteFile(("resources/uploadFiles/" + oneSvName), request);
			}
			att = new AttachmentF();
			String renameFileName = saveFile(one, request);
			// DB에 저장하기 위한 파일명 세팅
			if(renameFileName != null) {
				att.setAttClName(one.getOriginalFilename());
				att.setAttSvName(renameFileName);
				attList.add(att);
			}
		} else {
				// 파일이 변경되지 않았다면 기존파일을 넣는다
				att = new AttachmentF();
				att.setAttClName(oneClName);
				att.setAttSvName(oneSvName);
				attList.add(att);
		}
		
		 if(!two.getOriginalFilename().equals("")) {
			if(twoSvName != null) {
				deleteFile(("resources/uploadFiles/" + twoSvName), request);
			}
			att = new AttachmentF();
			String renameFileName = saveFile(two, request);
			if(renameFileName != null) {
				att.setAttClName(two.getOriginalFilename());
				att.setAttSvName(renameFileName);
				attList.add(att);
			}
		} else {
			// 파일이 변경되지 않았다면 기존파일을 넣는다
			att = new AttachmentF();
			att.setAttClName(twoClName);
			att.setAttSvName(twoSvName);
			attList.add(att);
		}
		 
		 if(!three.getOriginalFilename().equals("")) {
			if(threeSvName != null) {
				deleteFile(("resources/uploadFiles/" + threeSvName), request);
			}
			att = new AttachmentF();
			String renameFileName = saveFile(three, request);
			if(renameFileName != null) {
				att.setAttClName(three.getOriginalFilename());
				att.setAttSvName(renameFileName);
				attList.add(att);
			}
		} else {
				// 파일이 변경되지 않았다면 기존파일을 넣는다
				att = new AttachmentF();
				att.setAttClName(threeClName);
				att.setAttSvName(threeSvName);
				attList.add(att);
		}
		 
		 if(!four.getOriginalFilename().equals("")) {
			if(fourSvName != null) {
				deleteFile(("resources/uploadFiles/" + fourSvName), request);
			}
			att = new AttachmentF();
			String renameFileName = saveFile(three, request);
			if(renameFileName != null) {
				att.setAttClName(four.getOriginalFilename());
				att.setAttSvName(renameFileName);
				attList.add(att);
			}
		} else {
			// 파일이 변경되지 않았다면 기존파일을 넣는다
			att = new AttachmentF();
			att.setAttClName(fourClName);
			att.setAttSvName(fourSvName);
			attList.add(att);
		}
		 	System.out.println(f);
			System.out.println("바뀐사진이름1 : " + one.getOriginalFilename());
			System.out.println("바뀐사진이름2 : " + two.getOriginalFilename());
			System.out.println("바뀐사진이름3 : " + three.getOriginalFilename());
			System.out.println("바뀐사진이름4 : " + four.getOriginalFilename());
			System.out.println("사진 리스트 : " + attList);
		
			
			
		 
			int result = fService.updateFeed(f, attList);
			
			if(result > 0) {
				request.getSession().setAttribute("msg", "게시글이 등록되었습니다.");
				response.sendRedirect("fanFeedList");
			} else {
				System.out.println("게시글 수정에 실패하였습니다.");
			}
		 
	}
	
	// 게시글 삭제
	@GetMapping("/delete")
	public void deleteFeed(HttpServletResponse response,
							@ModelAttribute ArtistGroup ag,
							@ModelAttribute Subscribe s,
							int fid,
							Model model,
							HttpServletRequest request
							) throws IOException {
		// 1. 서버에서 첨부파일 있을 시 삭제 (deleteFile 메소드 호출)
//		List<AttachmentF> af = fService.selectptList(refId);
		
//		if(af.getRenameFileName() != null) {
//			deleteFile(af.getRenameFileName(), request);
//		}
		
		// 2. fid 가져가서 DB에서 update(bstatus -> N)
			int result = fService.deleteFeed(fid);
			
		// 3. 게시글 목록으로 재요청
		if(result > 0) {
		//	String artNameEn = ((List<Subscribe>)request.getSession().getAttribute("subList")).get(0).getArtiname();
		//	HttpSession session = request.getSession();
		//	model.addAttribute("artNameEn", artNameEn);
		//	model.addAttribute("subList", subList);
			
		//	session.setAttribute("artNameEn", artNameEn);
			
			request.getSession().setAttribute("msg", "게시글이 삭제되었습니다.");
			response.sendRedirect("fanFeedList");
		
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
	@RequestMapping("/reportView")
	public String reportView(Model model,
							HttpServletResponse response,
							int fid,
							HttpServletRequest request) {
		
		System.out.println("신고할 게시글 번호 : " + fid);
		
		List<Feed> f = fService.selectFeed(fid);
		
		return "fanfeed/feedreport";
	}
	
	// 게시글 신고
	@RequestMapping("/report")
	
	public String reportFeed(HttpServletResponse response,
			   				Feed f,
			   				Report r,
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
		
		int result = fService.insertFeedReport(r);
		
		if(result > 0) {
			model.addAttribute("msg", "success");
			return "fanfeed/feedreport";
			
		} else {
			model.addAttribute("msg", "fail");
			return "fanfeed/feedreport";
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
		
		return "fanfeed/fmessage";
		
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
		
		int result = fService.insertMessage(m);
		
		if(result > 0) {
			model.addAttribute("msg", "success");
			return "fanfeed/fmessage";
		} else {
			model.addAttribute("msg", "fail");
			return "fanfeed/fmessage";
		}
		
	}
	
   // 댓글 삭제
	@RequestMapping("/deleteReply")
	public void deleteReply(HttpServletResponse response,
							Reply r,
							int rid,
							HttpServletRequest request,
							HttpSession session) throws IOException {
		
		System.out.println(rid);
		
		int result = fService.deleteReply(rid);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "댓글이 삭제되었습니다.");
			response.sendRedirect("fanFeedList");
		} else {
			request.getSession().setAttribute("msg", "댓글삭제에 실패하였습니다.");
		}
	}
	
	// 댓글 신고 팝업창 열기
		@RequestMapping("/reportReplyView")
		public String reportReplyView(Model model,
								HttpServletResponse response,
								int rid,
								HttpServletRequest request) {
			
			System.out.println("신고할 댓글 번호 : " + rid);
			
			List<Reply> r = fService.selectReply(rid);
			
			return "fanfeed/replyreport";
		}
	
	// 댓글 신고
	@RequestMapping("/reportReply")
	public String reportReply(HttpServletResponse response,
			   				Report r,
			   				Reply rp,
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
		
		int result = fService.insertReplyReport(r);
		
		if(result > 0) {
			model.addAttribute("msg", "success");
			return "fanfeed/replyreport";
			
		} else {
			model.addAttribute("msg", "fail");
			return "fanfeed/feedreport";
		}	
	}
	
   // 게시글 좋아요 처리
	@PostMapping(value="/insertLike", produces="application/json; charset=utf-8")
	public @ResponseBody String insertLike(Like l, int refId, 
										   int flike,
										   Feed f,
										   HttpSession session) {
		f.setFid(refId);
		int result = fService.insertLike(l, f);
		
		// 응답 작성
		Gson gson = new GsonBuilder()
					.create();
		
		return gson.toJson(result);
		
	}
	
	// 친구 신청
	@RequestMapping("/insertFriend")
	public void insertFriend(HttpServletResponse response,
							Friend f,
							String frRecId,
							String frSend,
							HttpServletRequest request,
							HttpSession session) throws IOException { 
	
//	String frSend = ((Member)request.getSession().getAttribute("loginUser")).getId();
	
	System.out.println("친구 신청한 유저 : " + frSend);
	System.out.println("친구 신청 받은 유저 : " + frRecId);
	
		int result = fService.insertFriend(f);
		
		
		
		  if(result > 0) { 
			  request.getSession().setAttribute("msg", "친구신청이 완료되었습니다.");
			  response.sendRedirect("fanFeedList");
		  } else {
			  request.getSession().setAttribute("msg", "친구신청에 실패하였습니다.");
			  response.sendRedirect("fanFeedList");
		  }
		
		  
		 
	}
}

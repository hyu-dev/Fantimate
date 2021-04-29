package com.kh.fantimate.mypage2.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Like;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.ReplyCollection;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.feed.model.vo.FeedCollection;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.Artist;
import com.kh.fantimate.member.model.vo.ArtistCollection;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.mypage2.model.service.MypageService;
import com.kh.fantimate.official.model.vo.MediaCollection;
import com.kh.fantimate.store.model.vo.Store;
import com.kh.fantimate.store.model.vo.StoreCollection;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	private MypageService mService;

	// 마이페이지 아티스트 메인(피드)페이지 & 메인에 뿌려질 피드 전체 리스트 출력
	@GetMapping("/artist/feed")
	public ModelAndView artistMain(ModelAndView mv, HttpServletRequest request) {
		
		ArtistCollection arti = (ArtistCollection)request.getSession().getAttribute("artist");
		//System.out.println("아티스트 정보 : " + arti);
		
		// 아티스트 아이디
		String id = arti.getArtist().getArtiId();
		// 아티스트명(그룹)
		String artiName = arti.getArtist().getArtiNameEn();
		
		// 피드 리스트 가져오기
		List<Feed> feed = mService.selectFeedList(id);
		System.out.println(feed);
		// 피드 이미지 가져오기
		List<FeedCollection> attachment = mService.selectFeedImage(id);
		System.out.println(attachment);
		// 댓글 리스트 호출
		List<ReplyCollection> comment = mService.selectReplyList(artiName);
		System.out.println(comment);
		System.out.println("----");
		
		if(arti != null) {
			// 해당 아티스트 정보
			mv.addObject("arti", arti);
			mv.setViewName("mypage/artist/feed");
		}
		
		if(feed != null) {
			// 피드 리스트, 피드 이미지
			mv.addObject("feed", feed);
			mv.addObject("attachment", attachment);
			mv.addObject("comment", comment);
		}
		
		return mv;
	}
	
	// 마이페이지 아티스트 북마크 페이지 & 북마크에 뿌려질 피드 전체 리스트 출력
	@GetMapping("/artist/bookmarks")
	public ModelAndView artistBookmark(ModelAndView mv, HttpServletRequest request) {
		ArtistCollection arti = (ArtistCollection)request.getSession().getAttribute("artist");
		
		// 아티스트 아이디
		String id = arti.getArtist().getArtiId();
		// 아티스트명(그룹)
		String artiName = arti.getArtist().getArtiNameEn();
		
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("artiName", artiName);
		
		// 북마크(피드/미디어) 리스트 가져오기
		List<FeedCollection> feed = mService.selectBookmarkList(map);
		System.out.println("북마크 피드 : " + feed);
		List<MediaCollection> media = mService.selectMediaList(id);
		System.out.println("북마크 미디어 : " + media);
		// 북마크(피드) 이미지 가져오기
		List<FeedCollection> attachment = mService.selectBookmarkImage(map);
		System.out.println("북마크 : " + attachment);
		// 북마크(피드/미디어) 댓글 리스트 호출
		List<ReplyCollection> feedCmt = mService.selectBookmarkReplyList(map);
		System.out.println("북마크 피드 댓글 : " + feedCmt);
		List<ReplyCollection> mediaCmt = mService.selectMediaReplyList(map);
		System.out.println("북마크 미디어 댓글 : " + mediaCmt);
		System.out.println("----");
		
		if(arti != null) {
			// 해당 아티스트 정보
			mv.addObject("arti", arti);
			mv.setViewName("mypage/artist/bookmark");
		}
		
		if(feed != null) {
			// 피드 리스트, 피드 이미지
			mv.addObject("feed", feed);
			mv.addObject("attachment", attachment);
			mv.addObject("feedCmt", feedCmt);
		}
		
		if(media != null) {
			mv.addObject("media", media);
			mv.addObject("mediaCmt", mediaCmt);
		}
		
		return mv;
	}
	
	// 좋아요 추가하기
	@PostMapping(value="/insertLike", produces="application/json; charset=utf-8")
	public @ResponseBody void insertLike(Reply r, HttpServletRequest request, Model model) {
		ArtistCollection arti = (ArtistCollection)request.getSession().getAttribute("artist");
		
		Map<Object, Object> map = new HashMap<>();
		map.put("id", arti.getArtist().getArtiId());
		map.put("rid", r.getRid());
		
		// 좋아요 삭제
		int result = mService.insertLike(map);
		
		if(result > 0) {
			System.out.println("좋아요 추가 성공");
		} else {
			System.out.println("좋아요 추가 실패");
		}
	}
	
	// 좋아요 삭제하기
	@PostMapping(value="/deleteLike", produces="application/json; charset=utf-8")
	public @ResponseBody void deleteLike(Reply r, Like l, HttpServletRequest request, Model model) {
		// 좋아요 삭제
		int result = mService.deleteLike(r, l);
		
		if(result > 0) {
			System.out.println("좋아요 삭제 성공");
		} else {
			System.out.println("좋아요 삭제 실패");
		}
	}

	// 댓글 삭제하기
	@PostMapping(value="/deleteReply", produces="application/json; charset=utf-8")
	public @ResponseBody void deleteReply(Reply r, HttpServletRequest request, Model model) {
		ArtistCollection arti = (ArtistCollection)request.getSession().getAttribute("artist");
		
		// 아티스트 아이디
		r.setWriter(arti.getArtist().getArtiId());
		System.out.println("전송할 댓글 : " + r);
		// 아티스트명(그룹)
		String artiName = arti.getArtist().getArtiNameEn();
		System.out.println("그룹 이름 : " + artiName);
		
		// 댓글 삭제하고 리스트 재생성
		List<ReplyCollection> comment = mService.deleteReply(r, artiName);
		System.out.println("재생성할 댓글 : " + comment);
		
		if(comment != null) {
			model.addAttribute("comment", comment);
		} else {
			System.out.println("댓글없음");
		}
	}
	
	// 내 댓글 삭제하기
	@PostMapping(value="/deleteMyReply", produces="application/json; charset=utf-8")
	public @ResponseBody void deleteMyReply(Reply r, HttpServletRequest request, Model model) {
		ArtistCollection arti = (ArtistCollection)request.getSession().getAttribute("artist");
		
		// 아티스트 아이디
		r.setWriter(arti.getArtist().getArtiId());
		System.out.println("전송할 댓글 : " + r);
		
		// 댓글 삭제하기
		int result = mService.deleteMyReply(r);
		
		if(result > 0) {
			System.out.println("내 댓글 삭제 성공");
		} else {
			System.out.println("내 댓글 삭제 실패");
		}
	}
	
	// 댓글 신고하기
	@PostMapping(value="/reportReply", produces="application/json; charset=utf-8")
	public @ResponseBody void reportReply(Report r, HttpServletRequest request, Model model) {
		ArtistCollection arti = (ArtistCollection)request.getSession().getAttribute("artist");
		
		// 신고하는 사람 아이디(아티스트)
		r.setRptId(arti.getArtist().getArtiId());
		System.out.println("전송할 신고 : " + r);
		
		// 댓글 신고하기
		int result = mService.reportReply(r);
		
		if(result > 0) {
			System.out.println("신고 성공");
		} else {
			System.out.println("신고 실패");
		}
	}
	
	// 마이페이지 아티스트 코멘트 페이지 & 코멘트 페이지에 뿌려질 전체 리스트 출력
	@GetMapping("/artist/comments")
	public ModelAndView artistComment(ModelAndView mv, HttpServletRequest request) {
		ArtistCollection arti = (ArtistCollection)request.getSession().getAttribute("artist");
		
		// 아티스트 아이디
		String id = arti.getArtist().getArtiId();
		// 아티스트명(그룹)
		String artiName = arti.getArtist().getArtiNameEn();
		
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("artiName", artiName);
		
		// 내가 쓴 댓글 리스트 가져오기
		List<ReplyCollection> comment = mService.selectMyCommentList(id);
		System.out.println("내 댓글 : " + comment);
		System.out.println("----");
		
		if(arti != null) {
			// 해당 아티스트 정보
			mv.addObject("arti", arti);
			mv.addObject("comment", comment);
			mv.setViewName("mypage/artist/comment");
		}
		
		return mv;
	}
	
	// 마이페이지 소속사 메인 페이지 & 메인 페이지에 뿌려질 전체 리스트 출력
	@GetMapping("/agency/main")
	public ModelAndView agencyMain(ModelAndView mv, HttpServletRequest request) {
		Agency agency = (Agency)request.getSession().getAttribute("agency");
		
		// 소속사 아이디
		String id = agency.getAgId();
		
		// 소속 아티스트 목록 전체 불러오기(관리 페이지로 넘어가기 위해)
		List<ArtistGroup> artist = mService.selectArtistList(id);
		// System.out.println("아티스트 전체 목록 : " + artist);

		
		// 솔로 아티스트 불러오기
		List<ArtistGroup> solo = mService.selectSolo(id);
		// System.out.println("솔로 아티스트 : " + solo);
		
		// 그룹 아티스트 불러오기
		List<ArtistGroup> team = mService.selectTeam(id);
		// System.out.println("그룹 아티스트 : " + team);
		
		// 그룹 멤버 불러오기
		List<Artist> member = mService.selectMember(id);
		// System.out.println("멤버 개인 : " + member);
		// System.out.println("----");
		
		if(agency != null) {
			// 해당 아티스트 정보
			mv.addObject("agency", agency);
			mv.addObject("artist", artist);
			mv.addObject("solo", solo);
			mv.addObject("team", team);
			mv.addObject("member", member);
			mv.setViewName("mypage/agency/main");
		}
		
		return mv;
	}
	
	// 소속사 프로필 수정하기
	@PostMapping(value="/updateAgencyProfile", produces="application/json; charset=utf-8")
	public @ResponseBody String updateAgencyProfile(Member m, Agency a, 
												  HttpServletRequest request) {
		Agency agency = (Agency)request.getSession().getAttribute("agency");
		a.setAgId(agency.getAgId());
		
		// 소속사 프로필 수정하기
		int result = mService.updateAgencyProfile(a, m);
		
		if(result > 0) {
			System.out.println("프로필 수정 성공");
		} else {
			System.out.println("프로필 수정 실패");
		}
		
		// 다시 솔로 리스트 반환하기
		Agency ag = mService.selectAgencyProfile(agency.getAgId());
		return new Gson().toJson(ag);
	}
	
	// 아티스트 솔로 삭제하기
	@PostMapping(value="/deleteArtistSolo", produces="application/json; charset=utf-8")
	public @ResponseBody String deleteArtistSolo(Artist a, HttpServletRequest request) {
		Agency agency = (Agency)request.getSession().getAttribute("agency");
		
		// System.out.println(a);
		
		Map<String, String> map = new HashMap<>();
		map.put("artiNameEn", a.getArtiNameEn());
		map.put("agencyId", agency.getAgId());
		
		// 아티스트 솔로 아이디 불러오기
		String id = mService.selectArtistSoloId(map);
		// 아티스트 솔로 삭제하기
		int result = mService.deleteMemberSolo(id);
		// 아티스트 메인 솔로 삭제하기
		int result2 = mService.deleteMain(map);
		
		if(result > 0) {
			System.out.println("솔로 삭제 성공");
		} else {
			System.out.println("솔로 삭제 실패");
		}
		
		if(result2 > 0) {
			System.out.println("메인에서 삭제 성공");
			return "성공";
		} else {
			System.out.println("메인에서 삭제 실패");
			return "실패";
		}
	}
	
	// 아티스트 개인 삭제하기
	@PostMapping(value="/deleteArtistOne", produces="application/json; charset=utf-8")
	public @ResponseBody String deleteArtistOne(Member m, HttpServletRequest request) {
		Agency agency = (Agency)request.getSession().getAttribute("agency");
		
		// System.out.println(m);
		
		// 아티스트 개인 아이디 불러오기
		String id = mService.selectArtistOneId(m.getName());
		
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("agencyId", agency.getAgId());
		
		int result = mService.deleteMemberOne(map);
		
		if(result > 0) {
			System.out.println("개인 삭제 성공");
			return "성공";
		} else {
			System.out.println("개인 삭제 실패");
			return "실패";
		}
	}
	
	// 아티스트 그룹 삭제하기
	@PostMapping(value="/deleteArtistGroup", produces="application/json; charset=utf-8")
	public @ResponseBody String deleteArtistGroup(ArtistGroup a, HttpServletRequest request) {
		Agency agency = (Agency)request.getSession().getAttribute("agency");
		
		// System.out.println(a);
		
		Map<String, String> map = new HashMap<>();
		map.put("artiNameEn", a.getArtNameEn());
		map.put("agencyId", agency.getAgId());

		// 아티스트 메인 그룹 삭제하기
		int result = mService.deleteMain(map);
		
		if(result > 0) {
			System.out.println("메인에서 삭제 성공");
			return "성공";
		} else {
			System.out.println("메인에서 삭제 실패");
			return "실패";
		}
	}
	
	// 아티스트 솔로 등록하기
	@PostMapping(value="/enrollArtistSolo", produces="application/json; charset=utf-8")
	public @ResponseBody String enrollArtistSolo(ArtistGroup ag, Artist a, Attachment att, 
											   Member m, HttpServletRequest request,
											   @RequestParam(value="soloAttClName") MultipartFile file) {
		Agency agency = (Agency)request.getSession().getAttribute("agency");
		
		// System.out.println("artistGroup : " + ag + ", attachment : " + att + "member : " + m);
		
		ag.setAgId(agency.getAgId());
		a.setAgencyId(agency.getAgId());
		
		// 대문자로 변환
		String originName = ag.getArtNameEn().toUpperCase();
		String originName2 = a.getArtiNameEn().toUpperCase();
		ag.setArtNameEn(originName);
		a.setArtiNameEn(originName2);
		
		// 사진이 등록되었을 때
		if(!file.getOriginalFilename().equals("")) {
			att = new Attachment();
			String renameFileName = saveFile(file, request);
			
			// DB에 저장하기 위해 att에 저장
			if(renameFileName != null) {
				att.setAttClName(file.getOriginalFilename());
				att.setAttSvName(renameFileName);
			}
		}
		
		// 회원 등록하기
		int result1 = mService.enrollMember(m);
		// 메인에 아티스트 등록하기
		int result2 = mService.enrollArtistMain(ag, att);
		// 아티스트 솔로 등록하기
		int result3 = mService.enrollArtistSolo(a, att);
		
		if(result1 > 0) {
			System.out.println("회원 등록 성공");
		} else {
			System.out.println("회원 등록 실패");
		}
		
		if(result2 > 0) {
			System.out.println("메인에 등록 성공");
		} else {
			System.out.println("메인에 등록 실패");
		}
		
		if(result3 > 0) {
			System.out.println("아티스트 등록 성공");
		} else {
			System.out.println("아티스트 등록 실패");
		}
		
		// 다시 솔로 리스트 반환하기
		List<ArtistGroup> solo = mService.selectSolo(agency.getAgId());
		
		return new Gson().toJson(solo);
	}

	// 아티스트 메인 등록하기
	@PostMapping(value="/enrollArtistGroup", produces="application/json; charset=utf-8")
	public @ResponseBody String enrollArtistGroup(ArtistGroup ag, Attachment att, 
												  HttpServletRequest request, 
												  @RequestParam(value="groupAttClName") MultipartFile file) {
		Agency agency = (Agency)request.getSession().getAttribute("agency");
		
		ag.setAgId(agency.getAgId());
		
		// 대문자로 변환
		String originName = ag.getArtNameEn().toUpperCase();
		ag.setArtNameEn(originName);
		
		// 사진이 등록되었을 때
		if(!file.getOriginalFilename().equals("")) {
			att = new Attachment();
			String renameFileName = saveFile(file, request);
			
			// DB에 저장하기 위해 att에 저장
			if(renameFileName != null) {
				att.setAttClName(file.getOriginalFilename());
				att.setAttSvName(renameFileName);
			}
		}
		
		// 메인에 아티스트 등록하기
		int result = mService.enrollArtistMain(ag, att);
		
		if(result > 0) {
			System.out.println("메인에 등록 성공");
			return "성공";
		} else {
			System.out.println("메인에 등록 실패");
			return "실패";
		}
	}
	
	// 아티스트 개인 등록하기
	@PostMapping(value="/enrollArtistOne", produces="application/json; charset=utf-8")
	public @ResponseBody String enrollArtistOne(Artist a, Attachment att, 
											    Member m, HttpServletRequest request,
											    @RequestParam(value="oneAttClName") MultipartFile file) {
		// 소속사 정보
		Agency agency = (Agency)request.getSession().getAttribute("agency");
		a.setAgencyId(agency.getAgId());
		
		// 사진이 등록되었을 때
		if(!file.getOriginalFilename().equals("")) {
			att = new Attachment();
			String renameFileName = saveFile(file, request);
			
			// DB에 저장하기 위해 att에 저장
			if(renameFileName != null) {
				att.setAttClName(file.getOriginalFilename());
				att.setAttSvName(renameFileName);
			}
		}
		
		// 회원 등록하기
		int result1 = mService.enrollMember(m);
		// 아티스트 개인 등록하기
		int result2 = mService.enrollArtistOne(a, att);
		
		if(result1 > 0) {
			System.out.println("회원 등록 성공");
		} else {
			System.out.println("회원 등록 실패");
		}
		
		if(result2 > 0) {
			System.out.println("아티스트 등록 성공");
			return "성공";
		} else {
			System.out.println("아티스트 등록 실패");
			return "실패";
		}
	}
	
	// 프로필 사진 저장 경로
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);
		
		// -> 해당 경로가 존재하지 않는다면 디렉토리 생성
		if(!folder.exists()) folder.mkdirs();
		
		// 파일명 리네임 규칙 "년월일시분초_랜덤값.확장자"
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + "_"
							+ (int)(Math.random() * 100000) 
							+ originalFileName.substring(originalFileName.lastIndexOf("."));
		
		// 저장하고자하는 경로 + 파일명
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
			// => 업로드 된 파일 (MultipartFile) 이 rename명으로 서버에 저장
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 에러 : " + e.getMessage());
		} 
		
		return renameFileName;
	}
	
	// 마이페이지 소속사 스토어 관리 페이지 & 스토어 관리 페이지에 뿌려질 전체 리스트 출력
	@GetMapping("/agency/store")
	public ModelAndView agencyStoreAdmin(String artiName, String category, 
										 ModelAndView mv, HttpServletRequest request) {
		Agency agency = (Agency)request.getSession().getAttribute("agency");
		
		// 스토어 리스트 가져오기
		List<StoreCollection> store = mService.selectStoreList(artiName);
		
		if(category == "" || category == null) {
			mv.addObject("agency", agency);
			mv.addObject("store", store);
			mv.addObject("artiName", artiName);
			mv.setViewName("mypage/agency/store");
		} else {
			mv.addObject("agency", agency);
			mv.addObject("store", store);
			mv.addObject("artiName", artiName);
			mv.setViewName("mypage/agency/store");
		}
		
		return mv;
	}
	
	// 마이페이지 소속사 메인 페이지 & 메인 페이지에 뿌려질 전체 리스트 출력
	@GetMapping("/agency/media")
	public ModelAndView agencyMediaAdmin(ModelAndView mv, HttpServletRequest request) {
		Agency agency = (Agency)request.getSession().getAttribute("agency");
		
		// 소속사 아이디
		String id = agency.getAgId();
		
		// 소속 아티스트 목록 전체 불러오기(관리 페이지로 넘어가기 위해)
		List<ArtistGroup> artist = mService.selectArtistList(id);
		// System.out.println("아티스트 전체 목록 : " + artist);

		
		// 솔로 아티스트 불러오기
		List<ArtistGroup> solo = mService.selectSolo(id);
		// System.out.println("솔로 아티스트 : " + solo);
		
		// 그룹 아티스트 불러오기
		List<ArtistGroup> team = mService.selectTeam(id);
		// System.out.println("그룹 아티스트 : " + team);
		
		// 그룹 멤버 불러오기
		List<Artist> member = mService.selectMember(id);
		// System.out.println("멤버 개인 : " + member);
		// System.out.println("----");
		
		if(agency != null) {
			// 해당 아티스트 정보
			mv.addObject("agency", agency);
			mv.addObject("artist", artist);
			mv.addObject("solo", solo);
			mv.addObject("team", team);
			mv.addObject("member", member);
			mv.setViewName("mypage/agency/main");
		}
		
		return mv;
	}
	
	// 스토어 삭제하기
	@PostMapping(value="/deleteStoreItem", produces="application/json; charset=utf-8")
	public @ResponseBody String deleteStoreItem(String pname, String artiName, HttpServletRequest request) {
		
		System.out.println("pname : " + pname);
		System.out.println("artiName : " + artiName);
		// 스토어 삭제하기
		int result = mService.deleteStoreItem(pname);
		
		if(result > 0) {
			System.out.println("스토어 삭제 성공");
		} else {
			System.out.println("스토어 삭제 실패");
		}

		// 스토어 리스트 가져오기
		List<StoreCollection> store = mService.selectStoreList(artiName);
		
		return new Gson().toJson(store);
	}
}

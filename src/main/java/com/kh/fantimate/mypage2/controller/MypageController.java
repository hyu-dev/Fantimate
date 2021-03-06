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
import com.kh.fantimate.official.model.service.OfficialService;
import com.kh.fantimate.official.model.vo.MediaCategory;
import com.kh.fantimate.official.model.vo.MediaCollection;
import com.kh.fantimate.official.model.vo.MediaFile;
import com.kh.fantimate.official.model.vo.Official;
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
		
		if(r.getCategory().equals("OFFICIAL")) {
			// 미디어 댓글 삭제하기
			int result = mService.deleteMyMediaReply(r.getRid());
			
			if(result > 0) {
				System.out.println("내 댓글 삭제 성공");
			} else {
				System.out.println("내 댓글 삭제 실패");
			}
		} else {
			// 보드 댓글 삭제하기
			int result = mService.deleteMyReply(r.getRid());
			
			if(result > 0) {
				System.out.println("내 댓글 삭제 성공");
			} else {
				System.out.println("내 댓글 삭제 실패");
			}
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
			System.out.println(agency);
		}
		
		return mv;
	}
	
	// 마이페이지 소속사 스토어 관리 페이지 & 스토어 관리 페이지에 뿌려질 전체 리스트 출력
	@GetMapping("/agency/store")
	public ModelAndView agencyStoreAdmin(String artiName, String category, String search,
										 ModelAndView mv, HttpServletRequest request) {
		Agency agency = (Agency)request.getSession().getAttribute("agency");
		
		// 소속 아티스트 목록 전체 불러오기(관리 페이지로 넘어가기 위해)
		List<ArtistGroup> artist = mService.selectArtistList(agency.getAgId());
		
		mv.addObject("agency", agency);
		mv.addObject("artist", artist);
		mv.addObject("artiName", artiName);
		
		if(category == "" && search == "") {
			// 스토어 리스트 가져오기
			List<StoreCollection> store = mService.selectStoreList(artiName);
			mv.addObject("store", store);
			
		} else if(category != "" && search == "") {
			
			Map<String, String> map = new HashMap<>();
			map.put("artiName", artiName);
			map.put("category", category);
			
			// 카테고리 검색 결과 가져오기
			List<StoreCollection> store = mService.selectCategoryStoreList(map);
			
			mv.addObject("store", store);
			mv.addObject("category", category);

		} else if(category == "" && search != "") {
			
			Map<String, String> map = new HashMap<>();
			map.put("artiName", artiName);
			map.put("search", search);
			
			// 카테고리 검색 결과 가져오기
			List<StoreCollection> store = mService.selectSearchStoreList(map);
			
			mv.addObject("store", store);
			mv.addObject("search", search);

		} else {
			// 스토어 리스트 가져오기
			List<StoreCollection> store = mService.selectStoreList(artiName);
			mv.addObject("store", store);
		}
		
		mv.setViewName("mypage/agency/store");
		
		return mv;
	}
		
	// 마이페이지 소속사 미디어 관리 페이지 & 미디어 관리 페이지에 뿌려질 전체 리스트 출력
	@GetMapping("/agency/media")
	public ModelAndView agencyMediaAdmin(String artiName, String category, String search,
										 ModelAndView mv, HttpServletRequest request) {
		Agency agency = (Agency)request.getSession().getAttribute("agency");
		
		// 소속 아티스트 목록 전체 불러오기(관리 페이지로 넘어가기 위해)
		List<ArtistGroup> artist = mService.selectArtistList(agency.getAgId());
		// 카테고리 목록 불러오기
		List<MediaCategory> cate = mService.selectCategory(artiName);
		
		mv.addObject("artist", artist);
		mv.addObject("agency", agency);
		mv.addObject("cate", cate);
		mv.addObject("artiName", artiName);
		
		if(category == "" && search == "") {
			// 미디어 리스트 가져오기
			List<MediaCollection> media = mService.selectMediaAdminList(artiName);
			mv.addObject("media", media);
			
		} else if(category != "" && search == "") {
			Map<String, String> map = new HashMap<>();
			map.put("artiName", artiName);
			map.put("category", category);
			
			// 카테고리 검색 결과 가져오기
			//List<MediaCollection> media = mService.selectCategoryMediaList(map);
			//mv.addObject("media", media);
			mv.addObject("category", category);
			
		} else if(category == "" && search != "") {
			Map<String, String> map = new HashMap<>();
			map.put("artiName", artiName);
			map.put("search", search);
			
			// 카테고리 검색 결과 가져오기
			//List<MediaCollection> media = mService.selectSearchMediaList(map);
			//mv.addObject("media", media);
			mv.addObject("search", search);
			
		} else {
			// 미디어 리스트 가져오기
			List<MediaCollection> media = mService.selectMediaAdminList(artiName);
			mv.addObject("media", media);
		}
		
		mv.setViewName("mypage/agency/media");
		
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
	@PostMapping(value="/deleteArtistSolo")
	public @ResponseBody Map<String, String> deleteArtistSolo(Artist a, HttpServletRequest request) {
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
		boolean flag = true;
		if(result > 0) {
			System.out.println("솔로 삭제 성공");
		} else {
			System.out.println("솔로 삭제 실패");
			flag = false;
		}
		
		if(result2 > 0) {
			System.out.println("메인에서 삭제 성공");
		} else {
			System.out.println("메인에서 삭제 실패");
			flag = false;
		}
		String msg = "";
		if(flag)
			msg = "아티스트가 정상적으로 삭제되었습니다"; 
		else 
			msg = "아티스트 삭제에 실패하였습니다";
		
		Map<String, String> resultMsg = new HashMap<>();
		resultMsg.put("msg", msg);
		return resultMsg;
	}
	
	// 아티스트 개인 삭제하기
	@PostMapping(value="/deleteArtistOne")
	public @ResponseBody Map<String, String> deleteArtistOne(String id, HttpServletRequest request) {
		Agency agency = (Agency)request.getSession().getAttribute("agency");
		
		// 아티스트 개인 아이디 불러오기
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("agencyId", agency.getAgId());
		
		int result = mService.deleteMemberOne(map);
		boolean flag = true;
		if(result > 0) {
			System.out.println("개인 삭제 성공");
		} else {
			System.out.println("개인 삭제 실패");
			flag = false;
		}
		
		String msg = "";
		if(flag)
			msg = "아티스트가 정상적으로 삭제되었습니다"; 
		else 
			msg = "아티스트 삭제에 실패하였습니다";
		
		Map<String, String> resultMsg = new HashMap<>();
		resultMsg.put("msg", msg);
		return resultMsg;
		
	}
	
	// 아티스트 그룹 삭제하기
	@PostMapping(value="/deleteArtistGroup")
	public @ResponseBody Map<String, String> deleteArtistGroup(ArtistGroup a, HttpServletRequest request) {
		Agency agency = (Agency)request.getSession().getAttribute("agency");
		
		System.out.println(a);
		
		Map<String, String> map = new HashMap<>();
		map.put("artiNameEn", a.getArtNameEn());
		map.put("agencyId", agency.getAgId());

		// 아티스트 메인 그룹 삭제하기
		int result = mService.deleteMain(map);
		boolean flag = true;
		if(result > 0) {
			System.out.println("메인에서 삭제 성공");
		} else {
			System.out.println("메인에서 삭제 실패");
			flag = false;
		}
		
		String msg = "";
		if(flag)
			msg = "아티스트가 정상적으로 삭제되었습니다"; 
		else 
			msg = "아티스트 삭제에 실패하였습니다";
		
		Map<String, String> resultMsg = new HashMap<>();
		resultMsg.put("msg", msg);
		return resultMsg;
	}
	
	// 솔로 아이디 확인
	@PostMapping(value="/checkSoloId", produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, String> checkSoloId(String id, HttpServletRequest request) {
		
		String soloId = mService.checkMemberId(id);
		boolean flag = true;
		
		if(soloId != null || !soloId.equals("")) {
			System.out.println("아이디 존재");
			flag = false;
		} else {
			System.out.println("아이디 없음");
		}

		String msg = "";
		
		if(flag) 
			msg = "사용가능한 아이디입니다"; 
		else 
			msg = "이미 존재하는 아이디입니다";
		
		Map<String, String> map = new HashMap<>();
		map.put("msg", msg);
		return map;
	}
	
	// 개인 아이디 확인
	@PostMapping(value="/checkOneId", produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, String> checkOneId(String id, HttpServletRequest request) {
		
		String oneId = mService.checkMemberId(id);
		boolean flag = true;
		
		if(oneId != null || !oneId.equals("")) {
			System.out.println("아이디 존재");
			flag = false;
		} else {
			System.out.println("아이디 없음");
		}

		String msg = "";
		
		if(flag) 
			msg = "사용가능한 아이디입니다"; 
		else 
			msg = "이미 존재하는 아이디입니다";
		
		Map<String, String> map = new HashMap<>();
		map.put("msg", msg);
		return map;
	}
	
	// 아티스트 솔로 등록하기
	@PostMapping(value="/enrollArtistSolo")
	public @ResponseBody Map<String, String> enrollArtistSolo(ArtistGroup ag, Artist a, Attachment att, 
											   Member m, HttpServletRequest request,
											   @RequestParam(value="soloAttClName") MultipartFile file) {
		Agency agency = (Agency)request.getSession().getAttribute("agency");
		ag.setAgId(agency.getAgId());
		a.setAgencyId(agency.getAgId());
		System.out.println("artistGroup : " + ag + ", attachment : " + att + "member : " + m);
		System.out.println(file.getOriginalFilename());
		
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
		
		boolean flag = true;
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
			flag = false;
		}
		
		if(result2 > 0) {
			System.out.println("메인에 등록 성공");
		} else {
			System.out.println("메인에 등록 실패");
			flag = false;
		}
		
		if(result3 > 0) {
			System.out.println("아티스트 등록 성공");
		} else {
			System.out.println("아티스트 등록 실패");
			flag = false;
		}
		
		String msg = "";
		if(flag) 
			msg = "아티스트가 정상적으로 등록되었습니다."; 
		else 
			msg = "아티스트 등록에 실패하였습니다";
		
		Map<String, String> map = new HashMap<>();
		map.put("msg", msg);
		return map;
	}

	// 아티스트 메인 등록하기
	@PostMapping(value="/enrollArtistGroup")
	public @ResponseBody Map<String, String> enrollArtistGroup(ArtistGroup ag, Attachment att, 
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
		boolean flag = true;
		if(result > 0) {
			System.out.println("메인에 등록 성공");
		} else {
			System.out.println("메인에 등록 실패");
			flag = false;
		}
		
		String msg = "";
		if(flag) 
			msg = "아티스트가 정상적으로 등록되었습니다."; 
		else 
			msg = "아티스트 등록에 실패하였습니다";
		
		Map<String, String> map = new HashMap<>();
		map.put("msg", msg);
		return map;
	}
	
	// 아티스트 개인 등록하기
	@PostMapping(value="/enrollArtistOne", produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, String> enrollArtistOne(Artist a, Attachment att, 
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
		boolean flag = true;
		if(result1 > 0) {
			System.out.println("회원 등록 성공");
		} else {
			System.out.println("회원 등록 실패");
			flag = false;
		}
		
		if(result2 > 0) {
			System.out.println("아티스트 등록 성공");
		} else {
			System.out.println("아티스트 등록 실패");
			flag = false;
		}
		
		String msg = "";
		if(flag) 
			msg = "아티스트가 정상적으로 등록되었습니다."; 
		else 
			msg = "아티스트 등록에 실패하였습니다";
		
		Map<String, String> map = new HashMap<>();
		map.put("msg", msg);
		return map;
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
	
	// 미디어 등록하기
	@PostMapping(value="/insertMedia")
	public ModelAndView insertMedia(ModelAndView mv, Official o, MediaFile att, MediaCategory mc, 
										  String addCate, HttpServletRequest request,
										  @RequestParam(value="picName") MultipartFile picName,
										  @RequestParam(value="vidName") MultipartFile vidName) {
		Agency agency = (Agency)request.getSession().getAttribute("agency");
		
		// System.out.println(picName.getOriginalFilename());
		// System.out.println(vidName.getOriginalFilename());
		
		System.out.println("official: " + o + "MediaCategory : " + mc);
		System.out.println("addCate : " + addCate);
		
		// 카테고리 추가가 있을 경우
		if(addCate != null && !addCate.equals("")) {
			
			// 카테고리 중복 등록을 막기 위해 확인
			int cateCheck = 0;
			List<MediaCategory> cate = mService.selectCategory(mc.getArtiNameEn());
			
			for(int i=0; i < cate.size(); i++) {
				if(addCate.equals(cate.get(i).getCateName())) {
					cateCheck++;
				}
			}
			
			// 중복이 없을 경우
			if(cateCheck == 0) {
				// 카테고리 대문자로 변환
				mc.setCateName(addCate.toUpperCase());
				// 카테고리 등록
				System.out.println("tngod");
				int result1 = mService.insertMediaCategory(mc);
				
				if(result1 > 0) {
					System.out.println("카테고리 등록 성공");
				} else {
					System.out.println("카테고리 등록 실패");
				}
			}
		}
		
		// 유료 상품 유무 확인
		int price = o.getMediaPay();
		if(price != 0 ) {
			o.setIsPay("Y");
		} else {
			o.setIsPay("N");
		}
		
		// 카테고리 번호 연결
		int cateCode = 0;
		
		List<MediaCategory> cate = mService.selectCategory(mc.getArtiNameEn());
		
		for(int i=0; i < cate.size(); i++) {
			if(mc.getCateName().equals(cate.get(i).getCateName())) {
				cateCode = cate.get(i).getCateCode();
				o.setCateCode(cateCode);
				
				System.out.println("for문 catecode : " + cateCode);
			}
		}
		
		o.setCateCode(cateCode);
		System.out.println("catecode : " + cateCode);
		
		int result2 = mService.insertOfficial(o);
		
		if(result2 > 0) {
			System.out.println("미디어 등록 성공");
		} else {
			System.out.println("미디어 등록 실패");
		}
		
		att = new MediaFile();
		
		// 사진이 등록되었을 때
		if(!picName.getOriginalFilename().equals("")) {
			String renameFileName1 = saveFile(picName, request);
			
			// DB에 저장하기 위해 att에 저장
			if(renameFileName1 != null) {
				att.setPicClName(picName.getOriginalFilename());
				att.setPicSvName(renameFileName1);
			}
		}
		
		// 영상이 등록되었을 때
		if(!vidName.getOriginalFilename().equals("")) {
			String renameFileName2 = saveFile(vidName, request);
			
			// DB에 저장하기 위해 att에 저장
			if(renameFileName2 != null) {
				att.setVidClName(vidName.getOriginalFilename());
				att.setVidSvName(renameFileName2);
			}
		}
		
		// 미디어 파일 등록
		int result3 = mService.insertMediaFile(att);
		
		if(result3 > 0) {
			System.out.println("미디어 파일 등록 성공");
		} else {
			System.out.println("미디어 파일 등록 실패");
		}
		
		// 소속 아티스트 목록 전체 불러오기(관리 페이지로 넘어가기 위해)
		List<ArtistGroup> artist = mService.selectArtistList(agency.getAgId());
		// 미디어 리스트 가져오기
		List<MediaCollection> media = mService.selectMediaAdminList(mc.getArtiNameEn());
		
		mv.addObject("media", media);
		mv.addObject("cate", cate);
		mv.addObject("artiName", mc.getArtiNameEn());
		mv.addObject("artist", artist);
		mv.addObject("agency", agency);
		mv.setViewName("mypage/agency/media");
		
		return mv;
	}
	
	// 사진 저장 경로
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
	
	// 미디어 삭제하기
	@PostMapping(value="/deleteMediaItem", produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, String> deleteMediaItem(String mediaTtl, HttpServletRequest request) {
		
		// 미디어 삭제하기
		int result = mService.deleteMediaItem(mediaTtl);
		boolean flag = true;
		
		if(result > 0) {
			System.out.println("미디어 삭제 성공");
		} else {
			System.out.println("미디어 삭제 실패");
			flag = false;
		}

		String msg = "";
		if(flag) 
			msg = "미디어가 정상적으로 삭제되었습니다."; 
		else 
			msg = "미디어 삭제에 실패하였습니다";
		
		Map<String, String> map2 = new HashMap<>();
		map2.put("msg", msg);
		return map2;
	}
}

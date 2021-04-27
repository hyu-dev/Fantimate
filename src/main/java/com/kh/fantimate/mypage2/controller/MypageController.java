package com.kh.fantimate.mypage2.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fantimate.common.model.vo.Like;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.ReplyCollection;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.feed.model.vo.FeedCollection;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.Artist;
import com.kh.fantimate.member.model.vo.ArtistCollection;
import com.kh.fantimate.mypage2.model.service.MypageService;
import com.kh.fantimate.official.model.vo.MediaCollection;

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
		r.setId(arti.getArtist().getArtiId());
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
		List<ReplyCollection> comment = mService.selectMyCommentList(map);
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
		
		// 소속 아티스트 목록 불러오기
		List<Artist> artist = mService.selectArtistList(id);
		System.out.println(artist);
		System.out.println("----");
		
		if(agency != null) {
			// 해당 아티스트 정보
			mv.addObject("agency", agency);
			mv.setViewName("mypage/agency/main");
		}
		
		return mv;
	}
}

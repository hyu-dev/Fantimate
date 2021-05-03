package com.kh.fantimate.official.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.fantimate.common.model.vo.BookMark;
import com.kh.fantimate.common.model.vo.Friend;
import com.kh.fantimate.common.model.vo.Like;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.ReplyCollection;
import com.kh.fantimate.member.model.vo.Admin;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.ArtistCollection;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.member.model.vo.User;
import com.kh.fantimate.member.model.vo.UserCollection;
import com.kh.fantimate.official.model.service.OfficialService;
import com.kh.fantimate.official.model.vo.MediaCategory;
import com.kh.fantimate.official.model.vo.MediaCollection;
import com.kh.fantimate.official.model.vo.Official;
import com.kh.fantimate.pay.model.vo.Cart;

@Controller
@RequestMapping("/official")
public class OfficialController {
	@Autowired
	private OfficialService oService;

	// 오피셜 메인페이지 & 메인에 뿌려질 미디어 전체 리스트 출력
	@GetMapping("/media/main")
	public ModelAndView officialMain(ModelAndView mv, HttpServletRequest request) {
		String artiName = ((String)request.getSession().getAttribute("artiName"));
		
		// 미디어 전체 리스트 호출을 위한 카테고리 선택
		List<MediaCategory> category = oService.selectCategory(artiName);
		
		// 미디어 전체 리스트 호출
		List<MediaCollection> list = oService.selectAllMediaList(artiName);
		
		// 업로드 최신순으로 4개의 미디어 리스트 호출
		List<MediaCollection> slide = oService.selectNewMediaList(artiName);

		// System.out.println(category);
		// System.out.println(list);
		// System.out.println(slide);
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		System.out.println(loginUser);
		
		if(loginUser.getClassifyMem() == 1) {
			List<UserCollection> userColl = (List<UserCollection>)request.getSession().getAttribute("user");
			mv.addObject("userColl", userColl.get(0));
		}
		
		if(list != null) {
			mv.addObject("category", category);
			mv.addObject("list", list);
			mv.addObject("slide", slide);
			mv.addObject("loginUser", loginUser);
			mv.setViewName("official/media/main");
		} 
		
		return mv;
	}
	
	// 미디어 개수 조회하기
	@PostMapping(value="/countMedia", produces="application/json; charset=utf-8")
	public @ResponseBody int countMedia(HttpServletRequest request) {
		String artiName = ((String)request.getSession().getAttribute("artiName"));
		
		int count = oService.countMedia(artiName);
		System.out.println("미디어 개수 : " + count);
		
		return count;
	}
	
	// 장바구니에 등록하기
	@PostMapping(value="/media/insertCart", produces="application/json; charset=utf-8")
	public @ResponseBody void insertCart(@RequestParam(value="mediaNum") int mediaNum, 
										 @RequestParam(value="mediaPay") int mediaPay, 
										 HttpServletRequest request) {
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
		
		System.out.println("mediaNum = " + mediaNum + ", mediaPay = "+ mediaPay);
		
		Cart cart = new Cart();		
		cart.setMediaNum(mediaNum);
		cart.setBuyPrice(mediaPay);
		cart.setId(userId);
		cart.setBuyQ(1);
		
		// 장바구니에 해당 미디어 추가(유료)
		int result = oService.insertCart(cart);
		System.out.println("장바구니 : " + cart);
		
		if(result > 0) {
			System.out.println("입력 성공");
		} else {
			System.out.println("입력 실패");
		}
	}
	
	// 검색
	@GetMapping("/search")
	public @ResponseBody List<MediaCollection> searchMediaList(@RequestParam(value="search") String search,
											     HttpServletRequest request) {
		
		// 세션에 담긴 카테고리명을 담음
		String artiName = (String)request.getSession().getAttribute("artiName");
		
		// 맵에 해당 데이터 담음
		Map<String, String> map = new HashMap<>();
		map.put("search", search);
		map.put("artiName", artiName);
		
		// 해당 검색어가 포함된 미디어 리스트 호출
		List<MediaCollection> list = (ArrayList<MediaCollection>)oService.searchMediaList(map);
		if(list == null || list.size() < 1) list = new ArrayList<>();
		return list;
	}
	
	// 오피셜 리스트 페이지 출력
	@GetMapping("/media/list")
	public ModelAndView selectMediaList(String category, ModelAndView mv, HttpServletRequest request) {
		String artiName = ((String)request.getSession().getAttribute("artiName"));
		
		System.out.println("카테고리명 : " + category);
		
		// 맵에 해당 데이터 담음
		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("artiName", artiName);
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser.getClassifyMem() == 1) {
			List<UserCollection> userColl = (List<UserCollection>)request.getSession().getAttribute("user");
			mv.addObject("userColl", userColl.get(0));
		}
		
		// 해당 카테고리 미디어 리스트 호출
		List<MediaCollection> list = oService.selectMediaList(map);
		System.out.println(list);
		// 해당 카테고리 미디어 개수 조회하기
		int count = oService.countCategory(map);
		
		if(list != null) {
			mv.addObject("category", category);
			mv.addObject("list", list);
			mv.addObject("count", count);
			mv.setViewName("official/media/list");
		} 
		
		return mv;
	}
	
	// 오피셜 상세페이지 출력
	@GetMapping("/media/detail")
	public ModelAndView selectMedia(int mediaNum, HttpSession session, ModelAndView mv, 
									HttpServletRequest request) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String artiName = (String)request.getSession().getAttribute("artiName");
		String artistName = (String)request.getSession().getAttribute("artistName");
		
		// 소속사 마이페이지를 통해 들어온 경우
		if(loginUser.getClassifyMem() == 3) {
			if(artistName != "") {
				artiName = artistName;
			}
		}
		
		Map<Object, Object> map = new HashMap<>();
		map.put("mediaNum", mediaNum);
		map.put("artiName", artiName);
		
		// 클릭한 미디어 호출
		MediaCollection media = oService.selectMedia(map);
		// System.out.println("클릭한 미디어 호출 : " + media);
		
		if(media != null) {
			mv.addObject("media", media);
			mv.setViewName("official/media/detail");
			mv.addObject("loginUser", loginUser);
			
			// 해당 미디어의 카테고리 추출
			int category = media.getCategory().getCateCode();
			
			System.out.println("카테고리 코드 : " + category);
			System.out.println("아티스트 이름 : " + artiName);
			
			Map<Object, Object> map2 = new HashMap<>();
			map2.put("category", category);
			map2.put("artiName", artiName);
			map2.put("mediaNum", mediaNum);
			
			// 추천 영상 리스트 호출
			List<MediaCollection> rcmd = oService.selectRecommend(map2);
			System.out.println("추천 영상 리스트 : " + rcmd);
			
			if(rcmd != null) {
				mv.addObject("rcmd", rcmd);
			}
			
			// 클릭한 미디어 조회수 추가
			int count = oService.insertHitCount(mediaNum);
			// 북마크 여부 확인
			BookMark bmark = oService.selectBookMark(mediaNum);
			
			if(bmark != null && bmark.getBmstatus().equals("Y")) {
				mv.addObject("bmark", bmark);
			}
			// 댓글 개수 조회하기
			int rcount = oService.countReply(mediaNum);
			// 댓글 리스트 호출
			List<ReplyCollection> comment = oService.selectReplyList(map);
			// 친구 신청 호출
			List<Friend> friend = oService.selectFriend(loginUser.getId());
			
			// System.out.println("댓글 리스트 : " + comment);
			// System.out.println("댓글 개수 : " + rcount);
			// System.out.println("북마크 여부 : " + bmark);
			
			if(count > 0) {
				System.out.println("조회수 추가 성공");
			} else {
				System.out.println("조회수 추가 실패");
			}
			
			mv.addObject("friend", friend);
			mv.addObject("comment", comment);
			mv.addObject("rcount", rcount);
 		} 
		
		return mv;
	}
	
	// 댓글 등록하기
	@PostMapping(value="/insertReply", produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, String> insertReply(Reply r, HttpSession session, HttpServletRequest request) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String artiName = (String)request.getSession().getAttribute("artiName");
		
		// 회원 구분
		r.setClassify(loginUser.getClassifyMem());
		
		// 닉네임 설정
		if(loginUser.getClassifyMem() == 1) {
			List<UserCollection> user = (ArrayList<UserCollection>)request.getSession().getAttribute("user");
			System.out.println(user);
			
			Map<String, String> map = new HashMap<>();
			map.put("artiName", artiName);
			map.put("id", loginUser.getId());
			
			// 해당 아티스트에 적용된 닉네임 가져오기
			String nickName = oService.selectNickName(map);
			System.out.println("닉네임 : " + nickName);
			r.setNickname(nickName);
			
		} else if(loginUser.getClassifyMem() == 2) {
			ArtistCollection artist = (ArtistCollection)request.getSession().getAttribute("artist");
			r.setNickname(artist.getArtist().getArtiNickname());
		}
		
		r.setWriter(loginUser.getId());
		System.out.println("아티스트 명 : " + artiName);
		System.out.println("전송된 댓글 데이터 : " + r);
		
		// 댓글 등록하기
		int result = oService.insertReply(r);
		boolean flag = true;
		
		if(result > 0) {
			System.out.println("댓글 등록 성공");
			
		} else {
			System.out.println("댓글 등록 실패");
			flag = false;
		}
		
		String msg = "";
		if(flag) 
			msg = "댓글이 등록되었습니다."; 
		else 
			msg = "댓글 등록에 실패하였습니다";
		
		Map<String, String> map = new HashMap<>();
		map.put("msg", msg);
		return map;
	}
	
	// 대댓글 등록하기
	@PostMapping(value="/insertRecomment", produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, String> insertRecomment(Reply r, HttpSession session, HttpServletRequest request) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String artiName = (String)request.getSession().getAttribute("artiName");
		
		// 회원 구분
		r.setClassify(loginUser.getClassifyMem());
		
		// 닉네임 설정
		if(loginUser.getClassifyMem() == 1) {
			List<UserCollection> user = (ArrayList<UserCollection>)request.getSession().getAttribute("user");
			System.out.println(user);
			
			Map<String, String> map = new HashMap<>();
			map.put("artiName", artiName);
			map.put("id", loginUser.getId());
			
			// 해당 아티스트에 적용된 닉네임 가져오기
			String nickName = oService.selectNickName(map);
			System.out.println("닉네임 : " + nickName);
			r.setNickname(nickName);
			
		} else if(loginUser.getClassifyMem() == 2) {
			ArtistCollection artist = (ArtistCollection)request.getSession().getAttribute("artist");
			r.setNickname(artist.getArtist().getArtiNickname());
		}
		
		r.setWriter(loginUser.getId());
		System.out.println("아티스트 명 : " + artiName);
		System.out.println("전송된 댓글 데이터 : " + r);
		
		// 대댓글 등록하기
		int result = oService.insertRecomment(r);
		boolean flag = true;
		
		if(result > 0) {
			System.out.println("대댓글 등록 성공");
			
		} else {
			System.out.println("대댓글 등록 실패");
			flag = false;
		}
		
		String msg = "";
		if(flag) 
			msg = "댓글이 등록되었습니다."; 
		else 
			msg = "댓글 등록에 실패하였습니다";
		
		Map<String, String> map = new HashMap<>();
		map.put("msg", msg);
		return map;
	}
	
	// 댓글 삭제하기
	@PostMapping(value="/deleteReply", produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, String> deleteReply(int rid, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Map<Object, Object> map = new HashMap<>();
		map.put("id", loginUser.getId());
		map.put("rid", rid);
		
		int result = oService.deleteReply(map);
		boolean flag = true;
		
		if(result > 0) {
			System.out.println("댓글 삭제 성공");
		} else {
			System.out.println("댓글 삭제 실패");
			flag = false;
		}
		
		String msg = "";
		if(flag) 
			msg = "댓글이 삭제되었습니다."; 
		else 
			msg = "댓글 삭제에 실패하였습니다";
		
		Map<String, String> map2 = new HashMap<>();
		map2.put("msg", msg);
		return map2;
	}
	
	// 북마크 추가하기
	@PostMapping(value="/insertBookmark", produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, String> insertBookmark(int mediaNum, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Map<Object, Object> map = new HashMap<>();
		map.put("id", loginUser.getId());
		map.put("mediaNum", mediaNum);
		
		int result = oService.insertBookmark(map);
		boolean flag = true;
		
		if(result > 0) {
			System.out.println("북마크 추가 성공");
		} else {
			System.out.println("북마크 추가 실패");
			flag = false;
		}
		
		String msg = "";
		if(flag) 
			msg = "북마크 추가 성공했습니다"; 
		else 
			msg = "북마크 추가 실패했습니다";
		
		System.out.println(msg);
		Map<String, String> map2 = new HashMap<>();
		map2.put("msg", msg);
		return map2;
	}
	
	// 북마크 삭제하기
	@PostMapping(value="/deleteBookmark", produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, String> deleteBookmark(int mediaNum, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Map<Object, Object> map = new HashMap<>();
		map.put("id", loginUser.getId());
		map.put("mediaNum", mediaNum);
		
		int result = oService.deleteBookmark(map);
		boolean flag = true;
		
		if(result > 0) {
			System.out.println("북마크 삭제 성공");
		} else {
			System.out.println("북마크 삭제 실패");
			flag = false;
		}
		
		String msg = "";
		if(flag) 
			msg = "북마크 삭제 성공"; 
		else 
			msg = "북마크 삭제 실패";
		
		System.out.println(msg);
		Map<String, String> map2 = new HashMap<>();
		map2.put("msg", msg);
		return map2;
	}
	
	// 좋아요 추가하기
	@PostMapping(value="/insertLike", produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, String> insertLike(int rid, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Map<Object, Object> map = new HashMap<>();
		map.put("id", loginUser.getId());
		map.put("rid", rid);
		
		int result = oService.insertLike(map);
		boolean flag = true;
		
		if(result > 0) {
			System.out.println("좋아요 추가 성공");
		} else {
			System.out.println("좋아요 추가 실패");
			flag = false;
		}
		
		String msg = "";
		if(flag) 
			msg = "좋아요 추가 성공했습니다"; 
		else 
			msg = "좋아요 추가 실패했습니다";
		
		System.out.println("msg : " + msg);
		
		Map<String, String> map2 = new HashMap<>();
		map2.put("msg", msg);
		return map2;
	}
	
	// 좋아요 삭제하기
	@PostMapping(value="/deleteLike", produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, String> deleteLike(int rid, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Map<Object, Object> map = new HashMap<>();
		map.put("id", loginUser.getId());
		map.put("rid", rid);
		
		int result = oService.deleteLike(map);
		boolean flag = true;
		
		if(result > 0) {
			System.out.println("좋아요 삭제 성공");
		} else {
			System.out.println("좋아요 삭제 실패");
			flag = false;
		}
		
		String msg = "";
		if(flag) 
			msg = "좋아요 삭제 성공"; 
		else 
			msg = "좋아요 삭제 실패";
		
		Map<String, String> map2 = new HashMap<>();
		map2.put("msg", msg);
		return map2;
	}
	
	// 일반 유저 알림
	@PostMapping(value="/insertUserReplyAlarm", produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, String> insertUserReplyAlarm(int refId, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Map<Object, Object> map = new HashMap<>();
		map.put("id", loginUser.getId());
		map.put("refId", refId);
		
		int result = oService.insertUserReplyAlarm(map);
		boolean flag = true;
		
		if(result > 0) {
			System.out.println("유저 댓글 알림 성공");
		} else {
			System.out.println("유저 댓글 알림 실패");
			flag = false;
		}
		
		String msg = "";
		if(flag) 
			msg = "유저 댓글 알림 성공"; 
		else 
			msg = "유저 댓글 알림 실패";
		
		Map<String, String> map2 = new HashMap<>();
		map2.put("msg", msg);
		return map2;
	}
	
	// 아티스트 유저 알림
	@PostMapping(value="/insertArtistReplyAlarm", produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, String> insertArtistReplyAlarm(int refId, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Map<Object, Object> map = new HashMap<>();
		map.put("id", loginUser.getId());
		map.put("refId", refId);
		
		int result = oService.insertArtistReplyAlarm(map);
		boolean flag = true;
		
		if(result > 0) {
			System.out.println("아티스트 댓글 알림 실패");
		} else {
			System.out.println("아티스트 댓글 알림 실패");
			flag = false;
		}
		
		String msg = "";
		if(flag) 
			msg = "아티스트 댓글 알림 실패"; 
		else 
			msg = "아티스트 댓글 알림 실패";
		
		Map<String, String> map2 = new HashMap<>();
		map2.put("msg", msg);
		return map2;
	}
	/*
	// 파라미터를 넘겨줘야 하므로 수정 예정
	@GetMapping("/schedule")
	public String schedulePageView() {
		return "official/schedule/main";
	} */
}

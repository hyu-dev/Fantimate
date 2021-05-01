package com.kh.fantimate.official.controller;

import java.util.ArrayList;
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
		System.out.println("클릭한 미디어 호출 : " + media);
		
		if(media != null) {
			mv.addObject("media", media);
			mv.setViewName("official/media/detail");
			mv.addObject("loginUser", loginUser);
			
			// 클릭한 미디어 조회수 추가
			int count = oService.insertHitCount(mediaNum);
			// 북마크 여부 확인
			BookMark bmark = oService.selectBookMark(mediaNum);
			// 댓글 개수 조회하기
			int rcount = oService.countReply(mediaNum);
			// 댓글 리스트 호출
			List<ReplyCollection> comment = oService.selectReplyList(map);
			
			System.out.println("댓글 리스트 : " + comment);
			System.out.println("댓글 개수 : " + rcount);
			System.out.println("북마크 여부 : " + bmark);
			
			if(count > 0) {
				System.out.println("조회수 추가 성공");
			} else {
				System.out.println("조회수 추가 실패");
			}
			
			mv.addObject("bmark", bmark);
			mv.addObject("comment", comment);
			mv.addObject("rcount", rcount);
 		} 
		
		return mv;
	}
	
	// 댓글 등록하기
	@PostMapping(value="/insertReply", produces="application/json; charset=utf-8")
	public @ResponseBody String insertReply(Reply r, HttpSession session, Model model, HttpServletRequest request) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String artiName = (String)request.getSession().getAttribute("artiName");
		
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
		
		// 댓글 등록하고 다시 가져오기
		List<ReplyCollection> reply = (List<ReplyCollection>)oService.insertReply(r, artiName);
		
		if(reply != null) {
			System.out.println("댓글 등록 성공");
		} else {
			System.out.println("댓글 등록 실패");
		}
		
		// 댓글
		return new Gson().toJson(reply);
	}
	
	// 댓글 삭제하기
	@PostMapping(value="/deleteReply", produces="application/json; charset=utf-8")
	public @ResponseBody String deleteReply(Reply r, HttpSession session, Model model, HttpServletRequest request) {
		String artiName = ((String)request.getSession().getAttribute("artiName"));
		
		System.out.println("전송된 댓글 : " + r);
		
		List<ReplyCollection> comment = oService.deleteReply(r, artiName);
		
		if(comment != null) {
			model.addAttribute("comment", comment);
		} else {
			System.out.println("댓글없음");
		}
		
		return "abc";
	}
	/*
	// 파라미터를 넘겨줘야 하므로 수정 예정
	@GetMapping("/schedule")
	public String schedulePageView() {
		return "official/schedule/main";
	} */
}

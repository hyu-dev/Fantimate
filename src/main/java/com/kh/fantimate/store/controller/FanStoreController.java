package com.kh.fantimate.store.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.fantimate.common.model.vo.Message;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.member.model.vo.User;
import com.kh.fantimate.member.model.vo.UserCollection;
import com.kh.fantimate.store.model.service.FanStoreService;
import com.kh.fantimate.store.model.vo.Area;
import com.kh.fantimate.store.model.vo.FStoreListCollection;
import com.kh.fantimate.store.model.vo.FanStore;
import com.kh.fantimate.store.model.vo.FanStoreReplyCollection;
import com.kh.fantimate.store.model.vo.HashTag;
import com.kh.fantimate.store.model.vo.Wish;

@Controller
@RequestMapping("/fanStore")
public class FanStoreController {
	@Autowired
	private FanStoreService fService;

	@GetMapping("/list")
	public String fanStoreListPage(Model model,
								   HttpServletRequest request) {
		String userId = "";
		String referer = request.getHeader("Referer");
		if((Member)request.getSession().getAttribute("loginUser") == null) {
			model.addAttribute("referer", referer);
			return "store/fanStoreList";
		} else {
			userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
			// 지역설정/인증여부 확인(유저정보를 우선 가져온다)
			User user = fService.isSettingArea(userId);
			// 활동지역이 등록되어있지 않다면
			if(user.getAreaReg().equalsIgnoreCase("N") && user.getAreaCertify().equalsIgnoreCase("N")) {
				model.addAttribute("msg", "활동지역 등록이 필요합니다. 등록하시겠습니까?");
				model.addAttribute("referer", referer);
				return "store/fanStoreList";
			} else {
				// 지역설정이 되어있거나 인증이 되어있다면 리스트 불러오기
				// 팬스토어 전체 정보 불러오기
				List<FStoreListCollection> fanStoreList = fService.selectFanStoreList(user.getAreaCode());
				// 해시정보 불러오기
				List<HashTag> hash = fService.selectHashList(user.getAreaCode());
				// 유저 찜 리스트 정보 불러오기
				userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
				List<Wish> wishList = fService.selectWishList(userId);
				model.addAttribute("fanStoreList", fanStoreList);
				model.addAttribute("hash", hash);
				model.addAttribute("wishList", wishList);
				// 팬스토어리스트페이지로 이동
				return "store/fanStoreList";
			}
		}
	}
	
	@PostMapping("/area")
	public @ResponseBody List<Area> selectAreaList(@RequestParam(value="search")String search) {
		List<Area> areaList = fService.selectAreaList(search);
		return areaList;
	}
	
	@GetMapping("/settingArea")
	public String settingArea(@RequestParam(value="area") String area, 
							  Model model, HttpServletRequest request) {
		System.out.println(area);
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
		// 지역코드 불러오기
		int areaCode = fService.selectAreaCode(area);
		// 유저 객체에 담기
		User user = new User();
		user.setAreaCode(areaCode);
		user.setAreaReg("Y");
		user.setId(userId);
		
		int result = fService.settingArea(user);
		
		if(result > 0) {
			// 로그인 유저 정보 불러오기
			List<UserCollection> userColl = fService.selectUserCollection(userId);
			HttpSession session = request.getSession();
			session.setAttribute("user", userColl);
			return "redirect:/fanStore/list";
		} else {
			model.addAttribute("error", "지역설정에 실패하였습니다");
			return "store/fanStoreList";
		}
	}
	
	@GetMapping("/certifyArea")
	public String certifyArea(@RequestParam(value="area") String area, 
					  		  Model model, HttpServletRequest request) {
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
		// 지역코드 불러오기
		int areaCode = fService.selectAreaCode(area);
		// 유저 객체에 담기
		User user = new User();
		user.setAreaCode(areaCode);
		user.setAreaReg("Y");
		user.setId(userId);
		
		int result = fService.certifyArea(user);
		
		if(result > 0) {
			// 로그인 유저 정보 불러오기
			List<UserCollection> userColl = fService.selectUserCollection(userId);
			HttpSession session = request.getSession();
			session.setAttribute("user", userColl);
			return "redirect:/fanStore/list";
		} else {
			model.addAttribute("error", "지역인증에 실패하였습니다");
			return "store/fanStoreList";
		}
	}
	
	@PostMapping("/myStore")
	public @ResponseBody Map<String, Object>  selectMyStoreList(User user,
																	  HttpServletRequest request) {
		List<FStoreListCollection> fanStoreList = fService.selectMyStoreList(user);
		// 유저 찜 정보 불러오기
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
		List<Wish> wishList = fService.selectWishList(userId);
		Map<String, Object> returnList = new HashMap<>();
		returnList.put("fanStoreList", fanStoreList);
		returnList.put("wishList", wishList);
		return returnList;
	}
	
	@PostMapping("/hashList")
	public @ResponseBody List<HashTag> selectHashListBySearch(@RequestParam(value="areaCode")int areaCode,
															  @RequestParam(value="search")String search) {
		Map map = new HashMap<>();
		map.put("areaCode", areaCode);
		map.put("search", search);
		List<HashTag> hashList = fService.selectHashListBySearch(map);
		return hashList;
	}
	
	@PostMapping("/fNameList")
	public @ResponseBody List<FanStore> selectFNameListBySearch(@RequestParam(value="areaCode")int areaCode,
					  										    @RequestParam(value="search")String search) {
		Map map = new HashMap<>();
		map.put("areaCode", areaCode);
		map.put("search", search);
		List<FanStore> fNameList = fService.selectFNameListBySearch(map);
		return fNameList;
	}
	
	@PostMapping("/search")
	public @ResponseBody Map<String, Object> 
		   selectfStoreListBySearch(@RequestParam(value="areaCode")int areaCode,
				   					@RequestParam(value="search")String search,
				   					@RequestParam(value="type")String type,
				   					HttpServletRequest request) {
		System.out.println(areaCode + ", " + search + ", " + type);
		Map map = new HashMap<>();
		map.put("areaCode", areaCode);
		map.put("search", search);
		map.put("type", type);
		// 검색한 팬스토어 리스트 불러오기
		List<FStoreListCollection> fanStoreList = fService.selectfStoreListBySearch(map);
		// 유저 찜 정보 불러오기
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
		List<Wish> wishList = fService.selectWishList(userId);
		Map<String, Object> returnList = new HashMap<>();
		returnList.put("fanStoreList", fanStoreList);
		returnList.put("wishList", wishList);
		// 보내기
		return returnList;
	}
	
	@PostMapping("/wish")
	public @ResponseBody Map<String, String> enrollOrCancelWish(Wish wish,
						 @RequestParam(value="type")String type) {
		String msg = "";
		int result = 0;
		switch(type) {
		case "등록" :
			result = fService.enrollWish(wish);
			msg = result > 0 ? "찜목록에 등록되었습니다" : "등록에 실패하였습니다";
			break;
		case "취소" :
			result = fService.cancelWish(wish);
			msg = result > 0 ? "찜목록에서 제거되었습니다" : "찜목록제거에 실패하였습니다";
			break;
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("msg", msg);
		return map;
	}
	
	@PostMapping("/search/artiName")
	public @ResponseBody List<ArtistGroup> selectArtiNameList(@RequestParam(value="search")String search) {
		System.out.println(search);
		List<ArtistGroup> artiNameList = fService.selectArtiNameList(search);
		System.out.println(artiNameList);
		return artiNameList;
	}
	
	@PostMapping("/search/hashTag")
	public @ResponseBody List<ArtistGroup> selectHashTagList(@RequestParam(value="search")String search) {
		System.out.println(search);
		List<ArtistGroup> hashTagList = fService.selectHashTagList(search);
		System.out.println(hashTagList);
		return hashTagList;
	}
	
	@GetMapping("/detail")
	public String selectFanStore(Model model, @RequestParam(value="fcode")int fcode,
								 HttpServletRequest request) {
		if(((Member)request.getSession().getAttribute("loginUser")) != null) {
			// 로그인유저 아이디
			String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
			// 스토어 목록 불러오기
			List<FStoreListCollection> fanStore = fService.selectFanStore(fcode);
			System.out.println(fanStore);
			// 팬스토어 작성자 아이디
			String writer = fanStore.get(0).getFstore().getId();
			Map map = new HashMap<>();
			map.put("id", userId);
			map.put("writer", writer);
			map.put("fcode", fcode);
			List<FanStoreReplyCollection> fanStoreReply = new ArrayList<>();
			if(writer.equals(userId)) {
			// 로그인유저와 팬스토어 작성자가 같다면 댓글작성자 리스트 불러오기
				fanStoreReply = fService.selectReplyWriter(map);
			} else {
			// 로그인유저와 팬스토어 작성자가 다르다면 댓글리스트 불러오기
				fanStoreReply = fService.selectFanStoreReply(map);
			}
			// 유저 찜 정보 불러오기
			Wish wish = new Wish();
			wish.setCode(fcode);
			wish.setId(userId);
			Wish userWish = fService.selectWish(wish);
			
			// 보내기
			model.addAttribute("fanStore", fanStore);
			model.addAttribute("fanStoreReply", fanStoreReply);
			model.addAttribute("wish", userWish);
		}
		return "store/fanStoreDetail";
	}
	
	@PostMapping("/insertReply")
	public @ResponseBody List<FanStoreReplyCollection> insertReply(
						 Reply reply,
						 @RequestParam(value="fanStoreWriter")String fanStoreWriter,
						 @RequestParam(value="firstWriter")String firstWriter,
						 HttpServletRequest request) {
		System.out.println(fanStoreWriter + " " + firstWriter + " " + reply);
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
		// 댓글 등록
		int result = fService.insertReply(reply);
		List<FanStoreReplyCollection> fanStoreReply = new ArrayList<>();
		if(result > 0) {
			// 정상적으로 등록되었을 때
			Map map = new HashMap<>();
			if(userId.equals(fanStoreWriter)) {
				// 로그인유저(댓글작성자)와 팬스토어 작성자가 동일하다면
				System.out.println("로그인 유저와 팬스토어 작성자가 동일");
				map.put("id", firstWriter);
				map.put("writer", fanStoreWriter);
				map.put("fcode", reply.getRefId());
				// 구매자에게 알림 보내기(인서트)
				fService.insertReplyNotiBuyer(map);
			} else {
				// 로그인유저(댓글작성자)와 팬스토어 작성자가 동일하지 않다면
				System.out.println("로그인 유저와 팬스토어 작성자가 동일하지 않음");
				map.put("id", reply.getWriter());
				map.put("writer", fanStoreWriter);
				map.put("fcode", reply.getRefId());
				// 판매자에게 알림 보내기(인서트)
				fService.insertReplyNotiSeller(map);
			}
			// 댓글 리스트 다시 불러오기
			fanStoreReply = fService.selectFanStoreReply(map);
			return fanStoreReply;
		} else {
			return fanStoreReply;
		}
	}
	
	@PostMapping("/replyOne")
	public @ResponseBody List<FanStoreReplyCollection> insertReply(
						 @RequestParam(value="fcode") int fcode,
						 @RequestParam(value="fsWriter") String fsWriter,
						 @RequestParam(value="rWriter") String rWriter,
						 HttpServletRequest request){
		System.out.println(fcode + " " + fsWriter + " " + rWriter);
		Map map = new HashMap<>();
		map.put("fcode", fcode);
		map.put("writer", fsWriter);
		map.put("id", rWriter);
		List<FanStoreReplyCollection> fanStoreReply = fService.selectFanStoreReply(map);
		System.out.println("리스트 중 하나 클릭하여 댓글 내용 불러오기" + fanStoreReply);
		return fanStoreReply;
	}
			
	@PostMapping("/deleteReply")
	public @ResponseBody List<FanStoreReplyCollection> deleteReply(
						 @RequestParam(value="rid") int rid,
						 @RequestParam(value="fcode") int fcode,
						 @RequestParam(value="fsWriter") String fsWriter,
						 @RequestParam(value="loginUser") String loginUser,
						 @RequestParam(value="firstWriter") String firstWriter) {
		// 댓글 삭제하기
		int result = fService.deleteReply(rid);
		
		List<FanStoreReplyCollection> fanStoreReply = new ArrayList<>();
		if(result > 0) {
			Map map = new HashMap<>();
			if(loginUser.equals(fsWriter)) {
				// 로그인유저(댓글작성자)와 팬스토어 작성자가 동일하다면
				System.out.println("로그인 유저와 팬스토어 작성자가 동일");
				map.put("id", firstWriter);
				map.put("writer", fsWriter);
				map.put("fcode", fcode);
			} else {
				// 로그인유저(댓글작성자)와 팬스토어 작성자가 동일하지 않다면
				System.out.println("로그인 유저와 팬스토어 작성자가 동일하지 않음");
				map.put("id", loginUser);
				map.put("writer", fsWriter);
				map.put("fcode", fcode);
			}
			fanStoreReply = fService.selectFanStoreReply(map);
			return fanStoreReply;
		} else {
			return fanStoreReply;
		}
	}
	
	@RequestMapping(value="/sendMessage", method= {RequestMethod.POST})
	public @ResponseBody Map<String, String> sendMessage(Message message) {
		System.out.println(message);
		int result = fService.sendMessage(message);
		String msg = result > 0 ? "쪽지를 성공적으로 발송하였습니다" : "쪽지발송에 실패하였습니다";
		Map<String, String> map = new HashMap<>();
		map.put("msg", msg);
		return map;
	}
	
	@PostMapping("/reportFanStore")
	public @ResponseBody Map<String, String> reportFanStore(Report report,
															@RequestParam(value="reportType") String reportType) {
		System.out.println(report);
		int result = 0;
		String msg = "";
		
		switch(reportType) {
		case "팬스토어" :
			result = fService.reportFanStore(report);
			if(result > 0) {
				msg = "정상적으로 신고되었습니다";
				fService.insertNotiReportFanStore(report);
			} else {
				msg = "신고되지 않았습니다";
			}
			break;
		case "댓글" :
			result = fService.reportFanStoreReply(report);
			if(result > 0) {
				msg = "정상적으로 신고되었습니다";
				fService.insertNotiReportFSReply(report);
			} else {
				msg = "신고되지 않았습니다";
			}
			break;
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("msg", msg);
		return map;
	}
			
}
 
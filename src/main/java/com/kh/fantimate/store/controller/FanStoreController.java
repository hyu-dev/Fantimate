package com.kh.fantimate.store.controller;

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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.member.model.vo.User;
import com.kh.fantimate.member.model.vo.UserCollection;
import com.kh.fantimate.store.model.service.FanStoreService;
import com.kh.fantimate.store.model.vo.Area;
import com.kh.fantimate.store.model.vo.FStoreListCollection;
import com.kh.fantimate.store.model.vo.FanStore;
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
		String referer = request.getHeader("Referer");
		if((Member)request.getSession().getAttribute("loginUser") == null) {
			model.addAttribute("referer", referer);
			return "store/fanStoreList";
		} else {
			String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
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
				// 로그인 유저 정보 불러오기
				UserCollection userColl = fService.selectUserCollection(userId);
				// 해시정보 불러오기
				List<HashTag> hash = fService.selectHashList(user.getAreaCode());
				// 모든 정보 세션에 담기
				HttpSession session = request.getSession();
				session.setAttribute("fanStoreList", fanStoreList);
				session.setAttribute("userColl", userColl);
				session.setAttribute("hash", hash);
				// 팬스토어리스트페이지로 이동
				return "store/fanStoreList";
			}
		}
	}
	
	@PostMapping("/area")
	public @ResponseBody List<Area> selectAreaList(@RequestParam(value="search")String search) {
		System.out.println(search);
		List<Area> areaList = fService.selectAreaList(search);
		return areaList;
	}
	
	@GetMapping("/settingArea")
	public String settingArea(@RequestParam(value="area") String area, 
							  Model model, HttpServletRequest request) {
		System.out.println(area);
		
		// 지역코드 불러오기
		int areaCode = fService.selectAreaCode(area);
		// 유저 객체에 담기
		User user = new User();
		user.setAreaCode(areaCode);
		user.setAreaReg("Y");
		user.setId(((Member)request.getSession().getAttribute("loginUser")).getId());
		
		int result = fService.settingArea(user);
		
		if(result > 0) {
			return "redirect:/fanStore/list";
		} else {
			model.addAttribute("error", "지역설정에 실패하였습니다");
			return "store/fanStoreList";
		}
	}
	
	@GetMapping("/certifyArea")
	public String certifyArea(@RequestParam(value="area") String area, 
					  		  Model model, HttpServletRequest request) {
		System.out.println(area);
		
		// 지역코드 불러오기
		int areaCode = fService.selectAreaCode(area);
		// 유저 객체에 담기
		User user = new User();
		user.setAreaCode(areaCode);
		user.setAreaReg("Y");
		user.setId(((Member)request.getSession().getAttribute("loginUser")).getId());
		
		int result = fService.certifyArea(user);
		
		if(result > 0) {
			return "redirect:/fanStore/list";
		} else {
			model.addAttribute("error", "지역인증에 실패하였습니다");
			return "store/fanStoreList";
		}
	}
	
	@PostMapping("/myStore")
	public @ResponseBody List<FStoreListCollection> selectMyStoreList(User user,
																	  HttpServletRequest request) {
		List<FStoreListCollection> fanStoreList = fService.selectMyStoreList(user);
		HttpSession session = request.getSession();
		session.setAttribute("fanStoreList", fanStoreList);
		return fanStoreList;
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
	public @ResponseBody List<FStoreListCollection> 
		   selectfStoreListBySearch(@RequestParam(value="areaCode")int areaCode,
				   					@RequestParam(value="search")String search,
				   					@RequestParam(value="type")String type,
				   					HttpServletRequest request) {
		System.out.println(areaCode + ", " + search + ", " + type);
		Map map = new HashMap<>();
		map.put("areaCode", areaCode);
		map.put("search", search);
		map.put("type", type);
		List<FStoreListCollection> fanStoreList = fService.selectfStoreListBySearch(map);
		HttpSession session = request.getSession();
		session.setAttribute("fanStoreList", fanStoreList);
		return fanStoreList;
	}
	
	@PostMapping("/wish")
	public @ResponseBody Map<String, String> enrollOrCancelWish(Wish wish,
												   @RequestParam(value="type")String type) {
		System.out.println(wish);
		System.out.println(type);
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
		List<ArtistGroup> artiNameList = fService.selectArtiNameList(search);
		return artiNameList;
	}
}

package com.kh.fantimate.store.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fantimate.store.model.service.StoreService;
import com.kh.fantimate.store.model.vo.StoreCategory;
import com.kh.fantimate.store.model.vo.StoreCollection;

@Controller
@RestController
@RequestMapping("/store")
public class StoreController {
	@Autowired
	private StoreService sService;

	@GetMapping("/storeList")
	public ModelAndView StoreList(ModelAndView mv, HttpServletRequest request) {
		// 카테고리 리스트 호출
		// 아티스트 이름 임의로 조정 (세션으로 변경 필요)
		String artiName = "IU";
		List<StoreCategory> cateList = (ArrayList<StoreCategory>)sService.selectcategoryList(artiName);
		
		// 카테고리리스트로부터 가져온 데이터에서 첫번째 값 도출
		int cateCode = cateList.get(0).getCateCode();
		// 스토어 리스트 호출
		List<StoreCollection> list = (ArrayList<StoreCollection>)sService.selectStoreList(cateCode);
		
		if(list != null && !list.isEmpty()) {
			HttpSession session = request.getSession();
			session.removeAttribute("toggle");
			session.setAttribute("cateName", cateList.get(0).getCateName());
			session.setAttribute("artiName", artiName);
			session.setAttribute("list", list);
			
			mv.addObject("cateList", cateList);
			mv.addObject("list", list);
		} else {
//			mv.addObject("msg", "등록된 스토어가 없습니다.");
//			mv.setViewName("store/storeList");
		}
		return mv;
	}
	
	@GetMapping("/category/{cateName}/{toggle}")
	public List<StoreCollection> sortStoreByCategory(@PathVariable String cateName, 
													 @PathVariable String toggle,
													 HttpServletRequest request) {
		// 아티스트 이름 임의로 조정 (세션으로 변경 필요)
		String artiName = "IU";
		
//		System.out.println(toggle);
		Map<String, String> map = new HashMap<>();
		map.put("artiName", artiName);
		map.put("cateName", cateName);
		map.put("toggle", toggle);
		
		List<StoreCollection> list = (ArrayList<StoreCollection>)sService.selectStoreListByCate(map);
		
		HttpSession session = request.getSession();
		session.setAttribute("cateName", cateName);
		session.setAttribute("artiName", artiName);
		session.setAttribute("toggle", toggle);
		session.setAttribute("list", list);
		
		return list;
	}
	
	@GetMapping("/enrollWish/{pcode}/{cateName}/{toggle}")
	public List<StoreCollection> enrollWish(@PathVariable String pcode,
											@PathVariable String cateName, 
											@PathVariable String toggle,
											HttpServletRequest request) {
		// 로그인 유저 아이디 값 임의로 조정 (세션으로 변경 필요)
		String userId = "user";
		Map<String, String> map = new HashMap<>();
		map.put("id", userId);
		map.put("pcode", pcode);
		int result = sService.enrollWish(map);
		
		// 아티스트 이름 임의로 조정 (세션으로 변경 필요)
		String artiName = "IU";
		
//		System.out.println(toggle);
		Map<String, String> map2 = new HashMap<>();
		map2.put("artiName", artiName);
		map2.put("cateName", cateName);
		map2.put("toggle", toggle);
		
		List<StoreCollection> list = (ArrayList<StoreCollection>)sService.selectStoreListByCate(map2);
		return list;
	}
	
	@GetMapping("/cancelWish/{pcode}/{cateName}/{toggle}")
	public List<StoreCollection> cancelWish(@PathVariable String pcode, @PathVariable String cateName, @PathVariable String toggle) {
		// 로그인 유저 아이디 값 임의로 조정 (세션으로 변경 필요)
		String userId = "user";
		Map<String, String> map = new HashMap<>();
		map.put("id", userId);
		map.put("pcode", pcode);
		int result = sService.cancelWish(map);
		
		// 아티스트 이름 임의로 조정 (세션으로 변경 필요)
		String artiName = "IU";
		
//		System.out.println(toggle);
		Map<String, String> map2 = new HashMap<>();
		map2.put("artiName", artiName);
		map2.put("cateName", cateName);
		map2.put("toggle", toggle);
		
		List<StoreCollection> list = (ArrayList<StoreCollection>)sService.selectStoreListByCate(map2);
		return list;
	}
	
	@GetMapping("/search/{search}")
	public List<StoreCollection> searchStore(@PathVariable String search,
											 HttpServletRequest request) {
		// 세션에 담긴 카테고리명을 담음
		String cateName = (String)request.getSession().getAttribute("cateName");
		String artiName = (String)request.getSession().getAttribute("artiName");
		String toggle = (String)request.getSession().getAttribute("toggle");
		
		if(toggle == null) {
			toggle = "NEW";
		}
		
		// 맵에 해당 데이터 담음
		Map<String, String> map = new HashMap<>();
		map.put("search", search);
		map.put("cateName", cateName);
		map.put("artiName", artiName);
		map.put("toggle", toggle);
		
		List<StoreCollection> list = (ArrayList<StoreCollection>)sService.searchStoreList(map);
		System.out.println(list);
		if(list == null || list.size() < 1) list = new ArrayList<>();
		return list;
	}
	
	
		
}

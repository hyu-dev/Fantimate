package com.kh.fantimate.store.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.store.model.service.StoreService;
import com.kh.fantimate.store.model.vo.Store;
import com.kh.fantimate.store.model.vo.StoreCategory;
import com.kh.fantimate.store.model.vo.StoreCollection;
import com.kh.fantimate.store.model.vo.StoreInfo;

@Controller
@RestController
@RequestMapping("/store")
public class StoreController {
	@Autowired
	private StoreService sService;

	@GetMapping("/storeList")
	public ModelAndView StoreList(ModelAndView mv, 
								  HttpServletRequest request
								  ) {
		// 카테고리 리스트 호출
		// 아티스트 이름 임의로 조정 (세션으로 변경 필요)
		String artiName = "IU";
		List<StoreCategory> cateList = (ArrayList<StoreCategory>)sService.selectcategoryList(artiName);
		
		// 카테고리리스트로부터 가져온 데이터에서 첫번째 값 도출
		String cateName = cateList.get(0).getCateName();
		// 스토어 리스트 호출
		List<StoreCollection> list = (ArrayList<StoreCollection>)sService.selectStoreList(cateName);
		
		if(list != null && !list.isEmpty()) {
			HttpSession session = request.getSession();
			session.removeAttribute("toggle");
			session.setAttribute("cateName", cateList.get(0).getCateName());
			session.setAttribute("artiName", artiName);
			session.setAttribute("list", list);
			
			mv.addObject("cateList", cateList);
			mv.addObject("list", list);
		} else {
			mv.addObject("msg", "등록된 스토어가 없습니다.");
			String referer = request.getHeader("Referer");
			request.getSession().setAttribute("referer", referer);
			mv.setViewName("store/storeList");
		}
		return mv;
	}
	
	@GetMapping("/category/{cateName}/{toggle}")
	public List<StoreCollection> sortStoreByCategory(@PathVariable String cateName, 
													 @PathVariable String toggle,
													 HttpServletRequest request) {
		// 아티스트 이름 임의로 조정 (세션으로 변경 필요)
		String artiName = "IU";
		
		// System.out.println(toggle);
		Map<String, String> map = new HashMap<>();
		map.put("artiName", artiName);
		map.put("cateName", cateName);
		map.put("toggle", toggle);
		
		List<StoreCollection> list = (ArrayList<StoreCollection>)sService.selectStoreListByCate(map);
		// System.out.println(list);
		if(list.size() > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("cateName", cateName);
			session.setAttribute("artiName", artiName);
			session.setAttribute("toggle", toggle);
			session.setAttribute("list", list);
		} 
		
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
	public List<StoreCollection> cancelWish(@PathVariable String pcode,
											@PathVariable String cateName, 
											@PathVariable String toggle) {
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
	
	@GetMapping("/insertCart/{pcode}")
	public List<StoreCollection> insertCart(@PathVariable int pcode,
							 				HttpServletRequest request) {
		String price = sService.searchPrice(pcode);
		// 유저 아이디 임의로 기록 (세션으로 처리예정)
		String userId = "user";
		Map<String, String> map = new HashMap<>();
		map.put("id", userId);
		map.put("price", price);
		map.put("pcode", Integer.toString(pcode));
		
		int result = sService.insertCart(map);
		// 세션에 담긴 카테고리명을 담음
		String cateName = (String)request.getSession().getAttribute("cateName");
		String artiName = (String)request.getSession().getAttribute("artiName");
		String toggle = (String)request.getSession().getAttribute("toggle");
		
		if(toggle == null) {
			toggle = "NEW";
		}
		System.out.println(cateName + artiName + toggle);
		// 맵에 해당 데이터 담음
		Map<String, String> map2 = new HashMap<>();
		map2.put("cateName", cateName);
		map2.put("artiName", artiName);
		map2.put("toggle", toggle);
		
		List<StoreCollection> list = (ArrayList<StoreCollection>)sService.selectStoreListByCate(map2);
		System.out.println(list);
		if(list == null || list.size() < 1) list = new ArrayList<>();
			
		return list;   // path 경로로 가는데 앞에  /sp 는 삭제
	}
	
	@RequestMapping("/insert")
	public void insertStore(HttpServletResponse response,
							Store store,
							StoreCategory storeCate,
							StoreInfo storeInfo,
							HttpServletRequest request,
							@RequestParam(value="mainPhoto") MultipartFile main,
							@RequestParam(value="subPhotos") MultipartFile[] subs) 
							throws IOException{
		List<Attachment> attList = new ArrayList<>();
		Attachment att = null;
		// 업로드 파일 서버에 저장
		// 메인파일 첨부가 정상적으로 동작했다면
		if(!main.getOriginalFilename().equals("")) {
			att = new Attachment();
			String renameFileName = saveFile(main, request);
			// DB에 저장하기 위한 파일명 세팅
			if(renameFileName != null) {
				att.setAttClName(main.getOriginalFilename());
				att.setAttSvName(renameFileName);
				att.setAttMain("Y");
				attList.add(att);
			}
		}
		// 서브파일 첨부가 정상적으로 동작했다면
		for(MultipartFile sub : subs) {
			att = new Attachment();
			if(!sub.getOriginalFilename().equals("")) {
				String renameFileName = saveFile(sub, request);
				if(renameFileName != null) {
					att.setAttClName(sub.getOriginalFilename());
					att.setAttSvName(renameFileName);
					att.setAttMain("N");
					attList.add(att);
				}
			}
		}
		
		if(store.getIsView().equals("on"))
			store.setIsView("Y");
		else 
			store.setIsView("N");
		
		StoreCollection sc = new StoreCollection();
		sc.setStore(store);
		sc.setStoreCate(storeCate);
		sc.setStoreInfo(storeInfo);
		
		int result = sService.insertStore(sc, attList);
		
		if(result > 0) {
			response.sendRedirect("storeList");
		} else {
			System.out.println("등록안됨");
		}
	}
	
	// 파일 리네임 후 저장
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) folder.mkdirs();	// -> 해당 경로가 존재하지 않는다면 디렉토리 생성
		
		// 파일명 리네임 규칙 "년월일시분초_랜덤값.확장자"
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = "store_" + sdf.format(new Date()) + "_" 
							+ (int)(Math.random() * 100000)
							+ originalFileName.substring(originalFileName.lastIndexOf("."));
		String renamePath = folder + "\\" + renameFileName; 	// 저장하고자 하는 경로 + 파일명
		
		try {
			file.transferTo(new File(renamePath));
			// => 업로드 된 파일(MultipartFile)이 rename명으로 서버에 저장
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 에러 : " + e.getMessage());
		}	
		return renameFileName;
	}
	
	// 상품 상세페이지 불러오기
	@RequestMapping("/detail")
	public void storeDetail(HttpServletResponse response,
								HttpServletRequest request,
								@RequestParam(value="pcode") String pcode) throws IOException {
		
		boolean flagslist = false;	// slist라는 이름의 쿠키가 있는지 확인
		boolean flagPcode = false;	// 해당 pcode가 포함 되어 있는지 확인
		
		Cookie[] cookies = request.getCookies();
		try {
			if(cookies != null) {
				for(Cookie c : cookies) {
					// 읽은 게시글의 pcode를 모아서 보관하는 slist가 쿠키 안에 있다면
					if(c.getName().equals("slist")) {
						flagslist = true;
						// 기존 쿠기 값 먼저 읽어옴(, 등의 특수 문자 인코딩 때문에 decode처리)
						String slist = URLDecoder.decode(c.getValue(), "UTF-8");
						// , 구분자 기준으로 나누기
						String[] list = slist.split(",");
						for(String st : list) {
							// 쿠키 안에 지금 클릭한 게시글의 bid가 들어있다면 => 읽었음을 표시
							if(st.equals(String.valueOf(pcode))) flagPcode = true;
						}
						if(!flagPcode) {	// 게시글을 읽지 않았다면
							c.setValue(URLEncoder.encode(slist + "," + pcode, "UTF-8"));
							response.addCookie(c);	// 응답에 담아 보냄
						}
					}
				}
				
				if(!flagslist) {
					// slist라는 쿠키가 만들어지지 않은 경우
					Cookie c1 = new Cookie("slist", URLEncoder.encode(String.valueOf(pcode), "UTF-8"));
					response.addCookie(c1);
				}
			}
		
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} 
		
		List<StoreCollection> sc = sService.selectStore(pcode, !flagPcode);
		System.out.println(sc);
		HttpSession session = request.getSession();
		session.setAttribute("sc", sc);
		response.sendRedirect("storeDetail");
	}
	// 상품 상세페이지 이동
	@GetMapping("/storeDetail")
	public ModelAndView storeDetailPage(ModelAndView mv, HttpServletRequest request) {
		mv.addObject(request.getSession().getAttribute("sc"));
		return mv;
	}
}

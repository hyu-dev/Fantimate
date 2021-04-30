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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Subscribe;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.pay.model.vo.Cart;
import com.kh.fantimate.pay.model.vo.CartCollection;
import com.kh.fantimate.store.model.service.StoreService;
import com.kh.fantimate.store.model.vo.BuyCollection;
import com.kh.fantimate.store.model.vo.Review;
import com.kh.fantimate.store.model.vo.ReviewCollection;
import com.kh.fantimate.store.model.vo.Store;
import com.kh.fantimate.store.model.vo.StoreCategory;
import com.kh.fantimate.store.model.vo.StoreCollection;
import com.kh.fantimate.store.model.vo.StoreInfo;
import com.kh.fantimate.store.model.vo.Wish;

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

		if(((Member)request.getSession().getAttribute("loginUser")) == null) {
			mv.setViewName("store/storeList");
			return mv;
		} else {
			// 아티스트 이름 세션에서 불러오기
			String artiName = ((String)request.getSession().getAttribute("artiName"));
			System.out.println(artiName);
			// 카테고리 리스트 호출
			List<StoreCategory> cateList = (ArrayList<StoreCategory>)sService.selectcategoryList(artiName);
			String cateName = "";
			if(cateList != null && !cateList.isEmpty()) {
				// 카테고리리스트로부터 가져온 데이터에서 첫번째 값 도출
				cateName = cateList.get(0).getCateName();
			} else {
				mv.addObject("msg", "등록된 스토어가 없습니다.");
				String referer = request.getHeader("Referer");
				request.getSession().setAttribute("referer", referer);
				mv.setViewName("store/storeList");
				return mv;
			}
			
			Map<String, String> map = new HashMap<>();
			map.put("cateName", cateName);
			map.put("artiName", artiName);
			// 스토어 리스트 호출
			List<StoreCollection> list = sService.selectStoreList(map);
			System.out.println("리스트" + list);
			// 유저별 찜 리스트 호출
			String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
			List<Wish> wishList = sService.selectWishList(userId);
			if(!list.isEmpty() || list.size() > 0) {
				// 세션에 담음 (상품 검색시 필요)
				HttpSession session = request.getSession();
				session.removeAttribute("toggle");
				session.setAttribute("artiName", artiName);
				session.setAttribute("cateName", cateName);
				mv.addObject("wishList", wishList);
				mv.addObject("cateList", cateList);
				mv.addObject("list", list);
			} else {
				mv.addObject("msg", "등록된 스토어가 없습니다.");
				String referer = request.getHeader("Referer");
				request.getSession().setAttribute("referer", referer);
				mv.setViewName("store/storeList");
			}
		}
		return mv;
	}
	
	// 카테고리 & 토글 클릭시
	@GetMapping("/category/{cateName}/{toggle}")
	public Map<String, Object> sortStoreByCategory(@PathVariable String cateName, 
													 @PathVariable String toggle,
													 HttpServletRequest request) {
		
		String artiName = (String)request.getSession().getAttribute("artiName");
		
		Map<String, String> map = new HashMap<>();
		map.put("artiName", artiName);
		map.put("cateName", cateName);
		map.put("toggle", toggle);
		
		List<StoreCollection> list = sService.selectStoreListByCate(map);
		// 유저별 찜 리스트 호출
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
		List<Wish> wishList = sService.selectWishList(userId);
		Map<String, Object> result = new HashMap<>();
		if(list != null && !list.isEmpty()) {
			// 세션에 담음 (상품 검색시 필요)
			HttpSession session = request.getSession();
			session.setAttribute("cateName", cateName);
			session.setAttribute("toggle", toggle);
			result.put("list", list);
			result.put("wishList", wishList);
		} else {
			result.put("list", new ArrayList<>());
			result.put("wishList", new ArrayList<>());
		}
		
		return result;
	}
	
	@GetMapping("/enrollWish/{pcode}/{cateName}/{toggle}")
	public Map<String, Object> enrollWish(@PathVariable String pcode,
											@PathVariable String cateName, 
											@PathVariable String toggle,
											HttpServletRequest request) {
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
		String artiName = (String)request.getSession().getAttribute("artiName");
		
		Wish wish = new Wish();
		wish.setCode(Integer.parseInt(pcode));
		wish.setId(userId);
		int result = sService.enrollWish(wish);
		Map<String, Object> data = new HashMap<>();
		if(result > 0) {
			// 세션에 담음 (상품 검색시 필요)
			HttpSession session = request.getSession();
			session.setAttribute("cateName", cateName);
			session.setAttribute("toggle", toggle);
			Map<String, String> map = new HashMap<>();
			map.put("artiName", artiName);
			map.put("cateName", cateName);
			map.put("toggle", toggle);
			List<StoreCollection> list = (ArrayList<StoreCollection>)sService.selectStoreListByCate(map);
			// 유저별 찜 리스트 호출
			List<Wish> wishList = sService.selectWishList(userId);
			data.put("list", list);
			data.put("wishList", wishList);
		} else {
			data.put("list", new ArrayList<>());
			data.put("wishList", new ArrayList<>());
		}
		return data;
	}
	
	@GetMapping("/cancelWish/{pcode}/{cateName}/{toggle}")
	public Map<String, Object> cancelWish(@PathVariable String pcode,
											@PathVariable String cateName, 
											@PathVariable String toggle,
											HttpServletRequest request) {
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
		String artiName = (String)request.getSession().getAttribute("artiName");
		Wish wish = new Wish();
		wish.setCode(Integer.parseInt(pcode));
		wish.setId(userId);
		
		int result = sService.cancelWish(wish);
		
		Map<String, Object> data = new HashMap<>();
		if(result > 0) {
			// 세션에 담음 (상품 검색시 필요)
			HttpSession session = request.getSession();
			session.setAttribute("cateName", cateName);
			session.setAttribute("toggle", toggle);
			Map<String, String> map = new HashMap<>();
			map.put("artiName", artiName);
			map.put("cateName", cateName);
			map.put("toggle", toggle);
			List<StoreCollection> list = (ArrayList<StoreCollection>)sService.selectStoreListByCate(map);
			// 유저별 찜 리스트 호출
			List<Wish> wishList = sService.selectWishList(userId);
			data.put("list", list);
			data.put("wishList", wishList);
		} else {
			data.put("list", new ArrayList<>());
			data.put("wishList", new ArrayList<>());
		}
		return data;
	}
	
	@GetMapping("/search/{search}")
	public Map<String, Object> searchStore(@PathVariable String search,
										   HttpServletRequest request) {
		System.out.println(search);
		// 세션에 담긴 카테고리명을 담음
		String artiName = (String)request.getSession().getAttribute("artiName");
		String cateName = (String)request.getSession().getAttribute("cateName");
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
		System.out.println(artiName + " " + cateName + " " + toggle);
		
		List<StoreCollection> list = sService.searchStoreList(map);
		// 유저별 찜 리스트 호출
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
		List<Wish> wishList = sService.selectWishList(userId);
		System.out.println(list);
		Map<String, Object> data = new HashMap<>();
		if(!list.isEmpty() || list.size() > 0)  {
			// 세션에 담음 (상품 검색시 필요)
			HttpSession session = request.getSession();
			session.setAttribute("cateName", cateName);
			session.setAttribute("toggle", toggle);
			data.put("list", list);
			data.put("wishList", wishList);
		} else {
			data.put("list", new ArrayList<>());
			data.put("wishList", new ArrayList<>());
		}
		return data;
	}
	
	@GetMapping("/insertCart/{pcode}")
	public Map<String, Object> insertCart(@PathVariable int pcode,
							 				HttpServletRequest request) {
		String price = sService.searchPrice(pcode);
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
		int salesQ = 1;
		
		Cart c = new Cart();
		c.setId(userId);
		c.setPcode(pcode);
		c.setBuyQ(salesQ);
		c.setBuyPrice(Integer.parseInt(price));
		
		int result = sService.insertCart(c);
		// 세션에 담긴 카테고리명을 담음
		String cateName = (String)request.getSession().getAttribute("cateName");
		String artiName = (String)request.getSession().getAttribute("artiName");
		String toggle = (String)request.getSession().getAttribute("toggle");
		if(toggle == null) {
			toggle = "NEW";
		}
		// 맵에 해당 데이터 담음
		Map<String, String> map = new HashMap<>();
		map.put("cateName", cateName);
		map.put("artiName", artiName);
		map.put("toggle", toggle);
		
		List<StoreCollection> list = sService.selectStoreListByCate(map);
		// 유저별 찜 리스트 호출
		List<Wish> wishList = sService.selectWishList(userId);
		Map<String, Object> data = new HashMap<>();
		if(!list.isEmpty() || list.size() > 0) {
			data.put("list", list);
			data.put("wishList", wishList);
		} else {
			data.put("list", new ArrayList<>());
			data.put("wishList", new ArrayList<>());
		}
		return data;
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
				att.setAttStatus("Y");
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
					att.setAttStatus("Y");
					att.setAttMain("N");
					attList.add(att);
				}
			}
		}
		
		if(store.getIsView() != null)
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
	
	@RequestMapping("/update")
	public void updateStore(HttpServletResponse response,
							Store store,
							StoreCategory storeCate,
							StoreInfo storeInfo,
							HttpServletRequest request,
							@RequestParam(value="mainPhoto") MultipartFile main,
							@RequestParam(value="mainSvName") String mainSvName,
							@RequestParam(value="mainClName") String mainClName,
							@RequestParam(value="subPhotos") MultipartFile[] subs)
							throws IOException{
		String[] subSvName = null;
		String[] subClName = null;
		if(request.getParameterValues("subSvName") != null || request.getParameterValues("subClName") != null) {
			subSvName = request.getParameterValues("subSvName");
			subClName = request.getParameterValues("subClName");
			System.out.println(subSvName.length);
			System.out.println(subClName.length);
		}
		List<Attachment> attList = new ArrayList<>();
		Attachment att = null;
		// 업로드 파일 서버에 저장
		// 메인파일 첨부가 정상적으로 동작했다면
		if(!main.getOriginalFilename().equals("")) {
			// 메인파일에 새로운 데이터가 담겼다면 기존 파일 삭제
			if(mainSvName != null) {
				deleteFile(("resources/uploadFiles/" + mainSvName), request);
			}
			att = new Attachment();
			String renameFileName = saveFile(main, request);
			// DB에 저장하기 위한 파일명 세팅
			if(renameFileName != null) {
				att.setAttClName(main.getOriginalFilename());
				att.setAttSvName(renameFileName);
				att.setAttMain("Y");
				attList.add(att);
			}
		} else {
			// 메인파일이 변경되지 않았다면 기존파일을 넣는다
			att = new Attachment();
			att.setAttClName(mainClName);
			att.setAttSvName(mainSvName);
			att.setAttMain("Y");
			attList.add(att);
		}
		
		// 서브파일 첨부가 정상적으로 동작했다면
		int i = 0;
		for(MultipartFile sub : subs) {
			att = new Attachment();
			if(!sub.getOriginalFilename().equals("")) {
				// 서브파일에 새로운 데이터가 담겼다면 기존 파일 삭제
				if(subSvName != null) {
					deleteFile(("resources/uploadFiles/" + subSvName[i]), request);
					i++;
				}
				String renameFileName = saveFile(sub, request);
				if(renameFileName != null) {
					att.setAttClName(sub.getOriginalFilename());
					att.setAttSvName(renameFileName);
					att.setAttMain("N");
					attList.add(att);
				}
			} else {
				// 서브파일이 변경되지 않았다면 기존 파일을 넣는다
				att.setAttClName(subClName[i]);
				att.setAttSvName(subSvName[i]);
				att.setAttMain("N");
				attList.add(att);
				i++;
			}
		}
		
		if(store.getIsView() != null)
			store.setIsView("Y");
		else 
			store.setIsView("N");
		
		StoreCollection sc = new StoreCollection();
		sc.setStore(store);
		sc.setStoreCate(storeCate);
		sc.setStoreInfo(storeInfo);
		
		int result = sService.updateStore(sc, attList);
		
		if(result > 0) {
			response.sendRedirect("detail?pcode=" + sc.getStore().getPcode());
		} else {
			System.out.println("등록안됨");
		}
		// update가 성공적으로 등록되었으나 result 값이 -1로 표시되어.. 해결될때까지 임시로 적용
		response.sendRedirect("detail?pcode=" + sc.getStore().getPcode());
	}
	
	// 파일 삭제 메소드
	public void deleteFile(String filePath, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		File deleteFile = new File(root + filePath);
		
		if(deleteFile.exists()) {
			deleteFile.delete();
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
		
		if(((Member)request.getSession().getAttribute("loginUser")) == null) {
			response.sendRedirect(request.getHeader("referer"));
		} else {
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
			// 상세페이지 코드 세션에 담기
			HttpSession session = request.getSession();
			session.setAttribute("pcode", Integer.parseInt(pcode));
			
			// 상세페이지의 모든 정보 리스트로 담아오기
			List<StoreCollection> sc = sService.selectStore(pcode, !flagPcode);
			session.setAttribute("sc", sc);
			
			// 상세페이지의 리뷰 정보 리스트로 담아오기
			List<ReviewCollection> review = sService.selectReviewList(pcode);
			session.setAttribute("review", review);
			
			// 상세페이지에 넣을 추천 스토어 불러오기
			Map<String, String> map = new HashMap<>();
			map.put("artiName", sc.get(0).getStoreCate().getArtiNameEn());
			map.put("cateName", sc.get(0).getStoreCate().getCateName());
			String toggle = (String)session.getAttribute("toggle");
			if(toggle == null || toggle == "") toggle = "TOP";
			map.put("toggle", toggle);
			map.put("pcode", pcode);
			List<StoreCollection> recmd = (ArrayList<StoreCollection>)sService.recommandStoreListByCate(map);
			session.setAttribute("recmd", recmd);
			
			// 유저별 찜여부 확인
			String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
			Wish wish = new Wish();
			wish.setCode(Integer.parseInt(pcode));
			wish.setId(userId);
			Wish userWish = sService.selectWish(wish);
			session.setAttribute("wish", userWish);
			
			// 상세페이지로 이동
			response.sendRedirect("storeDetail");
		}
	}
	
	// 상품 상세페이지 이동
	@GetMapping("/storeDetail")
	public ModelAndView storeDetailPage(ModelAndView mv, HttpServletRequest request) {
		if(((Member)request.getSession().getAttribute("loginUser")) == null) {
			mv.addObject(request.getHeader("referer"));
		} else {
			mv.addObject(request.getSession().getAttribute("sc"));
		}
		return mv;
	}
	
	// 상품 상세페이지에서 찜등록
	@RequestMapping("/enroll/wish")
	public void enrollWish(HttpServletRequest request,
						   HttpServletResponse response) throws IOException {
		// 유저아이디, 상품코드
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
		int pcode = (int)request.getSession().getAttribute("pcode");
		
		Wish wish = new Wish();
		wish.setCode(pcode);
		wish.setId(userId);
		// 찜등록
		int result = sService.enrollWish(wish);
		
		// 유저별 찜여부 확인
		Wish userWish = sService.selectWish(wish);
		HttpSession session = request.getSession();
		session.setAttribute("wish", userWish);
		
		// 상세페이지로 이동
		response.sendRedirect("../storeDetail");
	}
	
	// 상품 상세페이지에서 찜취소
	@RequestMapping("/cancel/wish")
	public void cancelWish(HttpServletRequest request,
						   HttpServletResponse response) throws IOException {
		// 유저아이디, 상품코드 필요
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
		int pcode = (int)request.getSession().getAttribute("pcode");
		
		Wish wish = new Wish();
		wish.setCode(pcode);
		wish.setId(userId);
		// 찜등록
		sService.cancelWish(wish);
		
		// 유저별 찜여부 확인
		Wish userWish = sService.selectWish(wish);
		HttpSession session = request.getSession();
		session.setAttribute("wish", userWish);
		
		// 상세페이지로 이동
		response.sendRedirect("../storeDetail");
	}
	
	// 장바구니 등록
	@RequestMapping("/insert/cart")
	public void insertCart(HttpServletRequest request,
						   HttpServletResponse response,
						   @RequestParam(value="salesQ") int salseQ,
						   @RequestParam(value="price") String price) throws IOException {
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
		int pcode = (int)request.getSession().getAttribute("pcode");
		
		Cart c = new Cart();
		c.setId(userId);
		c.setPcode(pcode);
		c.setBuyQ(salseQ);
		c.setBuyPrice(Integer.parseInt(price));
		
		int result = sService.insertCart(c);
		
		if(result > 0) response.sendRedirect("../storeDetail");
	}
	
	@RequestMapping(value="/review/{rvCode}", produces="application/json; charset=utf-8")
	public String selectReview(@PathVariable int rvCode) {
		List<ReviewCollection> list = sService.selectReview(rvCode);
		Gson gson = new GsonBuilder()
				.setDateFormat("yyyy-MM-dd")
				.create();
	
		return gson.toJson(list);
	}
	
	@GetMapping("/collectionStore")
	public ModelAndView selectCollectionStore(ModelAndView mv, 
								   			 HttpServletRequest request) {
		
		if(((Member)request.getSession().getAttribute("loginUser")) == null) {
			mv.addObject(request.getHeader("referer"));
			mv.setViewName("common/main");
		} else {
			String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
			// 스토어 리스트 호출
			List<BuyCollection> list = sService.selectCollectionStore(userId);
			
			if(list != null && !list.isEmpty()) {
				request.getSession().setAttribute("collection", list);
				mv.addObject("list", list);
				mv.setViewName("pay/collection");
			} else {
				mv.setViewName("pay/collection");
			}
		}
		return mv;
	}
	
	@GetMapping("/{pcode}/{cartCode}")
	public BuyCollection storeReadPage(@PathVariable int pcode,
									   @PathVariable int cartCode,
									   HttpServletRequest request) {
		Cart cart = new Cart();
		cart.setCartCode(cartCode);
		cart.setPcode(pcode);
		BuyCollection store = sService.readStoreMain(cart);
		return store;
	}
	
	@RequestMapping("/insertReview")
	public void insertReview(HttpServletResponse response,
							Review review,
							HttpServletRequest request,
							@RequestParam(value="mainPhoto") MultipartFile main,
							@RequestParam(value="subPhotos") MultipartFile[] subs) 
							throws IOException{
		System.out.println(review);
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
				att.setAttStatus("Y");
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
					att.setAttStatus("Y");
					att.setAttMain("N");
					attList.add(att);
				}
			}
		}
		
		int result = sService.insertReview(review, attList);
		
		if(result > 0) {
			response.sendRedirect("collectionStore");
		} else {
			System.out.println("등록안됨");
		}
	}
	
	@GetMapping("/review/{pcode}/{cartCode}")
	public List<StoreCollection> reviewPage(@PathVariable int pcode,
			   								 @PathVariable int cartCode,
			   								 HttpServletRequest request) {
		Review rv = new Review();
		rv.setPcode(pcode);
		rv.setCartCode(cartCode);
		rv.setId(((Member)request.getSession().getAttribute("loginUser")).getId());
		List<StoreCollection> list = sService.selectOneReview(rv);
		return list;
	}
	
}

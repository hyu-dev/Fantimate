package com.kh.fantimate.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.main.model.vo.FavoriteArtist;
import com.kh.fantimate.member.model.service.MemberService;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.Artist;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.member.model.vo.User;

@Controller
@RequestMapping("/member")
@SessionAttributes({"loginUser"})
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	// 회원가입 페이지 이동
	@GetMapping("/join")
	public String joinView() {
		return "account/join";
	}
	
	// 전체 아티스트 리스트 불러오기 (회원가입시 관심 아티스트 선택)
	@RequestMapping(value="/artistList", produces="application/json; charset=utf-8")
	public @ResponseBody String artistList() {
		
		List<ArtistGroup> list = mService.selectList();
		
		//System.out.println("list 출력 : " + list);
		
		return new Gson().toJson(list);
		
	}
	
	// 아이디 중복 체크
	@ResponseBody @RequestMapping("/idCheck")
	public boolean idCheck(String id) {
		return mService.checkId(id);
	}
	
	// 회원 등록
	@PostMapping("/join")
	public String memberJoin(@ModelAttribute User u,
							 @ModelAttribute Member m,
							 @ModelAttribute Attachment a,
							 @ModelAttribute FavoriteArtist fv,
							 @RequestParam(value="profile", required=false) String profile,
							 @RequestParam(value="firstName", required=false) String firstName,
							 @RequestParam(value="name", required=false) String name,
							 @RequestParam(value="post", required=false) String post,
							 @RequestParam(value="address1", required=false) String address1,
							 @RequestParam(value="address2", required=false) String address2,
							 HttpServletRequest request,
							 Model model) {
		
		
		// 회원 주소
		u.setUaddress(post + "," + address1 + "," + address2);
		
		// 회원 성 + 이름
		m.setName(firstName + name);
		
		// 관심 아티스트 3명
		String[] arrayParam = request.getParameterValues("favArtists");

		FavoriteArtist fv1 = new FavoriteArtist();
		fv1.setId(u.getId());
		fv1.setArtiName(arrayParam[0]);
		FavoriteArtist fv2 = new FavoriteArtist();
		fv2.setId(u.getId());
		fv2.setArtiName(arrayParam[1]);
		FavoriteArtist fv3 = new FavoriteArtist();
		fv3.setId(u.getId());
		fv3.setArtiName(arrayParam[2]);
		
		List<FavoriteArtist> fvList = new ArrayList<FavoriteArtist>();
		fvList.add(fv1);
		fvList.add(fv2);
		fvList.add(fv3);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fvList", fvList);
		
		// 기본 프로필
		a.setAttClName(profile);
		a.setAttSvName(profile);
		
		// 출력 확인
		System.out.println("공통회원: " + m);
		System.out.println("일반회원: " + u);
		System.out.println("기본프로필: " + a);
		System.out.println("관심아티스트3명: " + map);
		
		// 1. COMMON 테이블에 insert
		int result1 = mService.insertCommon(m);
		//System.out.println("result1 : " + result1);
		
		// 2. USER 테이블에 insert
		int result2 = mService.insertUser(u);
		//System.out.println("result2 : " + result2);
		
		// 3. USER 기본 프로필 insert
		int result3 = mService.insertProfile(a);
		//System.out.println("result3 : " + result3);
		
		// 4. 관심 아티스트 3명 insert
		int result4 = mService.insertFavArtist(map);
		//System.out.println("result4 : " + result4);
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
			model.addAttribute("msg", "success");
			return "account/join";
		} else {
			model.addAttribute("msg", "fail");
			return "account/join";
		}
	
	}
	
	// 로그인 창 열기 
	@GetMapping("/login")
	public String loginView() {
		return "account/login";
	}
	
	
	// 회원 로그인 (세션 저장)
	@PostMapping("/login")
	public String memberLogin(@ModelAttribute Member m, Model model) {

		Member loginUser = mService.loginMember(m);

		if (loginUser != null) {
			
			// 1:일반유저 / 2: 소속사 / 3: 아티스트
			// loginUser.class == 1 (일반유저) 일때
			if(loginUser.getClassifyMem() == 1) {
				
				User user = mService.loginUser(loginUser.getId());
				
				model.addAttribute("loginUser", loginUser);
				model.addAttribute("user", user);
				model.addAttribute("msg", "success");
			} else if(loginUser.getClassifyMem() == 2) {
			// loginUser.class == 2 (소속사) 일때
				Agency agency = mService.loginAgency(loginUser.getId());
				model.addAttribute("loginUser", loginUser);
				model.addAttribute("agency", agency);
				model.addAttribute("msg", "success");
				
			} else if(loginUser.getClassifyMem() == 3) {
			// loginUser.class == 3 (소속아티스트) 일때
				
				Artist artist = mService.loginArtist(loginUser.getId());
				model.addAttribute("loginUser", loginUser);
				model.addAttribute("artist", artist);
				model.addAttribute("msg", "success");
			}
			
			return "account/login";
		} else {
			model.addAttribute("msg", "fail");
			return "account/login";
		}

	}
	
	
	
}

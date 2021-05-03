package com.kh.fantimate.member.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.google.gson.Gson;
import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.main.model.vo.FavoriteArtist;
import com.kh.fantimate.main.model.vo.QuitSubscribeCollection;
import com.kh.fantimate.main.model.vo.SubscribeArtist;
import com.kh.fantimate.member.model.service.MemberService;
import com.kh.fantimate.member.model.vo.Admin;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.ArtistCollection;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.member.model.vo.FindIdCollection;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.member.model.vo.User;
import com.kh.fantimate.member.model.vo.UserCollection;

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
	@RequestMapping("/idCheck")
	public @ResponseBody int idCheck(String id){
		
		int count = mService.checkId(id);
		System.out.println("아이디 홧인 : " + id);
		System.out.println("중복체크 카운트: " + count);
		if(!id.equals("")) {
			if(count == 1) {
				return count;
			} else {
				return count;
			}
		} else {
			// 아이디 널 값으로 보냈을 경우
			return 2;
		}
		

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
	public String memberLogin(@ModelAttribute Member m, Model model,HttpSession session) {

		Member loginUser = mService.loginMember(m);

		if (loginUser != null) {
			
			// 1:일반유저 / 2: 소속사 / 3: 아티스트
			// loginUser.class == 1 (일반유저) 일때
			if(loginUser.getClassifyMem() == 1 && loginUser.getStatus().equals("Y")) {
				
				List<UserCollection> user = (ArrayList<UserCollection>)mService.loginUser(loginUser.getId());
				List<SubscribeArtist> subArtist = (ArrayList<SubscribeArtist>)mService.selectSubA(loginUser.getId());
				System.out.println("회원 구독 정보오오:" + subArtist);
				session.setAttribute("subArtist", subArtist);
				System.out.println("유저 정보 : " + user);
				model.addAttribute("loginUser", loginUser);
				session.setAttribute("user", user);
				model.addAttribute("msg", "success");
			} else if(loginUser.getClassifyMem() == 3) {
			// loginUser.class == 3 (소속사) 일때
				Agency agency = mService.loginAgency(loginUser.getId());
				model.addAttribute("loginUser", loginUser);
				session.setAttribute("agency", agency);
				model.addAttribute("msg", "success");
				
			} else if(loginUser.getClassifyMem() == 2) {
			// loginUser.class == 2 (소속아티스트) 일때
				
				ArtistCollection artist = mService.loginArtist(loginUser.getId());
				model.addAttribute("loginUser", loginUser);
				session.setAttribute("artist", artist);
				model.addAttribute("msg", "success");
			} else if(loginUser.getClassifyMem() == 4) {
				
				Admin admin = mService.loginAdmin(loginUser.getId());
				model.addAttribute("loginUser", loginUser);
				session.setAttribute("admin", admin);
				model.addAttribute("msg", "success");
			} else if(loginUser.getClassifyMem() == 1 && loginUser.getStatus().equals("N")) {
				
				model.addAttribute("msg", "stop");
			}
			return "account/login";
			
		} else {
			model.addAttribute("msg", "fail");
			return "account/login";
		} 

	}
	
	// 회원의 구독 아티스트 세션에 담기
	@GetMapping("/sub")
	public String sub(HttpSession session, SubscribeArtist sb) {
		
		
		SubscribeArtist s = new SubscribeArtist();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String user = loginUser.getId();
		
		if(loginUser != null) {
			// 회원의 구독 정보 (세션에 담기) --> 널 && 유저 1일 경우 슬라이드 안 보이게 
			List<SubscribeArtist> subArtist = (ArrayList<SubscribeArtist>)mService.selectSubA(loginUser.getId());
			System.out.println("회원 구독 정보오오:" + subArtist);
			session.setAttribute("subArtist", subArtist);
		}
		
		return "common/main"; 
		
	}
	

	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		return "redirect:/main";
	}
	
	
	// 아이디 찾기 
	@PostMapping("/findId")
	public String findId(Model model, String fullName, String userEmail) {
		
		Map<String, String> map = new HashMap<>();
		map.put("fullName", fullName);
		map.put("userEmail", userEmail);
		
		FindIdCollection fc = mService.findUserId(map);
		
		if(fc != null) {
			model.addAttribute("idMsg", "success");
			model.addAttribute("fc", fc);
		} else {
			model.addAttribute("idMsg", "fail");
		}
		
		return "account/login";
		
	
	}
	
	// 비밀번호 찾기 
	@PostMapping("/findPwd")
	public String findPwd(String id,Model model) {
		System.out.println("아이디 넘어오냥:" + id);
		
		FindIdCollection userInfo = mService.findUserPwd(id);
		System.out.println("dddd 넘어오냥:" + userInfo);
		
		if(userInfo != null) {
			model.addAttribute("passMsg", "success");
			model.addAttribute("userInfo", userInfo);
		} else {
			model.addAttribute("passMsg", "fail");
		}
		
		return "account/login";

	}
	
	

	
}

package com.kh.fantimate.mypage1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fantimate.member.model.service.MemberService;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.mypage1.model.Service.Mypage1Service;


@Controller
@RequestMapping("/mypage/admin")
public class MypageAdminController {
	
	@Autowired
	private Mypage1Service mService;
	
	@Autowired
	private MemberService memService;
	
	
	// 재우추가
		@GetMapping("/report")
		public ModelAndView requestReportList(ModelAndView mv) {
//			List<Feed> feed = nService.selelctList();
			
//			if(feed != null) {
//				mv.addObject("feed", feed);
				mv.setViewName("mypage/admin/reportList");
//			}else{
//				mv.addObject("msg", "피드 조회에 실패하였습니다.");
//				mv.setViewName("common/errorpage");
//			}
			return mv;
		}
		
		@PostMapping("/detail")
		public String noticeDetail() {
			
			return "/mypage/admin/noticeDetail"; 
		}
		
		@GetMapping("/management")
		public ModelAndView memberManagement(ModelAndView mv) {
//			List<Feed> dibs = nService.selelctList();
			
//			if(dibs != null) {
//				mv.addObject("dibs", dibs);
				mv.setViewName("mypage/admin/management");
//			}else{
//				mv.addObject("msg", "피드 조회에 실패하였습니다.");
//				mv.setViewName("common/errorpage");
//			}
			return mv;
		}
		
		// 결제일순으로 보기
		// 환불신청한것부터 보기
		@GetMapping("/paylist")
		public ModelAndView payList(ModelAndView mv) {
			
			mv.setViewName("mypage/admin/payList");
			
			return mv;
		}

		
		
		
		
		@PostMapping("/insertAgency")
		public String insertAgency(@ModelAttribute Member common,
										  @ModelAttribute Agency agency,
										  Model model) {
			
			System.out.println("common 객체 : " + common);
			System.out.println("agency 객체 : " + agency);
			
			// 아이디 중복검사 로직
			int idcheck = mService.checkId(common.getId());
			
			if(idcheck > 0) {
			// 1. COMMON 테이블에 insert
			int result1 = memService.insertCommon(common);
			//System.out.println("result1 : " + result1);
			agency.setAgId(common.getId());
			int result2 = mService.insertAgency(agency);
			
				// 가입 완료 로직
				if(result1 > 0 && result2 > 0) {
					System.out.println("정상회원가입");
					model.addAttribute("msg", "success");
				}else {
					System.out.println("Agency 등록 실패");
				}
			
			}else {
				System.out.println("아이디가 중복 되었습니다.");
				model.addAttribute("msg", "fail");
			}
			
			
			return "notice/list";
		}
		
		
		// 회원가입 (DB insert)
//		@PostMapping("/join")	// DB insert(Post)
//		public String memberJoin(@ModelAttribute Member m,
//								  @RequestParam("post") String post,
//								  @RequestParam("address1") String address1,
//								  @RequestParam("address2") String address2,
//								  Model model,
//								  RedirectAttributes rd) {
//			m.setAddress(post + "," + address1 + "," + address2);
//			System.out.println("회원 가입 넘어온 값: " + m);
//			// int 값에는 null 입력 불가로 값이 들어오지 않았을 때 400 - 잘못 된 요청 에러 발생
//			// 객체 타입인 Integer로 다루면 문제 없음
//			
//			// => 한글 깨짐 
//			//    스프링에서 제공하는 필터를 이용해서 요청 시 전달오는 값에 한글이 있을경우
//			//	   인코딩 될 수 있도록 처리 추가 (web.xml)
//			
//			
//			// => 비밀번호가 평문으로 되어 암호화 처리 필요
//			/*	스프링 시큐리티 모듈에서 제공하는 bcrypt 암호화 방식 사용
//			 	
//			  	단방향 해쉬 함수는 암호화 된 메세지를 수학적인 연산을 통해 생성(다이제스트) - ex. SHA-512
//			  	* 문제 - 단방향 해쉬 함수는 많은 다이제스트가 확보되면 평문을 찾아낼 수 있음
//			  		      비밀번호 저장을 위한 알고리즘이 아닌 검색을 위해 설계된 알고리즘
//			 	* 해결 - salting 기법 : 원본 메세지에 문자열을 추가하여 동일한 길이의 다이제스트를 생성
//			 	 		but salt 값을 알아내면 단방향 해쉬 함수를 통한 다이제스트를 복호화 하는 것과 같음
//			 	
//			 	bcrypt 방식은 이러한 salt 값을 랜덤하게 생성하여 암호화 하는 방식.
//			 	
//			 	1) pom.xml 에서 스프링 시큐리티 모듈 관련 라이브러리 추가
//			 	2) spring-security.xml 파일 만들어서 bean 정의
//			 	3) web.xml에서 spring-sequrity.xml 경로 추가하여 컨테이너가 읽어갈 수 있도록 함
//			 	4) 필드부에 해당 객체 선언 후 의존성 주입
//			 
//			 */
//			
//			String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
//			m.setPwd(encPwd);
//			
//			int result = mService.insertMember(m);
//			
//			if(result > 0) {
//				// model.addAttribute("msg", "회원 가입이 완료 되었습니다. 로그인 해주세요.");
//				// -> SessionAttributes에 작성해서 session scope에 저장
//				// -> alert 처리는 되지만 url에 String 값이 노출 됨
//				
//				// * RedirectAttributes : Redirect시 데이터를 전달할 수 있는 객체
//				rd.addFlashAttribute("msg", "회원 가입이완료 되었습니다. 로그인 해주세요.");
//				// redirect 직전 모든 Flash 속성을 세션에 복사 -> redirect 직후 세션에서 다시 모델로 이동
//				return "redirect:/home";
//			}else {
//				model.addAttribute("msg", "회원가입에 실패하였습니다.");
//				return "common/errorpage";
//			}
//		}
		
		
		
		
		
		
		
}


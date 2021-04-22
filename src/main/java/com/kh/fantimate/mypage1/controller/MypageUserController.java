package com.kh.fantimate.mypage1.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fantimate.common.model.vo.Friend;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.mypage1.model.Service.Mypage1Service;
import com.kh.fantimate.mypage1.model.vo.FriendPageInfo;
import com.kh.fantimate.mypage1.model.vo.UserPaymentCol2;
import com.kh.fantimate.pay.model.vo.Cart;
import com.kh.fantimate.pay.model.vo.Payment;

@Controller
@RequestMapping("/mypage/user")
public class MypageUserController {
	@Autowired
	private Mypage1Service mService;
	
	
	// 재우추가
		@GetMapping("/feed")
		public ModelAndView userMyFeed(ModelAndView mv) {
//			List<Feed> feed = nService.selelctList();
			
//			if(feed != null) {
//				mv.addObject("feed", feed);
				mv.setViewName("mypage/user/feed");
//			}else{
//				mv.addObject("msg", "피드 조회에 실패하였습니다.");
//				mv.setViewName("common/errorpage");
//			}
			return mv;
		}
		
		@GetMapping("/subscribes")
		public ModelAndView userMysubscribes(ModelAndView mv) {
			
			mv.setViewName("mypage/user/subscribes");
			
			return mv;
		}
		
		@GetMapping("/dibs")
		public ModelAndView userMyDibs(ModelAndView mv) {
//			List<Feed> dibs = nService.selelctList();
			
//			if(dibs != null) {
//				mv.addObject("dibs", dibs);
				mv.setViewName("mypage/user/dibs");
//			}else{
//				mv.addObject("msg", "피드 조회에 실패하였습니다.");
//				mv.setViewName("common/errorpage");
//			}
			return mv;
		}
		
//		여기서부턴 상세조건 생략, 구현부터
		@GetMapping("/friends")
		public ModelAndView userMyFriends(ModelAndView mv,
				@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
				HttpSession session) {
			// 비로그인 처리
			if(session.getAttribute("loginUser") == null) {
				mv.addObject("msg", "로그인이 필요합니다.");
				mv.setViewName("mypage/admin/errorpage");
				return mv;
			}
			
			Member m = (Member) session.getAttribute("loginUser");
			System.out.println("m.getId() : " + m.getId());
			
			// 친구개수
			int listCount = mService.RListCountFriend(m);
			System.out.println("친구 수 : " + listCount);
			
			// 요청 페이지에 맞는 리스트 조회
			FriendPageInfo pi = pagingFriend(currentPage, listCount, m.getId());
			List<Friend> list = mService.requestFriendList(pi);	// 아직
			System.out.println("읽어온 친구 : " + list);
			
			
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName("mypage/user/friends");
			}else{
				mv.addObject("msg", "조회에 실패하였습니다.");
				mv.setViewName("mypage/admin/errorpage");
			}
			return mv;
		}
		@GetMapping("/friendsReq")
		public ModelAndView userMyFriendsReq(ModelAndView mv,
				@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
				HttpSession session) {
			if(session.getAttribute("loginUser") == null) {
				mv.addObject("msg", "로그인이 필요합니다.");
				mv.setViewName("mypage/admin/errorpage");
				return mv;
			}
			
			Member m = (Member) session.getAttribute("loginUser");
			System.out.println("m.getId() : " + m.getId());
			
			// 친구개수
			int listCount = mService.RListCountFriendReq(m);
			System.out.println("친구 신청 수: " + listCount);
			
			// 요청 페이지에 맞는 리스트 조회
			FriendPageInfo pi = pagingFriend(currentPage, listCount, m.getId());
			List<Friend> list = mService.requestFriendList2(pi);	// 아직
			System.out.println("읽어온 친구신청 수 : " + list);
			
			
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName("mypage/user/friendsReq");
			}else{
				mv.addObject("msg", "조회에 실패하였습니다.");
				mv.setViewName("mypage/admin/errorpage");
			}
			return mv;
		}
		
		@GetMapping("friends/update")
		public ModelAndView userFriendUpdate(ModelAndView mv,
				@RequestParam(value="fid", required=true) String fid,
				@RequestParam(value="url", required=true) String url,
				@RequestParam(value="stat", required=true) int stat,
				HttpSession session) {
			// 친구요청 객체 전달
			Friend f = new Friend();
			f.setFrSend(fid);
			String recId = ((Member)session.getAttribute("loginUser")).getId();
			f.setFrRecId(recId);
			f.setFrStatus(stat);
			System.out.println("혹시나 객체값 출력 : " + f);
			System.out.println("url : " + url);
			
			// 받아온 값들로 해당 유저의 정보를 업데이트 해야함.(추후에 -1로 아예 컬럼 삭제할 경우 대비
			if(stat > 0) {	// 친구를 수락(2) 거절(3) 삭제도일단 (3)
				int result = mService.userFriendUpdate2(f);
				System.out.println("친구 상태 업데이트 완료 : " + result);
				// 업데이트 성공시
				if(result > 0) {
					mv.addObject("message", "친구정보가 수정되었습니다.");
					mv.setViewName("mypage/user/friends");
					
				// 업데이트 실패시
				}else {
					System.out.println("업데이트 실패");
					mv.addObject("msg", "업데이트에 실패하였습니다..");
					mv.setViewName("mypage/admin/errorpage");
				}
			}else {
				System.out.println("잘못된 접근입니다.");
				mv.addObject("msg", "잘못된 접근입니다.");
				mv.setViewName("mypage/admin/errorpage");
			}
			return mv;
		}
		
		@GetMapping("/comments")
		public ModelAndView userMycomments(ModelAndView mv) {
			
			mv.setViewName("mypage/user/comments");
			
			return mv;
		}
		
		@GetMapping("/bookmarks")
		public ModelAndView userMybookmarks(ModelAndView mv) {
			
			mv.setViewName("mypage/user/bookmarks");
			
			return mv;
		}
		
		@GetMapping("/fanStore")
		public ModelAndView userMyfanstore(ModelAndView mv) {
			
			mv.setViewName("mypage/user/fanStore");
			
			return mv;
		}
		
		@GetMapping("/payments")
		public ModelAndView userMypayments(ModelAndView mv,
				@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
				HttpSession session) {
			
			if(session.getAttribute("loginUser") == null) {
				mv.addObject("msg", "로그인이 필요합니다.");
				mv.setViewName("mypage/admin/errorpage");
				return mv;
			}
			
			Member m = (Member) session.getAttribute("loginUser");
			System.out.println("m.getId() : " + m.getId());
			
			// 결제개수
			int listCount = mService.RListCountPayList(m);
			System.out.println("결제 수: " + listCount);
			
			// 요청 페이지에 맞는 리스트 조회
			FriendPageInfo pi = pagingFriend(currentPage, listCount, m.getId());
			List<UserPaymentCol2> list = mService.requestPayList(pi);	// 아직
			System.out.println("읽어온 결제정보 : " + list);
			
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName("mypage/user/payments");
			}else{
				mv.addObject("msg", "조회에 실패하였습니다.");
				mv.setViewName("mypage/admin/errorpage");
			}
			return mv;
		}
		// Cartcode를 받아서 update
		@GetMapping("/payments/update")
		public String userMypaymentsUpdate(
				@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
				@RequestParam(value="Cartcode", required=true) String Cartcode,
				@RequestParam(value="paystatus", required=true) String paystatus,
				HttpSession session,
				Model model){
			
			// M, S 넘어옴 (Media, Store)
			String[] payCategory = Cartcode.split("-");
			System.out.println("payCategory[0] : " + payCategory[0]);
			String payResult = payCategory[0];		// M or S	// 미디어 or 스토어
			
			// paystatus 2 면구매확정 3이면 환불신청
			int cartCode = Integer.parseInt(payCategory[1]);	// String->int 형변환했을뿐 Cart의 cate_code
			
			//객체에 값 저장하여 넘기기
			String userid = ((Member)session.getAttribute("loginUser")).getId();
			UserPaymentCol2 u = new UserPaymentCol2();
			Payment p = new Payment();
			Cart c = new Cart();
			System.out.println("Cartcode : " + Cartcode);			// ex) M-29
			System.out.println("paystatus : " + paystatus);			// ex) 2
			
			// 아이디와 넘어온 cartCode 대입
			c.setId(userid);
			c.setCartCode(cartCode);
			
			// u에 다시 cartcode, id 대입
			u.setCart(c);
			
			System.out.println("여기까지 잘 넣어졌나 확인 u = " + u);
			// 해당 cartCode의 Pay code 알아오기
			String paycode = mService.selectPayCodeList(u);
			System.out.println("paycode : " + paycode);
			c.setPayCode(paycode);
			u.setCart(c);
			
			// 해당 cartCode의 개수 리턴
			int countCartCode = mService.CountCartCodeList(u);
			System.out.println("조회된 countCartCode 갯수 : " + countCartCode);
			
			
			// 해당 PayCode로 1개밖에 없다면 바로 로직수행(구매확정 혹은 환불신청)
			if(countCartCode == 1) {
				if(payCategory[0].equals("M")) {	// 미디어라면
					if(Integer.parseInt(paystatus) == 2) {	// 구매확정이라면
						c.setIsBought("C");
						System.out.println("Cart에 C가 제대로 설정됨? : " + c);
						p.setPayStatus(paystatus);	// 넘어온 2를 대입
						
						u.setCart(c);
						u.setPayment(p);
						// join_view update 오류 구문으로 하나씩 업데이트
						// PAYMENT -> PAY_STATUS 2로, CART ->IS_BOUGHT "C"
						int result1 = mService.userpaymentMConfirmUpdateC(u);
						System.out.println("수행후 result 1 : " + result1);
						int result2 = mService.userpaymentMConfirmUpdateP(u);
						System.out.println("수행후 result 2 : " + result2);
						
						if(result1 < 0 && result2 < 0) {
							model.addAttribute("msg", "구매확정에 실패하였습니다(-1)");
						}
						
					}
				}else if(payCategory[0].equals("S")) { // 스토어라면
					// 구매확정인경우
					
					// 환불인경우
					
				}else {
					// 이런경우는 아직 없음
					System.out.println("오류발생 M, S가아닌 다른 경우가 발생함.");
				}
				
			}else if(countCartCode > 1) {
				// countCartCode 1개보다 크다면 배열 받아오기
				
				// 받아온 배열 사이즈 구하기 --> ? 필요있나
				
				// 수정하기
				
				// 해당 PAYCODE의 상태 싹 조회해서 모두가 환불완료 혹은 구매확정이라면
				// 전체 구매확정(PAY STATUS 2로 설정하기)
			}
			
			
			if(payCategory[0].equals("M")) {	// 미디어라면
				
			}else if(payCategory[0].equals("S")) { // 스토어라면
		
			}
			
			System.out.println("객체 p : " + p);
			System.out.println("객체 c : " + c);
			System.out.println("객체 u : " + u);
			
			
			
			
			if(cartCode == 2) {// 구매확정
				
			}else if(cartCode == 3) {	// 환불신청
				
			}
			
//			if(result > 0) {
//				mv.addObject("pi", pi);
//				mv.setViewName("mypage/user/payments");
//				return "redirect:/mypage/user/payments";
//			}else {
//				mv.addObject("msg", "조회에 실패하였습니다.");
//				mv.setViewName("mypage/admin/errorpage");
//				session.setAttribute("msg", "조회에 실패하였습니다.");
//				model.addAtt
//				return "redirect:/mypage/user/payments";
//			}
			return "redirect:/mypage/user/payments";
		}
		
		//파일 저장 아직
		private String saveFile(MultipartFile file, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			System.out.println(root);
			String savePath = root + "\\buploadFiles";
			File folder = new File(savePath);
			if(!folder.exists()) folder.mkdirs();	// -> 해당 경로가 존재하지 않는다면 디렉토리 생성
			
			// 파일명 리네임 규칙 년월일시분초_랜덤값.확장자
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String originalFileName = file.getOriginalFilename();
			String renameFileName = sdf.format(new Date()) 
								+ "_"
								+ (int)(Math.random() * 100000)
								+ originalFileName.substring(originalFileName.lastIndexOf("."));
			String renamePath = folder + "\\" + renameFileName; // 저장하고자 하는 경로 + 파일명
			
			try {
				file.transferTo(new File(renamePath));
				// => 업로드 된 파일 (MultipartFIle) 이 rename 명으로 서버에 저장
			} catch (IllegalStateException | IOException e) {
				System.out.println("파일 업로드 에러  : " + e.getMessage());
			}	
			
			return renameFileName;
		}
		
		// 검색조건에 맞는 페이징 구하기
		public int RListCountMethod2(String category) {
			System.out.println("User Controller RListName : " + category);
			
			int listCountResult = mService.RListCountMethod2(category);
			System.out.println("페이징 처리 결과 listCountValue : " + listCountResult);
			return listCountResult;
		}
				
		// 친구 페이징처리
		public FriendPageInfo pagingFriend(int currentPage, int listCount, String userId) {
				FriendPageInfo pi = null;	// 페이지 정보를 담아 줄 PageInfo 참조변수 선언
				
				int pageLimit = 10;	// 한 페이지에 보여질 페이징바의 갯수
				int boardLimit = 10;	// 한 페이지 보여질 게시글 개수
				
				int maxPage = (int)Math.ceil((double)listCount / boardLimit);
				int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
				int endPage = startPage + pageLimit - 1;
				
				// 마지막 페이지가 총 페이지 수보다 클 경우
				if(maxPage < endPage) {
					endPage = maxPage;
				}
				pi = new FriendPageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit, userId);
				System.out.println("pagingFriend pi객체 : " + pi);
				pi.setSerchCondition(userId);
				return pi;
			}
}


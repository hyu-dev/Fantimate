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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Friend;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.member.model.vo.User;
import com.kh.fantimate.mypage1.model.Service.Mypage1Service;
import com.kh.fantimate.mypage1.model.vo.FriendPageInfo;
import com.kh.fantimate.mypage1.model.vo.UserPaymentCol2;
import com.kh.fantimate.mypage1.model.vo.UserUpdateVo;
import com.kh.fantimate.pay.model.vo.Cart;
import com.kh.fantimate.pay.model.vo.Payment;

@Controller
@RequestMapping("/mypage/user")
public class MypageUserController {
	@Autowired
	private Mypage1Service mService;
		
		
		// 회원정보 수정
		@PostMapping("/update")
		public String userUpdate(
				@ModelAttribute("loginUser") Member common,
				@ModelAttribute("User") User user,
				Model model,
				RedirectAttributes rd,
				@RequestParam(value="uploadfile") MultipartFile file,
				HttpServletRequest request,
				HttpSession session) {
			
			System.out.println("회원정보수정 전달");
			//		System.out.println("Member(Common) 객체 : " + common);
			System.out.println("User 객체 : " + user);
			String paramId = ((Member)request.getSession().getAttribute("loginUser")).getId();
			// 원래 프로필 파일 조회
			Attachment userAtt = mService.selectProfile(((Member)request.getSession().getAttribute("loginUser")));
			System.out.println("userAtt : " + userAtt);
			// 프로필 저장 경로(미리선언)
			String savePath = session.getServletContext().getRealPath("resources") + "\\images\\mypage\\user\\profile\\" + paramId;

			UserUpdateVo updateUser = new UserUpdateVo();

			Member m12 = new Member();
			m12.setId(paramId);
			m12.setPwd(common.getPwd());
			updateUser.setCommon(m12);

			User m13 = new User();
			m13.setUemail(user.getUemail());
			updateUser.setUser(m13);


			int upResult = mService.updateProfileInfo(updateUser);	

			//프로필정보가 제대로 바꼇다면
			if(upResult > 0) {

				// 업로드 파일이 있다면 삭제하기
				if(!file.isEmpty()) {
					// 파일 원본이름 배열
					String[] originFileNameAndJPEG = file.getOriginalFilename().split("\\."); 
					String fileExt = originFileNameAndJPEG[1];


					System.out.println("file.getOriginalFilename() 왜 오류뜨지 : " + file.getOriginalFilename());
					System.out.println("확장자 : " + fileExt);

					// 첫 업로드라면 seq 통해 컬럼먼저 생성
					System.out.println("userAtt 비어있니? : " + userAtt);
					if(userAtt == null) {
						//				if(userAtt.getAttSvName() == null) {

						Attachment newAtt = new Attachment();
						newAtt.setAttClName(file.getOriginalFilename());	// 올린 원본이름 그대로 저장
						newAtt.setAttSvName(paramId + fileExt);	// 유저아이디 + 확장자로 저장
						newAtt.setId(paramId);
						int result = mService.insertProfile(newAtt);

						if(result < 0) {
							System.out.println("컬럼생성 오류");
							return "";
						}

					}
					//			// 기존 프로필(userAtt) 파일 삭제하기
					if(userAtt != null) {
						String fileName = userAtt.getAttClName();
						File deleteFile = new File(savePath + "\\" + fileName);

						// 기존 파일 삭제
						if(deleteFile.exists()) {
							deleteFile.delete();
							System.out.println("기존 프로필 삭제 완료");
						}
					}
					// 혹시 처음 업로드라면 경로생성
					File folder = new File(savePath);
					if(!folder.exists()) folder.mkdirs();

					System.out.println("savePath : " + savePath);
					// 파일 생성하기
					String originalFileName = file.getOriginalFilename();
					System.out.println("originalFileName : " + originalFileName );
					String renameFileName = paramId + "." + fileExt;
					System.out.println("renameFileName : " + renameFileName);

					try {
						file.transferTo(new File(savePath + "\\" + renameFileName));
					} catch (IllegalStateException | IOException e) {
						System.out.println("파일 업로드 에러 : " + e.getMessage());
					}
					System.out.println("프로필 저장 정상 수행");

					// 변경될 sv, cv네임 id 넘겨주기
					Attachment upAtt = new Attachment();
					upAtt.setAttClName(file.getOriginalFilename());
					upAtt.setAttSvName(renameFileName);
					upAtt.setId(paramId);
					int result = mService.updateProfile(upAtt);
					System.out.println("updateProfile result : " + result);
					if(result > 0) {

					}

					// 파일 삭제하기 전에 USER_PROFILE의 UP_STATUS컬럼을 Y로 변경해준다.	(N일경우만 Y로 해줘도 되지만 일단은 다 Y로 변경)
					Member tempProfile = new Member();
					tempProfile.setStatus("Y");
					int upstatus = mService.updateUpStatusUser(tempProfile);
					if(upstatus < 0) {
						System.out.println("Y로 변경 실패");
						return "";
					}
				}
			}
			return "redirect:/mypage/user/payments";
		}
////////////////////////////////////////////////////////////////////////////////////////////	
		
		
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
			}else if( ((Member)(session.getAttribute("loginUser"))).getClassifyMem() != 1 ){
				mv.addObject("msg", "일반회원이 아닙니다.");
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
				@RequestParam(value="isBought", required=true) String isBought,
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
			System.out.println("isBought : " + isBought);			// ex) Y결제완료,W대기,R환불,C확정
			
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
//			if(countCartCode == 1) {
				if(payCategory[0].equals("M")) {	// 미디어라면
//					if(Integer.parseInt(paystatus) == 2) {	// 구매확정이라면
					if(isBought.equals("C")) {
						c.setIsBought("C");
						u.setCart(c);
						System.out.println("Cart에 C가 제대로 설정됨? : " + c);
//						p.setPayStatus(paystatus);	// 넘어온 2를 대입
//						u.setPayment(p);
						
						// join_view update 오류 구문으로 하나씩 업데이트
						// PAYMENT -> PAY_STATUS 2로, CART ->IS_BOUGHT "C"
						int result1 = mService.userpaymentMConfirmUpdateC(u);
						System.out.println("수행후 result 1 : " + result1);
						if(result1 < 0) {
							model.addAttribute("msg", "미디어 구매확정에 실패하였습니다(-1)");
						}
						
						// 만약 2가지 다로 할경우 밑에 추가로 로직 다시 작성
//						int result2 = mService.userpaymentMConfirmUpdateP(u);
//						System.out.println("수행후 result 2 : " + result2);
						
//						if(result1 < 0 && result2 < 0) {
//							model.addAttribute("msg", "구매확정에 실패하였습니다(-1)");
//						}
						
					}
				}else if(payCategory[0].equals("S")) { // 스토어라면
					// 구매확정인경우
					if(isBought.equals("C")) {
						c.setIsBought("C");
						u.setCart(c);
						System.out.println("Cart에 C가 제대로 설정됨? : " + c);
						
						int result1 = mService.userpaymentSConfirmUpdateC(u);
						System.out.println("수행후 result 1 : " + result1);
						if(result1 < 0) {
							model.addAttribute("msg", "스토어 구매확정에 실패하였습니다(-1)");
						}
					}
					
					// 환불인경우
					if(isBought.equals("W")) {
						c.setIsBought("W");
						u.setCart(c);
						System.out.println("Cart에 W가 제대로 설정됨? : " + c);
						
						// 이제는 환불도 같은 로직으로 가능
						int result1 = mService.userpaymentSConfirmUpdateC(u);
						System.out.println("수행후 result 1 : " + result1);
						if(result1 < 0) {
							model.addAttribute("msg", "스토어 환불신청에 실패하였습니다(-1)");
						}
					}
					
				}else {
					// 이런경우는 아직 없음
					System.out.println("오류발생 M, S가아닌 다른 경우가 발생함.");
				}
/*			
// 나중에 
			}else if(countCartCode > 1) {
				// countCartCode 1개보다 크다면 배열 받아오기
				
				// 수정하기
				
				// 해당 PAYCODE의 상태 싹 조회해서 모두가 환불완료 혹은 구매확정이라면
				// 전체 구매확정(PAY STATUS 2로 설정하기)
				
				if(payCategory[0].equals("M")) {	// 미디어라면
					
				}else if(payCategory[0].equals("S")) { // 스토어라면
					
				}
			}
*/			
			
			System.out.println("객체 p : " + p);
			System.out.println("객체 c : " + c);
			System.out.println("객체 u : " + u);
			
			
			return "redirect:/mypage/user/payments";
		}
		
		//파일 저장 아직(참고용)
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


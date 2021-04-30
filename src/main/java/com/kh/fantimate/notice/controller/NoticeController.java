package com.kh.fantimate.notice.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fantimate.common.model.vo.Notice;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.notice.model.Service.NoticeService;
import com.kh.fantimate.notice.model.vo.NoticePageInfo;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService nService;
	
	// LISTLEVEL에 따른 게시글 차등 조회
	@GetMapping("/list")
	public ModelAndView noticeList(ModelAndView mv,
				@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
				HttpSession session){
		// 기본으로 넘어오는 값이 없기 때문에 required=false, defaultValue=1
		
		//조회 가능레벨 매개변수로 넘기기위해 계산
		int listLevel = 0;
		if(session.getAttribute("loginUser") != null) {
			Member m = (Member)(session.getAttribute("loginUser"));
			listLevel = m.getClassifyMem();
		}
		System.out.println("리스트 레벨 : " + listLevel);
		
		// 총 게시판개수
		int listCount = nService.selectListCountAll(listLevel);	
		// 0 :전체 공개(로그인), 1 : 아티스트,소속사조회 , 2 : 소속사 
		System.out.println("조회된 게시판 개수 : " + listCount);
		
		// 요청 페이지에 맞는 게시글 리스트 조회
		NoticePageInfo pi = pagingNotice(currentPage, listCount, listLevel);
		List<Notice> list = nService.selectList(pi);
		
		//테스트
		System.out.println(list);
		
		// 출력해주기
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("mypage/admin/noticeList");
		}else {
			mv.addObject("msg", "조회에 실패하였습니다.");
			mv.setViewName("mypage/errorpage");
		}
		
		return mv;
	}
		
	// 공지사항 작성페이지
	@GetMapping("/write")
	public String noticeWrite(HttpSession session,
							  HttpServletResponse response) {
		Member member = (Member)(session.getAttribute("loginUser"));
		
		if(member != null) {
			if(member.getClassifyMem() == 4) {
			return "mypage/admin/noticeWrite";
			//redirect: /detail?seq="+ vo.getSeq();
			}else{
				try {
					response.getWriter().println("<script>alert('잘못된 접근방법입니다.');</script>");
				} catch (IOException e) {
					e.printStackTrace();
				}
				return "common/main";
			}
		}else {
			try {
				response.getWriter().println("<script>alert('잘못된 접근방법입니다.');</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}			
			return "common/main";
		}
	}
	
	// 공지사항 작성 상세페이지
	@PostMapping("/insert")
	public String noticeInsert(Notice n,
							   HttpServletRequest request) {
		
		// 공지사항 등록
		int result = nService.insertNotice(n);
		/*
		// 공지사항 등록 알림(아티스트 소속사)
		if(n.getRlevel() == 2 || n.getRlevel() == 3) {
			int alarmFriend = nService.insertAlarmF(n);
			System.out.println("공지사항 알람 수행 됐니? (0 or 1) " + alarmFriend);
			if(alarmFriend < 0) {
			System.out.println("알람 실패");
			}
		*/
		if(result > 0) {
			System.out.println("공지사항 등록 성공");
		}
		
		return "redirect:/notice/list";
	}
	
	// 공지사항 detail
	@GetMapping("/detail")
	public String noticeDetail(int nid,
							  HttpServletRequest request,
							  HttpServletResponse response,
							  Model model) {
		boolean flagnlist = false;
		boolean flagnid = false;

		Cookie[] cookies = request.getCookies();
		// cookies에 request영역의 쿠키를 가져와서 저장


		try {
			if(cookies != null) {
				for(Cookie c : cookies) {
					//반복문을 돌려 확인했을때

					// nlist안에 bid가 있다면 flagnlist를 true로 바꿔줌.
					if(c.getName().equals("nlist")) {
						flagnlist = true;

						// 기존 쿠키 값 먼저 읽어오기(대신 , 등의 특수문자 인코딩 때문에 UTF-8로 decode 해줘야함)
						String nlist = URLDecoder.decode(c.getValue(), "UTF-8");

						String[] list = nlist.split(",");	// list안에 ,기준으로 잘라 넣기
						for(String st : list) {
							// 쿠키 안에 지금 클릭한 게시글의 bid가 들어있다면 => 읽었음을 표시
							if(st.equals(String.valueOf(nid))) {
								flagnid = true;
							}
						}
						// nid가 false일 경우 --> 게시글을 읽지 않았을 경우
						if(!flagnid) {
							c.setValue(URLEncoder.encode(nlist + "," + nid, "UTF-8"));
							response.addCookie(c);
						}
					}
				}
				if(!flagnlist) {	
					// nlist라는 쿠키가 만들어지지 않은 경우
					Cookie c1 = new Cookie("nlist", URLEncoder.encode(String.valueOf(nid), "UTF-8"));
					response.addCookie(c1);
				}
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		Notice n = nService.selectNotice(nid, !flagnid);
		
		if(n != null) {
			model.addAttribute("Notice", n);
			return "mypage/admin/noticeDetail";
		}else {
			model.addAttribute("msg", "공지사항 상세보기에 실패했습니다.");
			return "mypage/admin/noticeList";
		}
	}
	
	
	
	// 공지사항 수정하기
	@GetMapping("updatepage")
	public String updatepageView(Model model, int nid) {
		// 넘겨받은 파라미터로 해당 공지사항을 조회해온 후 model객체에 저장하여 notice 수정페이지로 리턴
		Notice n = nService.selectNotice(nid, false);	// 조회수 증가 없이
		// System.out.println();
		// System.out.println("updatepage 의 n : " + n);
		model.addAttribute("notice", n);
		
		return "mypage/admin/noticeUpdate";
	}
	
	
	
	// 공지사항 수정
	@PostMapping("update")
	public String noticeUpdate(Notice n,
							   HttpServletRequest request) {
		// System.out.println("수정전 게시판 정보 : " + n);
		int result = nService.updateNotice(n);
		
		if(result > 0) {
			System.out.println("공지사항 수정 성공");
			return "redirect:/notice/detail?nid=" + n.getNid();
		}else {
			System.out.println("공지사항 수정 실패");
//			return "mypage/admin/noticeList";
			return "redirect:/notice/list?nid=" + n.getNid();
		}
	}
	
	
	
	// 공지사항 삭제
	@GetMapping("/delete")
	public String boardDelete(int nid, HttpServletRequest request) {
		int result = nService.deleteNotice(nid);
		
//		if(result > 0) {
			return "redirect:/notice/list";
//		}else {
//			return "redirect:/notice/list";
//		}
		
	}
	
	
	
		
		
		
	//게시판페이징
	public NoticePageInfo pagingNotice(int currentPage, int listCount, int listLevel) {
			NoticePageInfo pi = null;	// 페이지 정보를 담아 줄 PageInfo 참조변수 선언
			
			int pageLimit = 10;	// 한 페이지에 보여질 페이징바의 갯수
			int boardLimit = 10;	// 한 페이지 보여질 게시글 개수
			
			int maxPage = (int)Math.ceil((double)listCount / boardLimit);
			int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
			int endPage = startPage + pageLimit - 1;
			
			// 마지막 페이지가 총 페이지 수보다 클 경우
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			pi = new NoticePageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit, listLevel);
			System.out.println("전달이 됐니?" + pi.getListLevel());
			return pi;
		}
}


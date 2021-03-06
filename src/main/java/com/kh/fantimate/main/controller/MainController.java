


package com.kh.fantimate.main.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.fantimate.common.model.vo.Alarm;
import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Friend;
import com.kh.fantimate.common.model.vo.Message;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.main.model.service.MainService;
import com.kh.fantimate.main.model.vo.FeedTopNineCollection;
import com.kh.fantimate.main.model.vo.FriendCollection;
import com.kh.fantimate.main.model.vo.MainCollection;
import com.kh.fantimate.main.model.vo.MediaTopNineCollection;
import com.kh.fantimate.main.model.vo.QuitSubscribeCollection;
import com.kh.fantimate.main.model.vo.StoreTopNineCollection;
import com.kh.fantimate.main.model.vo.SubscribeArtist;
import com.kh.fantimate.member.model.vo.Member;

@Controller
//@RestController
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	private MainService mpService;
	
	// 로그인 유저의 관심 아티스트 리스트 불러오기 (메인페이지 상단에 3개 뿌려주기)
	@RequestMapping(value="/artistFavList", produces="application/json; charset=utf-8")
	public @ResponseBody String artistFavList(HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String user = loginUser.getId();
		
		List<MainCollection> list = (ArrayList<MainCollection>)mpService.selectArtistFavList(user);


		//System.out.println("list 출력 : " + list);
		
		return new Gson().toJson(list);
		
	}
	
	
	
	
	// 관심아티스트 제외한 아티스트 리스트 불러오기 (메인페이지 뿌려주기)
	@RequestMapping(value="/artistList", produces="application/json; charset=utf-8")
	public @ResponseBody String artistList(HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String user = loginUser.getId();
		
		List<MainCollection> list = (ArrayList<MainCollection>)mpService.selectArtistList(user);
		
		//System.out.println("list 출력 : " + list);
		
		return new Gson().toJson(list);
		
	}
	
	// 로그인전 - 전체 아티스트 리스트
	@RequestMapping(value="/artistWholeList", produces="application/json; charset=utf-8")
	public @ResponseBody String artistWholeList(HttpSession session) {
		
		
		List<MainCollection> list = (ArrayList<MainCollection>)mpService.selectArtistWholeList();
		
		//System.out.println("list 출력 : " + list);
		
		return new Gson().toJson(list);
		
	}
	

	// 구독페이지 이동 (아티스트명 가지고)
	@GetMapping("/subscribe")
	public String joinView(String artNameEn, Model model, HttpSession session, SubscribeArtist sb) {
		
		SubscribeArtist s = new SubscribeArtist();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String user = loginUser.getId();
		
		sb.setId(user);
		sb.setArtNameEn(artNameEn);
		
		// 1. 구독 여부 확인 (유저아이디, 아티스트명 가지고 가서 있는지 확인)
		int count = mpService.selectSubCount(sb);
		// 2. 구독 취소 여부 확인
		if(count >= 1)
		  s = mpService.selectQuitSub(sb);
		
		System.out.println("ssssss" + s);
		System.out.println("status 나오니 : " + s.getSubStatus());
		
		if (s != null && count >= 1) {
			if(s.getSubStatus().equals("N")) {
				// 구독 했으면 ---> 해당 피드로 이동 (아티스트명 같이 보내기)
				return "redirect:/fanfeed/fanFeedList?artNameEn="+artNameEn;
			} else if (s.getSubStatus().equals("Y") ) {
				// 예전에 구독했던 닉네임 이름, 구독 프로필 정보 가져오기 
				QuitSubscribeCollection qs = mpService.selectQuitInfo(sb);
				System.out.println("qs정보나오니"+ qs);
				model.addAttribute("qs", qs);
				model.addAttribute("artNameEn", artNameEn);
				model.addAttribute("msg", "subscribeMess");
				return "main/subscribe";
			}
			
		} else {
			if(loginUser.getClassifyMem() == 1){
				// 구독 안 했을 경우 & 일반유저인경우 ---> 구독 페이지로 이동 
				model.addAttribute("artNameEn", artNameEn);
				return "main/subscribe";
			} else if (loginUser.getClassifyMem() == 2 || loginUser.getClassifyMem() == 3 || loginUser.getClassifyMem()==4) {
				// 소속사, 관리자, 아티스트로 로그인한 경우 --> 바로 팬 피드 이동 
				return "redirect:/fanfeed/fanFeedList?artNameEn="+artNameEn;
			}
		}
		
		model.addAttribute("msg", "fail");
		return "main/subscribe"; 
		
	}
	
	@PostMapping("/subscribe")
	public String subscribeArtist(SubscribeArtist sb,
								  Attachment att,
								  @RequestParam(value="nickname", required=false) String nickname,
								  @RequestParam(value="artNameEn", required=false) String artNameEn,
								  @RequestParam(value="uploadFile") MultipartFile file,
								  HttpServletRequest request,
								  HttpSession session,
								  Model model) {
		
		// 닉네임을 가져와서 중복되는 닉네임이 있는지 확인 카운트가 1개 이상이면 insert(x)
		// 그게 아니라면 , 등록 가능
		// 추후에 취소했던 여부도 확인해야함 (취소 했는데 다시 구독하는 경우 --> 닉네임 다시 사용할건지 체크(?)
		
		
		// 닉네임을 가져와서 중복되는 닉네임이 있는지 확인 카운트가 1이상이면 insert(x)
		int count = mpService.selectNickName(nickname);
		//System.out.println("왜ㅐㅐ" + count);
		
		if(count >= 1) {
			
			model.addAttribute("msg", "sameNickname");
			model.addAttribute("artNameEn", artNameEn);
			return "main/subscribe";
			
		} else if(count == 0) {
			
			// 로그인유저 set
			Member loginUser = (Member)session.getAttribute("loginUser");
			String user = loginUser.getId();
			sb.setId(user);
			// 아티스트 명 set
			sb.setArtNameEn(artNameEn);
			// 구독 닉네임 set
			sb.setNickname(nickname);
			
			// 업로드 파일 서버에 저장
			// 파일이 첨부 되었다면
			if (!file.getOriginalFilename().equals("")) {
				// 파일 저장 메소드 별도로 작성 - 리네임 리턴
				String renameFileName = saveFile(file, request);
				// DB에 저장하기 위한 파일명 세팅
				if (renameFileName != null) {
					att.setAttClName(file.getOriginalFilename()); // 클라이언트 파일명
					att.setAttSvName(renameFileName); // 서버 파일명
				}

			}
			
			// 1. 구독테이블 insert
			int result1 = mpService.insertSub(sb);
			// 2. 구독 프로필 insert
			int result2 = mpService.insertAttS(att); 
			
			model.addAttribute("msg", "success");
			return "main/subscribe";
			
		}
		
		
		model.addAttribute("msg", "fail");
		return "main/subscribe";
		
	}
	
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath); // 메모리상에서 객체 파일 만들기 
		if(!folder.exists()) folder.mkdir(); // -> 해당 경로가 존재하지 않는다면 디렉토리 생성
		
		// 파일명 리네임 규칙 "년월일시분초_랜덤값.확장자"
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + "_"
							+ (int)(Math.random() * 100000)
							+ originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName; // 저장하고자하는 경로 + 파일명
		
		try {
			file.transferTo(new File(renamePath));
			// => 업로드 된 파일 (MultipartFile) 이 rename명으로 서버에 저장
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 에러 : " + e.getMessage());
		}
		
		return renameFileName;
	}
	
	// 구독했는데 다시 구독할 경우 --> 업데이트 해주기 
	@PostMapping("/updateStatus")
	public String updateSubStatus(SubscribeArtist sb,
								  @RequestParam(value="nickname", required=false) String nickname,
								  @RequestParam(value="artNameEn", required=false) String artNameEn,
								  HttpSession session,
								  Model model) {
		
		// 로그인유저 set
		Member loginUser = (Member)session.getAttribute("loginUser");
		String user = loginUser.getId();
		sb.setId(user);
		// 아티스트 명 set
		sb.setArtNameEn(artNameEn);
		// 구독 닉네임 set
		sb.setNickname(nickname);
		
		// 아티스트 이름, 유저 닉네임 가져가서 status N으로 다시 변경 
		int result = mpService.updateStatus(sb);
		
		if(result > 0) {
			model.addAttribute("msg", "success");
		} else {
			model.addAttribute("msg", "fail");
		}
		
		return "main/subscribe";
	}
	
	
	// 메인 아티스트명 검색
	@RequestMapping("/search")
	public @ResponseBody List<MainCollection> artistSearchList(String artistName){
		List<MainCollection> list = (ArrayList<MainCollection>)mpService.selectArtistSearchList(artistName); 
		if(list == null) list = new ArrayList<>();
		return list;
	}
	
	// 알람 리스트 불러오기 (세션에 담기)
	@RequestMapping(value="/alarmList", produces="application/json; charset=utf-8")
	public @ResponseBody String alarmList(Alarm al ,HttpSession session, Date dateFormat) {
		
		List<Alarm> alist = new ArrayList<>();
		int countA = 0;
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		// 로그인 유저의 아이디 가지고 가기 
		String user = loginUser.getId();
		
		// 유저아이디, 오늘날짜 담아서 가기
		al.setId(user);
		al.setAlTime(dateFormat);
		
		if(loginUser.getClassifyMem() == 1) {
		  // 일반 유저 알람 불러오기
		  alist = (ArrayList<Alarm>)mpService.selectAlarmList(al);
		  // 일반 유저 알람 카운트 해오기
		  countA = mpService.selectAlarmCount(al);
		  // 세션에 담기
		  session.setAttribute("alist", alist);
		  session.setAttribute("countA", countA);
		  
		} else if(loginUser.getClassifyMem() == 2) {
		  // 소속아티스트
		  alist = (ArrayList<Alarm>)mpService.selectAlarmList(al);
		  // 소속아티스트 알람 카운트 해오기
		  countA = mpService.selectAlarmCount(al);
		  // 세션에 담기
		  session.setAttribute("alist", alist);
		  session.setAttribute("countA", countA);
		  
		} else if(loginUser.getClassifyMem() == 3) {
		  // 소속사
		  alist = (ArrayList<Alarm>)mpService.selectAlarmList(al);
		  // 소속사 알람 카운트 해오기
		  countA = mpService.selectAlarmCount(al);
		  // 세션에 담기
		  session.setAttribute("alist", alist);
		  session.setAttribute("countA", countA);
		  
		} else if(loginUser.getClassifyMem() == 4){
		  // 관리자 
		  alist = (ArrayList<Alarm>)mpService.selectAlarmList(al);
		  // 관리자 알람 카운트 해오기
		  countA = mpService.selectAlarmCount(al);
		  // 세션에 담기
		  session.setAttribute("alist", alist);
		  session.setAttribute("countA", countA);
		}
		
		
		return new Gson().toJson(alist);
		
	}
	
	// 알람 갯수 카운트 (세션에 담기)
	@RequestMapping(value="/alarmCount", produces="application/json; charset=utf-8")
	public @ResponseBody String alarmCount(HttpSession session, Alarm al, Date dateFormat) {
		int countA = 0;
		
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		// 로그인 유저의 아이디 가지고 가기 
		String user = loginUser.getId();
		
		// 유저아이디, 오늘날짜 담아서 가기
		al.setId(user);
		al.setAlTime(dateFormat);
		
		if(loginUser.getClassifyMem() == 1) {
		  // 일반 유저 알람 카운트 해오기
		  countA = mpService.selectAlarmCount(al);
		  // 세션에 담기
		  session.setAttribute("countA", countA);
		  
		} else if(loginUser.getClassifyMem() == 2) {
		  // 소속아티스트 알람 카운트 해오기
		  countA = mpService.selectAlarmCount(al);
		  // 세션에 담기
		  session.setAttribute("countA", countA);
		  
		} else if(loginUser.getClassifyMem() == 3) {
		  // 소속사 알람 카운트 해오기
		  countA = mpService.selectAlarmCount(al);
		  // 세션에 담기
		  session.setAttribute("countA", countA);
		  
		} else if(loginUser.getClassifyMem() == 4){
		  // 관리자 알람 카운트 해오기
		  countA = mpService.selectAlarmCount(al);
		  // 세션에 담기
		  session.setAttribute("countA", countA);
		}
		

		return new Gson().toJson(countA);
		
	}
	

	@RequestMapping(value="/messageWholeList", produces="application/json; charset=utf-8")
	public @ResponseBody String messageWholeList(HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		// 로그인 유저의 아이디 가지고 가기 
		String user = loginUser.getId();
		
		// 날짜만 셀렉 
		List<Message> dlist = (ArrayList<Message>)mpService.selectMessageDate(user);
		// 전체 리스트 
		List<Message> mlist = (ArrayList<Message>)mpService.selectMessageWholeList(user);
		
		// 날짜 포맷하기 위해 GsonBuilder를 이용해서 GSON 객체 생성
		Gson gson = new GsonBuilder()
					.setDateFormat("yyyy-MM-dd")
					.create();
		
		// 날짜랑 전체리스트 보내기
		JSONObject sendJson = new JSONObject();
		sendJson.put("dlist", dlist);
		sendJson.put("mlist", mlist);
		
		session.setAttribute("sendJson", sendJson);

		return gson.toJson(sendJson);
		
	}
	
	// 메세지 창 이동
	@GetMapping("/readMessage")
	public String readMessage(Message m,
							  String messSendId,
							  String messContent,
							  String messTitle,
							  int messCode,
							  Model model) {
		

		// 읽음으로 표시 
		int read = mpService.updateRead(messCode);
		
		System.out.println("읽음여부:" + read);
		
		m.setMessCode(messCode);
		m.setMessSendId(messSendId);
		m.setMessContent(messContent);
		m.setMessTitle(messTitle);
		
		model.addAttribute("message", m);
		
		return "common/messageNavi";

	}
	
	// 쪽지 답장
	@PostMapping("/messageSend")
	public String messageSend(@ModelAttribute Message m, 
							   HttpSession session,
							   Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		// 로그인 유저의 아이디 가지고 가기 
		String user = loginUser.getId();
		// 보내는 아이디 - 현재 로그인한 유저
		m.setMessSendId(user);
		
		int sendMessage = mpService.insertMessage(m);
		
		System.out.println("쪽지insert" + sendMessage);
		
		if(sendMessage > 0) {
			model.addAttribute("msg", "success");
			return "common/messageNavi";
		} else {
			model.addAttribute("msg", "fail");
			return "common/messageNavi";
		}
		
		
	}
	
	//쪽지 신고
	@PostMapping("/reportMessage")
	public String reportMessage(@ModelAttribute Report r,
								int refId,
								Model model) {
		
		// 쪽지 신고
		int reportMessage = mpService.insertReportm(r);
		// 쪽지 상태 N으로 업데이트해서 쪽지함에서 가리기
		int updateMessage = mpService.updateMessage(refId);
		// 알람 insert
		int alarmReport = mpService.insertAlarmR(refId);
		
		System.out.println("쪽지번호!!!" + refId);
		System.out.println("쪽지 상태 업데이트" + updateMessage);
		System.out.println("알람 insert" + alarmReport);
		
		if(reportMessage > 0 && updateMessage > 0 && alarmReport > 0) {
			
			model.addAttribute("msg", "success2");
			return "common/messageNavi";
		} else {
			model.addAttribute("msg", "fail");
			return "common/messageNavi";
		}
		
		
	}
	
	// 쪽지 카운트
	@RequestMapping(value="/mailCount", produces="application/json; charset=utf-8")
	public @ResponseBody String mailCount(HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		// 로그인 유저의 아이디 가지고 가기 
		String user = loginUser.getId();
		
		int mailCount = mpService.selectMailCount(user);
		

		return new Gson().toJson(mailCount);
		
	}
	
	// 친구 아코디언
	@RequestMapping(value="/friendMessage", produces="application/json; charset=utf-8")
	public @ResponseBody String friendMessage(HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		// 로그인 유저의 아이디 가지고 가기 
		String user = loginUser.getId();
		
		// 친구 아이디 & 친구 프로필 select
		List<FriendCollection> flist = (ArrayList<FriendCollection>)mpService.selectFriendInfo(user);
		// 친구가 보낸 메세지 select
		List<FriendCollection> fmlist = (ArrayList<FriendCollection>)mpService.selectFriendMsg(user);
		
		// 날짜 포맷하기 위해 GsonBuilder를 이용해서 GSON 객체 생성
		Gson gson = new GsonBuilder()
					.setDateFormat("yyyy-MM-dd")
					.create();
		
		// 날짜랑 전체리스트 보내기
		JSONObject sendJson = new JSONObject();
		sendJson.put("flist", flist);
		sendJson.put("fmlist", fmlist);
		
		//System.out.println("친구프로필: " + flist);
		//System.out.println("친구메시지: " + fmlist);
		
		session.setAttribute("sendJson", sendJson);

		return gson.toJson(sendJson);
		
	}
	
	// 회원이 구독한 아티스트 피드 탑 9 조회 
	@RequestMapping(value="/feedTopNine", produces="application/json; charset=utf-8")
	public @ResponseBody String feedTopNine(HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		// 로그인 유저의 아이디 가지고 가기 
		String user = loginUser.getId();
		
		// 게시물 사진 제외한 리스트 select
		List<FeedTopNineCollection> tnlist = (ArrayList<FeedTopNineCollection>)mpService.selectFeedTopNineCollection(user);
		
		// 날짜랑 전체리스트 보내기
		//JSONObject sendJson = new JSONObject();
		//sendJson.put("tnlist", tnlist);
		//sendJson.put("piclist", piclist);
		
		//System.out.println("피드 탑 9: " + tnlist);
		
		//session.setAttribute("tnlist", tnlist);

		return new Gson().toJson(tnlist);
		
	}
	
	// 회원이 구독한 아티스트 미디어 탑 9 조회 
	@RequestMapping(value = "/mediaTopNine", produces = "application/json; charset=utf-8")
	public @ResponseBody String mediaTopNine(HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		// 로그인 유저의 아이디 가지고 가기
		String user = loginUser.getId();

		// 게시물 사진 제외한 리스트 select
		List<MediaTopNineCollection> tmlist = (ArrayList<MediaTopNineCollection>) mpService
				.selectmediaTopNineCollection(user);

		//System.out.println("미디어 탑 9: " + tmlist);

		return new Gson().toJson(tmlist);

	}
	
	// 회원이 구독한 스토어 탑 9 조회 
	@RequestMapping(value = "/storeTopNine", produces = "application/json; charset=utf-8")
	public @ResponseBody String storeTopNine(HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		// 로그인 유저의 아이디 가지고 가기
		String user = loginUser.getId();

		// 게시물 사진 제외한 리스트 select
		List<StoreTopNineCollection> slist = (ArrayList<StoreTopNineCollection>) mpService
				.selectStoreTopNineCollection(user);

		//System.out.println("스토어 탑 9: " + slist);

		return new Gson().toJson(slist);

	}
	
	// 친구 수락
	@GetMapping("/acceptFriend")
	public String acceptFriend(String sendId,
										  HttpSession session,
										  Friend fr,
										  Model model,
										  int alCode) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		// 로그인 유저의 아이디 가지고 가기
		String user = loginUser.getId();
		
		fr.setFrRecId(user);
		fr.setFrSend(sendId);
		
		Map<String, String> map = new HashMap<>();
		map.put("user", user);
		map.put("sendId", sendId);
		
		int result = mpService.updateAcceptFriend(fr);
		// 알람 insert
		int alarmFriend = mpService.insertAlarmF(map);
		// 알림에서 가리기
		int hideAlarm = mpService.updateAlarmStatus(alCode);
		
		System.out.println("result:" + result);
		System.out.println("alarmFriend:" + alarmFriend);
		System.out.println("hideAlarm:" + hideAlarm);
		
		if(result > 0 && alarmFriend > 0 && hideAlarm > 0) {
			model.addAttribute("msg", "accept");
		} else {
			model.addAttribute("msg", "fail");
		}
		
		return "common/main";
		
	}
	
	// 친구 거절 
	@GetMapping("/declineFriend")
	public String declineFriend(String sendId,
										  HttpSession session,
										  Friend fr,
										  Model model,
										  int alCode) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		// 로그인 유저의 아이디 가지고 가기
		String user = loginUser.getId();
		
		fr.setFrRecId(user);
		fr.setFrSend(sendId);
		
		int result = mpService.updateDeclineFriend(fr);
		// 알림에서 가리기
		int hideAlarm = mpService.updateAlarmStatus(alCode);
		
		System.out.println("거절result:" + result);
		System.out.println("거절hideAlarm:" + hideAlarm);
		
		if(result > 0 && hideAlarm > 0) {
			model.addAttribute("msg", "decline");
		}else {
			model.addAttribute("msg", "fail");
		}
		
		return "common/main";
		
	}
	
	//chartTopThree
	@RequestMapping(value = "/chartTopThree", produces = "application/json; charset=utf-8")
	public @ResponseBody String chartTopThree() {

		// 미디어 탑 3 select 
		List<MediaTopNineCollection> chlist = (ArrayList<MediaTopNineCollection>) mpService
				.selectChartTopThree();

		//System.out.println("미디어 탑 3: " + chlist);

		return new Gson().toJson(chlist);

	}
	
	// 구독페이지 이동 (아티스트명 가지고)
	@GetMapping("/chart")
	public String chart() {
		
		return "main/chart";

	}
	
	
	
	@RequestMapping(value="/chartDay", produces="application/json; charset=utf-8")
	public @ResponseBody String chartDay() {
		
		// 일간별 미디어 순위 조회 
		List<MediaTopNineCollection> dlist = (ArrayList<MediaTopNineCollection>)mpService.selectchartDay();
		
		// 날짜 포맷하기 위해 GsonBuilder를 이용해서 GSON 객체 생성
		Gson gson = new GsonBuilder()
					.setDateFormat("yyyy-MM-dd")
					.create();
		
		return gson.toJson(dlist);
		
	}
	
	@RequestMapping(value="/chartWeek", produces="application/json; charset=utf-8")
	public @ResponseBody String chartWeek() {
		
		// 일간별 미디어 순위 조회 
		List<MediaTopNineCollection> wlist = (ArrayList<MediaTopNineCollection>)mpService.selectchartWeek();
		
		// 날짜 포맷하기 위해 GsonBuilder를 이용해서 GSON 객체 생성
		Gson gson = new GsonBuilder()
					.setDateFormat("yyyy-MM-dd")
					.create();
		
		return gson.toJson(wlist);
		
	}
	
	
	// 알람 삭제
	@RequestMapping(value="/alarmDelete", produces="application/json; charset=utf-8")
	public @ResponseBody String alarmDelete(int alCode,Alarm al ,HttpSession session, Date dateFormat){
		
		// 알람 업데이트 후 
		int result = mpService.alarmDelete(alCode);
		
		// 다시 전체 알람 리스트 불러오기 
		List<Alarm> alist = new ArrayList<>();
		int countA = 0;
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		// 로그인 유저의 아이디 가지고 가기 
		String user = loginUser.getId();
		
		// 유저아이디, 오늘날짜 담아서 가기
		al.setId(user);
		al.setAlTime(dateFormat);
		
		if(loginUser.getClassifyMem() == 1) {
		  // 일반 유저 알람 불러오기
		  alist = (ArrayList<Alarm>)mpService.selectAlarmList(al);
		  // 일반 유저 알람 카운트 해오기
		  countA = mpService.selectAlarmCount(al);
		  // 세션에 담기
		  session.setAttribute("alist", alist);
		  session.setAttribute("countA", countA);
		  
		} else if(loginUser.getClassifyMem() == 2) {
		  // 소속아티스트
		  alist = (ArrayList<Alarm>)mpService.selectAlarmList(al);
		  // 소속아티스트 알람 카운트 해오기
		  countA = mpService.selectAlarmCount(al);
		  // 세션에 담기
		  session.setAttribute("alist", alist);
		  session.setAttribute("countA", countA);
		  
		} else if(loginUser.getClassifyMem() == 3) {
		  // 소속사
		  alist = (ArrayList<Alarm>)mpService.selectAlarmList(al);
		  // 소속사 알람 카운트 해오기
		  countA = mpService.selectAlarmCount(al);
		  // 세션에 담기
		  session.setAttribute("alist", alist);
		  session.setAttribute("countA", countA);
		  
		} else if(loginUser.getClassifyMem() == 4){
		  // 관리자 
		  alist = (ArrayList<Alarm>)mpService.selectAlarmList(al);
		  // 관리자 알람 카운트 해오기
		  countA = mpService.selectAlarmCount(al);
		  // 세션에 담기
		  session.setAttribute("alist", alist);
		  session.setAttribute("countA", countA);
		}
		
		
		// 날짜랑 전체리스트 보내기
		JSONObject sendJson = new JSONObject();
		sendJson.put("alist", alist);
		sendJson.put("countA", countA);
		
		//System.out.println("친구프로필: " + flist);
		//System.out.println("친구메시지: " + fmlist);
		
		session.setAttribute("sendJson", sendJson);

		return new Gson().toJson(sendJson);
		
		//return new Gson().toJson(alist);
		

	}
	
	// 친구한테 쪽지 보내기 
	@RequestMapping(value="/sendMessage", method= {RequestMethod.POST})
	public @ResponseBody Map<String, String> sendMessage(Message message) {
		System.out.println(message);
		int result = mpService.sendMessage(message);
		String msg = result > 0 ? "쪽지를 성공적으로 발송하였습니다" : "쪽지발송에 실패하였습니다";
		Map<String, String> map = new HashMap<>();
		map.put("msg", msg);
		return map;
	}
		
	
	// 장바구니 카운트
	@RequestMapping(value="/cartCount", produces="application/json; charset=utf-8")
	public @ResponseBody String cartCount(HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		// 로그인 유저의 아이디 가지고 가기 
		String user = loginUser.getId();
		
		int cartCount = mpService.selectCartCount(user);
		
		
		return new Gson().toJson(cartCount);
		
	}

	
	

}

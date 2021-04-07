package com.kh.fantimate.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Artist {
	private String artiId; 			// 아티스트 개인 아이디
	private String artiName; 		// 이름(영어)
	private String artiNickname; 	// 닉네임
	private String artiFacebook; 	// 페이스북 주소
	private String artiInsta; 		// 인스타 주소
	private String artiTwitter; 	// 트위터 주소
	private String artiDailymsg; 	// 상태 메세지
	private String isTeam; 			// 팀여부(솔로/그룹)
	private String agencyId; 		// 소속사 아이디
	private String artiNameEn; 		// 아티스트 등록명(영어)
}

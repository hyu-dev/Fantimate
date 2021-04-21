package com.kh.fantimate.common.model.vo;

import com.kh.fantimate.member.model.vo.Artist;
import lombok.Data;

@Data
public class ReplyCollection {
	private Reply reply;
	private Subscribe subscribe;
	private Artist artist;
	private Attachment artiAttach;
	private Attachment userAttach;
}

package com.kh.fantimate.main.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Friend;
import com.kh.fantimate.common.model.vo.Message;

import lombok.Data;

@Data
public class FriendCollection {

	private Friend fr;
	private Attachment att;
	private Message msg;
	
}

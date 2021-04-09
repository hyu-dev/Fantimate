package com.kh.fantimate.official.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import lombok.Data;

@Data
public class MediaCollection {
	private Official official;
	private MediaCategory category;
	private Attachment attachment;
	private HitCount hitCount;
}

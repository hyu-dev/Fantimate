package com.kh.fantimate.official.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import lombok.Data;

@Data
public class MediaCollection {
	private Official official;
	private MediaCategory category;
	private MediaFile mediaFile;
	private HitCount hitCount;
}

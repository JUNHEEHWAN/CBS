package com.team4.cbs.common.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class AttachmentFileVO {
	
	
	private String atchmnflNo;	// 첨부파일 번호
	private int atchmnflSn;		// 첨부파일 순번
	private String filePth;		// 파일 경로
	private String fileNm;		// 파일 명
	private String streFileNm;	// 저장 파일명
	private String fileTy;		// 파일 유형
	private int fileSz;			// 파일 크기
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date rgsde;			// 등록일
	private String etc;			//기타 사항
}

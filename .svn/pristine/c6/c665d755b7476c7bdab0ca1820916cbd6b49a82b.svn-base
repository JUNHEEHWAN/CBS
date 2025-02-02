package com.team4.cbs.common.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class NoticeVO {
	private String noticeNo;
	private String userCd;
	private String titl;
	private String cn;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd") // ajax - 날짜(Date) 받아오기 
	private Date rgsde;
	private String fileUrl; // 파일 URL
	
	
	public String getFname() {
		if(fileUrl == null ) {
			
			return "첨부파일없디용";
		}
		
		String[] shArr = fileUrl.split("/");
		return shArr[shArr.length -1];
	}

}

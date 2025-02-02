package com.team4.cbs.common.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class EntryProcessStatusVO {
	
	private String entrManageNo;		// 통관 관리 번호
	private String userCd;				// 사용자 코드
	private String processSttus;		// 처리 상태
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd hh:mm:ss") // ajax - 날짜(Date) 받아오기
	private Date processDe;				// 처리 날짜
	private int enprstno;				// 통관처리상태번호
	
	// 1:1 관계라 resultMap 대신 변수 선언
	private String entrSe;				// 사용자 구분
	private String userNm;				// 사용자 명
	private String telno;				// 전화번호
	private String emailAdres;			// 이메일 주소
	
}
package com.team4.cbs.trnsprt.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class VehiclesDiaryVO {
	
	private String vhcleDiaryCd;	// 차량 일지 코드
	private String icCardNo;		// IC카드 번호
	private String strtPnt;			// 출발지
	private String arvlPnt;			// 도착지
	private int stodelSe;			// 입출고 구분
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private String strtTime;		// 출발 시간
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private String arvlTime; 		// 도착 시간
	
	private String entrManageNo;	// 통관 관리 번호
	
	
}
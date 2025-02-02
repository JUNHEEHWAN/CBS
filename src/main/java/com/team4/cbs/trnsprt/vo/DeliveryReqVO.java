package com.team4.cbs.trnsprt.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class DeliveryReqVO {
	
	private String entrManageNo;	// 통관관리번호
	private String processSttus;    // 통관처리상태
	private String client;			// 고객명
	private String entrSe;			// 통관상태
	
	private String startPrt;    	// 출발 항구    
	private String arvlPrt;     	// 도착 항구    
	private String shipNm;      	// 선박 명
	private String waybilNo;        // BL번호
	
	private String userCd;			// 유저코드
	private String userNm;			// 요청자명
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date processDe;         // 요청일자
	
}

package com.team4.cbs.trnsprt.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class IcCardVO {
	
	private String icCardNo;   	// IC카드 번호
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date validBeginDe;	// 유효 시작 일자
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date validEndDe;	// 유효 종료 일자
	private String vhcleCd;		// 차량 코드
	private String drverCd;		// 운전자 코드
	
	private String drverNm;		// 운전자 명
	private String telno;		// 전화번호
	private String mdlNm;		// 모델 명
	private String vhcleNo;		// 차량 번호
	private String ldadngVl;	// 부피
	private String ldadngWt;	// 적재 중량
}

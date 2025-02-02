package com.team4.cbs.pbsvnt.quar.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
//검역 요청 테이블 VO -조한봄-
@Data
public class QuarantineRequestVO {
	private String qrantRequestCd;
	private String qrantSe;
	private String qrantResultAt;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date requstDe;
	private String requstPlace;
	private String pbsvntCd;
	private String entrManageNo;
	private int goodsNo;
	private String cstmrCd;
	private String id;
	
	
	private String qrantIemNo;
	private String inspctAgen;
	private String userNm;
	private String allQrantJudg;
	private String bizrno;
	private String entrprsNm;
	private String charger;
	private String reprsntAdres;
	private String mfrcRealmSe;
	private String inspctDate;
	private String thingNm;
	
}

package com.team4.cbs.pbsvnt.bounded.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BoundedReqVO { // 입고 요청 테이블 따로 없음, QUARANTINE_THING JOIN CUSTOMER
	// SELECT A.ENTR_MANAGE_NO, A.GOODS_NO, A.CSTMR_CD, A.WRHOUSNG_REQUST_DE, B.ENTRPRS_NM -- string int string date string
	private String entrManageNo;	// 통관관리번호
	private int goodsNo;			// 상품번호
	private String cstmrCd;			// 고객코드
	private Date wrhousngRequstDe;	// 입고요청일자
	private String entrprsNm;		// 기업명
	private Date wrhousngDe;		// 입고일자
	
	private String bndwasCd;		// 보세창고코드
}

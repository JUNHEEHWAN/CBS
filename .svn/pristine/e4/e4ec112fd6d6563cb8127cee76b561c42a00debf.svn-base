package com.team4.cbs.pbsvnt.admin.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ExportLicenseVO {
	private String entrManageNo;				// 통관 관리 번호        
	private String expterCmpnm;                 // 수출자 상호          
	private String expterAdres;                 // 수출자 주소          
	private String client;                      // 위탁자 상호          
	private String clientAdres;                 // 위탁자 주소          
	private String imprCmpnm;                   // 구매자 또는 계약당사자    
	private int totAmount;                      // 총금액             
	private String entrSe;                      // 통관 구분           
	private String manctmKwa;                   // 관할 세관           
	private String arvlPrt;                     // 도착항             
	private String hsCd;                        // HS 부호           
	private String goodsNm;                     // 품명              
	private String thingTy;                     // 물품 유형           
	private int qy;                             // 수량              
	private int untpc;                          // 단가              
	private int amount;                         // 금액              
	private String confmInstt;                  // 승인기관            
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd") // ajax - 날짜(Date) 받아오기 
	private Date validPd;                       // 유효 기간           
	private String confmNo;                     // 승인 번호           
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd") // ajax - 날짜(Date) 받아오기 
	private Date confmDe;                       // 승인 날짜           
	private String confmer;                     // 승인자             
}

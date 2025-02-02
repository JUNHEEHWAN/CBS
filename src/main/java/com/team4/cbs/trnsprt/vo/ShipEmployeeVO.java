package com.team4.cbs.trnsprt.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ShipEmployeeVO {

	private String shplCd;		// 선박 직원 코드
	private String shipCmpnyCd;	// 선박 회사 코드
	private String shplSe;		// 선박 직원 구분
	private String shplNm;		// 선박 직원 명
	private String ihidnum;		// 주민등록번호
	private String shplAdres;	// 선박 직원 주소
	
}

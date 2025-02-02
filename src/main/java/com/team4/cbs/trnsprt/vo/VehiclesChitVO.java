package com.team4.cbs.trnsprt.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class VehiclesChitVO {
	
	private String trnsprtChitNo;	// 운송 전표 번호
	private String entrManageNo;	// 통관 관리 번호
	private String opratHistInfoCd;	// 운행 이력 정보 코드
	
}

package com.team4.cbs.trnsprt.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class UseContainerVO {
	
	private String entrManageNo;	// 통관 관리 번호
	private int cntanrInnb;			// 컨테이너 고유번호
	private String useStartDate;	// 사용 시작일
	private String useEndDate;		// 사용 종료일
	
}

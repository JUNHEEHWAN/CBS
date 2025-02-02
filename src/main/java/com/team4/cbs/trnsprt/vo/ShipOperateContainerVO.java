package com.team4.cbs.trnsprt.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ShipOperateContainerVO {
	
	private String shipDiaryCd;		// 선박일지코드
	private int imoNo;				// IMO 번호
	private String cntanrInnb;		// 컨테이너 고유 번호
	private String entrManageNo;	// 통관 관리 번호
	private Date appnDe;			// 지정 일자
	
}

package com.team4.cbs.trnsprt.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ShipContainerVO {
	
	private int imoNo;			// IMO 번호
	private String cntanrInnb;	// 컨테이너 고유 번호
	
	
	private int cntanrZero;		// 규격
	private int cntanrStndrd;		// 규격
	private String cntanrMtrqlt;	// 재질
}

package com.team4.cbs.cstbrkr.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class GoodsVO {
	private int goodsNo;		//상품 번호
	private String goodsNm;		//상품 명
	private String hsCd;		//HScode
	
	//GoodsVO : MainGoodsVO = 1 : N
	private List<MainGoodsVO> mainGoodsVOList;
	
	private String goodsCl;		//상품분류
	private int goodsTaxrt;		//상품세율
	private Date applcBeginDe;	//적용개시일
	private Date applcEndDe;	//적용만료일
}

package com.team4.cbs.pbsvnt.quar.vo;

import java.util.Date;

import com.team4.cbs.common.vo.UserVO;
import com.team4.cbs.cstbrkr.vo.GoodsVO;

import lombok.Data;
// 검역 상세 테이블 VO -조한봄-
@Data
public class QuarantineDetailVO {
	private String qrantNo;
	private Date excDe;
	private String excPlace;
	private String koreanIndictMatterAt;
	private String koreanIndictMatterUrl;
	private String qrantRequestCd;
	private String entrManageNo;
	private int goodsNo;
	private String cstmrCd;
	
	private String qrantResultAt; // QUARANTINE_REQUEST랑 1:1 관계라서 resultMap 안 쓰고 변수로
	
	// 행정 공무원 검역 상세 출력시 JOIN VO
	private QuarantineRequestVO quarantineRequestVO;
	private QuarantineItemVO quarantineItemVO;
	private GoodsVO goodsVO;
	private UserVO userVO;
}

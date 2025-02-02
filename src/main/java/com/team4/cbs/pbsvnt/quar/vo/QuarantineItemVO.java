package com.team4.cbs.pbsvnt.quar.vo;

import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.team4.cbs.cstbrkr.vo.EntryThingVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class QuarantineItemVO {
	
	private String qrantIemNo;         //검역_항목_번호
	private String qrantRequestCd;        //검역_요청_코드
	private String entrManageNo;       //통관_관리_번호
	private int goodsNo;               //상품_번호
	private String cstmrCd;            //고객_코드
	private String qrantSe;            //검역_구분
	private String qrantIemNm;         //검역_항목_명
	private String inspctSpcfct;       //검사_규격
	private String iemResult;          //항목_결과
	private String iemJudg;            //항목_판정
	private String packCondt;          //포장_상태/
	private String itmAmo;             //품목_수량/
	private String koreanIndictMatter; //한글_표시_사항/
	private String cstdyCondt;		   //보관_상태	/
	private String visualAbnorWhet;    //육안_이상_여부/
	private String decayDeteriWhet;    //부패_변질_여부/
	private String impurWhet;          //이물_여부/
	private String inspctNote;         //검사_비고/
	private String actAbnorWhet;       //행동_정상_여부/
	private String etpSymp;            //외부_증상/
	private String anatoSymp;          //해부학_증상/
	private String detailCn;           //상세_내용
	private String allQrantJudg;           //전체_검역_판정
	private String id;					//접속한 아이디
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
    private Date inspctDate;		   //검사_일자
	
    private String inspctAgen;		       //검사_기관
    
    //결과서
    
    private String pbsvntCd;
    private String entrprsNm;
    private String charger;
    private String reprsntAdres;
    private String userNm;
    
    private String thingNm;
    private String goodsNm;
    
    
    List<EntryThingVO> etThingList;
	
}

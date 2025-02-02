package com.team4.cbs.common.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.team4.cbs.admin.vo.PublicServantVO;

import lombok.Data;

@Data
public class UserVO {
	private String userCd;//사용자_코드 (0.관리자 1.관세사 2.공무원 3.운송)
	private String password;//비밀번호
	private String userNm;//사용자_명
	private String clsf;//직급
	private String ihidnum;//주민등록번호
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd") // ajax - 날짜(Date) 받아오기 
	private Date encpn;//입사일
	private String emailAdres;//이메일_주소
	private String telno;//전화번호
	private String adres;//주소
	private String detailAdres;//상세주소
	private String userSe;//사용자_구분
	
	//UserrVO ; UserAuthVO = 1: N
	private List<UserAuthVO> userAuthVOList;
		
	//USER : CUSTOMS_BROKER = 1 : 1
	private CustomsBrokerVO customsBrokerVO;
	
	//USET : PUBLIC = 1:1
	private PublicServantVO publicServantVO;
	
	//USET : PUBLIC = 1:1
	private ChargeCustomerVO chargeCustomerVO;
	
	//일반 생성자
	public UserVO(String userCd, String userNm, String password) {
		this.userCd = userCd;
		this.userNm = userNm;
		this.password = password;
	}
	
	//기본생성자
	public UserVO() {}
	
}

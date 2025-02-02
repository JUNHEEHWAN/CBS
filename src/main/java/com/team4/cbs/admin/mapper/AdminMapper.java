package com.team4.cbs.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team4.cbs.common.vo.ChargeCustomerVO;
import com.team4.cbs.common.vo.UserVO;

@Mapper
public interface AdminMapper {

	// 관세사 전체 목록 리스트
	public List<UserVO> getList(Map<String, Object> map);

	// 공무원 전체 리스트
	public List<UserVO> pbList(Map<String, Object> map);

	// 페이징 처리를 위해 전체 행갯수 가져오기(공무원)
	public int getTotal(Map<String, Object> map);

	// 페이징 처리를 위해 전체 행갯수 가져오기(관세사)
	public int getTotal2(Map<String, Object> map);

	// 모달 상세
	public UserVO brkrlistOne(UserVO userVO);

	// 관세사 승인 업데이트
	public int brkrUpdate(UserVO userVO);
	public int brkrUpdate2(UserVO userVO);
	
	// 고객관리 리스트
	public List<ChargeCustomerVO> chargeCustomerList(Map<String, Object> map);

	// 페이징 처리를 위해 전체 행갯수 가져오기 (고객관리)
	public int getTotal3(Map<String, Object> map);



}

package com.team4.cbs.main.service;

import java.util.Map;

import com.team4.cbs.common.vo.UserVO;


public interface UserService {

	public boolean selectId(String id); //중복 Id 검색

	public int createUser(UserVO userVO); //회원가입

	public int createUser2(UserVO userVO);

	//ID 찾기
	public UserVO findAjax(UserVO userVO);

	//pw찾기
	public UserVO findAjax2(UserVO userVO);

	//비번 업데이트
	public int pwUpdate(UserVO userVO);

}

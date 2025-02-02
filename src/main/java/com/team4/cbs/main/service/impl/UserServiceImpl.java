package com.team4.cbs.main.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team4.cbs.common.vo.UserVO;
import com.team4.cbs.main.mapper.UserMapper;
import com.team4.cbs.main.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;
	
	//중복 Id 검색
	@Override
	public boolean selectId(String id) {
		return userMapper.selectId(id);
	}

	//회원가입
	@Override
	public int createUser(UserVO userVO) {
		return userMapper.createUser(userVO);
	}

	@Override
	public int createUser2(UserVO userVO) {
		return userMapper.createUser2(userVO);
	}

	//ID찾기
	@Override
	public UserVO findAjax(UserVO userVO) {
		return userMapper.findAjax(userVO);
	}

	//pw찾기
	@Override
	public UserVO findAjax2(UserVO userVO) {
		return userMapper.findAjax2(userVO);
	}

	//비번 업데이트 
	@Override
	public int pwUpdate(UserVO userVO) {
		return userMapper.pwUpdate(userVO);
	}

	
}

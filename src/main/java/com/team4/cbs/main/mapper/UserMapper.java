package com.team4.cbs.main.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team4.cbs.common.vo.UserVO;

@Mapper
public interface UserMapper {

	// User List
	public List<UserVO> listUser();
	
	// User 1개
	public UserVO getUser(String username);
	
	// update User
	public int updUser(UserVO userVO);
	
	
	// delete User
	//public int delUser(String username);
	
	//ID 중복확인 
	public boolean selectId(String id);
	
	//회원가입
	public int createUser(UserVO userVO);
	public int createUser2(UserVO userVO);

	//ID찾기
	public UserVO findAjax(UserVO userVO);

	//pw찾기
	public UserVO findAjax2(UserVO userVO);

	//비번 업데이트
	public int pwUpdate(UserVO userVO);
}

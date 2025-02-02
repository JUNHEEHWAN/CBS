package com.team4.cbs.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.team4.cbs.common.vo.UserVO;


public class CustomUser extends User {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserVO userVO;
	//USER의 생성자를 처리해주는 생성자임
	public CustomUser(String username, String password
				, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	//생성자.return memberVO == null?null:new CustomUser(memberVO);
	public CustomUser(UserVO userVO) {
		//사용자가 정의한 (select한) MemberVO 타입의 객체 memberVO를
		//스프링 시큐리티에서 제공해주고 있는 UsersDetails 타입으로 변환
		//회원정보를 보내줄테니 이제부터 프링이 너가 관리해줘
		super(userVO.getUserCd()+"",userVO.getPassword(),
				userVO.getUserAuthVOList().stream()
			.map(auth->new SimpleGrantedAuthority(auth.getAuth()))
			.collect(Collectors.toList())
			);
		this.userVO = userVO;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	
}





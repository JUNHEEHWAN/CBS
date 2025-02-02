package com.team4.cbs.security;

import java.io.Console;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import lombok.extern.slf4j.Slf4j;


@Slf4j
public class CustomLoginSuccessHandler extends
		SavedRequestAwareAuthenticationSuccessHandler{
	
	//부모클래스의 메소드 재정의
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
		Authentication auth) throws ServletException, IOException {
		
		log.warn("onAuthenticationSuccess");
		
		//auth.getPrincipal() : 사용자 정보를 가져옴
		User customUser = (User)auth.getPrincipal();
		
		//사용자 아이디를 리턴
		log.info("username : " + customUser.getUsername());
		
		//auth.getAuthorities() -> 권한들(ROLE_MEMBER,ROLE_ADMIN)
		//authority.getAuthority() : ROLE_MEMBER
		List<String> roleNames = new ArrayList<String>();
		auth.getAuthorities().forEach(authority->{
			roleNames.add(authority.getAuthority());			
		});
		//roleNames [ROLE_MEMBER,ROLE_ADMIN]
		log.warn("ROLE_NAMES : " + roleNames);
//		
		//테스트대상
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/cbs/admin/brkrlist");
			return;
		}
		if(roleNames.contains("ROLE_CUSTNO")) {
			response.sendRedirect("/cbs/login");
			return;
		}
		if(roleNames.contains("ROLE_CUST")) {
			response.sendRedirect("/cbs/cstbrkr/cstbrkrHome");
			return;
		}
		if(roleNames.contains("ROLE_PUBL1")) {
			response.sendRedirect("/cbs/svntAdmin/cstCheck");
			return;
		}
		if(roleNames.contains("ROLE_PUBL2")) {
			response.sendRedirect("/cbs/quar/qstart");
			return;
		}
		if(roleNames.contains("ROLE_TRAN")) {
			response.sendRedirect("/cbs/trnsprt/store");
			return;
		}
//		
//		if(roleNames.contains("ROLE_MEMBER")) {
//			response.sendRedirect("/brd/list");
//			return;
//		}
		
		//부모
		//super.onAuthenticationSuccess(request, response, auth);
	}
	
}






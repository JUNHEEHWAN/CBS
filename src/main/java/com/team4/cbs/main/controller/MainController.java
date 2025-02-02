package com.team4.cbs.main.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team4.cbs.admin.service.AdminService;
import com.team4.cbs.common.vo.UserVO;
import com.team4.cbs.main.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cbs")
public class MainController {
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	UserService userService;
	
	@Autowired
	AdminService adminService;

	//로그인
	@GetMapping("/login")
	public String login() {
		return "main/login/login";
	}
	
	
	//아이디,비번찾기
	@GetMapping("/find")
	public String find() {
		return "main/login/find";
	}
	
	//아이디찾기
	@ResponseBody
	@PostMapping("/find")
	public String findAjax(@RequestBody UserVO userVO) {
	String result = "";	
		log.debug("userVO 확인 => {}",userVO);
		
	UserVO userVOList =	userService.findAjax(userVO);
		log.debug("userVOList =>" + userVOList);
		if(userVOList == null) {
			result = "false";
		}else if(userVOList != null) {
			result = userVOList.getUserCd();
		}
		
		return result;
	}
	
	//비번찾기
	@ResponseBody
	@PostMapping("/find2")
	public UserVO findAjax2(@RequestBody UserVO userVO) {
		String result = "";	
		log.debug("userVO 확인 => {}",userVO);
		
		UserVO userVOList = userService.findAjax2(userVO);
		
		
		return userVOList;
	}
	  //비밀번호 변경(업데이트)
	  @ResponseBody
	  @PostMapping("/pwUpdate") 
	  public String pwUpdate(@RequestBody UserVO userVO) {
		  String password = passwordEncoder.encode(userVO.getPassword());		
		  userVO.setPassword(password);
		  
		  userService.pwUpdate(userVO);
		  
		  return "OK";
	  
	  }
	 
	
	
	//회원가입 jsp
	@GetMapping("/create")
	public String create() {
		return "main/createForm";
	}
	
	//회원가입
	@ResponseBody
	@PostMapping("/create")
	public String createUser(@RequestPart("userVO") UserVO userVO, MultipartFile uploadFile) throws Exception {
		
		log.debug("체킁: {}",userVO);
		log.debug("체킁3: {}",uploadFile.getOriginalFilename());
		log.debug("체킁2:{}", userVO.getCustomsBrokerVO());
		
		String saveName = uploadFile.getOriginalFilename();
		uploadFile.transferTo(new File("d:/team4/uploads/" + saveName));  // 물리적 저장 완료
		
		String webURL = "/team4/uploads/" + saveName;
		userVO.getCustomsBrokerVO().setProfileFile(webURL);
		
		String password = passwordEncoder.encode(userVO.getPassword());		
		userVO.setPassword(password);
		
		//등록
		userService.createUser(userVO);
		userService.createUser2(userVO);
		
		return "OK";
		
		
	}
	
	//Id 중복 확인
		@PostMapping("/ConfirmId")
		@ResponseBody
		public ResponseEntity<Boolean> confirmId(String id) {
			log.info("ConfirmId.........");
			log.info("id : " + id);
			boolean result = true;
			
			if(id.trim().isEmpty()) {
				log.info("id : " + id);
				result = false;
			} else {
				if (userService.selectId(id)) {
					result = false;
				} else {
					result = true;
				}
			}
			
			return new ResponseEntity<>(result, HttpStatus.OK);
		}

	
}

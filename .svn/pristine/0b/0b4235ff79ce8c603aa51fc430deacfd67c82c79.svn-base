package com.team4.cbs.admin.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.access.prepost.PreAuthorize;
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
import com.team4.cbs.admin.service.NoticeService;
import com.team4.cbs.common.vo.ChargeCustomerVO;
import com.team4.cbs.common.vo.NoticeVO;
import com.team4.cbs.common.vo.UserVO;
import com.team4.cbs.main.service.UserService;
import com.team4.cbs.util.ArticlePage;
import com.team4.cbs.util.ArticlePageList;

import lombok.extern.slf4j.Slf4j;


//@PreAuthorize("hasRole('ROLE_ADMIN')")
@Slf4j
// 시스템 관리자 컨트롤러
@Controller
@RequestMapping("/cbs/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	NoticeService noticeService;
	
	@GetMapping("/adminHome")
	public String cstbrkrHome() {
		log.debug("요기왔낭");
		return "admin/adminHome";
	}

	
	//관세사 전체 리스트 jsp
	@GetMapping("/brkrlist")
	public String cstbrkrList() {
		log.debug("지금 관세사 전체 리스트");
		return "admin/cstbrkrList";
	}
	//관세사 승인 업데이트
	@ResponseBody
	@PostMapping("/brkrUpdate")
	public String brkrUpdate(@RequestBody UserVO userVO) {
		log.debug("updata : " + userVO);
		
		adminService.brkrUpdate(userVO);
		adminService.brkrUpdate2(userVO);
		
		
		
		return "OK";
	}
	//관세사 전체 리스트
	@ResponseBody
	@PostMapping("/brkrlist")
	public ArticlePage<UserVO> getList(@RequestBody(required=false) Map<String,Object> map){
		log.debug("map 체크 : " + map);
		
		List<UserVO> userList = this.adminService.getList(map);
		
		log.debug("userList 체크 : " + userList);
		
		//페이징처리 시작///////////////////
		//전체 갯수 확인
		int total = this.adminService.getTotal2(map);
		log.debug("체크 Total : " + total);
		
		//select 5개의 행
		int size = 10;
		
		//jsp에서 넘겨준 현재 페이지수(currentPage)
		String currentPage = map.get("currentPage").toString();
		log.debug("체크 currentPage : " + currentPage);
		
		//jsp 넘겨준 keyword(검색조건)
		String keyword = map.get("keyword").toString();
		log.debug("keyword : " + keyword );
		
		//ArticlePage객체 생성 -> ArticlePage(사용해야할 VO>
		ArticlePage<UserVO> data = new ArticlePage<UserVO>(total, Integer.parseInt(currentPage), size, userList, keyword);
		//AriticlePage안의 url 속에 값넣기
		String url = "/cbs/admin";
		data.setUrl(url);
		
		log.debug("체크 data : " + data.toString());
		
		return data;
		
	}
	
	//공무원 전체 리스트 jsp
	@GetMapping("/pbsvntlist")
	public String pbsvntlist() {
		log.debug("지금 공무원 전체 리스트");
		return "admin/pbsvntList";
	}
	@GetMapping("/test")
	public String test() {
		log.debug("tes트");
		return "admin/test";
	}
	//공무원 전체 리스트
	@ResponseBody
	@PostMapping("/pbsvntlist")
	public ArticlePage<UserVO> pbList(@RequestBody(required=false) Map<String,Object> map) {
		log.debug("map 체크 : " + map);
		
		List<UserVO> userList = this.adminService.pbList(map);
		
		log.debug("userList 체크 : " + userList );
		
		//페이징처리 시작///////////////////
		//전체 갯수 확인
		int total = this.adminService.getTotal(map);
		log.debug("체크 Total : " + total);
		
		//select 5개의 행
		int size = 10;
		
		//jsp에서 넘겨준 현재 페이지수(currentPage)
		String currentPage = map.get("currentPage").toString();
		log.debug("체크 currentPage : " + currentPage);
		
		//jsp 넘겨준 keyword(검색조건)
		String keyword = map.get("keyword").toString();
		log.debug("keyword : " + keyword );
		
		//ArticlePage객체 생성 -> ArticlePage(사용해야할 VO>
		ArticlePage<UserVO> data = new ArticlePage<UserVO>(total, Integer.parseInt(currentPage), size, userList, keyword);
		//AriticlePage안의 url 속에 값넣기
		String url = "/cbs/admin";
		data.setUrl(url);
		
		log.debug("체크 data : " + data.toString());
		
		return data;
	}
	
	//공무원 리스트 한개 상세페이지
	@ResponseBody
	@PostMapping("/brkrlistOne")
	public UserVO brkrlistOne(@RequestBody UserVO userVO) {
		log.debug("brkrlistOne->userVO : " + userVO);
		
		userVO = this.adminService.brkrlistOne(userVO);
		log.debug("brkrlistOne->userVO(후) : " + userVO);
		
		return userVO;
		
	}
	
	
	//공지사항 화면 
	@GetMapping("/notice")
	public String notice() {
		return "admin/notice";
	}
	
	
	//공지사항 전체 리스트
		@ResponseBody
		@PostMapping("/noticeList")
		public ArticlePage<NoticeVO> noticeList(@RequestBody(required=false) Map<String,Object> map){
			log.debug("map 체크 : " + map);
			
			List<NoticeVO> noticeList = this.noticeService.noticeList(map);
			
			log.debug("noticeList 체크 : " + noticeList );
			
			//페이징처리 시작///////////////////
			//전체 갯수 확인
			int total = this.noticeService.noticeGetTotal(map);
			log.debug("체크 Total : " + total);
			
			//select 5개의 행
			int size = 10;
			
			//jsp에서 넘겨준 현재 페이지수(currentPage)
			String currentPage = map.get("currentPage").toString();
			log.debug("체크 currentPage : " + currentPage);
			
			//jsp 넘겨준 keyword(검색조건)
			String keyword = map.get("keyword").toString();
			log.debug("keyword : " + keyword );
			
			//ArticlePage객체 생성 -> ArticlePage(사용해야할 VO>
			ArticlePage<NoticeVO> data = new ArticlePage<NoticeVO>(total, Integer.parseInt(currentPage), size, noticeList, keyword);
			//AriticlePage안의 url 속에 값넣기
			String url = "/cbs/admin";
			data.setUrl(url);
			
			log.debug("체크 data : " + data.toString());
			
			return data;
			
		}
		
		//공지사항 상세화면 
		@GetMapping("/noticeDetail")
		public String noticeDetail(String noticeNo, Model model) {
			log.debug("제목 클릭 상세 titl-> : " + noticeNo);
			
			List<NoticeVO> noticeList = this.noticeService.noticeDetail(noticeNo);
			log.debug("noticeList -> " + noticeList);
			model.addAttribute("noticeList", noticeList);
			
			return "admin/noticeDetail";
		}
		
		
		  
		//공지사항 등록 - 화면
		  @GetMapping("/noticeCreated") 
		  public String noticeCreated() {
		  return "admin/noticeCreated";
		  
		  }
		  
		  //공지사항 등록 아작스 
		  @ResponseBody
		  @PostMapping("/noticeCreated") 
		  public String noticeCreate(@RequestPart("noticeVO") NoticeVO noticeVO, MultipartFile uploadFile) throws Exception {
			 log.debug("체크{}",noticeVO); 
			 log.debug("체크2 : {}",uploadFile); 
			 String saveName = uploadFile.getOriginalFilename(); 
			 uploadFile.transferTo(new File("d:/team4/uploads/" + saveName));  // 물리적 저장 완료
			 
			 String webURL = "/team4/uploads/" + saveName;
			 noticeVO.setFileUrl(webURL);
			 noticeService.noticeCreate(noticeVO);
			  
			  return "OK";
			  
		  }
		
		//공지사항 수정 - 시스템관리자권한
		  @ResponseBody
		  @PostMapping("/noticeUpdate") 
		  public NoticeVO update(@RequestPart("noticeVO") NoticeVO noticeVO, MultipartFile uploadFile) throws Exception {
		  log.info("update : " + noticeVO);
		  String saveName = uploadFile.getOriginalFilename(); 
		  uploadFile.transferTo(new File("d:/team4/uploads/" + saveName));  // 물리적 저장 완료
			 
		  String webURL = "/team4/uploads/" + saveName;
		  noticeVO.setFileUrl(webURL);	 
		  int result = this.noticeService.update(noticeVO); 
		  log.info("update : " + result);
		  
		  return noticeVO;
		  
		  }
		 
		//공지사항 삭제 - 시스템관리자권한
		  @ResponseBody
		  @PostMapping("/noticeDelete") 
		  public String delete(@RequestBody String noticeNo) {
		  log.info("noticeNo : " + noticeNo);
		  
		  int result = this.noticeService.delete(noticeNo); 
		  log.info("delete : " + result);
		  
		  return "OK"; 
		  }
		  
		
		/* ################################################################# */
		
		// 고객 전체 리스트 jsp
			@GetMapping("/cstlist")
			public String cstlistList() {
				log.debug("지금 고객관리 전체 리스트");
				return "admin/adminCustomerList";
			}
		
			// 고객목록
	         @ResponseBody
	         @PostMapping("/cstlist")
	         public ArticlePageList<ChargeCustomerVO> adminCustomerList(@RequestBody(required = false) Map<String, Object> map) {
	             log.info("map 체크 : " + map);
	             List<ChargeCustomerVO> customerList = this.adminService.chargeCustomerList(map);
	             log.info("CustomerList 체크 : " + customerList);

	             // 페이징 처리 시작 /////////////////////////////////////////
	             // 전체 갯수 확인
	             int total = this.adminService.getTotal3(map);
	             log.info("체크 Total : " + total);

	             // select한 5개의 행
	             int size = 10;

	             // jsp에서 넘겨준 현재 페이지수(currentPage)
	             String currentPage = map.get("currentPage").toString();
	             log.info("체크 currentPage : " + currentPage);

	             String keyword = "";
	             if (map != null) {
	                 keyword = map.get("keyword") != null ? (String) map.get("keyword") : "";
	             }

	             ArticlePageList<ChargeCustomerVO> data = new ArticlePageList<ChargeCustomerVO>(total, Integer.parseInt(currentPage), size, customerList, keyword);
	             log.info("체크 data : " + data);
	             // 페이징 처리 끝 ////////////////////////////
	             String url = "/cbs/admin";
	             data.setUrl(url);

	             return data;
	         }
}

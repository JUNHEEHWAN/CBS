package com.team4.cbs.pbsvnt.bounded.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team4.cbs.pbsvnt.bounded.service.BoundedService;
import com.team4.cbs.pbsvnt.bounded.vo.BoundedReqVO;
import com.team4.cbs.pbsvnt.bounded.vo.BoundedWarehouseVO;
import com.team4.cbs.pbsvnt.bounded.vo.UseBoundedWarehouseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cbs/bounded")
public class BoundedController {
	
	@Autowired
	BoundedService boundedService;
	
	@GetMapping("/examForm")
	public String examForm() {
		return "pbsvnt/bounded/warehouseList";
	}

	@GetMapping("/warehouse")
	public String warehouseList(Model model) { // 창고 구역 불러오기
		List<BoundedWarehouseVO> zone = this.boundedService.getZone();
		//log.info("warehouseList()->boundedZone" + boundedZone);
		model.addAttribute("zone",zone);
		/*
		List<BoundedWarehouseVO> no = this.boundedService.getNo();
		model.addAttribute("no",no);
		*/
		return "pbsvnt/bounded/warehouse";
		
	}

	@GetMapping("/warehousing")
	public String wareHousing(Model model) { // 입고 요청 목록
		List<BoundedReqVO> boundedReqList = this.boundedService.getReqList();
		model.addAttribute("boundedReqList", boundedReqList);
		return "pbsvnt/bounded/warehousingList";
	}
	
	@ResponseBody
	@PostMapping("/insUseBounded")
	public int insUseBounded(@RequestBody BoundedReqVO boundedReqVO) { // 입고 등록 (사용 보세 창고 TABLE INSERT)
		return this.boundedService.insUseBounded(boundedReqVO);
	}
	
	
	@ResponseBody
	@PostMapping("/useBoundedList")
	public List<UseBoundedWarehouseVO> useBoundedList(@RequestBody Map<String, Object> map) { // 창고 구역 선택 후 목록
		String bndwasCd = (String)map.get("bndwasCd");
		log.info("useBoundedList()->bndwasCd: " + bndwasCd);
		List<UseBoundedWarehouseVO> useBoundedList = this.boundedService.useBoundedList(bndwasCd);
		log.info("useBoundedList()->useBoundedList" + useBoundedList);
		return useBoundedList;
	}
	
}

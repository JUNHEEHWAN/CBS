package com.team4.cbs.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cbs/pdf")
public class pdfController {
	
// 작업하기 위해서 만든 페이징 메소드
	@GetMapping("/pdfFile")
	public String pdfFile() {
		return "trnsprt/pdfFile";
	}

// 보세 운송 신고서 window.open 메소드
	@GetMapping("/trnsportPdf")
	public String trnsportPdf() {
		return "main/certificate/transport";
	}
// 보세 운송 전표  window.open 메소드
	@GetMapping("/transportChit")
	public String transportChit() {
		return "main/certificate/transportChit";
	}

// 수입승인서 window.open 메소드
	@GetMapping("/exportLicensePdf")
	public String exportLicensePdf() {
		return "main/certificate/exportLicense";
	}

// 수입신고서 window.open 메소드
	@GetMapping("/cstbrkrPdf")
	public String cstbrkrPdf() {
		return "main/certificate/cstbrkr";
	}
	
}

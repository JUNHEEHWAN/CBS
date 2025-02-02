package com.team4.cbs.util;

import java.util.List;

import lombok.Data;
import lombok.ToString;

//페이징 관련 정보 + 게시글 정보
//new ArticlePage<FreeBoardVO>(total, currentPage, size, content); 
//	-> 제네릭으로 생성, 파라미터를 정해줌
//	전달받은 파라미터를 통하여 아래 값들을 정해줌

@ToString
@Data
public class ArticlePageList<T> {
	
	    // 전체글 수
	    private int total;
	    // 현 페이지 번호
	    private int currentPage;
	    // 전체 페이지 수
	    private int totalPages;
	    // 블록의 시작 페이지 번호 : 페이징 처리시 보여질 숫자 1 ~ 3페이지 중 1
	    private int startPage;
	    // 블록의 종료 페이지 번호 : 1 ~ 3페이지 중 3
	    private int endPage;
	    // 요청 URL
	    private String url ="";
	    // select 결과 데이터
	    private List<T> content;
	    
	    private String pagingArea = "";
	    //검색어
	    private String keyword;

	    // 생성자(Constructor)
	    //                  total = 10 currentPage = 1  size = 2  content = select한 10개의 행
	    public ArticlePageList(int total, int currentPage, int size, List<T> content, String keyword) {
	        this.total = total;
	        this.currentPage = currentPage;
	        this.content = content;
	        this.keyword = keyword;
	        
	        if(total == 0) {    // 개시글이 없으면
	            totalPages = 0; // 전체 페이지 수 0
	            startPage = 0;  // 블록 시작 번호 0
	            endPage = 0;    // 블록 종료 번호 0
	        }else { // 게시글이 있다면
	            // 전체 페이지 수 = 전체글 수 / 한 화면에 보여질 목록의 행의 수
	            totalPages = total / size; // ex) 5 = 10 / 2
	            
	            // 전체 페이지 수를 나눈 과정에서 나머지값이 있다면
	            if(total % size > 0) {
	                totalPages++;   // 최종 totalPage = 76
	            }
	            
	            // 페이지 블록 시작번호를 구하는 공식(암기?)
	            // 블록 시작 번호 = 현재 페이지 / 페이지크기(블록크기) * 페이지크기+1
	            startPage = (currentPage / 10) * 10 + 1; // 1 / 5 * 5 + 1 = 1(현제페이지) 
	            
	            // 현제페이지 % 페이지크기(블록크기) = 0 일때 보정
	            if(currentPage % 10 == 0) {
	                startPage -= 10;
	            }
	            
	            // 블록 종료 번호 = 시작페이지 번호 + (페이지크기 -1)
	            endPage = startPage + (10 - 1); // 1 +
	            // 블록 종료 번호 = 시작페이지 번호 + (페이지크기 -1)
	            endPage = startPage + (10 - 1); // 1 + 4 = 5(블록 마지막 숫자)
	            
	            // 종료페이지 번호 > 전체페이지수
	            if(endPage > totalPages) { // 5 > 76  
	                endPage = totalPages;
	            }
	        }
	        
	        pagingArea += "<nav aria-label='Page navigation example'>";
	        pagingArea += "<ul class='pagination justify-content-center'>";
	        
	        // 이전 페이지 링크 생성 부분 수정
	        if (this.currentPage > 1) {
	            pagingArea += "<li class='page-item'><a class='page-link' href='" + this.url + "?currentPage=" + (this.currentPage - 1) + "&keyword=" + this.keyword + "' tabindex='-1' aria-disabled='true'>이전</a></li>";
	        } else {
	            pagingArea += "<li class='page-item disabled'><span class='page-link' tabindex='-1' aria-disabled='true'>이전</span></li>";
	        }
	        
	        for(int pNo=this.startPage;pNo<=this.endPage;pNo++) {        
	            pagingArea += "<li class='page-item ";
	            if(this.currentPage == pNo) {
	                pagingArea += "active";
	            }
	            pagingArea += "'>";
	            pagingArea += "<a class='page-link' href='" + this.url + "?currentPage=" + pNo + "&keyword=" + this.keyword + "'>" + pNo + "</a>";
	            pagingArea += "</li>";
	        }
	        // 다음 페이지 링크 생성 부분 수정
	        if (this.currentPage < this.totalPages) {
	            pagingArea += "<li class='page-item'><a class='page-link' href='" + this.url + "?currentPage=" + (this.currentPage+1) + "&keyword=" + this.keyword + "'>다음</a></li>";
	        } else {
	            pagingArea += "<li class='page-item disabled'><span class='page-link' tabindex='-1' aria-disabled='true'>다음</span></li>";
	        }
	        
	        pagingArea += "</ul>";
	        pagingArea += "</nav>";
	    }
	}

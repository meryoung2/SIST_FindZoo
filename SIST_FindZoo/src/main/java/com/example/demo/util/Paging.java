package com.example.demo.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.dao.FreeDao;

@Repository
public class Paging {
	
	// 현재 페이지가 몇 페이지인지
	public static int pageNum;
	// 한 페이지에 나오는 게시글의 수
	public static int pageSize = 10;
	// 전체 레코드가 몇개인지
	public static int totalRecord;
	// 전체 페이지가 몇개인지
	public static int totalPage;
	// 검색 레코드가 몇개인지
	public static int searchRecord;
	// 검색 페이지가 몇개인지
	public static int searchPage;
	// 페이지 목록의 시작 숫자
	public static int listStart = 1;
	// 페이지 목록의 끝 숫자
	public static int listEnd = 5;
	// 검색 페이지 목록의 시작 숫자
	public static int s_listStart = 1;
	// 검색 페이지 목록의 끝 숫자
	public static int s_listEnd = 5;
	// 한 페이지에서 출력할 첫 번째 게시글
	public static int start;
	// 한 페이지에서 출력할 마지막 게시글
	public static int end;
	
	// 진짜 처음 페이지 계산
	public int getStart(int pageNum) {
		start = (pageNum - 1) * Paging.pageSize + 1;
		
		return start;
	}
	
	// 진짜 끝 페이지 계산
	public int getEnd(int start, int pageNum) {
		end = start + Paging.pageSize - 1;
		
		return end;
	}
	
	// 총 페이지 수 계산
	public int getTotalPage() {
		totalPage = (int)Math.ceil((double)totalRecord/pageSize);
		
		return totalPage;
	}
	
	// 검색 결과에 따른 페이지 수 계산
	public int getSearchPage() {
		searchPage = (int)Math.ceil((double)searchRecord/pageSize);
		
		return searchPage;
	}
	
	// 페이지 목록 시작 숫자 계산
	public int getListStart(int pageNum) {
		if(pageNum > 5 && (pageNum % 5 != 0)) {
			listStart = (pageNum / 5) * 5 + 1;
		}else if(pageNum > 5 && (pageNum % 5 == 0)){
			listStart = (pageNum / 6) * 5 + 1;
		}else {
			listStart = 1;
		}
		
		return listStart;
	}
	
	// 페이지 목록 끝 숫자 계산
	public int getListEnd() {
		if(listStart+4 <= totalPage) {
			listEnd = listStart + 4;
		}else {
			listEnd = totalPage;
		}
		
		return listEnd;
	}
	
	// 페이지 목록 시작 숫자 계산
	public int getS_ListStart(int pageNum) {
		if(pageNum > 5 && (pageNum % 5 != 0)) {
			listStart = (pageNum / 5) * 5 + 1;
		}else if(pageNum > 5 && (pageNum % 5 == 0)){
			listStart = (pageNum / 6) * 5 + 1;
		}else {
			listStart = 1;
		}
		
		return listStart;
	}
	
	// 페이지 목록 끝 숫자 계산
	public int getS_ListEnd() {
		if(listStart+4 <= searchPage) {
			listEnd = listStart + 4;
		}else {
			listEnd = searchPage;
		}
		
		return listEnd;
	}
}

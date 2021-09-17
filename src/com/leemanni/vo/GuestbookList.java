package com.leemanni.vo;

import java.util.ArrayList;

import com.leemanni.vo.GuestbookVO;

public class GuestbookList {
	// 1페이지 분량의 글(GuestBookVO) 목록을 기억할 ArrayList 를 선언한다.
	ArrayList<GuestbookVO> list = new ArrayList<>();

	// 페이지 작업에 사용할 8개의 변수를 선언한다.
	private int pageSize = 10; // 한 페이지에 표시할 글의 개수
	private int totalCount = 0; // 테이블에 저장된 전체 글의 개수
	private int totalPage = 0; // 전체 페이지의 개수
	private int currentPage = 1; // 현재 브라우저에 표시되는 페이지 번호
	private int startNo = 1; // 현재 브라우저에 표시되는 글의 시작 인덱스 번호 => (오라클은 1부터 시작됨)
	private int endNo = 0; // 현재 브라우저에 표시되는 글의 마지막 인덱스 번호
	private int startPage = 0; // 페이지 이동 하이퍼링크 또는 버튼에 표시될 시작 페이지 번호
	private int endPage = 0; // 페이지 이동 하이퍼링크 또는 버튼에 표시될 마지막 페이지 번호
	
	public GuestbookList(int pageSize, int totalCount, int currentPage) {
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		
//		pageSize, totalCount, currentPage 를 제외한 나머지 변수의 값을 계산하는 메소드 실행
		calculator();
		
	}

	private void calculator() {
		totalPage = (totalCount -1) / pageSize +1;
		currentPage = currentPage > totalPage? totalPage : currentPage;
		startNo = (currentPage - 1) * pageSize +1;
		endNo = startNo + pageSize - 1;
		endNo = endNo > totalCount ? totalCount : endNo;
		startPage = (currentPage-1) / 10 * 10 +1;
		endPage = startPage + 9;
		endPage = endPage > totalPage ? totalPage : endPage;
	}
	
	
	
	
	public ArrayList<GuestbookVO> getList() {
		return list;
	}

	public void setList(ArrayList<GuestbookVO> list) {
		this.list = list;
	}

	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	@Override
	public String toString() {
		return "GuestbookList [list=" + list + ", pageSize=" + pageSize + ", totalCount=" + totalCount
				+ ", totalPage=" + totalPage + ", currentPage=" + currentPage + ", startNo=" + startNo + ", endNo="
				+ endNo + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
}

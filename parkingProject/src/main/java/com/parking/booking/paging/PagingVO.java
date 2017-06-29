package com.parking.booking.paging;

public class PagingVO {
	private String page; // 페이지번호
	private String pageSize; // 몇개씩보기
	private String startRow; // 시작 레코드 번호
	private String endRow; // 종료 레코드 번호
	
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getPageSize() {
		return pageSize;
	}
	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}
	public String getStartRow() {
		return startRow;
	}
	public void setStartRow(String startRow) {
		this.startRow = startRow;
	}
	public String getEndRow() {
		return endRow;
	}
	public void setEndRow(String endRow) {
		this.endRow = endRow;
	}
	
	
}

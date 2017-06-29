package com.parking.member.paging;

public class PagingMemberVO {
 private String page; //페이지 번호
 private String pageSize; //페이지에 보여주는 줄수
 private String start_memberRow;//시작 레코드 번호
 private String end_memberRow; //종료 레코드 번호
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
public String getStart_memberRow() {
	return start_memberRow;
}
public void setStart_memberRow(String start_memberRow) {
	this.start_memberRow = start_memberRow;
}
public String getEnd_memberRow() {
	return end_memberRow;
}
public void setEnd_memberRow(String end_memberRow) {
	this.end_memberRow = end_memberRow;
}
 
 
}

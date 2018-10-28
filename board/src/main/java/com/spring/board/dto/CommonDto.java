package com.spring.board.dto;

public class CommonDto {

	int start_index;
	int end_index;
	String pagination;

	public int getStart_index() {
		return start_index;
	}

	public void setStart_index(int start_index) {
		this.start_index = start_index;
	}

	public int getEnd_index() {
		return end_index;
	}

	public void setEnd_index(int end_index) {
		this.end_index = end_index;
	}

	public String getPagination() {
		return pagination;
	}

	public void setPagination(String pagination) {
		this.pagination = pagination;
	}

}

package com.spring.board.form;

public class CommonForm {

	String function_name;
	int current_page_no;
	int count_per_page;
	int count_per_list;
	int tatal_page_count;
	int tatal_list_count;
	int limit;
	int offset;

	public String getFunction_name() {
		return function_name;
	}

	public void setFunction_name(String function_name) {
		this.function_name = function_name;
	}

	public int getCurrent_page_no() {
		return current_page_no;
	}

	public void setCurrent_page_no(int current_page_no) {
		this.current_page_no = current_page_no;
	}

	public int getCount_per_page() {
		return count_per_page;
	}

	public void setCount_per_page(int count_per_page) {
		this.count_per_page = count_per_page;
	}

	public int getCount_per_list() {
		return count_per_list;
	}

	public void setCount_per_list(int count_per_list) {
		this.count_per_list = count_per_list;
	}

	public int getTatal_page_count() {
		return tatal_page_count;
	}

	public void setTatal_page_count(int tatal_page_count) {
		this.tatal_page_count = tatal_page_count;
	}

	public int getTatal_list_count() {
		return tatal_list_count;
	}

	public void setTatal_list_count(int tatal_list_count) {
		this.tatal_list_count = tatal_list_count;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

}

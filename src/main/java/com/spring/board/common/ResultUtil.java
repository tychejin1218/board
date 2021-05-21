package com.spring.board.common;

/**
 * 여러 개의 결과 값을 리턴하기 위한 클래스 (성공 유무, 메세지, 조회 내용 등)
 */
public class ResultUtil {  

	private String state = "FAIL";	
	private String msg	= "";
	private Object data = "";
	
	public String getState() {
		return state;
	}
		
	public void setState(String state) {
		this.state = state;
	}	
	
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}
	
	public void setData(Object data) {
		this.data = data;
	}
	
	
}

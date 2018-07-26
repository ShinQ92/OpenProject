package com.bitcamp.op;

public class loginInfo {

	private String id;
	private String pw;
	
	public loginInfo() {} //default생성자 꼭 있어야 함 필 수 
	
	public loginInfo(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}

	@Override
	public String toString() {
		return "loginInfo [id=" + id + ", pw=" + pw + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
	
	
}

package com.truck.domain;


public class LoginResponse {

	private int serverResponseCode;
	private String serverResponseMsg;
	private String latestVersionNo;
	private int lastLoginDt;
	private CustomerDetail detail;
	
	
	public String getLatestVersionNo() {
		return latestVersionNo;
	}
	public void setLatestVersionNo(String latestVersionNo) {
		this.latestVersionNo = latestVersionNo;
	}
	public int getLastLoginDt() {
		return lastLoginDt;
	}
	public void setLastLoginDt(int lastLoginDt) {
		this.lastLoginDt = lastLoginDt;
	}
	public CustomerDetail getDetail() {
		return detail;
	}
	public void setDetail(CustomerDetail detail) {
		this.detail = detail;
	}
	public int getServerResponseCode() {
		return serverResponseCode;
	}
	public void setServerResponseCode(int serverResponseCode) {
		this.serverResponseCode = serverResponseCode;
	}
	public String getServerResponseMsg() {
		return serverResponseMsg;
	}
	public void setServerResponseMsg(String serverResponseMsg) {
		this.serverResponseMsg = serverResponseMsg;
	}
}

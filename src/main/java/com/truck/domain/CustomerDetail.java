package com.truck.domain;

import java.util.Date;

public class CustomerDetail {

	private int customerId;
	private String firstName;
	private String lastName;
	private String loginId;
	private String password;
	private String addressln1;
	private String addressln2;
	private int cityId;
	private int stateId;
	private String zipCode;
	private String phoneNo;
	private String mobileNo;
	private String faxNo;
	private Date lastLogin;
	private int roleId;//buyer-3, seller-2

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public Date getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getAddressln1() {
		return addressln1;
	}

	public void setAddressln1(String addressln1) {
		this.addressln1 = addressln1;
	}

	public String getAddressln2() {
		return addressln2;
	}

	public void setAddressln2(String addressln2) {
		this.addressln2 = addressln2;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public int getStateId() {
		return stateId;
	}

	public void setStateId(int stateId) {
		this.stateId = stateId;
	}

	public String getFaxNo() {
		return faxNo;
	}

	public void setFaxNo(String faxNo) {
		this.faxNo = faxNo;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CustomerDetail [customerId=");
		builder.append(customerId);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", loginId=");
		builder.append(loginId);
		builder.append(", password=");
		builder.append(password);
		builder.append(", addressln1=");
		builder.append(addressln1);
		builder.append(", addressln2=");
		builder.append(addressln2);
		builder.append(", cityId=");
		builder.append(cityId);
		builder.append(", stateId=");
		builder.append(stateId);
		builder.append(", zipCode=");
		builder.append(zipCode);
		builder.append(", phoneNo=");
		builder.append(phoneNo);
		builder.append(", mobileNo=");
		builder.append(mobileNo);
		builder.append(", faxNo=");
		builder.append(faxNo);
		builder.append(", lastLogin=");
		builder.append(lastLogin);
		builder.append(", roleId=");
		builder.append(roleId);
		builder.append("]");
		return builder.toString();
	}

}

package com.truck.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;






public class StudentFeesInfo
{
	
	
	//discription,feespaidto,remarks,createdby,createts,uploaddocs
	private int id;
	private int userdetailid;
	private int studentbatchid;
	private int feessettingsid; 
	private int modeofpaymentid;
	private String description;
	private int feespaidto;
	private String remarks;
	private int createdby;
	private Date createts;
	
	private String uploaddocs;
	
	private int feesamount;
	
	private String paiddate;
	
	private MultipartFile uploaddocsFile;  
	
    private String batchyear;
	
	private int totalamount;
	
	private int  balance;
	
	private String cityname;
	  
	private String studentname;
	
	private String paymenttype;
	
	private String companyname;
	
	private String fathername;
	
	private String fromDate;
	
	private String toDate;
	
	
	private String address;
	
	private String mobilenumber;
	
	private String phonenumber;
	
	
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobilenumber() {
		return mobilenumber;
	}
	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public String getFathername() {
		return fathername;
	}
	public void setFathername(String fathername) {
		this.fathername = fathername;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getPaymenttype() {
		return paymenttype;
	}
	public void setPaymenttype(String paymenttype) {
		this.paymenttype = paymenttype;
	}
	public String getStudentname() {
		return studentname;
	}
	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}
	public String getCityname() {
		return cityname;
	}
	public void setCityname(String cityname) {
		this.cityname = cityname;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getBatchyear() {
		return batchyear;
	}
	public void setBatchyear(String batchyear) {
		this.batchyear = batchyear;
	}
	public int getTotalamount() {
		return totalamount;
	}
	public void setTotalamount(int totalamount) {
		this.totalamount = totalamount;
	}
	public MultipartFile getUploaddocsFile() {
		return uploaddocsFile;
	}
	public void setUploaddocsFile(MultipartFile uploaddocsFile) {
		this.uploaddocsFile = uploaddocsFile;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserdetailid() {
		return userdetailid;
	}
	public void setUserdetailid(int userdetailid) {
		this.userdetailid = userdetailid;
	}
	public int getStudentbatchid() {
		return studentbatchid;
	}
	public void setStudentbatchid(int studentbatchid) {
		this.studentbatchid = studentbatchid;
	}
	public int getFeessettingsid() {
		return feessettingsid;
	}
	public void setFeessettingsid(int feessettingsid) {
		this.feessettingsid = feessettingsid;
	}
	public int getModeofpaymentid() {
		return modeofpaymentid;
	}
	public void setModeofpaymentid(int modeofpaymentid) {
		this.modeofpaymentid = modeofpaymentid;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getFeesamount() {
		return feesamount;
	}
	public void setFeesamount(int feesamount) {
		this.feesamount = feesamount;
	}
	public String getPaiddate() {
		return paiddate;
	}
	public void setPaiddate(String paiddate) {
		this.paiddate = paiddate;
	}
	public int getFeespaidto() {
		return feespaidto;
	}
	public void setFeespaidto(int feespaidto) {
		this.feespaidto = feespaidto;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public int getCreatedby() {
		return createdby;
	}
	public void setCreatedby(int createdby) {
		this.createdby = createdby;
	}
	public Date getCreatets() {
		return createts;
	}
	public void setCreatets(Date createts) {
		this.createts = createts;
	}
	public String getUploaddocs() {
		return uploaddocs;
	}
	public void setUploaddocs(String uploaddocs) {
		this.uploaddocs = uploaddocs;
	}
	
	
	
	
}

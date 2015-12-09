package com.truck.domain;






public class FeesSettings
{
	
	//
		
	private int id;


	private int modeofentryid;
	
	private int studentbatchid;
	
	private double totalamount;
	
	private int createdby;
    
	private String batchyear;
	
	private String entrytype;
	
	
	
	public String getBatchyear() {
		return batchyear;
	}

	public void setBatchyear(String batchyear) {
		this.batchyear = batchyear;
	}

	public String getEntrytype() {
		return entrytype;
	}

	public void setEntrytype(String entrytype) {
		this.entrytype = entrytype;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getModeofentryid() {
		return modeofentryid;
	}

	public void setModeofentryid(int modeofentryid) {
		this.modeofentryid = modeofentryid;
	}

	public int getStudentbatchid() {
		return studentbatchid;
	}

	public void setStudentbatchid(int studentbatchid) {
		this.studentbatchid = studentbatchid;
	}

	public double getTotalamount() {
		return totalamount;
	}

	public void setTotalamount(double totalamount) {
		this.totalamount = totalamount;
	}

	public int getCreatedby() {
		return createdby;
	}

	public void setCreatedby(int createdby) {
		this.createdby = createdby;
	}

	

	
}

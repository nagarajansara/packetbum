package com.truck.domain;

import java.sql.Timestamp;

public class Messages {
	
	
	private int id;
	
	private int vclid;
	
	private int quoteid;
	
	private String message;
	
	private String itemid;
	
	private String messageid;
	
	private String proownerid;
	
	private String subjects;
	
	private Users users;
	
	private Items items;
	
	private String status;
	
	private String shortname;
	
	//private String creates;
	
	
	private Timestamp  creates;
	
	private String userid;
	
	private String messageuid;
	
    private String readmsg;
	    
    private String msgdetailid;
    
    private int inboxcount;
	
	
	
	public Timestamp getCreates() {
		return creates;
	}
	public void setCreates(Timestamp creates) {
		this.creates = creates;
	}
	public int getInboxcount() {
		return inboxcount;
	}
	public void setInboxcount(int inboxcount) {
		this.inboxcount = inboxcount;
	}
	
	
	public String getMsgdetailid() {
		return msgdetailid;
	}
	public void setMsgdetailid(String msgdetailid) {
		this.msgdetailid = msgdetailid;
	}
	public String getReadmsg() {
		return readmsg;
	}
	public void setReadmsg(String readmsg) {
		this.readmsg = readmsg;
	}
	
	
	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getMessageuid() {
		return messageuid;
	}


	public void setMessageuid(String messageuid) {
		this.messageuid = messageuid;
	}


/*	public String getCreates() {
		return creates;
	}


	public void setCreates(String creates) {
		this.creates = creates;
	}*/


	public String getShortname() {
		return shortname;
	}


	public void setShortname(String shortname) {
		this.shortname = shortname;
	}


	public String getSubjects() {
		return subjects;
	}


	public void setSubjects(String subjects) {
		this.subjects = subjects;
	}


	public Users getUsers() {
		return users;
	}


	public void setUsers(Users users) {
		this.users = users;
	}


	public Items getItems() {
		return items;
	}


	public void setItems(Items items) {
		this.items = items;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}
	
	
	public int getVclid() {
		return vclid;
	}
	public void setVclid(int vclid) {
		this.vclid = vclid;
	}
	public String getProownerid() {
		return proownerid;
	}
	public void setProownerid(String proownerid) {
		this.proownerid = proownerid;
	}
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	public String getMessageid() {
		return messageid;
	}
	public void setMessageid(String messageid) {
		this.messageid = messageid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getQuoteid() {
		return quoteid;
	}
	public void setQuoteid(int quoteid) {
		this.quoteid = quoteid;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
	

}

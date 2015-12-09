package com.truck.domain;

import java.sql.Timestamp;

import com.truck.util.TruckUtil;

public class Items {
	
	private int id;
	private int itemdetailsid;
	private int userid;
	private String itemscol; //items Collection
	private String colcountry;//Collection Country
	private String colpostcode; //collection post code
	private String delcountry;//delivery country
	private String delpostcode;//delivery post code
	
	private String description;
	private String photos;
	private String millage;
	
	private String map;
	
	private String coladdress;
	
	private String deladdress;
	
	private Timestamp creates;
	
	private int itemtypeid;
	
	
	private String username;
	
	private String numquote;
	
	private String shortname;
	
	private int totalitem;
	
	private String amount;
	
	private String diffdays;
	
	
	
	
	
	public String getDiffdays() {		
		
		return TruckUtil.getDiffMinuteByDate(diffdays);
	}
	public void setDiffdays(String diffdays) {
		this.diffdays = diffdays;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public int getTotalitem() {
		return totalitem;
	}
	public void setTotalitem(int totalitem) {
		this.totalitem = totalitem;
	}
	public String getShortname() {
		return shortname;
	}
	public void setShortname(String shortname) {
		this.shortname = shortname;
	}
	public String getNumquote() {
		return numquote;
	}
	public void setNumquote(String numquote) {
		this.numquote = numquote;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getItemtypeid() {
		return itemtypeid;
	}
	public void setItemtypeid(int itemtypeid) {
		this.itemtypeid = itemtypeid;
	}
	public Timestamp getCreates() {
		return creates;
	}
	public void setCreates(Timestamp creates) {
		this.creates = creates;
	}
	public String getColaddress() {
		return coladdress;
	}
	public void setColaddress(String coladdress) {
		this.coladdress = coladdress;
	}
	public String getDeladdress() {
		return deladdress;
	}
	public void setDeladdress(String deladdress) {
		this.deladdress = deladdress;
	}
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPhotos() {
		return photos;
	}
	public void setPhotos(String photos) {
		this.photos = photos;
	}
	public String getMillage() {
		return millage;
	}
	public void setMillage(String millage) {
		this.millage = millage;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getItemdetailsid() {
		return itemdetailsid;
	}
	public void setItemdetailsid(int itemdetailsid) {
		this.itemdetailsid = itemdetailsid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getItemscol() {
		return itemscol;
	}
	public void setItemscol(String itemscol) {
		this.itemscol = itemscol;
	}
	public String getColcountry() {
		return colcountry;
	}
	public void setColcountry(String colcountry) {
		this.colcountry = colcountry;
	}
	public String getColpostcode() {
		return colpostcode;
	}
	public void setColpostcode(String colpostcode) {
		this.colpostcode = colpostcode;
	}
	public String getDelcountry() {
		return delcountry;
	}
	public void setDelcountry(String delcountry) {
		this.delcountry = delcountry;
	}
	public String getDelpostcode() {
		return delpostcode;
	}
	public void setDelpostcode(String delpostcode) {
		this.delpostcode = delpostcode;
	}
	
	
	
	
	
	
}

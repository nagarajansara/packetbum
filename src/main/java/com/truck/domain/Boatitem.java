package com.truck.domain;

public class Boatitem {

	private int id;
	private String subcategory;
	private String description;
	private String typeofboat;
	private String lenth;
	private String typeofkeel;
	private String photos;
	private int itemid;	
	private String ontrailer;
	private Common common;
	 
		
	
	
   public String getOntrailer() {
		return ontrailer;
	}
	public void setOntrailer(String ontrailer) {
		this.ontrailer = ontrailer;
	}
	
	
	public Common getCommon() {
		return common;
	}
	public void setCommon(Common common) {
		this.common = common;
	}
	public int getItemid() {
			return itemid;
	}
	public void setItemid(int itemid) {
			this.itemid = itemid;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTypeofboat() {
		return typeofboat;
	}
	public void setTypeofboat(String typeofboat) {
		this.typeofboat = typeofboat;
	}
	public String getLenth() {
		return lenth;
	}
	public void setLenth(String lenth) {
		this.lenth = lenth;
	}
	public String getTypeofkeel() {
		return typeofkeel;
	}
	public void setTypeofkeel(String typeofkeel) {
		this.typeofkeel = typeofkeel;
	}
	public String getPhotos() {
		return photos;
	}
	public void setPhotos(String photos) {
		this.photos = photos;
	}
	
	
	
}

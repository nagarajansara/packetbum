package com.truck.domain;

public class Haulageitem {

	private int id;
	private String subcategory;
	private String description;
	private String haulagedescription;
	private String packagedescription;
	private String relevantitem;
	private String photos;
	
	private String weight;
	
	
	
	private int itemid;
	
	 private Common common;
	
	
	public Common getCommon() {
		return common;
	}
	public void setCommon(Common common) {
		this.common = common;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
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
	public String getHaulagedescription() {
		return haulagedescription;
	}
	public void setHaulagedescription(String haulagedescription) {
		this.haulagedescription = haulagedescription;
	}
	public String getPackagedescription() {
		return packagedescription;
	}
	public void setPackagedescription(String packagedescription) {
		this.packagedescription = packagedescription;
	}
	public String getRelevantitem() {
		return relevantitem;
	}
	public void setRelevantitem(String relevantitem) {
		this.relevantitem = relevantitem;
	}
	public String getPhotos() {
		return photos;
	}
	public void setPhotos(String photos) {
		this.photos = photos;
	}
	
	
	
}

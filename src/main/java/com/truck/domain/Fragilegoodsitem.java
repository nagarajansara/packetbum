package com.truck.domain;

public class Fragilegoodsitem {

	private int id;
	private String subcategory;
	private String description;
	private String fragiledescription;
	private String length;
	private String width;
	private String height;
	private String weight;
	private String photos;
	
	
	private Common common;
		
	private int itemid;

	private String dimension;
	
	private String weight_type;
	
	
	public String getLength() {
		return length;
	}
	public void setLength(String length) {
		this.length = length;
	}
	public String getDimension() {
		return dimension;
	}
	public void setDimension(String dimension) {
		this.dimension = dimension;
	}
	public String getWeight_type() {
		return weight_type;
	}
	public void setWeight_type(String weight_type) {
		this.weight_type = weight_type;
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
	public String getFragiledescription() {
		return fragiledescription;
	}
	public void setFragiledescription(String fragiledescription) {
		this.fragiledescription = fragiledescription;
	}

	public String getWidth() {
		return width;
	}
	public void setWidth(String width) {
		this.width = width;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getPhotos() {
		return photos;
	}
	public void setPhotos(String photos) {
		this.photos = photos;
	}
	
	
	
}

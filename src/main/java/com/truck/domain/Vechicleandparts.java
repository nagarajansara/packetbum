package com.truck.domain;

public class Vechicleandparts {

	private int id;
	private String vechicledescription;
	private String description;
	private String length;
	private String width;
	private String height;	
	private String weight;
	private String photos;
	private String ontrailer;
	private String dimension;
	private String weight_type;
	
	
    private int itemid;
	
    private String subcategory;
	
	private Common common;
		
	
	
	
	public String getWeight_type() {
		return weight_type;
	}
	public void setWeight_type(String weight_type) {
		this.weight_type = weight_type;
	}
	public String getDimension() {
		return dimension;
	}
	public void setDimension(String dimension) {
		this.dimension = dimension;
	}
	public String getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
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
	
	public String getVechicledescription() {
		return vechicledescription;
	}
	public void setVechicledescription(String vechicledescription) {
		this.vechicledescription = vechicledescription;
	}
	public String getOntrailer() {
		return ontrailer;
	}
	public void setOntrailer(String ontrailer) {
		this.ontrailer = ontrailer;
	}
	
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getLength() {
		return length;
	}
	public void setLength(String length) {
		this.length = length;
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

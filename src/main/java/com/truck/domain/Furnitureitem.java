package com.truck.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;



public class Furnitureitem {

	private int id;
	
	//@Size(min=2, max=30)
	private String description;
	private String length;
	private String width;
	private String height;
	private String weight;
	private String photos;
	
	///  The following variables not Furnitureitem table
	private String item_length_un;
	private String item_height_un;
	private String item_width_un;
	private String item_weight_un;
	
	private String dimension;
	private String weight_type;
	
	private String itemscol; //items Collection
	private String colcountry;//Collection Country
	private String colpostcode; //collection post code
	private String delcountry;//delivery country
	private String delpostcode;//delivery post code
	
	private String quantity;
	
	private String colearliestpickup;
	
	private String collatestpickup;
	private String delearliestpickup;
	private String dellatestpickup;
	
	
	private MultipartFile photosmultipart;
	
	private List<MultipartFile> item_1;
	
	private String email;
	
	private int itemid;
	
    private Common common;
	
    public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public Common getCommon() {
		return common;
	}
	public void setCommon(Common common) {
		this.common = common;
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
	public List<MultipartFile> getItem_1() {
		return item_1;
	}
	public void setItem_1(List<MultipartFile> item_1) {
		this.item_1 = item_1;
	}
	public int getItemid() {
		return itemid;
	}
	public void setItemid(int itemid) {
		this.itemid = itemid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public MultipartFile getPhotosmultipart() {
		return photosmultipart;
	}
	public void setPhotosmultipart(MultipartFile photosmultipart) {
		this.photosmultipart = photosmultipart;
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
	
	
	
	public String getItem_length_un() {
		return item_length_un;
	}
	public void setItem_length_un(String item_length_un) {
		this.item_length_un = item_length_un;
	}
	public String getItem_height_un() {
		return item_height_un;
	}
	public void setItem_height_un(String item_height_un) {
		this.item_height_un = item_height_un;
	}
	public String getItem_width_un() {
		return item_width_un;
	}
	public void setItem_width_un(String item_width_un) {
		this.item_width_un = item_width_un;
	}
	public String getItem_weight_un() {
		return item_weight_un;
	}
	public void setItem_weight_un(String item_weight_un) {
		this.item_weight_un = item_weight_un;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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

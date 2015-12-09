package com.truck.domain;


public class Subcategory {

	private int id;
	
	private int categoryid;
	private String name;
	private String icon;		
	private String category;	
	
	/*
	private MultipartFile iconfile;
	
	

	
	public MultipartFile getIconfile() {
		return iconfile;
	}

	public void setIconfile(MultipartFile iconfile) {
		this.iconfile = iconfile;
	}*/

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}

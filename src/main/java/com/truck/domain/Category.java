package com.truck.domain;



import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Category implements Serializable {
	
	private int id;
	
	private String name;	
		
	private String nameSL;
	
	private String icon;
	

	

	public String getNameSL() {
		return nameSL;
	}

	public void setNameSL(String nameSL) {
		this.nameSL = nameSL;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	

	


}

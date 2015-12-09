package com.truck.domain;


public class BussinessAssociates
{
	
	
		
	private int id;


	private String name;
	

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Bussinessassociates [name=");
		builder.append(name);
		builder.append("]");
		return builder.toString();
	}
	

	
}

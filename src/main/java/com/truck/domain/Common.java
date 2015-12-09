package com.truck.domain;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;


public class Common implements Serializable
{
	
	
	
	
	private List<MultipartFile> itemimage;
	
	private String colcountry;//Collection Country
	private String colpostcode; //collection post code
	private String delcountry;//delivery country
	private String delpostcode;//delivery post code
	private String colearliestpickup;
	private String collatestpickup;
	private String delearliestpickup;
	private String dellatestpickup;
	
	private String[] deleteImageName;
	
	
	
	
      
	public String[] getDeleteImageName() {
		return deleteImageName;
	}
	public void setDeleteImageName(String[] deleteImageName) {
		this.deleteImageName = deleteImageName;
	}
	public List<MultipartFile> getItemimage() {
		return itemimage;
	}
	public void setItemimage(List<MultipartFile> itemimage) {
		this.itemimage = itemimage;
	}
	public String getColearliestpickup() {
		return colearliestpickup;
	}
	public void setColearliestpickup(String colearliestpickup) {
		this.colearliestpickup = colearliestpickup;
	}
	public String getCollatestpickup() {
		return collatestpickup;
	}
	public void setCollatestpickup(String collatestpickup) {
		this.collatestpickup = collatestpickup;
	}
	public String getDelearliestpickup() {
		return delearliestpickup;
	}
	public void setDelearliestpickup(String delearliestpickup) {
		this.delearliestpickup = delearliestpickup;
	}
	public String getDellatestpickup() {
		return dellatestpickup;
	}
	public void setDellatestpickup(String dellatestpickup) {
		this.dellatestpickup = dellatestpickup;
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

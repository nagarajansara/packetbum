package com.truck.dao;

import java.util.List;

import com.truck.domain.Category;
import com.truck.domain.Messages;
import com.truck.domain.Subcategory;
import com.truck.domain.Userdetails;

public interface AdminDAO {

	
	

	// ADD Category
	
	   long addCategory(Category category); 
	   
	   void updateCategory(Category category);
	   
	   List<Category> retriveCategoryAd();
	   
	   List<Category> getCategoryByID(int id);
	   
	   void deleteCategoryByID(int id);
	   
	 // Sub Category
	   
       long addSubCategory(Subcategory subcategory); 
	   
	   void updateSubCategory(Subcategory subcategory);
	   
	   List<Subcategory> retriveSubCategoryAd();
	   
	   List<Subcategory> getSubCategoryByID(int id);
	   
	   void deleteSubCategoryByID(int id);
	   
	 // users
	   
	   
	List<Userdetails> retriveTransporter();
	
	List<Userdetails> retriveProductOwner();
	
	
	  List<Messages> retriveMessagesGroupByMessageID();
	  
	  void updateflag(int id);
}

package com.truck.dao;

import java.util.List;

import com.truck.domain.Items;
import com.truck.domain.Quote;
import com.truck.domain.Users;

public interface ProductDAO {

	
	

	// ADD Product Owner
	
	   long addProductOwner(Users user); 
	   
	   Integer checkUserExits(String email);
	
    // Update Quote if accept
	   
	   void updateQuoteIsAccept(int id,int userid);
	   
	   // retrive item bt User id
	   
	   List<Items> retriveItemsByUserID(int id);
	   
	   List<Items> retriveItemsForActiveDelivery(int id);
	   
	   List<Quote> retriveAcceptQuoteByUserID(int userid);
	  
	   void deleteItem(int id);
	   
	   void UpGradeItem(int itemid);
	
	   List<Items> retriveExpiredItemsByUserID(int id);
	   
	   
	   List<Users> getProOwnerDetailsByID(int id);
	   
	   void updateUsername(String name,int id);
	   void updateProfile(String mobile,int id);
	   
	   Integer getMessageCountByItemId(int id);
	   
	   void updateItemDetails(String colAddress, String delAddress, int id);
	   
	   void updateItemAddress(int id, String colPostalCode,
				String delPostalCode);
	   List<Items> getItemDetailsBasedId(int id);
	   
}

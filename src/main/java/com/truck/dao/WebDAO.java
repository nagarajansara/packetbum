package com.truck.dao;

import java.util.List;

import com.truck.domain.Boatitem;
import com.truck.domain.Caritem;
import com.truck.domain.Category;
import com.truck.domain.Countries;
import com.truck.domain.Fragilegoodsitem;
import com.truck.domain.Furnitureitem;
import com.truck.domain.Generalitem;
import com.truck.domain.Haulageitem;
import com.truck.domain.Homeitem;
import com.truck.domain.ItemImages;
import com.truck.domain.Items;
import com.truck.domain.Livestockitem;
import com.truck.domain.Messages;
import com.truck.domain.Motorcyclesitem;
import com.truck.domain.Otheritem;
import com.truck.domain.Starrating;
import com.truck.domain.Subcategory;
import com.truck.domain.Userdetails;
import com.truck.domain.Users;
import com.truck.domain.Vechicleandparts;
import com.truck.domain.Vechicleowner;
import com.truck.util.Crawl;

public interface WebDAO {

	
	// Search Iteam
	
	 List<Items> retriveCountrySearchItems(List<String> colcountry,List<String> delcountry,List<String> itemtypeid,int start,int numofvalue);
	 
	 List<Items> retriveCountrySearchItems(String colcountry,String delcountry,String[] itemtypeid);
	 int getCountrySearchItemTotalCount(List<String> colcountry,List<String> delcountry,List<String> itemtypeid);
	
	 List<Items> retriveRouteSearchItems(List<String> colcountry,List<String> delcountry,List<String> itemtypeid,String colpostcode,String delpostcode,String km,int start,int numofvalue);
	 int getCountryRouteItemTotalCount(List<String> colcountry,List<String> delcountry,List<String> itemtypeid,String colpostcode,String delpostcode,String km);
	
	
	 List<Items> retriveLocalSearchItems(List<String> itemtypeid,String postcode,String km,int start,int numofvalue);
	 int getCountryLocalItemTotalCount(List<String> itemtypeid,String postcode, String km,int start,int numofvalue);
	
	 
	 
	// Users
	 long addUser(Users users);	
	 
	 void addUserDetails(Users users);
	
	 void addUserDetailsTP(Userdetails userdetails);
	 
	 List<Users> getShortnameByMailID(String mail);
	 
	 List<Users> getUserDetailsByID(String username);
	// Signup for Vechicle Owner Functionality
	
	 long addSignupTP(Vechicleowner vechicleowner);	
	   
	   void ActiveAccountByToken(String token,String id);
	   
	// Add  Items For Quotes
	
	 long addItems(Items items);
	   
	 
	 
	   
	   
	 void addItemImage(String name,int itemid,int itemdetailid);
	   
	 List<ItemImages> retriveItemImagesByItemID(int id);
	   
	   void updateItemImage(String imagename,int id);
	   
	 //Item List
	   
	   List<Items> retriveItems();
	   
	   List<Items> retriveRecentDeliverys();
	   
	   List<Items> retriveItems(int start,int numofvalue);
	   
	   List<Items> retriveUpgradeItems();
	   
	   List<Items> getItem(int id);
	   
	  int getItemTotalCount();
	   
	   
	   
 //Furniture
	   
	   long addFurniture(Furnitureitem furnitureitem);
	   
	   List<Furnitureitem> getFurnitureItem(int id);
	   
	   List<Furnitureitem> getFurnitureByItemID(int id);
	   
 // General Items
	   
	   long addGeneralitem(Generalitem generalitem);
	   
       List<Generalitem> getGeneralItem(int id);
	   
	   List<Generalitem> getGeneralByItemID(int id);
	   
  // Cars
	   
	   long addCaritem(Caritem caritem);
	   
       List<Caritem> getCarItem(int id);
	   
	   List<Caritem> getCarByItemID(int id);
	   
 // Motorcycle
	   
	   long addmotorcycle(Motorcyclesitem motorcyclesitem);  
	   
       List<Motorcyclesitem> getMotorcyclesItem(int id);
	   
	   List<Motorcyclesitem> getMotorcyclesByItemID(int id);
	   
	// Vechicle And Parts
	   
	   long addvechicleandparts(Vechicleandparts vechicleandparts);
	   
       List<Vechicleandparts> getVechicleandpartsItem(int id);
	   
	   List<Vechicleandparts> getVechicleandpartsByItemID(int id);
	   
	   
	   
   // Home
	   
	   long addhome(Homeitem homeitem);  
       List<Homeitem> getHomeItem(int id);
	   
	   List<Homeitem> getHomeByItemID(int id);
	   
	   
	 //  Boats
	   
	   long addboats(Boatitem boatitem); 
	   
        List<Boatitem> getBoatItem(int id);
	   
	   List<Boatitem> getBoatByItemID(int id);
	   
 //  Haulage
	   
	   long addhaulage(Haulageitem haulageitem); 
	   
       List<Haulageitem> getHaulageItem(int id);
	   
	   List<Haulageitem> getHaulageByItemID(int id);
	   
 //  Fragile Goods
	   
	   long addFragilegoods(Fragilegoodsitem fragilegoodsitem);
	   
       List<Fragilegoodsitem> getFragilegoodsItem(int id);
	   
	   List<Fragilegoodsitem> getFragilegoodsByItemID(int id);
	   
 //  Live Stock
	   
	   long addLivestock(Livestockitem livestockitem); 

	   
	
	   
       List<Livestockitem> getLivestockItem(int id);
	   
	   List<Livestockitem> getLivestockByItemID(int id);
	   
 //  Other
	   
	   long addOthers(Otheritem otheritem); 
	   
       List<Otheritem> getOtherItem(int id);
	   
	   List<Otheritem> getOtherByItemID(int id);
	   
	 // Country
	   
	   List<Countries> retrieveCountries();

	
	// Messages service
	   
	   long addMessage(Messages message);
	   
	   void addMessageDetails(Messages message);
	   
	   List<Messages> retriveMessageByMessageID(int id);
	   
	   List<Messages> getMessageByMessageID(int id);
	   
	   List<Messages> retriveMessageByItemVclID(int itemid,int vclid);
	   
	   List<Messages> retriveMessageByItemProID(int itemid,int proid);
	   
	   
	   List<Messages> retriveMessageByProID(int proid);
	   
	   List<Messages> retriveMessageByVCLID(int vclid);
	   
	   List<Messages> retriveMessageByItemID(int itemid);
	   
	   
	   void updateMessageReadByID(int id);
	   
	//   List<Messages> retriveMessageByMessageID(int itemid);
	   
	 // Forgot Password Functionality
	   
	   
	   void updatePassword(String email,String Pass);
	
	// List Category
	   
	   List<Category> retriveCategory();
	   List<Subcategory> retriveSubCategoryByCategoryID(int id);
   //  FEED BACK
	   
	   
	
	   void addStarrating(Starrating star);
	   
	   void addTpDaetails(Crawl crawl);
	   
	   List<Crawl> retriveTpDetails();
	   
	   List<Userdetails> getFeedBackUserDetails(int VCL_ID);
	   List<Starrating> getStartRating(int VCL_ID);

	List<Starrating> getStartRatingComments(int vCL_ID);
	
	List<Countries> getCountries();
	   
}

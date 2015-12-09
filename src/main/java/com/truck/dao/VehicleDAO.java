package com.truck.dao;

import java.util.List;

import com.truck.domain.Quote;
import com.truck.domain.Userdetails;

public interface VehicleDAO {

	
	
public long addQuote(Quote quote);	
	

 List<Quote> retriveQuoteByItemID(int id);
 
 List<Quote> retriveQuoteByUserID(int id);
 
 List<Quote> retriveQuoteByVCLUserID(int id);
 
 List<Quote> retriveAcceptQuoteByUserID(int userid);
 
 List<Quote> getQuoteLowestPriceByItemID(int id);
 
 List<Quote> retriveQuoteForFeedBack(int id);
 
 List<Quote> retriveExpiredQuoteByUserID(int id); 
 
 List<Userdetails> getVclOwnerDetailsByID(int id);
 
 
 void updateVclProfile(Userdetails userdetails,int id);
}

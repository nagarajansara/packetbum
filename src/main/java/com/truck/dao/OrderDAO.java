package com.truck.dao;

import java.util.List;

import com.truck.domain.Order;

public interface OrderDAO {

	
	String generateConfirmationIDByUser(int id,String qid,String amount);
	
	void updateOrder(String confirmationid,String confirmationsignature,String tarifficationerror);
	
	List<Order> getOrder(String confirmationid);

	
}

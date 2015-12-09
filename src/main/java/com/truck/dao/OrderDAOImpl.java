package com.truck.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import com.truck.domain.Order;
import com.truck.security.Encryption;
import com.truck.util.TruckUtil;
@Component
public class OrderDAOImpl  implements OrderDAO {

	
	@Autowired
	private NamedParameterJdbcTemplate namedParmJdbcTemplate;
	
	Encryption encpSha=new Encryption();

	
	// CATEGORY
	
	private final String CREATE_NEW_ORDER = "INSERT INTO truckdb.order(confirmationid,confirmationsignature,tarifficationerror,purchasestatus,providerdata,userid,quoteid,amount) values(:confirmationid,:confirmationsignature,:tarifficationerror,:purchasestatus,:providerdata,:userid,:quoteid,:amount)";	
	

	private final String UPDATE_ORDER = "update truckdb.order set confirmationsignature=:confirmationsignature,tarifficationerror=:tarifficationerror,purchasestatus=:purchasestatus where confirmationid=:confirmationid";
	

	private final String SELECT_ORDER_BY_CONFORMATIONID ="select purchasestatus from truckdb.order where confirmationid=:confirmationid";

	@Override
	public String generateConfirmationIDByUser(int id,String qid,String amount) {
		// TODO Auto-generated method stub
		
		 Map<String, String> paramMap = new HashMap<String, String>();
		 //confirmationid,confirmationsignature,tarifficationerror,purchasestatus,providerdata,userid
		 String uid=TruckUtil.getUUID();
		 paramMap.put("confirmationid",uid);
			paramMap.put("confirmationsignature","null");
			paramMap.put("tarifficationerror","2");
			paramMap.put("purchasestatus","Waiting for confirmation...");
			paramMap.put("providerdata","null");
			paramMap.put("userid",String.valueOf(id));
			paramMap.put("quoteid",qid);
			paramMap.put("amount",String.valueOf(Integer.parseInt(amount)/10));
			
			namedParmJdbcTemplate.update(CREATE_NEW_ORDER, paramMap);
			
				return uid;
	}



	@Override
	public void updateOrder(String confirmationid,String confirmationsignature, String tarifficationerror) {
		// TODO Auto-generated method stub
		
		 Map<String, String> paramMap = new HashMap<String, String>();
		 //confirmationid,confirmationsignature,tarifficationerror,purchasestatus,providerdata,userid
		
		    paramMap.put("confirmationid",confirmationid);
			paramMap.put("confirmationsignature",confirmationsignature);
			paramMap.put("tarifficationerror",tarifficationerror);
			
			if(Integer.parseInt(tarifficationerror)==0){
				paramMap.put("purchasestatus","confirmed");
			}else{
				paramMap.put("purchasestatus","Failed");
			}
		
			namedParmJdbcTemplate.update(UPDATE_ORDER, paramMap);
		
	}



	@Override
	public List<Order> getOrder(String confirmationid) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("confirmationid",confirmationid);
		return namedParmJdbcTemplate.query(SELECT_ORDER_BY_CONFORMATIONID, paramMap,new BeanPropertyRowMapper<Order>(Order.class));
	}



   
	
	


}

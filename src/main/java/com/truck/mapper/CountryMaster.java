package com.truck.mapper;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
public class CountryMaster {

	 public static final Map<String,Integer> COUNTRYMASTER_MAP = createMap();

	    private static Map<String, Integer> createMap() {
	        Map<String, Integer> country = new HashMap<String,Integer>();
	        country.put("England",226);
	        country.put("India",99);
	        country.put("Slovenia",194);			
	        return Collections.unmodifiableMap(country);
	    }
	
	
	/*public static void main(String [] arg){
		
		System.out.println("country id"+CountryMaster.COUNTRYMASTER_MAP.get("England"));
		
	}*/
	
	
	
	
}

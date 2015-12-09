package com.truck.mapper;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
public class HashForMasterTable {

	 public static final Map<Integer, String> MASTERTYPE_MAP = createMap();

	    private static Map<Integer, String> createMap() {
	        Map<Integer, String> hm = new HashMap<Integer, String>();
	        hm.put(1,"furnitureitem");
			 hm.put(2,"generalitem");
			 hm.put(3,"caritem");
			 hm.put(4,"motorcyclesitem");
			 hm.put(5,"vechicleandparts");
			 hm.put(6,"homeitem");
			 hm.put(7,"boatsitem");
			 hm.put(8,"haulageitem");
			 hm.put(9,"fragilegoodsitem");
			 hm.put(10,"livestockitem");
			 hm.put(11,"otheritem");
	        return Collections.unmodifiableMap(hm);
	    }
	
	
	
	
	
	
	
}

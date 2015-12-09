package com.truck.util;

import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

public class AutoGeneratedKey {

	private AutoGeneratedKey(){}
	private KeyHolder holder = new GeneratedKeyHolder();
	private String[] columns = {"id"};
	
	public static AutoGeneratedKey getInstance(){
		return new AutoGeneratedKey();
	}
	
	public String[] getPKName(String pkName){
		columns[0] = pkName;
		return columns;
	}
	
	public KeyHolder getHolder(){
		return holder;
	}
	
	public Long getValue(){
		return holder.getKey().longValue();
	}
}
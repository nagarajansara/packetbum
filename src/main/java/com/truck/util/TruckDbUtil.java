package com.truck.util;

public class TruckDbUtil {

	public static String setQueryLimit(String query, int page, int numofrows) {
		return query + " limit " + numofrows * (page - 1) + ", " + numofrows;
	}

}

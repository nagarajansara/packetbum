package com.truck.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.google.gson.JsonSyntaxException;
import com.truck.util.GeocodeResponse.Result;


public class GoogleGeoCode {
    private Gson gson = new Gson();

    private volatile long lastRequest = 0L;

    public static String[] getLatLong(String code){
    	 String lat=null,lng=null,address=null;
    	
    	try {
    		GeocodeResponse googleGeoCode=new GoogleGeoCode().getLocation(code);
        	  
        	   
    		
    		   for(Result result : googleGeoCode.getResults())
    		   {
    			   lat=String.valueOf(result.getGeometry().getLocation().getLat());
    			   lng= String.valueOf(result.getGeometry().getLocation().getLng());
    			   address=result.getFormatted_address();
    		   }
    		   
			
		} catch (JsonSyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return new String[] {lat, lng,address};
    }
    
    public GeocodeResponse getLocation(String ...addressElements) throws JsonSyntaxException, JsonIOException, MalformedURLException,
            IOException {
        StringBuilder sb = new StringBuilder();
        
        for (String string : addressElements) {
            if (sb.length() > 0) {
                sb.append('+');
            }
            sb.append(URLEncoder.encode(string.replace(' ', '+'), "UTF-8"));
        }
        String url = "http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=" + sb.toString();
        // Google limits this web service to 2500/day and 10 requests/s
        synchronized (this) {
            try {
                long elapsed = System.currentTimeMillis() - lastRequest;
                if (elapsed < 100) {
                    try {
                        Thread.sleep(100 - elapsed);
                    } catch (InterruptedException e) {
                    }
                }
                return gson.fromJson(new BufferedReader(new InputStreamReader(new URL(url).openStream())), GeocodeResponse.class);
            } finally {
                lastRequest = System.currentTimeMillis();
            }
        }
    }
    
    
    
   /* public static void main(String []arg){
    	
    	String [] value=GoogleGeoCode.getLatLong("628503 india");
    	System.out.println("Latitude: " + value[0]);
        System.out.println("Longitude: " + value[1]);
        System.out.println("address: " + value[2]);
    }*/
    
}
package com.truck.util;


import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {

	
	public String testEncoding() {
	    final String src = "Hallo Ä"; // this has to be read with the right encoding
	    final CharsetEncoder asciiEncoder = Charset.forName("US-ASCII").newEncoder();
	    final StringBuilder result = new StringBuilder();
	    for (final Character character : src.toCharArray()) {
	        if (asciiEncoder.canEncode(character)) {
	            result.append(character);
	        } else {
	            result.append("\\u");
	            result.append(Integer.toHexString(0x10000 | character).substring(1).toUpperCase());
	        }
	    }
	   return result.toString();
	 }

	
	
	
	public static void main(String[] args) {
		
		 String s = "03/24/13"+" 00:00";
	        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm");
	        try
	        {
	            Date date = simpleDateFormat.parse(s);

	            System.out.println("date : "+simpleDateFormat.format(date));
	        }
	        catch (Exception ex)
	        {
	            System.out.println("Exception "+ex);
	        }
		
		
	}
	

}

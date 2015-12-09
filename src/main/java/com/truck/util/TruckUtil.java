package com.truck.util;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;
import java.util.UUID;

import org.apache.commons.codec.binary.Base64;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.multipart.MultipartFile;

public class TruckUtil {

	
	private static final long LIMIT = 100000L;
	private static long last = 0;
	 private final static char[] idchars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
	 
	 
     private static String createUID(int len) {
         char[] id = new char[len];
         Random r = new Random(System.currentTimeMillis());
         for (int i = 0;  i < len;  i++) {
             id[i] = idchars[r.nextInt(idchars.length)];

         }
         return new String(id);
     }

     public static String base64UrlEncode(String input) {
    	 byte [] stringToEncodeBytes = input.getBytes();  
    	  return Base64.encodeBase64String(stringToEncodeBytes);
    	     }
     
     
     
    public static String base64UrlDecode(String input) {
    String result = null;
    Base64 decoder = new Base64(true);
    byte[] decodedBytes = decoder.decode(input);
    result = new String(decodedBytes);
    return result;
     }
     
	public static long getID() {
	  // 10 digits.
	  long id = System.currentTimeMillis() % LIMIT;
	  if ( id <= last ) {
	    id = (last + 1) % LIMIT;
	  }
	  return last = id;
	}
	public static String getUUID()
	{
		return UUID.randomUUID().toString();
	}

	public static String getDateString(String dateInString) {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String dateVal="";
	 
		Date date;
		try {
			date = formatter.parse(dateInString);
			dateVal=formatter.format(date);
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println(date);
		//System.out.println(formatter.format(date));
		
		
		return dateVal;
	}
	
	
	public static java.sql.Date getSqlDate(String dateInString) {
		String date = dateInString;
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy"); // your template here
		java.util.Date dateStr;
		java.sql.Date dateDB = null;
		try {
			dateStr = formatter.parse(date);
			 dateDB = new java.sql.Date(dateStr.getTime());
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return dateDB;
	}
	
	
	public static java.sql.Date getSqlDateFormat(String dateInString) {
		String date = dateInString;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); // your template here
		java.util.Date dateStr;
		java.sql.Date dateDB = null;
		try {
			dateStr = formatter.parse(date);
			 dateDB = new java.sql.Date(dateStr.getTime());
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return dateDB;
	}
	
	public static int getStringToInt(String stringVal){
		
		
		return Integer.parseInt(stringVal);
	}
	
	 public static String md5(String input) {
         
	        String md5 = null;
	         
	        if(null == input) return null;
	         
	        try {
	             
	        //Create MessageDigest object for MD5
	        MessageDigest digest = MessageDigest.getInstance("MD5");
	         
	        //Update input string in message digest
	        digest.update(input.getBytes(), 0, input.length());
	 
	        //Converts message digest value in base 16 (hex)
	        md5 = new BigInteger(1, digest.digest()).toString(16);
	 
	        } catch (NoSuchAlgorithmException e) {
	 
	            e.printStackTrace();
	        }
	        return md5;
	    }
	 
	 public static void uploadFiles(MultipartFile photoFiles,String directory,String fileName){
		  
          if (!"".equalsIgnoreCase(fileName)) {
              // Handle file content - multipartFile.getInputStream()
          	try {
					photoFiles.transferTo(new File(directory + fileName));
					
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
              
          }
 
		 
		 
	 }
	 
	 public static double distance(double lat1, double lon1, double lat2, double lon2, char unit) {
		  double theta = lon1 - lon2;
		  double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
		  dist = Math.acos(dist);
		  dist = rad2deg(dist);
		  dist = dist * 60 * 1.1515;
		  if (unit == 'K') {
		    dist = dist * 1.609344;
		  } else if (unit == 'N') {
		  	dist = dist * 0.8684;
		    }
		  return (dist);
		}

		
		private static double deg2rad(double deg) {
		  return (deg * Math.PI / 180.0);
		}


		private static double rad2deg(double rad) {
		  return (rad * 180 / Math.PI);
		}
	 
	/*	public static DateTime convertSqlTimeStampToDateTime(java.sql.Timestamp sqlTimestamp){
		    Calendar c = Calendar.getInstance();
		    c.setTime(sqlTimestamp);
		    //note: java months are between 0 and 11:
		    DateTime dt=new DateTime(c.get(Calendar.YEAR),c.get(Calendar.MONTH)+1,c.get(Calendar.DAY_OF_MONTH),c.get(Calendar.HOUR_OF_DAY),c.get(Calendar.MINUTE),c.get(Calendar.SECOND),c.get(Calendar.MILLISECOND));
		    return dt;
		}*/
		
		
		 public static String getDiffMinuteByDate(String timestamp){
			 
			 Date today = new Date();
			 SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd HH:mm:ss"); 
			 
			
			 String dateStart =timestamp;
			 String dateStop =format.format(today) ;

			
			 // Custom date format
			 

			 Date d1 = null;
			 Date d2 = null;
			 try {
			     d1 = format.parse(dateStart);
			    d2 = format.parse(dateStop);
			 } catch (Exception e) {
			     e.printStackTrace();
			 }    

			 // Get msec from each, and subtract.
			 long diff = d2.getTime() - d1.getTime();
			 long diffSeconds = diff / 1000;         
			 long diffMinutes = diff / (60 * 1000);         
			 long diffHours = diff / (60 * 60 * 1000); 
			 int diffInDays = (int) (diff / (24 * 60 * 60 * 1000));
			 
			 String value="";
			 
	             Locale locale = LocaleContextHolder.getLocale();
				
				 String defaultLanguage=locale.getDisplayLanguage();
			 
				 String DaysAgo=" Days ago";
				 String HoursAgo=" Hours ago";				 
				 String minsago=" Mins ago";
				 
				 System.out.println("defaultLanguage---"+defaultLanguage);
				 
				 if(defaultLanguage=="Slovenian"){
					 DaysAgo=" dni";
					HoursAgo=" ur";
					minsago=" dni";
				 }
			 
			 
			if(diffMinutes>60){
				
				if(diffHours>24){
					
					
						value=diffInDays+DaysAgo;
					
					
					
				}else{
					value=diffHours+HoursAgo;
				}
				
				
			}else{
				value=diffMinutes+minsago;
			}
			 
			return value;
			 
			 
			 
		 }
		 
		 public static String getCurrentDateCustomFormat(String format) {
			    SimpleDateFormat sdfDate = new SimpleDateFormat(format);//dd/MM/yyyy
			    Date now = new Date();
			    String strDate = sdfDate.format(now);
			    return strDate;
			}
	
}

package com.truck.domain;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import org.springframework.security.core.userdetails.User;

public class VerificationToken {

	
	 private static final int EXPIRATION = 60 * 24;
	 
	  
	    private Long id;
	     
	    private String token;
	    
	    private boolean verified;
	   
	   
	    private User user;
	     
	    private Date expiryDate;
	 
	    public VerificationToken() {
	        super();
	    }
	    public VerificationToken(String token, User user) {
	        super();
	        this.token = token;
	        this.user = user;
	        this.expiryDate = calculateExpiryDate(EXPIRATION);
	        this.verified = false;
	    }
	     
	    private Date calculateExpiryDate(int expiryTimeInMinutes) {
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(new Timestamp(cal.getTime().getTime()));
	        cal.add(Calendar.MINUTE, expiryTimeInMinutes);
	        return new Date(cal.getTime().getTime());
	    }
	
	
	
	
	
}

package com.truck.domain;

import java.util.Locale;

import org.springframework.context.ApplicationEvent;
import org.springframework.security.core.userdetails.User;



public class OnRegistrationCompleteEvent extends ApplicationEvent {
    private final String appUrl;
    private final Locale locale;
    private final User user;
 
    public OnRegistrationCompleteEvent(User user, Locale locale, String appUrl) {
        super(user);
         
        this.user = user;
        this.locale = locale;
        this.appUrl = appUrl;
    }
     
    // standard getters and setters
}


	
	
	
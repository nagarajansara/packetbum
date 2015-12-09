package com.truck.dao;

import com.truck.domain.Users;
import com.truck.domain.VerificationToken;


public interface UserDAO {
	
	
	 
    Users getUser(String verificationToken);
 
    void saveRegisteredUser(Users user);
 
    void createVerificationToken(Users user, String token);
 
    VerificationToken getVerificationToken(String VerificationToken);
}
						


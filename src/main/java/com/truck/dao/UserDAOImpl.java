package com.truck.dao;

import org.springframework.stereotype.Component;

import com.truck.domain.Users;
import com.truck.domain.VerificationToken;

@Component
public class UserDAOImpl implements UserDAO {

	@Override
	public Users getUser(String verificationToken) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveRegisteredUser(Users user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void createVerificationToken(Users user, String token) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public VerificationToken getVerificationToken(String VerificationToken) {
		// TODO Auto-generated method stub
		return null;
	}

		
	
}

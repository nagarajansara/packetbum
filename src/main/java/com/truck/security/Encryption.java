package com.truck.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Encryption {
	@Autowired
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	@Autowired
	ShaPasswordEncoder shaEncoder = new ShaPasswordEncoder(256);

	public String encodeBCrypt(String pwd) {
		return encoder.encode(pwd);
	}

	public String encode(String pwd, String saltUserName) {
		return shaEncoder.encodePassword(pwd, saltUserName);
	}

	public static void main(String[] args) {
		Encryption encode = new Encryption();
		System.out.println(encode.encode("test123", "test@gmail.com"));

	}

}

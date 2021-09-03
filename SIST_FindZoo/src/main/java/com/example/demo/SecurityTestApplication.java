package com.example.demo;

import org.springframework.boot.SpringApplication;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootApplication
public class SecurityTestApplication {

	public static void main(String[] args) {
		//sist, sist, 관리자, ADMIN
		/*String pwd = PasswordEncoderFactories.createDelegatingPasswordEncoder().encode("sist");
		
		MemberVO m = new MemberVO("sist",pwd,"관리자","ADMIN");
		
		DBManager.insertMember(m);
		System.out.println("관리자 계정 생성함");*/
		
		SpringApplication.run(SecurityTestApplication.class, args);
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
		
	}

}

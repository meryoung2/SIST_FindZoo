package com.example.demo;

import org.springframework.context.annotation.Configuration;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		//super.configure(http);
		
		http.authorizeRequests()
		.mvcMatchers("/","/join.do","/login.do","/main.do").permitAll() 
		//로그인, 회원가입없이 들어갈 수 있는 페이지들 추가로 써야함(마이페이지 같은 경우는 permit하면 안됌
		.mvcMatchers("/admin/**").hasRole("ADMIN")
		.anyRequest().authenticated();
		
		http.formLogin().loginPage("/login.do").permitAll() //로그인되지 않은 사용자 /login.do에 모두 접근 가능
		.defaultSuccessUrl("/loginOK.do"); //로그인이 완료된 메인 화면으로 갈 수 있도록 url바꾸기

		http.logout()
		.logoutRequestMatcher(new AntPathRequestMatcher("/logout.do"))
		.invalidateHttpSession(true)
		.logoutSuccessUrl("/login.do");
		
		http.httpBasic();
	}
	
}

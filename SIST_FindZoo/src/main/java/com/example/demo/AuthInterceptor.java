package com.example.demo;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("Auth 인터셉터 동작함!");
		HttpSession session = request.getSession();
		
		String login= (String)session.getAttribute("loginM");
		//로그인이 되어있는지 확인
		
		if(login == null) {
	        //메소드 정의 - session객체에 현재 uri 정보 저장
			saveBeforeUri(request);
	        //로그인 url로 보냄
			response.sendRedirect("/login.do");
			return false;
		}else {
			return true;
		}
	}
	
	public void saveBeforeUri(HttpServletRequest request) {
		
		String uri=request.getRequestURI();       
		String query=request.getQueryString();    

	   //query에 아무것도 들어있지 않다면
		if(query == null || query.trim().equals("null")) {
			query = "";
		}else {
			query="?"+query;
		}	
		
	    //session객체에 저장
		if(request.getMethod().equals("POST")) {
			request.getSession().setAttribute("uri", uri+query);
		}
	}
}

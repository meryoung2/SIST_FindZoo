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
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		//System.out.println("Auth 인터셉터 동작함!");
		HttpSession session = request.getSession();
		
		String uri=request.getRequestURI();       
		String query=request.getQueryString(); 
		
		//query에 아무것도 들어있지 않다면
		if(query == null || query.trim().equals("null")) {
			query = "";
		}else {
			query="?"+query;
		}	
		
	    //session객체에 저장
		request.getSession().setAttribute("uri", uri+query);
		System.out.println("저장하는 uri:"+(uri+query));
		
		super.afterCompletion(request, response, handler, ex);
					
	}
}

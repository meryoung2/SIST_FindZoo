package com.example.demo;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("로그인 인터셉터 동작함!");
		HttpSession session = request.getSession();
		if(session.getAttribute("loginM") != null) {
		return super.preHandle(request, response, handler);
		}else {
			response.sendRedirect("/login.do");
			return false;
		}
	}

}

package com.example.demo;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class SistConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		//WebMvcConfigurer.super.addInterceptors(registry);
		
		registry.addInterceptor(new LoginInterceptor())
		.addPathPatterns("/member/**");
		
		registry.addInterceptor(new AuthInterceptor())
		.addPathPatterns("/**")
		.excludePathPatterns("/member/**")
		.excludePathPatterns("/login.do","/css/**","/error","/resources/**","/join.do","/WEB-INF/views/**");


	}
}

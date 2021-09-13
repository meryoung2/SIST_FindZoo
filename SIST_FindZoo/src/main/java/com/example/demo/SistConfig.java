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
		.addPathPatterns("/로그인 후 들어갈 수 있는 뷰(인터셉터)/**");
	}
	
}

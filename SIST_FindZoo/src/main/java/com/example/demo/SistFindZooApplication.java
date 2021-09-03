package com.example.demo;

import org.apache.catalina.Context;
import org.apache.tomcat.util.scan.StandardJarScanner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class SistFindZooApplication {

	public static void main(String[] args) {
		SpringApplication.run(SistFindZooApplication.class, args);
	}

	@Bean
	public ServletWebServerFactory embeddedServletContainerFactory() {
		return new TomcatServletWebServerFactory() {
		@Override
		protected void postProcessContext(Context context) {
			((StandardJarScanner) context.getJarScanner()).setScanManifest(false);
			}
		};
	}

}
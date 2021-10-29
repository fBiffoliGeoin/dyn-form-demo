package com.dynform;

import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;

import com.dynform.read_operations.core.EnvironmentService;

@Controller
@SpringBootApplication
public class DynFormApplication implements ApplicationRunner {
	
	private EnvironmentService environmentService;
	
	public DynFormApplication(EnvironmentService environmentService) {
		this.environmentService= environmentService;
	}
	
	public static void main(String[] args) {
		SpringApplication.run(DynFormApplication.class, args);
	}
	
	@Override
	public void run(ApplicationArguments args) throws Exception {
		environmentService.loadEnvironments();
	}
}

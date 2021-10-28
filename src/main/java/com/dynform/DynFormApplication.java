package com.dynform;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;

@Controller
@SpringBootApplication(scanBasePackages={"com.dynform"})
public class DynFormApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(DynFormApplication.class, args);
	}
}

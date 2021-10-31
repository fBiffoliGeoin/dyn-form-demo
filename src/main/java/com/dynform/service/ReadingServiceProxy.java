package com.dynform.service;

import java.io.InputStream;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import com.dynform.read_operations.core.ReadingServiceImpl;

@Service
public class ReadingServiceProxy extends ReadingServiceImpl {
	
	public InputStream getInputStreamFromPath(String path) throws Exception {
		Resource resource = new ClassPathResource(path);
		return resource.getInputStream();
	}
}

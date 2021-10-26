package com.dynform.service.custom;

import javax.annotation.PostConstruct;

import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import com.dynform.interfaces.CustomService;

@Configuration
@Service
public class DiscographyCustomServiceImpl implements CustomService {
	
	private CustomServiceMapper customServiceMapper;
	
	private final String DISCOGRAPHY_H2 = "discography-h2";
	
	public DiscographyCustomServiceImpl(CustomServiceMapper customServiceMapper) {
		this.customServiceMapper = customServiceMapper;
	}

	@Bean
	@ConfigurationProperties(DISCOGRAPHY_H2 + ".datasource")
	public DataSourceProperties dataSourceDiscographyH2Properties() {
		return new DataSourceProperties();
	}
	
	@PostConstruct
	@Override
    public void addDataSourceProp() {
		customServiceMapper.addDataSourceProp(DISCOGRAPHY_H2, dataSourceDiscographyH2Properties());
    }
}

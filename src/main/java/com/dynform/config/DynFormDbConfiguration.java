package com.dynform.config;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
public class DynFormDbConfiguration {
	
	@Configuration
	@EnableTransactionManagement
	@EnableJpaRepositories(
			entityManagerFactoryRef = "dynFormEntityManagerFactory",
			basePackages = {
			"com.dynform.repository",
			})
	public class dynFormConfig {
		
		@Primary
		@Bean(name = "dynFormEntityManagerFactory")
		public LocalContainerEntityManagerFactoryBean entityManagerFactory(
				EntityManagerFactoryBuilder builder,
				DataSource dynFormDataSource) {
			return builder
					.dataSource(dynFormDataSource)
					.packages("com.dynform.entities")
					.persistenceUnit("dyn-form")
					.build();
		}
		
		@Bean(name = "transactionManager")
		public PlatformTransactionManager transactionManager(
				@Qualifier("dynFormEntityManagerFactory") EntityManagerFactory dynFormEntityManagerFactory) {
			return new JpaTransactionManager(dynFormEntityManagerFactory);
		}
	}
}
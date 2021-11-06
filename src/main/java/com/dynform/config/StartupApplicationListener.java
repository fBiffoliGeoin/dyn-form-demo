package com.dynform.config;

import javax.sql.DataSource;

import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.dynform.modify_operations.core.ModifyingService;
import com.dynform.read_operations.core.EnvironmentService;
import com.dynform.read_operations.core.ReadingService;
import com.dynform.repository.ErrorsDetailRepository;
import com.dynform.repository.ErrorsRepository;
import com.dynform.repository.MenuRepository;
import com.dynform.repository.MetadataRepository;
import com.dynform.service.custom.CustomServiceMapper;

@Component
public class StartupApplicationListener implements
  ApplicationListener<ContextRefreshedEvent> {
 
	private ReadingService readingService;
	private ModifyingService modifyingService;
	private MenuRepository menuRepo;
	private MetadataRepository metadataRepository;
	private DataSource dynFormDataSource;
	private ErrorsRepository errorsRepo;
	private ErrorsDetailRepository errorsDetailRepo;
	private CustomServiceMapper customServiceMapper;
	private EnvironmentService environmentService;
 
    public StartupApplicationListener(ReadingService readingService, ModifyingService modifyingService,
			MenuRepository menuRepo, MetadataRepository metadataRepository, DataSource dynFormDataSource,
			ErrorsRepository errorsRepo, ErrorsDetailRepository errorsDetailRepo, CustomServiceMapper customServiceMapper,
			EnvironmentService environmentService) {
		super();
		this.readingService = readingService;
		this.modifyingService = modifyingService;
		this.menuRepo = menuRepo;
		this.metadataRepository = metadataRepository;
		this.dynFormDataSource = dynFormDataSource;
		this.errorsRepo = errorsRepo;
		this.errorsDetailRepo = errorsDetailRepo;
		this.customServiceMapper = customServiceMapper;
		this.environmentService = environmentService;
	}



	@Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
    	readingService.setConfiguration(menuRepo, metadataRepository,
    			dynFormDataSource, customServiceMapper, environmentService);
    	modifyingService.setConfiguration(this.menuRepo, metadataRepository,
    			dynFormDataSource, errorsRepo, errorsDetailRepo, customServiceMapper, environmentService);
    }
}

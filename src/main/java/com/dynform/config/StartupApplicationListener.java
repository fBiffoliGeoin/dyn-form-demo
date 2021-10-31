package com.dynform.config;

import javax.sql.DataSource;

import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.dynform.modify_operations.core.ModifyingService;
import com.dynform.read_operations.ReadingController;
import com.dynform.read_operations.core.EnvironmentService;
import com.dynform.read_operations.core.ReadingService;
import com.dynform.repository.ErrorsDetailRepository;
import com.dynform.repository.ErrorsRepository;
import com.dynform.repository.IMenuRepository;
import com.dynform.repository.MetadataRepository;
import com.dynform.service.custom.CustomServiceMapper;

@Component
public class StartupApplicationListener implements
  ApplicationListener<ContextRefreshedEvent> {
 
	private EnvironmentService environmentService;
	private ReadingService readingService;
	private ModifyingService modifyingService;
	private IMenuRepository menuRepo;
	private MetadataRepository metadataRepository;
	private DataSource dynFormDataSource;
	private ErrorsRepository errorsRepo;
	private ErrorsDetailRepository errorsDetailRepo;
	private CustomServiceMapper customServiceMapper;
	private ReadingController readingController;
 
    public StartupApplicationListener(EnvironmentService environmentService, ReadingService readingService, ModifyingService modifyingService,
			IMenuRepository menuRepo, MetadataRepository metadataRepository, DataSource dynFormDataSource,
			ErrorsRepository errorsRepo, ErrorsDetailRepository errorsDetailRepo, CustomServiceMapper customServiceMapper,
			ReadingController readingController) {
    	
		super();
		
		this.environmentService = environmentService;
		this.readingService = readingService;
		this.modifyingService = modifyingService;
		this.menuRepo = menuRepo;
		this.metadataRepository = metadataRepository;
		this.dynFormDataSource = dynFormDataSource;
		this.errorsRepo = errorsRepo;
		this.errorsDetailRepo = errorsDetailRepo;
		this.customServiceMapper = customServiceMapper;
		this.readingController = readingController;
	}



	@Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
		
		environmentService.setConfiguration(menuRepo);
		try {
			environmentService.loadEnvironments();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
    	readingService.setConfiguration(menuRepo, metadataRepository,
    			dynFormDataSource, customServiceMapper);
    	modifyingService.setConfiguration(this.menuRepo, metadataRepository,
    			dynFormDataSource, errorsRepo, errorsDetailRepo, customServiceMapper);
    	readingController.setServices(readingService, environmentService);
    }
}

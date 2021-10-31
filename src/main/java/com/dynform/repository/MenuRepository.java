package com.dynform.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.dynform.entities.MenuTypesEntity;
import com.dynform.model.Environment;
import com.dynform.model.MainMenuItem;
import com.dynform.model.MenuItem;

@Repository
public interface MenuRepository extends JpaRepository<MenuTypesEntity, Long>, IMenuRepository {
		
	String FIND_SELECT_ENVIRONMENT_QUERY = "select new com.dynform.model.Environment ("
			+ " custom_db.id, custom_db.code, custom_db.defaultEnvId = envs.id,"
			+ " envs.id, envs.code, envs.description) "
			+ " from CustomDbEntity custom_db "
			+ " inner join custom_db.environments envs"
	;
	
	String FIND_SELECT_MAIN_QUERY = "select new com.dynform.model.MainMenuItem ("
			+ " type.id, type.description) "
			+ " from MenuTypesEntity type "
	;

	String FIND_SELECT_VISIBLE_TO_ALL_QUERY = "select new com.dynform.model.MenuItem ("
			+ " category.id, category.description, category.readOnly, table.schema, table.name,"
			+ " table.fileName, table.description, type.description, type.generalPath,"
			+ " category.sequence, table.sequence, table.file) "
			+ " from MenuTypesEntity type "
			+ " inner join type.categories category"
			+ " inner join category.tables table"
			+ " where category.visibleToAll = True"
			+ " and type.id = :typeId"
			+ " order by category.sequence, table.sequence"
		;
	
	String FIND_SELECT_VISIBLE_TO_USER_QUERY = "select new com.dynform.model.MenuItem ("
			+ " category.id, category.description, category.readOnly, table.schema, table.name,"
			+ " table.fileName, table.description, type.description, type.generalPath,"
			+ " category.sequence, table.sequence, table.file) "
			+ " from MenuTypesEntity type "
			+ " inner join type.categories category"
			+ " inner join category.tables table"
			+ " inner join category.users user"
			+ " where user.userName = :userName"
			+ " and type.id = :typeId"
			+ " order by category.sequence, table.sequence"
		;
	
	@Query(FIND_SELECT_ENVIRONMENT_QUERY)
	public List<Environment> getEnvironments();
	
	@Query(FIND_SELECT_MAIN_QUERY)
	public List<MainMenuItem> getMainMenu();
	
	@Query(FIND_SELECT_VISIBLE_TO_ALL_QUERY)
	public List<MenuItem> getMenuVisibleToAll(@Param("typeId") Long typeId);
	
	@Query(FIND_SELECT_VISIBLE_TO_USER_QUERY)
	public List<MenuItem> getMenuVisibleToUser(@Param("userName") String userName, @Param("typeId") Long typeId);
}
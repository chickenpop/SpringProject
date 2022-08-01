package com.project.tour;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
@Qualifier("dao")
public class MainDAOImpl implements MainDAO {

	@Autowired
	private SqlSessionTemplate template;
	
}

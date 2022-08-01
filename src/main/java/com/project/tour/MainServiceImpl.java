package com.project.tour;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	@Qualifier("dao")
	private MainDAO dao;
	
	
	
}

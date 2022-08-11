package com.project.tour.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.tour.dto.UserDTO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	@Qualifier("dao")
	private AdminDAO dao;
	
	@Override
	public List<UserDTO> getUser(HashMap<String, String> map) {
		return dao.getUser(map);
	}
	
	@Override
	public int getUserCnt() {
		return dao.getUserCnt();
	}
	
	@Override
	public List<UserDTO> findUser(HashMap<String, String> map) {
		return dao.findUser(map);
	}
	
}

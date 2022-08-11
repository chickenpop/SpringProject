package com.project.tour.admin;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.project.tour.dto.UserDTO;

@Repository
@Qualifier("dao")
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<UserDTO> getUser(HashMap<String, String> map) {
		return template.selectList("admin.getUser", map);
	}
	
	@Override
	public int getUserCnt() {
		return template.selectOne("admin.getUserCnt");
	}
	
	@Override
	public List<UserDTO> findUser(HashMap<String, String> map) {
		return template.selectList("admin.findUser", map);
	}
	
}

package com.project.tour.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.project.tour.dto.AdminDTO;
import com.project.tour.dto.MemberDTO;
import com.project.tour.dto.UserDTO;

@Repository
@Qualifier("dao")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public UserDTO checkUser(MemberDTO dto) {	
		return template.selectOne("member.checkUser", dto);
	}
	
	@Override
	public AdminDTO checkAdmin(MemberDTO dto) {
		return template.selectOne("member.checkAdmin", dto);
	}
	
}

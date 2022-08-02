package com.project.tour.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.tour.dto.AdminDTO;
import com.project.tour.dto.MemberDTO;
import com.project.tour.dto.UserDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	@Qualifier("dao")
	private MemberDAO dao;
	
	@Override
	public UserDTO checkuser(MemberDTO dto) {
		return dao.checkUser(dto);
	}
	
	@Override
	public AdminDTO checkAdmin(MemberDTO dto) {
		return dao.checkAdmin(dto);
	}
	
}

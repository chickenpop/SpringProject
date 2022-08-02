package com.project.tour.member;

import com.project.tour.dto.AdminDTO;
import com.project.tour.dto.MemberDTO;
import com.project.tour.dto.UserDTO;

public interface MemberDAO {

	UserDTO checkUser(MemberDTO dto);

	AdminDTO checkAdmin(MemberDTO dto);

}

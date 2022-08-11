package com.project.tour.admin;

import java.util.HashMap;
import java.util.List;

import com.project.tour.dto.UserDTO;

public interface AdminDAO {

	List<UserDTO> getUser(HashMap<String, String> map);

	int getUserCnt();

	List<UserDTO> findUser(HashMap<String, String> map);

}

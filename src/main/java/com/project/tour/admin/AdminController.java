package com.project.tour.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.tour.dto.SearchDTO;
import com.project.tour.dto.UserDTO;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	@GetMapping(value="/admin/userlist")
	public String main(String page, Model model) {
				
		// 페이징
		int currentPage = 0;
		int begin = 0;
		int end = 0;
		int pageCnt = 10;
		
		int totalCnt = 0;
		int totalPage = 0;
		
		if (page == null || page == "") currentPage = 1;
		else currentPage = Integer.parseInt(page);
		
		begin = ((currentPage - 1) * pageCnt) + 1;
		end = begin + pageCnt - 1;
		
		HashMap<String,String> map = new HashMap<String,String>();
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		List<UserDTO> list = service.getUser(map);
		
		totalCnt = service.getUserCnt();
		totalPage = (int)Math.ceil((double)totalCnt / pageCnt);
		
        String pagebar = "";
		
		int pageSize = 10;	// 보이는 페이지 개수
		int n = 0;			// 페이지 번호
		int loop = 0;		
		
		pagebar = "";
		
		loop = 1;
		n = ((currentPage - 1) / pageSize) * pageSize + 1;
		
		pagebar += "<ul class=\"pagination\">";
		
		if (n == 1) {
			pagebar += String.format(" <li class=\"page-item\">\r\n"
					+ "		      <a class=\"page-link\" href=\"#!\" aria-label=\"Previous\">\r\n"
					+ "		        <span aria-hidden=\"true\">&laquo;</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li> "
					);
		} else {
			pagebar += String.format(" <li class=\"page-item\">\r\n"
					+ "		      <a class=\"page-link\" href=\"/planitshare/admin/userlist?page=%d\" aria-label=\"Previous\">\r\n"
					+ "		        <span aria-hidden=\"true\">&laquo;</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li> "
					, n - 1
					);
		}
		
		while (!(loop > pageSize || n > totalPage)) {
			
			if (n == currentPage) {
				pagebar += String.format(" <li class=\"page-item active\"><a class=\"page-link\" href=\"#!\">%d</a></li> "
						, n);
			} else {
				pagebar += String.format(" <li class=\"page-item\"><a class=\"page-link\" href=\"/planitshare/admin/userlist?page=%d\">%d</a></li> "
						, n
						, n);
			}
			
			loop++;
			n++;
		}
		
		if (n > totalPage) {
			pagebar += String.format(" <li class=\"page-item\">\r\n"
					+ "		      <a class=\"page-link\" href=\"#!\" aria-label=\"Next\">\r\n"
					+ "		        <span aria-hidden=\"true\">&raquo;</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li> "
					);
		} else {
			pagebar += String.format(" <li class=\"page-item\">\r\n"
					+ "		      <a class=\"page-link\" href=\"/planitshare/admin/userlist=%d\" aria-label=\"Next\">\r\n"
					+ "		        <span aria-hidden=\"true\">&raquo;</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li> "
					, n
					);
		}
		
		
		pagebar += "</ul>";
		
		// 회원 성별 m, f > 남자, 여자
		for(UserDTO dto : list) {
			if(dto.getGender().equals("f")) {
				dto.setGender("여자");
			} else if(dto.getGender().equals("m")) {
				dto.setGender("남자");
			} 
		}
		
		
		model.addAttribute("list", list);
		model.addAttribute("pagebar", pagebar);
		
		return "admin.userlist";
	}
	
	
	@GetMapping(value="/admin/search")
	public String UserSearch(String user, String keyword, Model model) {
	
		System.out.println(user + ' ' + keyword);
		
		HashMap<String,String> map = new HashMap<String,String>();
		
		map.put("user", user);
		map.put("keyword", keyword);
		
		List<UserDTO> list = service.findUser(map);
		
		for(UserDTO dto : list) {
			if(dto.getGender().equals("f")) {
				dto.setGender("여자");
			} else if(dto.getGender().equals("m")) {
				dto.setGender("남자");
			} 
		}
		
		model.addAttribute("list", list);
		model.addAttribute("keyword", keyword);
		
		return "admin.usersearch";
	}
	
	
	
}

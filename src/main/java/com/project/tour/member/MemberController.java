package com.project.tour.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.tour.dto.AdminDTO;
import com.project.tour.dto.MemberDTO;
import com.project.tour.dto.UserDTO;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	@GetMapping(value="/member/login")
	public String login() {
				
		return "member.login";
	}
	
	@PostMapping(value="/member/loginok")
	public String loginok(@ModelAttribute MemberDTO dto, HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
		
		HttpSession session = req.getSession();
		if(("user").equals(dto.getLoginmode())) {
			
			UserDTO mdto = service.checkuser(dto);
			mdto.setLoginmode("user");
			session.setAttribute("auth", mdto);
			
		} else if(("admin").equals(dto.getLoginmode())) {
			
			AdminDTO mdto = service.checkAdmin(dto);
			mdto.setLoginmode("admin");
			session.setAttribute("auth", mdto);
						
		} else {			
			req.setAttribute("loginError", "y");
		}

		return "main";
	}
	
	@GetMapping(value="/member/logout")
	public String logout(HttpServletRequest req, HttpServletResponse resp) {

		HttpSession session = req.getSession();
	    session.invalidate();
		
		return "main";
	}

	
}

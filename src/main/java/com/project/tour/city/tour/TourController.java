package com.project.tour.city.tour;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.tour.dto.CityDTO;
import com.project.tour.dto.SearchDTO;
import com.project.tour.dto.TourDTO;
import com.project.tour.dto.TourReviewDTO;

@Controller
public class TourController {

	@Autowired
	private TourService service;
	
	@GetMapping(value="/city/tour")
	public String tour(Model model) {
			
		List<String> category = service.getTourCategoryList();
		List<CityDTO> city = service.getCityName();
		List<TourDTO> tour = service.getTourList(); 
		
		model.addAttribute("category", category);
		model.addAttribute("city", city);
		model.addAttribute("tour", tour);
		
		return "city.tour.list";
	}
	
	
	@GetMapping(value="/city/tour/search")
	public String search(SearchDTO dto, Model model) {
		
		List<String> category = service.getTourCategoryList();
		List<CityDTO> city = service.getCityName();
		List<TourDTO> tour = service.searchTour(dto); 
		
		model.addAttribute("search", dto);
		model.addAttribute("category", category);
		model.addAttribute("city", city);
		model.addAttribute("tour", tour);
		
		return "city.tour.search";
	}
	
	@GetMapping(value="/city/tour/view")
	public String tourview(TourDTO tdto, Model model, HttpSession session) {
		
		
		TourDTO dto = service.getTour(tdto);
		List<TourReviewDTO> rlist = service.getTourReview(tdto);
		
		model.addAttribute("dto", dto);
		model.addAttribute("rlist", rlist);
		model.addAttribute("sdto", tdto.getSeq());
		
		return "city.tour.view";
	}
	
}

package com.project.tour.city.tour;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
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
		model.addAttribute("sdto", tdto);
		
		return "city.tour.view";
	}
	
	@PostMapping(value="/city/tour/reviewAdd")
	public String reviewAdd(TourReviewDTO rdto, String seq, String cseq, HttpServletRequest req, Model model) {
		
		TourDTO sdto = new TourDTO();
		
		sdto.setSeq(seq);
		sdto.setCseq(cseq);
		
		TourDTO dto = service.getTour(sdto);

		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)req;
		MultipartFile file = multi.getFile("attach");
		
		int result = 0;
		
		// ?????? ??????
		if("".equals(file.getOriginalFilename()) || file.getOriginalFilename() == null) {
			
			result = service.putTourReview(rdto);
			
		} else {
			

			String filename = file.getOriginalFilename();
			String path = req.getRealPath("resources/userimage/tour");
			
			// ????????? ?????? ??????
			filename = getFileName(path, filename);
			
			// ????????? ?????? ?????? ??????
			result = service.putTourReview(rdto);
			service.putTourReviewImg(filename);
				
			File savefile = new File(path + "\\" + filename); //?????? ??????
			
			try {
				
				file.transferTo(savefile); //?????? ?????? > ?????? ??????
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		// ?????? ?????? ????????????
		List<TourReviewDTO> rlist = service.getTourReview(sdto);
		
		model.addAttribute("dto", dto);
		model.addAttribute("rlist", rlist);
		model.addAttribute("sdto", sdto);
		model.addAttribute("result", result);
		
		return "city.tour.view";
	}
	
	@PostMapping(value="/city/tour/reviewdel")
	public void reviewDel(String seq, Model model, HttpServletResponse resp, HttpServletRequest req) throws IOException {
		
		String isImg = service.getTourReviewImg(seq);
		
		if(isImg != null || !(" ".equals(isImg))) {	
			
			//?????? ?????? ??????
			String path = req.getRealPath("/resources/userimage/tour");
			path += "/" + isImg;
			
			File file = new File(path);
			file.delete();
			
			service.delTourReviewImg(seq);
		}		
		
		int result = service.delTourReview(seq);
		Gson gson = new Gson();
		
		resp.getWriter().print(gson.toJson(result));
	
	}
	
	private String getFileName(String path, String filename) {
		
		//?????? ????????? ???????????? ???????????? ?????? ?????????
		//path = "resources/files/"
		//filename = "MyBatis.png"
		
		int n = 1; //????????? ??????
		int index = filename.lastIndexOf(".");
		
		String tempName = filename.substring(0, index); //"MyBatis"
		String tempExt = filename.substring(index); //".png"
		
		while (true) {
			
			File file = new File(path + "\\" + filename); //files\MyBatis.png
			
			if (file.exists()) {
				//??????. > ?????? > ?????? ??????
				filename = tempName + "_" + n + tempExt; //MyBatis_1.png
				n++;				
			} else {
				//??????. > ????????? ?????? ??????
				return filename;
			}
			
		}
		
	}
	
	
	
}

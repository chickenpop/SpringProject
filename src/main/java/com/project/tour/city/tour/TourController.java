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
		
		// 리뷰 등록
		if("".equals(file.getOriginalFilename()) || file.getOriginalFilename() == null) {
			
			result = service.putTourReview(rdto);
			
		} else {
			

			String filename = file.getOriginalFilename();
			String path = req.getRealPath("resources/userimage/tour");
			
			// 파일명 중복 방지
			filename = getFileName(path, filename);
			
			// 이미지 있는 리뷰 등록
			result = service.putTourReview(rdto);
			service.putTourReviewImg(filename);
				
			File savefile = new File(path + "\\" + filename); //희망 경로
			
			try {
				
				file.transferTo(savefile); //임시 폴더 > 저장 폴더
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		// 리뷰 목록 가져오기
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
			
			//파일 경로 지정
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
		
		//저장 폴더의 파일명을 중복되지 않게 만들기
		//path = "resources/files/"
		//filename = "MyBatis.png"
		
		int n = 1; //인덱싱 숫자
		int index = filename.lastIndexOf(".");
		
		String tempName = filename.substring(0, index); //"MyBatis"
		String tempExt = filename.substring(index); //".png"
		
		while (true) {
			
			File file = new File(path + "\\" + filename); //files\MyBatis.png
			
			if (file.exists()) {
				//있다. > 중복 > 파일 변경
				filename = tempName + "_" + n + tempExt; //MyBatis_1.png
				n++;				
			} else {
				//없다. > 파일명 사용 가능
				return filename;
			}
			
		}
		
	}
	
	
	
}

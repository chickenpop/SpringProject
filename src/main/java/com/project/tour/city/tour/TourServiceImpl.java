package com.project.tour.city.tour;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.tour.dto.CityDTO;
import com.project.tour.dto.SearchDTO;
import com.project.tour.dto.TourDTO;
import com.project.tour.dto.TourReviewDTO;

@Service
public class TourServiceImpl implements TourService {

	@Autowired
	@Qualifier("dao")
	private TourDAO dao;
	
	@Override
	public List<String> getTourCategoryList() {
		return dao.getTourCategoryList();
	}
	
	@Override
	public List<CityDTO> getCityName() {
		return dao.getCityName();
	}
	
	@Override
	public List<TourDTO> getTourList() {
		return dao.getTourList();
	}
	
	@Override
	public List<TourDTO> searchTour(SearchDTO dto) {
		return dao.searchTour(dto);
	}
	
	@Override
	public TourDTO getTour(TourDTO tdto) {
		return dao.getTour(tdto);
	}
	
	@Override
	public List<TourReviewDTO> getTourReview(TourDTO tdto) {
		return dao.getTourReview(tdto);
	}
	
	@Override
	public int putTourReview(TourReviewDTO rdto) {
		return dao.putTourReview(rdto);
	}
	
	@Override
	public int delTourReview(String seq) {
		return dao.delTourReview(seq);
	}
	
	@Override
	public int editTourReview(TourReviewDTO rdto) {
		return dao.editTourReview(rdto);
	}
	
	@Override
	public int putTourReviewImg(String filename) {
		return dao.putTourReviewImg(filename);
	}
	
}

package com.project.tour.city.tour;

import java.util.HashMap;
import java.util.List;

import com.project.tour.dto.CityDTO;
import com.project.tour.dto.SearchDTO;
import com.project.tour.dto.TourDTO;
import com.project.tour.dto.TourReviewDTO;

public interface TourDAO {

	List<String> getTourCategoryList();

	List<CityDTO> getCityName();

	List<TourDTO> getTourList();

	List<TourDTO> searchTour(SearchDTO dto);

	TourDTO getTour(TourDTO tdto);

	List<TourReviewDTO> getTourReview(TourDTO tdto);	
	
}

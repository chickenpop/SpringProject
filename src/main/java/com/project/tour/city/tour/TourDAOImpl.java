package com.project.tour.city.tour;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.project.tour.dto.CityDTO;
import com.project.tour.dto.SearchDTO;
import com.project.tour.dto.TourDTO;
import com.project.tour.dto.TourReviewDTO;

@Repository
@Qualifier("dao")
public class TourDAOImpl implements TourDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<String> getTourCategoryList() {
		return template.selectList("tour.tourCategorylist");
	}
	
	@Override
	public List<CityDTO> getCityName() {
		return template.selectList("tour.cityNameList");
	}
	
	@Override
	public List<TourDTO> getTourList() {
		return template.selectList("tour.tourList");
	}
	
	@Override
	public List<TourDTO> searchTour(SearchDTO dto) {
		return template.selectList("tour.searchTour", dto);
	}
	
	@Override
	public TourDTO getTour(TourDTO tdto) {
		return template.selectOne("tour.tour", tdto);
	}
	
	@Override
	public List<TourReviewDTO> getTourReview(TourDTO tdto) {
		return template.selectList("tour.tourReview", tdto);
	}
	
	@Override
	public int putTourReview(TourReviewDTO rdto) {
		return template.insert("tour.putTourReview", rdto);
	}
	
	@Override
	public int delTourReview(String seq) {
		return template.delete("tour.delTourReview", seq);
	}
	
	@Override
	public int editTourReview(TourReviewDTO rdto) {
		return template.update("tour.editTourReview", rdto);
	}
	
	@Override
	public int putTourReviewImg(String filename) {
		return template.insert("tour.putTourReviewImg", filename);
	}
	
	@Override
	public int delTourReviewImg(String seq) {
		return template.delete("tour.delTourReviewImg", seq);
	}
	
	@Override
	public String getTourReviewImg(String seq) {
		return template.selectOne("tour.getTourReviewImg", seq);
	}
	
}

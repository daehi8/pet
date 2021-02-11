package pet.model.service;

import java.util.List;

import pet.model.dto.PriceReviewDTO;

public interface PriceReviewService {

	// 리뷰 가격정보 작성
	public void insertPriceReview(PriceReviewDTO priceReviewDTO) throws Exception;
	
	// 리뷰 고유번호로 DTO 찾기
	public List selectByReviewNo(int review_no) throws Exception;
	
	// 진료과목 리스트
	public List selectSubjectList() throws Exception;
}

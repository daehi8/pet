package pet.model.service;

import pet.model.dto.RatingReviewDTO;

public interface RatingReviewService {
	
	// 평점 작성
	public void insertRatingReview(RatingReviewDTO ratingReviewDTO) throws Exception;
}
package pet.model.service;

import java.util.List;

import pet.model.dto.RatingReviewDTO;

public interface RatingReviewService {
	
	// 평점 작성
	public void insertRatingReview(RatingReviewDTO ratingReviewDTO) throws Exception;
	
	// 리뷰 고유번호로 DTO 찾기
	public RatingReviewDTO selectByReviewNo(int review_no) throws Exception;
}

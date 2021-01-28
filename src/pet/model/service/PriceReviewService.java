package pet.model.service;

import pet.model.dto.PriceReviewDTO;

public interface PriceReviewService {

	// 리뷰 가격정보 작성
	public void insertPriceReview(PriceReviewDTO priceReviewDTO) throws Exception;
}

package pet.model.service;

import pet.model.dto.LikeReviewDTO;

public interface LikeReviewService {
	
	// 같은 이메일로 좋아요 중복 금지 -> 유효성검사
	public int likeCheck(LikeReviewDTO likeReviewDTO) throws Exception;
	// 추천 DB에 입력
	public void insertLikeReview(LikeReviewDTO likeReviewDTO) throws Exception;
	// 리뷰글에 추천한 사람 수 카운트해서 총 추천수
	public int getLikeReviewCount(int review_no) throws Exception;
}

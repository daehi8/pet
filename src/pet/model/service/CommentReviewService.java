package pet.model.service;

import pet.model.dto.CommentReviewDTO;

public interface CommentReviewService {
	
	// 리뷰코멘트 입력
	public void insertCommentReview(CommentReviewDTO commentReviewDTO) throws Exception;
	
	// 리뷰코멘트 삭제
	public void deleteCommentReview(int review_no) throws Exception;
}

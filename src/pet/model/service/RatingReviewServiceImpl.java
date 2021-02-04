package pet.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pet.model.dto.RatingReviewDTO;

@Service("ratingReviewService")
public class RatingReviewServiceImpl implements RatingReviewService{
	
	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Override
	public void insertRatingReview(RatingReviewDTO ratingReviewDTO) throws Exception {
		dao.insert("ratingReview.insertRatingReview", ratingReviewDTO);		
	}
	
	@Override
	public RatingReviewDTO selectByReviewNo(int review_no) throws Exception{
		return dao.selectOne("ratingReview.selectByReviewNo", review_no);
	}
}

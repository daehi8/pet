package pet.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pet.model.dto.ReviewDTO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Override
	public void insertReview(ReviewDTO reviewDTO) throws Exception {
		dao.insert("review.insertReview", reviewDTO);
	}

	@Override
	public void updateReview(ReviewDTO reviewDTO) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteReview(ReviewDTO reviewDTO) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ReviewDTO myReview(String member_email) {
		// TODO Auto-generated method stub
		return null;
	}

}

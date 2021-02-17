package pet.model.service;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pet.model.dto.LikeReviewDTO;

@Service("likeReviewService")
public class LikeReviewServiceImpl implements LikeReviewService {

	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Override
	public int likeCheck(LikeReviewDTO likeReviewDTO) throws Exception {
		return dao.selectOne("likeReview.likeCheck", likeReviewDTO);
	}

	@Override
	public void insertLikeReview(LikeReviewDTO likeReviewDTO) throws Exception {
		dao.insert("likeReview.insertLikeReview", likeReviewDTO);	
	}

	@Override
	public int getLikeReviewCount(int review_no) throws Exception {
		return dao.selectOne("likeReview.getLikeReviewCount", review_no);
	}

}

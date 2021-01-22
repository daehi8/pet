package pet.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pet.model.dto.CommentReviewDTO;

@Service("commentReviewService")
public class CommentReviewServiceImpl implements CommentReviewService{

	@Autowired
	private SqlSessionTemplate dao = null;
	
	
	@Override
	public void insertCommentReview(CommentReviewDTO commentReviewDTO) throws Exception {
		dao.insert("commentReview.insertCommentReview", commentReviewDTO);
	}

	@Override
	public void deleteCommentReview(int review_no) throws Exception {
		// TODO Auto-generated method stub
		
	}

}

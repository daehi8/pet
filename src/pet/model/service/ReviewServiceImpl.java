package pet.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public int selectNewReview() throws Exception {
		int no = dao.selectOne("review.selectNewNo");
		return no;
	}

	@Override
	public List getListReview(int start, int end, String hospital_name, String SearchType) throws Exception {
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("hospital_name", hospital_name);
		if(SearchType != null) {
			map.put("searchType", SearchType);
		}
		return dao.selectList("review.getListReview", map);
	}

	@Override
	public int getListReviewCount(String hospital_name) throws Exception {
		return dao.selectOne("review.getListReviewCount", hospital_name);
	}

	@Override
	public int getRecomCount(String hospital_name) throws Exception {
		return dao.selectOne("review.getRecomCount", hospital_name);
	}

	@Override
	public int getNotRecomCount(String hospital_name) throws Exception {
		return dao.selectOne("review.getNotRecomCount", hospital_name);
	}

}

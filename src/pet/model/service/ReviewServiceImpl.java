package pet.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pet.model.dto.DocInfoDTO;
import pet.model.dto.DocMyHospitalDTO;
import pet.model.dto.DocPictureDTO;
import pet.model.dto.HospitalDTO;
import pet.model.dto.ReviewDTO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Override
	public void insertReview(ReviewDTO reviewDTO) throws Exception {
		if(reviewDTO.getPublic_check() == null) {
			reviewDTO.setPublic_check("N");
		}
		dao.insert("review.insertReview", reviewDTO);
	}

	@Override
	public int selectNewReview() throws Exception {
		int no = dao.selectOne("review.selectNewNo");
		return no;
	}

	@Override
	public List getListReview(int start, int end, int hospital_no, String SearchType) throws Exception {
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("hospital_no", hospital_no);
		if(SearchType != null) {
			map.put("searchType", SearchType);
		}
		return dao.selectList("review.getListReview", map);
	}

	@Override
	public int getListReviewCount(int hospital_no) throws Exception {
		return dao.selectOne("review.getListReviewCount", hospital_no);
	}

	@Override
	public int getRecomCount(int hospital_no) throws Exception {
		return dao.selectOne("review.getRecomCount", hospital_no);
	}

	@Override
	public int getNotRecomCount(int hospital_no) throws Exception {
		return dao.selectOne("review.getNotRecomCount", hospital_no);
	}

	@Override
	public List getListAuthCheckReview(int start, int end, String searchType) throws Exception {
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("searchType", searchType);
		return dao.selectList("review.getListAuthCheckReview", map);
	}

	@Override
	public int getListAuthCheckReviewCount(String searchType) throws Exception {
		return dao.selectOne("review.getListAuthCheckReviewCount", searchType);
	}

	@Override
	public void okAuthCheck(int review_no) throws Exception {
		dao.update("review.okAuthCheck", review_no);		
	}

	@Override
	public void noAuthCheck(int review_no) throws Exception {
		dao.update("review.noAuthCheck", review_no);		
	}

	@Override
	public ReviewDTO selectByReviewNo(int review_no) throws Exception {
		return dao.selectOne("review.selectByReviewNo", review_no);
	}

	@Override
	public DocPictureDTO getDocPicture(int hospital_no) throws Exception {
		return dao.selectOne("review.getDocPicture", hospital_no);
	}

	@Override
	public DocInfoDTO getDocInfo(int hospital_no) throws Exception {
		return dao.selectOne("review.getDocInfo", hospital_no);
	}

	@Override
	public String selectAuth(int review_no) throws Exception {
		return dao.selectOne("review.selectAuth", review_no);
	}

	@Override
	public DocMyHospitalDTO selectMyhospitalByHospitalNo(int hospital_no) throws Exception {
		return dao.selectOne("review.selectMyhospitalByHospitalNo", hospital_no);
	}

	@Override
	public HospitalDTO selectHospitalByHospitalNo(int hospital_no) throws Exception {
		return dao.selectOne("review.selectHospitalByHospitalNo", hospital_no);
	}

	@Override
	public List selectHospitalAll() throws Exception {
		return dao.selectList("review.selectHospitalAll");
	}

	@Override
	public String selectDocMailByName(DocInfoDTO docInfoDTO) throws Exception {
		return dao.selectOne("review.selectDocMailByName", docInfoDTO);
	}

}

package pet.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pet.model.dto.PriceReviewDTO;

@Service("priceReviewService")
public class PriceReviewServiceImpl implements PriceReviewService{
	
	@Autowired
	private SqlSessionTemplate dao = null;

	@Override
	public void insertPriceReview(PriceReviewDTO priceReviewDTO) throws Exception {
		dao.insert("priceReview.insertPriceReview", priceReviewDTO);
	}
}

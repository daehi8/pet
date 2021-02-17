package pet.model.service;

import java.util.List;

import pet.model.dto.PriceReviewDTO;
import pet.model.dto.SearchCriteria;

public interface InfoService {

		public List<PriceReviewDTO> list(SearchCriteria scri) throws Exception;
		// 그래프에 넣을 값
		public int getCount(int start, int end, String subject_info);
		public int count(SearchCriteria scri) throws Exception;
		public int scount(String subject_info) throws Exception;
		// review + review_price
		public List<PriceReviewDTO> read(String subject_info) throws Exception;
		public List<PriceReviewDTO> join(int start, int end, String subject_info) throws Exception;
		public int max(String subject_info) throws Exception;
		public int min(String subject_info) throws Exception;
		public int avg(String subject_info) throws Exception;
		
}

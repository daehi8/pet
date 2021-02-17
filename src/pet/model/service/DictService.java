package pet.model.service;

import java.util.List;
import pet.model.bean.DictBean;
import pet.model.dto.Criteria;
import pet.model.dto.DictDTO;
import pet.model.dto.SearchCriteria;

public interface DictService {
	
	// 목록
	public List<DictDTO> list(SearchCriteria scri) throws Exception;
	
	// 게시물 총 개수 (페이징)
	public int count(SearchCriteria scri) throws Exception;
			
	// 작성
	public void write(DictDTO dto) throws Exception;
	
	// 조회
	public DictDTO read(int dict_no) throws Exception;
	
	// 수정
	public void update(DictDTO dto) throws Exception;
	
	// 삭제
	public void delete(int dict_no) throws Exception;
		
	// 게시물 목록 (페이징)
	public List<DictDTO> listSearch(SearchCriteria scri) throws Exception;
	
}

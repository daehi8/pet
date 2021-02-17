package pet.model.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pet.model.bean.DictBean;
import pet.model.dto.Criteria;
import pet.model.dto.DictDTO;
import pet.model.dto.SearchCriteria;

@Service("Ddao")
public class DictServiceImpl implements DictService{
	
	@Autowired
	private SqlSessionTemplate Ddao = null;

	// 목록
	@Override
	public List<DictDTO> list(SearchCriteria scri) throws Exception {
		return Ddao.selectList("dict.page", scri);
	}
	
	// 총 개수
	@Override
	public int count(SearchCriteria scri) throws Exception {
		return Ddao.selectOne("dict.count", scri);
	}
	
	// 작성
	@Override
	public void write(DictDTO dto) throws Exception {
			Ddao.insert("dict.add", dto);
		
	}
	
	// 조회
	@Override
	public DictDTO read(int dict_no) throws Exception {
		return Ddao.selectOne("dict.read", dict_no);
	}
	
	// 수정
	@Override
	public void update(DictDTO dto) throws Exception {
		Ddao.update("dict.update", dto);
		
	}

	// 삭제
	@Override
	public void delete(int dict_no) throws Exception {
		Ddao.delete("dict.delete", dict_no);
		
	}
	
	@Override
	public List<DictDTO> listSearch(SearchCriteria scri) throws Exception {
		return Ddao.selectList("dict.page", scri);
	}

	
}
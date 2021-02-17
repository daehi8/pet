package pet.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pet.model.dto.PriceReviewDTO;
import pet.model.dto.SearchCriteria;

@Service("Idao")
public class InfoServiceImpl implements InfoService{

	@Autowired
	private SqlSessionTemplate Idao = null;

	@Override
	public List<PriceReviewDTO> list(SearchCriteria scri) throws Exception {
		return Idao.selectList("info.page", scri);
	}
	
	@Override
	public int getCount(int start, int end, String subject_info) {
		//Map<String, Integer> map = new HashMap<String, Integer>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subject_info", subject_info);
		map.put("start", start);
		map.put("end", end);
		return Idao.selectOne("info.count", map);
	}

	@Override
	public List<PriceReviewDTO> read(String subject_info) throws Exception {
		return Idao.selectList("info.read", subject_info);
		}

	@Override
	public int count(SearchCriteria scri) throws Exception {
		return Idao.selectOne("info.ct", scri);
	}

	@Override
	public List<PriceReviewDTO> join(int start, int end, String subject_info) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subject_info", subject_info);
		map.put("start", start);
		map.put("end", end);
		return Idao.selectList("info.join", map);
	}

	@Override
	public int max(String subject_info) throws Exception {
		return Idao.selectOne("info.max", subject_info);
	}

	@Override
	public int min(String subject_info) throws Exception {
		return Idao.selectOne("info.min", subject_info);
	}

	@Override
	public int avg(String subject_info) throws Exception {
		return Idao.selectOne("info.avg", subject_info);
	}

	@Override
	public int scount(String subject_info) throws Exception {
		return Idao.selectOne("info.scount", subject_info);
	}
}

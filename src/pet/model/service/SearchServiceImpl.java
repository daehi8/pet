package pet.model.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;


@Service("searchDAO")
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Override
	public List getSearch(String keyword) {
		return dao.selectList("test.search",keyword);
	}
	
	@Override
	public List getTestReview(String keyword) {
		return dao.selectList("test.TestReview",keyword);
	}

	@Override
	public List getHospital(String keyword) {
		return dao.selectList("test.Hospital",keyword);
	}

	@Override
	public List getDocInfo(String keyword) {
		return dao.selectList("test.DocInfo",keyword);
	}

	@Override
	public List getHospitalList(String keyword , int start, int end) throws Exception {
		HashMap map = new HashMap();
		map.put("keyword", keyword);
		map.put("startRow", start);
		map.put("endRow", end);
		return dao.selectList("test.CountList" , map);
	}

	@Override
	public int getHospitalListCount(String keyword  ) throws Exception {

		return dao.selectOne("test.Count",keyword);
	}

	@Override
	public List getCity(String keyword) {
		
		return dao.selectList("test.CityList",keyword);
	}

	
	

}

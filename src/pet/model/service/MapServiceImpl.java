package pet.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("map")
public class MapServiceImpl implements MapService{

	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Override
	public List selectAll() throws Exception {
		
		return dao.selectList("map.selectAll");
	} 

}

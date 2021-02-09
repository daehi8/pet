package pet.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pet.model.dto.DocInfoDTO;
import pet.model.dto.DocPictureDTO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Override
	public List selectMemberAll(int start, int end, String searchType) throws Exception {
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("searchType", searchType);
		return dao.selectList("admin.selectMemberAll", map);
	}

	@Override
	public int getCountMemberAll(String searchType) throws Exception {
		return dao.selectOne("admin.getCountMemberAll", searchType);
	}

	@Override
	public List selectDocAll(int start, int end, String searchType) throws Exception {
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("searchType", searchType);
		return dao.selectList("admin.selectDocAll", map);
	}

	@Override
	public int getCountDocAll(String searchType) throws Exception {
		return dao.selectOne("admin.getCountDocAll", searchType);
	}

	@Override
	public DocInfoDTO getDocInfo(int no) throws Exception {
		return dao.selectOne("admin.getDocInfo", no);
	}

	@Override
	public List getDocPicture(String doc_mail) throws Exception {
		return dao.selectList("admin.getDocPicture", doc_mail);
	}

	@Override
	public void okAuthCheck(String doc_mail) throws Exception {
		dao.update("admin.okAuthCheck", doc_mail);
	}

	@Override
	public void noAuthCheck(String doc_mail) throws Exception {
		dao.update("admin.noAuthCheck", doc_mail);
	}
	
	
}
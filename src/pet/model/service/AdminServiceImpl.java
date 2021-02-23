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
	public void okDocAuthCheck(String doc_mail) throws Exception {
		dao.update("admin.okDocAuthCheck", doc_mail);
	}

	@Override
	public void noDocAuthCheck(String doc_mail) throws Exception {
		dao.update("admin.noDocAuthCheck", doc_mail);
	}

	@Override
	public void insertPriceTag(String subject) throws Exception {
		dao.insert("admin.insertPriceTag", subject);
		
	}

	@Override
	public List selectSubjectAll() throws Exception {
		return dao.selectList("admin.selectSubjectAll");
	}

	@Override
	public void delSubject(String subject) throws Exception {
		dao.delete("admin.delSubject", subject);
	}

	@Override
	public void delMember(int no) throws Exception {
		dao.update("admin.deleteMember", no);
	}

	@Override
	public List selectAuthNoReviewList() throws Exception {
		return dao.selectList("admin.selectAuthNoReviewList");
	}

	@Override
	public List selectAuthNoDocList() throws Exception {
		return dao.selectList("admin.selectAuthNoDocList");
	}
	
	@Override	// hospital DB 동일이름 갯수세기
	public int getNameCount() throws Exception {
		return dao.selectOne("admin.getNameCount");
	}
	
	@Override	// 동일 이름 목록 꺼내기.
	public List nameList(HospitalDTO hospitalDto) throws Exception {
		return dao.selectList("admin.nameList", hospitalDto);
	}

	@Override 	// Myhospital에 메일에 맞는 병원 번호 저장.
	public void updateHospital(DocMyHospitalDTO docMyHospitalDto) throws Exception {
		dao.update("admin.updateHospital", docMyHospitalDto );
	}

	@Override
	public void updateDoc_info(DocInfoDTO docInfoDto) throws Exception {
		dao.update("admin.updateDoc_info", docInfoDto);
	}

	
}

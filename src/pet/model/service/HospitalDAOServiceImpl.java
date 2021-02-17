package pet.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pet.model.dto.DocInfoDTO;
import pet.model.dto.DocMyHospitalDTO;
import pet.model.dto.DocPictureDTO;
import pet.model.dto.HospitalDTO;

@Service("hospitalDao")
public class HospitalDAOServiceImpl implements HospitalDAOService {

	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Override	// 사진 갯수
	public int getPictureCount() throws Exception {
		return dao.selectOne("admin.getPictureCount");
	}
	
	@Override	// license, registration 정보를 보기 위해 꺼내기
	public List getDoc_picture(DocPictureDTO docPictureDto) throws Exception {
		System.out.println("impl까진 왔나?-> @Authwired는 따로 지정해주기.");
		return dao.selectList("admin.getDoc_picture", docPictureDto);
	}


	@Override
	public List selectAll() throws Exception {
		return dao.selectList("admin.selectAll");
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

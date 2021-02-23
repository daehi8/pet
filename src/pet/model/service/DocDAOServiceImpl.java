package pet.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pet.model.bean.MailHandler;
import pet.model.bean.DocMailSendService;
import pet.model.dto.DocInfoDTO;
import pet.model.dto.DocMyHospitalDTO;
import pet.model.dto.DocPictureDTO;
import pet.model.dto.HospitalDTO;

@Service("docDao")	// Bean에서 DAOService 서비스를 받는 것.
public class DocDAOServiceImpl implements DocDAOService {
	
	@Autowired
	private SqlSessionTemplate dao = null;	//@서비스와 이름 다름..


	@Override
	public List selectAll() {
		return dao.selectList("doctor.selectAll");
	}
	
	@Override  // DB 의사모든테이블에 doc_no입력, info테이블에 메일,비번 삽입.
	public void insertDoc(DocInfoDTO docInfoDto) throws Exception {
		dao.insert("doctor.insertDoc", docInfoDto);
	}
	
	@Override	// DB에 doc_myhospital도  인서트.
	public void insertHospital(DocMyHospitalDTO docMyHospitalDto) throws Exception {
		dao.insert("doctor.insertHospital",docMyHospitalDto);
	}

	
	// authkey DB에 넣기
	@Override
	public void updateAuthKey(DocInfoDTO docInfoDto) {
		dao.update("doctor.updateAuthKey", docInfoDto);
	}


	@Override // 인증키가 일치하는지 확인
	public List authKeyOK(DocInfoDTO docInfoDto) throws Exception {
		System.out.println("authKeyOK 확인------");
		return dao.selectList("doctor.authKeyOk", docInfoDto);
	}


	@Override // pic_no의 최대값 리턴
	public int maxNo() throws Exception {
		return dao.selectOne("doctor.maxNo");
	}
	
	@Override	// 파일 원본명,번호 저장 하기
	public int insertFile(DocPictureDTO docPictureDto) throws Exception {
		return dao.insert("doctor.insertFile", docPictureDto);
	}
	
	@Override	// 파일 사본, 타입 업데이트
	public void fileUpdate(DocPictureDTO docPictureDto) throws Exception {
		System.out.println("업데이트가 실행됐나???");
		dao.update("doctor.fileUpdate", docPictureDto);
	}

	@Override	// 로그인 체크 , 메일 중복 체크
	public int userCheck(DocInfoDTO docInfoDto)throws Exception {
		return dao.selectOne("doctor.userCheck", docInfoDto);
	}

	
	@Override	// 메일인증과 file 저장했을 경우 인증상태 1로 변경하기.
	public void updateAuthState(DocInfoDTO docInfoDto) throws Exception {
		System.out.println("impl 상태변경.");
		dao.update("doctor.updateAuthState" , docInfoDto);
	}

	@Override
	public String selectLicense(DocPictureDTO docPictureDto) throws Exception {
		return dao.selectOne("doctor.selectLicense",docPictureDto);
	}
	@Override
	public String selectRegistration(DocPictureDTO docPictureDto) throws Exception {
		return dao.selectOne("doctor.selectRegistration",docPictureDto);
	}
	
	@Override	// doc_pictuer에 동의서있는지 확인
	public String selectAgree(DocPictureDTO docPictureDto) throws Exception {
		return dao.selectOne("doctor.selectAgree",docPictureDto);
	}
	
	@Override	// doc_pictuer에 동의서있는지 확인
	public void updateAgree(DocInfoDTO docInfoDto) throws Exception {
		dao.update("doctor.updateAgree",docInfoDto);
	}
	

	@Override	// 의사정보 꺼내기 Doc_info
	public DocInfoDTO getDoctor(String doc_mail) throws Exception {
		return dao.selectOne("doctor.getDoctor", doc_mail);
	}

	@Override	// doc_info 정보 수정
	public int updateModify(DocInfoDTO docInfoDto) throws Exception {
		return dao.update("doctor.updateModify" , docInfoDto);
	}
	
	@Override	// doc_info의  비번 수정
	public void changePw(DocInfoDTO docInfoDto) throws Exception {
		dao.update("doctor.changePw", docInfoDto);
	}

	@Override	// doc_pictuer 정보 수정
	public int updatePicture(DocPictureDTO docPictureDto) throws Exception {
		return dao.update("doctor.updatePicture");
	}

	@Override	// doc_hospital정보꺼내기
	public DocMyHospitalDTO getHospital(String doc_mail) throws Exception {
		return dao.selectOne("doctor.getHospital", doc_mail);
	}
	
	@Override	// hospital DB 정보 꺼내기
	public HospitalDTO getHospitalDB(int no) throws Exception {
		return dao.selectOne("doctor.getHospitalDB", no);
	}

	@Override	// Myhospital ( 병원추가정보) 입력하기.
	public void hospitalUpdate(DocMyHospitalDTO docMyHospitalDto) throws Exception {
		dao.update("doctor.hospitalUpdate", docMyHospitalDto);
	}

	@Override	// doc_info 의 doc_state를 -1 로 변경.
	public int deleteDoctor(DocInfoDTO docInfoDto) throws Exception {
		return dao.update("doctor.deleteDoctor", docInfoDto);
	}

	@Override
	public int stateChange(DocInfoDTO docInfoDto) throws Exception {
		return dao.update("doctor.stateChange", docInfoDto);
	}

	@Override
	public int getArticleCount(NoticefreedomDTO freeDto) throws Exception {
		return dao.selectOne("doctor.getArticleCount", freeDto);
	}

	@Override
	public List getArticles(int startRow, int endRow, String email) throws Exception {
		HashMap hashmap = new HashMap();
		hashmap.put("startRow", startRow);
		hashmap.put("endRow", endRow);
		hashmap.put("email", email);

		return dao.selectList("doctor.getArticles", hashmap );
	}

	

	

	

	



	




	
	
}

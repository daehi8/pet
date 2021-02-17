package pet.model.service;

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

@Service("docDao")	// Bean���� DAOService ���񽺸� �޴� ��.
public class DocDAOServiceImpl implements DocDAOService {
	
	@Autowired
	private SqlSessionTemplate dao = null;	//@���񽺿� �̸� �ٸ�..


	@Override
	public List selectAll() {
		return dao.selectList("doctor.selectAll");
	}
	
	@Override  // DB �ǻ������̺� doc_no�Է�, info���̺� ����,��� ����.
	public void insertDoc(DocInfoDTO docInfoDto) throws Exception {
		dao.insert("doctor.insertDoc", docInfoDto);
	}
	
	@Override	// DB�� doc_myhospital��  �μ�Ʈ.
	public void insertHospital(DocMyHospitalDTO docMyHospitalDto) throws Exception {
		dao.insert("doctor.insertHospital",docMyHospitalDto);
	}

	
	// authkey DB�� �ֱ�
	@Override
	public void updateAuthKey(DocInfoDTO docInfoDto) {
		dao.update("doctor.updateAuthKey", docInfoDto);
	}


	@Override // ����Ű�� ��ġ�ϴ��� Ȯ��
	public List authKeyOK(DocInfoDTO docInfoDto) throws Exception {
		System.out.println("authKeyOK Ȯ��------");
		return dao.selectList("doctor.authKeyOk", docInfoDto);
	}


	@Override // pic_no�� �ִ밪 ����
	public int maxNo() throws Exception {
		return dao.selectOne("doctor.maxNo");
	}
	
	@Override	// ���� ������,��ȣ ���� �ϱ�
	public int insertFile(DocPictureDTO docPictureDto) throws Exception {
		return dao.insert("doctor.insertFile", docPictureDto);
	}
	
	@Override	// ���� �纻, Ÿ�� ������Ʈ
	public void fileUpdate(DocPictureDTO docPictureDto) throws Exception {
		System.out.println("������Ʈ�� ����Ƴ�???");
		dao.update("doctor.fileUpdate", docPictureDto);
	}

	@Override	// �α��� üũ , ���� �ߺ� üũ
	public int userCheck(DocInfoDTO docInfoDto)throws Exception {
		return dao.selectOne("doctor.userCheck", docInfoDto);
	}

	
	@Override	// ���������� file �������� ��� �������� 1�� �����ϱ�.
	public void updateAuthState(DocInfoDTO docInfoDto) throws Exception {
		System.out.println("impl ���º���.");
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
	
	@Override	// doc_pictuer�� ���Ǽ��ִ��� Ȯ��
	public String selectAgree(DocPictureDTO docPictureDto) throws Exception {
		return dao.selectOne("doctor.selectAgree",docPictureDto);
	}
	
	@Override	// doc_pictuer�� ���Ǽ��ִ��� Ȯ��
	public void updateAgree(DocInfoDTO docInfoDto) throws Exception {
		dao.update("doctor.updateAgree",docInfoDto);
	}
	

	@Override	// �ǻ����� ������ Doc_info
	public DocInfoDTO getDoctor(String doc_mail) throws Exception {
		return dao.selectOne("doctor.getDoctor", doc_mail);
	}

	@Override	// doc_info ���� ����
	public int updateModify(DocInfoDTO docInfoDto) throws Exception {
		return dao.update("doctor.updateModify" , docInfoDto);
	}
	
	@Override	// doc_info��  ��� ����
	public void changePw(DocInfoDTO docInfoDto) throws Exception {
		dao.update("doctor.changePw", docInfoDto);
	}

	@Override	// doc_pictuer ���� ����
	public int updatePicture(DocPictureDTO docPictureDto) throws Exception {
		return dao.update("doctor.updatePicture");
	}

	@Override	// doc_hospital����������
	public DocMyHospitalDTO getHospital(String doc_mail) throws Exception {
		return dao.selectOne("doctor.getHospital", doc_mail);
	}
	
	@Override	// hospital DB ���� ������
	public HospitalDTO getHospitalDB(int no) throws Exception {
		return dao.selectOne("doctor.getHospitalDB", no);
	}

	@Override	// Myhospital ( �����߰�����) �Է��ϱ�.
	public void hospitalUpdate(DocMyHospitalDTO docMyHospitalDto) throws Exception {
		dao.update("doctor.hospitalUpdate", docMyHospitalDto);
	}

	@Override	// doc_info �� doc_state�� -1 �� ����.
	public int deleteDoctor(DocInfoDTO docInfoDto) throws Exception {
		return dao.update("doctor.deleteDoctor", docInfoDto);
	}

	@Override
	public int stateChange(DocInfoDTO docInfoDto) throws Exception {
		return dao.update("doctor.stateChange", docInfoDto);
	}

	

	

	

	



	




	
	
}

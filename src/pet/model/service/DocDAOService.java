package pet.model.service;

import java.util.List;
import java.util.Map;

import pet.model.dto.DocInfoDTO;
import pet.model.dto.DocMyHospitalDTO;
import pet.model.dto.DocPictureDTO;
import pet.model.dto.HospitalDTO;

public interface DocDAOService {
	// ��ü���̺� ���ڵ� �˻�/java.util.List����
	public List selectAll() throws Exception;	
	
	// Doc_info ���̺� doc_no / doc_mail / doc_pw ����.
	public void insertDoc(DocInfoDTO docInfoDto)throws Exception;

	// doc_myhospital ���� ����
	public void insertHospital(DocMyHospitalDTO docMyHospitalDto) throws Exception;
	
	// ����Ű ���� - map �Ⱦ���
	public void updateAuthKey(DocInfoDTO docInfoDto) throws Exception;
	
	// ����, ����Ű�� DB�� ��ġ�ϴ��� Ȯ�� - map �Ⱦ���
	public  List authKeyOK(DocInfoDTO docInfoDto) throws Exception;
	
	// pic_no�� �ִ밪 ����.
	public int maxNo() throws Exception;
	
	// �α��� üũ
	public int userCheck(DocInfoDTO docInfoDto)throws Exception;

	// �������� insert
	public int insertFile(DocPictureDTO docPictureDto) throws Exception;
	// �������� ����
	public void fileUpdate(DocPictureDTO docPictureDto) throws Exception;

	// �������� ���� ����
	public void updateAuthState(DocInfoDTO docInfoDto) throws Exception;
	
	
	
	// doc_picture���� file_type Ȯ��.	
	// license �ִ� ���� Ȯ���ϱ� 
	public String selectLicense(DocPictureDTO docPictureDto)throws Exception;
	
	// registration �ִ� ���� Ȯ���ϱ� 
	public String selectRegistration(DocPictureDTO docPictureDto)throws Exception;
	
	// ���Ǽ��� doc_pictuer�� �ִ��� Ȯ��
	public String selectAgree(DocPictureDTO docPictureDto) throws Exception;
	
	// ���Ǽ��� doc_pictuer�� ������ 1�� ����
	public void updateAgree(DocInfoDTO docInfoDto) throws Exception;

	
	
	// doc_info���� ������
	public DocInfoDTO getDoctor(String doc_mail) throws Exception;
	
	// doc_info ���� ����.
	public int updateModify(DocInfoDTO docInfoDto) throws Exception;

	// doc_info ��� ����
	public void changePw(DocInfoDTO docInfoDto) throws Exception;
	
	// doc_picture ��������
	public int updatePicture(DocPictureDTO docPictureDto) throws Exception;
	
	// doc_myhospital ���� ������
	public DocMyHospitalDTO getHospital(String doc_mail) throws Exception;
	
	// hospital DB���� ������ ( �̸�, ��ȣ)  no�� �˻� �ؾ���.
	public HospitalDTO getHospitalDB(int no) throws Exception;

	// doc_myhospital���� ����.
	public void hospitalUpdate(DocMyHospitalDTO docMyHospitalDto) throws Exception;

	// Ż�� (doc_info �� doc_state�� -1 �� ����.)
	public int deleteDoctor(DocInfoDTO docInfoDto) throws Exception;

	

	// stateChange �� doc_mail��  authstate�� 1�̸� doc_state�� 1�� ����
	public int stateChange(DocInfoDTO docInfoDto) throws Exception;

	

	

	

	
	
}

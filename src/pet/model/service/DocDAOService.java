package pet.model.service;

import java.util.List;
import java.util.Map;

import pet.model.dto.DocInfoDTO;
import pet.model.dto.DocMyHospitalDTO;
import pet.model.dto.DocPictureDTO;
import pet.model.dto.HospitalDTO;

public interface DocDAOService {
	// 전체테이블 레코드 검색/java.util.List리턴
	public List selectAll() throws Exception;	
	
	// Doc_info 테이블에 doc_no / doc_mail / doc_pw 전송.
	public void insertDoc(DocInfoDTO docInfoDto)throws Exception;

	// doc_myhospital 에도 저장
	public void insertHospital(DocMyHospitalDTO docMyHospitalDto) throws Exception;
	
	// 인증키 삽입 - map 안쓰고
	public void updateAuthKey(DocInfoDTO docInfoDto) throws Exception;
	
	// 메일, 인증키가 DB와 일치하는지 확인 - map 안쓰고
	public  List authKeyOK(DocInfoDTO docInfoDto) throws Exception;
	
	// pic_no의 최대값 리턴.
	public int maxNo() throws Exception;
	
	// 로그인 체크
	public int userCheck(DocInfoDTO docInfoDto)throws Exception;

	// 사진파일 insert
	public int insertFile(DocPictureDTO docPictureDto) throws Exception;
	// 사진파일 저장
	public void fileUpdate(DocPictureDTO docPictureDto) throws Exception;

	// 메일인증 상태 변경
	public void updateAuthState(DocInfoDTO docInfoDto) throws Exception;
	
	
	
	// doc_picture에서 file_type 확인.	
	// license 있는 메일 확인하기 
	public String selectLicense(DocPictureDTO docPictureDto)throws Exception;
	
	// registration 있는 메일 확인하기 
	public String selectRegistration(DocPictureDTO docPictureDto)throws Exception;
	
	// 동의서가 doc_pictuer에 있는지 확인
	public String selectAgree(DocPictureDTO docPictureDto) throws Exception;
	
	// 동의서가 doc_pictuer에 있으면 1로 변경
	public void updateAgree(DocInfoDTO docInfoDto) throws Exception;

	
	
	// doc_info정보 꺼내기
	public DocInfoDTO getDoctor(String doc_mail) throws Exception;
	
	// doc_info 정보 수정.
	public int updateModify(DocInfoDTO docInfoDto) throws Exception;

	// doc_info 비번 수정
	public void changePw(DocInfoDTO docInfoDto) throws Exception;
	
	// doc_picture 정보수정
	public int updatePicture(DocPictureDTO docPictureDto) throws Exception;
	
	// doc_myhospital 정보 꺼내기
	public DocMyHospitalDTO getHospital(String doc_mail) throws Exception;
	
	// hospital DB정보 꺼내기 ( 이름, 번호)  no로 검색 해야함.
	public HospitalDTO getHospitalDB(int no) throws Exception;

	// doc_myhospital정보 수정.
	public void hospitalUpdate(DocMyHospitalDTO docMyHospitalDto) throws Exception;

	// 탈퇴 (doc_info 의 doc_state를 -1 로 변경.)
	public int deleteDoctor(DocInfoDTO docInfoDto) throws Exception;

	

	// stateChange 로 doc_mail의  authstate가 1이면 doc_state를 1로 변경
	public int stateChange(DocInfoDTO docInfoDto) throws Exception;

	
	// 내가 쓴글 총갯수.
	public int getArticleCount(NoticefreedomDTO freeDto) throws Exception;
	
	// 내가 쓴 글목록들 
	public List getArticles(int startRow, int endRow, String email) throws Exception;
	

	
	
}

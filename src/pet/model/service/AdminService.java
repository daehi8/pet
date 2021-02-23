package pet.model.service;

import java.util.List;

import pet.model.dto.DocInfoDTO;
import pet.model.dto.DocMyHospitalDTO;
import pet.model.dto.DocPictureDTO;
import pet.model.dto.HospitalDTO;

public interface AdminService {
	
	// 모든 회원 확인
	public List selectMemberAll(int start, int end, String searchType) throws Exception;

	// 회원 수 확인
	public int getCountMemberAll(String searchType)throws Exception;
	
	// 모든 의사 회원 확인
	public List selectDocAll(int start, int end, String searchType) throws Exception;
	
	// 모든 의사 회원 수 확인
	public int getCountDocAll(String searchType) throws Exception;
	
	// 의사 정보 확인
	public DocInfoDTO getDocInfo(int no) throws Exception;
	
	// 의사 사진 정보 확인
	public List getDocPicture(String doc_mail) throws Exception;
	
	// 의사 인증 승인
	public void okDocAuthCheck(String doc_mail) throws Exception;
	
	// 의사 인증 미승인
	public void noDocAuthCheck(String doc_mail) throws Exception;
	
	// 진료태그 추가
	public void insertPriceTag(String subject) throws Exception;
	
	// 진료태그 모두 확인
	public List selectSubjectAll() throws Exception;
	
	// 진료태그 삭제
	public void delSubject(String subject) throws Exception;
	
	// 회원 탈퇴
	public void delMember(int no) throws Exception;
	
	// 미승인 리뷰 확인
	public List selectAuthNoReviewList() throws Exception;
	
	// 미승인 의사 확인
	public List selectAuthNoDocList() throws Exception;
	
	// hospital DB에서  중복이름 갯수세기
		public int getNameCount() throws Exception;
		
	// hospital DB에서  이름이 있는지 검색.
	public List nameList(HospitalDTO hospitalDto) throws Exception;

	// Myhospital에 메일에 맞는 병원 번호 저장.
	public void updateHospital(DocMyHospitalDTO docMyHospitalDto)  throws Exception;
		
	// doc_info에 병원 번호 저장.
	public void updateDoc_info(DocInfoDTO docInfoDto) throws Exception;
	
}

package pet.model.service;

import java.util.List;

import pet.model.dto.DocInfoDTO;
import pet.model.dto.DocPictureDTO;

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
	public void okAuthCheck(String doc_mail) throws Exception;
	
	// 의사 인증 미승인
	public void noAuthCheck(String doc_mail) throws Exception;
}

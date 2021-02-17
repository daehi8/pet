package pet.model.service;

import java.util.List;

import pet.model.dto.DocInfoDTO;
import pet.model.dto.DocMyHospitalDTO;
import pet.model.dto.DocPictureDTO;
import pet.model.dto.HospitalDTO;

public interface HospitalDAOService {
	
	// 사진 갯수 세기.
	public int getPictureCount() throws Exception;
	
	//doc_picture 에서 가입 시 제출한 사진 꺼내기
	public List getDoc_picture(DocPictureDTO docPictureDto) throws Exception;

	// doc_info에서 의사리스트 추출.
	public List selectAll() throws Exception;
	
	// hospital DB에서  중복이름 갯수세기
	public int getNameCount() throws Exception;
	
	// hospital DB에서  이름이 있는지 검색.
	public List nameList(HospitalDTO hospitalDto) throws Exception;

	// Myhospital에 메일에 맞는 병원 번호 저장.
	public void updateHospital(DocMyHospitalDTO docMyHospitalDto)  throws Exception;
	
	// doc_info에 병원 번호 저장.
	public void updateDoc_info(DocInfoDTO docInfoDto) throws Exception;

	
	
}

package pet.model.service;

import java.util.List;

import pet.model.dto.UploadReviewDTO;

public interface UploadReviewService {
	
	// 파일 업로드1
	public int insertFile(UploadReviewDTO uploadReviewDTO)throws Exception;
	
	// 고유번호에 맞는 파일정보 찾기
	public UploadReviewDTO selectFile(int no)throws Exception;
	
	// 파일 업로드2
	public void fileUpdate(UploadReviewDTO uploadReviewDTO)throws Exception;
	
	// 삭제
	public void deleteFile(int no)throws Exception;
	
	// 리뷰번호에 맞는 인증파일  찾기
	public UploadReviewDTO getAuthByReviewNo(int review_no)throws Exception;

	// 리뷰 번호에 맞는 병원사진파일 찾기
	public List getHospitalByReviewNo(int review_no)throws Exception;
	
	// 리뷰 번호에 맞는 치료사진파일 찾기
	public List getCureByReviewNo(int review_no)throws Exception;
}

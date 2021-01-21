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
	
	// 리뷰에 맞는 파일번호 찾기
	public List selectFileNo(int review_no)throws Exception;
}

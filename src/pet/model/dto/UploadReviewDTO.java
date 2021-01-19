package pet.model.dto;

// 리뷰 파일 업로드
public class UploadReviewDTO {
	// 업로드 파일 고유번호
	private int no;
	// 리뷰고유번호
	private int review_no;
	// 파일 구분
	// 인증파일 = auth 
	// 병원사진 = hospital 
	// 치료사진 = cure
	private String file_type;
	// 파일 원본 이름
	private String org_name;
	// 저장된 파일 이름
	private String save_name;
	// 파일 용량
	private String size;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getFile_type() {
		return file_type;
	}
	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}
	public String getOrg_name() {
		return org_name;
	}
	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}
	public String getSave_name() {
		return save_name;
	}
	public void setSave_name(String save_name) {
		this.save_name = save_name;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	
	
}

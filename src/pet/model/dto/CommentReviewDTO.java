package pet.model.dto;

// 리뷰 코멘트
public class CommentReviewDTO {
	// 고유번호
	private int no;
	// 리뷰 고유번호
	private int review_no;
	// 의사 리뷰
	private String docter_review;
	// 병원 리뷰
	private String hospital_review;
	// 한줄 요약
	private String summaary;
	
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
	public String getDocter_review() {
		return docter_review;
	}
	public void setDocter_review(String docter_review) {
		this.docter_review = docter_review;
	}
	public String getHospital_review() {
		return hospital_review;
	}
	public void setHospital_review(String hospital_review) {
		this.hospital_review = hospital_review;
	}
	public String getSummaary() {
		return summaary;
	}
	public void setSummaary(String summaary) {
		this.summaary = summaary;
	}
	
	
}

package pet.model.dto;

// 리뷰 가격정보
public class PriceReviewDTO {
	// 고유번호
	private int no;
	// 리뷰 고유번호
	private int review_no;		
	// 진료과목
	private String medical_subject;
	// 진료비
	private String price;
	// 세부사항
	private String detail;
	
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
	public String getMedical_subject() {
		return medical_subject;
	}
	public void setMedical_subject(String medical_subject) {
		this.medical_subject = medical_subject;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	
}

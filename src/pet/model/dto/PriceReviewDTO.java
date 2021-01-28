package pet.model.dto;

// 리뷰 가격정보
public class PriceReviewDTO {
	// 고유번호
	private int no;
	// 리뷰 고유번호
	private int review_no;		
	// 진료과목
	private String subject_info;
	// 진료비
	private String price_info;
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
	public String getSubject_info() {
		return subject_info;
	}
	public void setSubject_info(String subject_info) {
		this.subject_info = subject_info;
	}
	public String getPrice_info() {
		return price_info;
	}
	public void setPrice_info(String price_info) {
		this.price_info = price_info;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	
}

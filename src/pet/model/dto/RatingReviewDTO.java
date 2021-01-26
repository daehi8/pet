package pet.model.dto;

// 리뷰 평점
public class RatingReviewDTO {
	// 고유 번호
	private int no;
	// 리뷰 고유번호
	private int review_no;
	// 친절함
	private String kind;
	// 대기시간
	private String waiting;
	// 청결함
	private String clean;
	// 자세한 설명여부
	private String detail;
	// 가격
	private String price;
	// 치료후 결과
	private String after;
	// 평균
	private float mean;
	
	public float getMean() {
		return mean;
	}
	public void setMean(float mean) {
		this.mean = mean;
	}
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
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getWaiting() {
		return waiting;
	}
	public void setWaiting(String waiting) {
		this.waiting = waiting;
	}
	public String getClean() {
		return clean;
	}
	public void setClean(String clean) {
		this.clean = clean;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getAfter() {
		return after;
	}
	public void setAfter(String after) {
		this.after = after;
	}
	
}

package pet.model.dto;

// 리뷰 평점
public class RatingReviewDTO {
	// 고유 번호
	private int no;
	// 리뷰 고유번호
	private int review_no;
	// 친절함
	private int kind;
	// 대기시간
	private int waiting;
	// 청결함
	private int clean;
	// 자세한 설명여부
	private int detail;
	// 가격
	private int price;
	// 치료후 결과
	private int after;
	// 총 평균
	private int mean;
	
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
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public int getWaiting() {
		return waiting;
	}
	public void setWaiting(int waiting) {
		this.waiting = waiting;
	}
	public int getClean() {
		return clean;
	}
	public void setClean(int clean) {
		this.clean = clean;
	}
	public int getDetail() {
		return detail;
	}
	public void setDetail(int detail) {
		this.detail = detail;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAfter() {
		return after;
	}
	public void setAfter(int after) {
		this.after = after;
	}
	public int getMean() {
		return mean;
	}
	public void setMean(int mean) {
		this.mean = mean;
	}
	
	
}

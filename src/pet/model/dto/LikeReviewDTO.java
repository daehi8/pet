package pet.model.dto;

import java.sql.Timestamp;

public class LikeReviewDTO {
	//고유번호
	private int no;
	//리뷰 고유번호
	private int review_no;
	//좋아요 누른 사용자 이메일
	private String member_email;
	//좋아요 누른 글의 사용자 이메일
	private String target_email;
	//좋아요 누른 시간
	private Timestamp reg_date;
	
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
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getTarget_email() {
		return target_email;
	}
	public void setTarget_email(String target_email) {
		this.target_email = target_email;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	
}

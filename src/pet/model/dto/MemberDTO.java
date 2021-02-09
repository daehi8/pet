package pet.model.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class MemberDTO {

	private int no;
	private String email;
	private String pw;
	private String name; // 나중에 입력
	private long phone; // 나중에 입력
	private String pen_name; // 랜덤
	private String org_profile; // 랜덤
	private String save_profile; // 랜덤
	private String size_profile; // 랜덤
	private long point; // 디폴트값 0 설정
	private int marketing; // 마케팅 정보 동의 Y/N
	private Date reg_date; // 가입시간
	private Date log_date; // 마지막 로그인 시간
	private String approval_status; // 인증 상태 
	private String approval_key; //인증 키
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getPen_name() {
		return pen_name;
	}
	public void setPen_name(String pen_name) {
		this.pen_name = pen_name;
	}
	public String getOrg_profile() {
		return org_profile;
	}
	public void setOrg_profile(String org_profile) {
		this.org_profile = org_profile;
	}
	public String getSave_profile() {
		return save_profile;
	}
	public void setSave_profile(String save_profile) {
		this.save_profile = save_profile;
	}
	public String getSize_profile() {
		return size_profile;
	}
	public void setSize_profile(String size_profile) {
		this.size_profile = size_profile;
	}
	public long getPoint() {
		return point;
	}
	public void setPoint(long point) {
		this.point = point;
	}
	public int getMarketing() {
		return marketing;
	}
	public void setMarketing(int marketing) {
		this.marketing = marketing;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getLog_date() {
		return log_date;
	}
	public void setLog_date(Date log_date) {
		this.log_date = log_date;
	}
	public String getApproval_status() {
		return approval_status;
	}
	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}
	public String getApproval_key() {
		return approval_key;
	}
	public void setApproval_key(String approval_key) {
		this.approval_key = approval_key;
	}
	

	
	
}

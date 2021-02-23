package pet.model.dto;

import java.sql.Timestamp;

public class TestReviewDTO {
	private int no;
	
	private String member_email;
	
	private String hospital_name;
	
	private String doc_name;
	
	private String revisit;
	
	private String public_check;
	
	private String auth_check;
	
	private Timestamp reg_date;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getHospital_name() {
		return hospital_name;
	}

	public void setHospital_name(String hospital_name) {
		this.hospital_name = hospital_name;
	}

	public String getDoc_name() {
		return doc_name;
	}

	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}

	public String getRevisit() {
		return revisit;
	}

	public void setRevisit(String revisit) {
		this.revisit = revisit;
	}

	public String getPublic_check() {
		return public_check;
	}

	public void setPublic_check(String public_check) {
		this.public_check = public_check;
	}

	public String getAuth_check() {
		return auth_check;
	}

	public void setAuth_check(String auth_check) {
		this.auth_check = auth_check;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
}

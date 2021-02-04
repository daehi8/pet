package pet.model.dto;

import java.sql.Timestamp;

public class DocInfoDTO {
	private int doc_no;
	private String doc_mail;
	private String doc_pw;
	private String doc_name;
	private int doc_state;
	private String authKey;
	private int authstate;
	private int mem_type;
	private Timestamp reg_date;
	
	public int getDoc_no() {
		return doc_no;
	}
	public void setDoc_no(int doc_no) {
		this.doc_no = doc_no;
	}
	
	public String getDoc_mail() {
		return doc_mail;
	}
	public void setDoc_mail(String doc_mail) {
		this.doc_mail = doc_mail;
	}
	
	public String getDoc_pw() {
		return doc_pw;
	}
	
	public void setDoc_pw (String doc_pw) {
		this.doc_pw = doc_pw;
	}
	
	public String getDoc_name() {
		return doc_name;
	}
	
	public void setDoc_name (String doc_name) {
		this.doc_name = doc_name;
	}
	
	public int getDoc_state() {
		return doc_state;
	}
	public void setDoc_state(int doc_state) {
		this.doc_state = doc_state;
	}
	
	public String getAuthKey() {
		return authKey;
	}
	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}
	
	public int getAuthstate() {
		return authstate;
	}
	public void setAuthstate(int authstate) {
		this.authstate = authstate;
	}
	
	public int getMem_type() {
		return mem_type;
	}
	public void setMem_type(int mem_type) {
		this.mem_type = mem_type;
	}
	
	public Timestamp getReg_date(){
 		return reg_date; 
 	}
	
	public void setReg_date (Timestamp reg_date){
		this.reg_date = reg_date;
	}
}

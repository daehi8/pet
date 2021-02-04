package pet.model.dto;

public class DocPictureDTO {
	
	private int pic_no;
	private String doc_mail;
	private String file_type;
	private String org_pic;
	private String save_pic;

	public int getPic_no() {
		return pic_no;
	}
	public void setPic_no(int pic_no) {
		this.pic_no = pic_no;
	}
	
	public String getDoc_mail() {
		return doc_mail;
	}
	public void setDoc_mail(String doc_mail) {
		this.doc_mail = doc_mail;
	}
	
	public String getFile_type() {
		return file_type;
	}
	public void setFile_type (String file_type) {
		this.file_type = file_type;
	}
	
	public String getOrg_pic() {
		return org_pic;
	}
	public void setOrg_pic (String org_pic) {
		this.org_pic = org_pic;
	}
	public String getSave_pic() {
		return save_pic;
	}
	public void setSave_pic (String save_pic) {
		this.save_pic = save_pic;
	}
	
	
}

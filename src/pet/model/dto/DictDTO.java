package pet.model.dto;

public class DictDTO {
	
	public int dict_no;
	public int animal_no;
	public String animal_name;
    public String animal_feed;
	public String animal_reason;
	
	public int getDict_no() {
		return dict_no;
	}
	public void setDict_no(int dict_no) {
		this.dict_no = dict_no;
	}
	
	public int getAnimal_no() {
		return animal_no;
	}
	public void setAnimal_no(int animal_no) {
		this.animal_no = animal_no;
	}
	public String getAnimal_name() {
		return animal_name;
	}
	public void setAnimal_name(String animal_name) {
		this.animal_name = animal_name;
	}
	public String getAnimal_feed() {
		return animal_feed;
	}
	public void setAnimal_feed(String animal_feed) {
		this.animal_feed = animal_feed;
	}
	public String getAnimal_reason() {
		return animal_reason;
	}
	public void setAnimal_reason(String animal_reason) {
		this.animal_reason = animal_reason;
	}

}

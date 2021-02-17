package pet.model.dto;

public class HospitalDTO {
	private int no;
	private String state;
	private String location_adr;
	private String road_adr;
	private String zip_code;
	private String name;
	private double coordinate_x;
	private double coordinate_y;
	private String subject_info;
	private PriceReviewDTO PriceReviewDTO;
	
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
	private String price_info;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getLocation_adr() {
		return location_adr;
	}
	public void setLocation_adr(String location_adr) {
		this.location_adr = location_adr;
	}
	public String getRoad_adr() {
		return road_adr;
	}
	public void setRoad_adr(String road_adr) {
		this.road_adr = road_adr;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getCoordinate_x() {
		return coordinate_x;
	}
	public void setCoordinate_x(double coordinate_x) {
		this.coordinate_x = coordinate_x;
	}
	public double getCoordinate_y() {
		return coordinate_y;
	}
	public void setCoordinate_y(double coordinate_y) {
		this.coordinate_y = coordinate_y;
	}
	
	
}

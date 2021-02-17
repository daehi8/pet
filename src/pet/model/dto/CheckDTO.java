package pet.model.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class CheckDTO {
	
	private int no;
	private int check_no;
	private int quest_no;
	private String quest_title;
	private String quest_ans1;
	private String quest_ans2;
	private String quest_ans3;
	private String quest_ans4;
	private String quest_ans5;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCheck_no() {
		return check_no;
	}
	public void setCheck_no(int check_no) {
		this.check_no = check_no;
	}
	public int getQuest_no() {
		return quest_no;
	}
	public void setQuest_no(int quest_no) {
		this.quest_no = quest_no;
	}
	public String getQuest_title() {
		return quest_title;
	}
	public void setQuest_title(String quest_title) {
		this.quest_title = quest_title;
	}
	public String getQuest_ans1() {
		return quest_ans1;
	}
	public void setQuest_ans1(String quest_ans1) {
		this.quest_ans1 = quest_ans1;
	}
	public String getQuest_ans2() {
		return quest_ans2;
	}
	public void setQuest_ans2(String quest_ans2) {
		this.quest_ans2 = quest_ans2;
	}
	public String getQuest_ans3() {
		return quest_ans3;
	}
	public void setQuest_ans3(String quest_ans3) {
		this.quest_ans3 = quest_ans3;
	}
	public String getQuest_ans4() {
		return quest_ans4;
	}
	public void setQuest_ans4(String quest_ans4) {
		this.quest_ans4 = quest_ans4;
	}
	public String getQuest_ans5() {
		return quest_ans5;
	}
	public void setQuest_ans5(String quest_ans5) {
		this.quest_ans5 = quest_ans5;
	}
	
}
package pet.model.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


public class TestBean {

	@RequestMapping("test.do")
	public String test()throws Exception{
		return "test";
	}
	

}

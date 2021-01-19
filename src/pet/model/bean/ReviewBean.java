package pet.model.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/review/")
public class ReviewBean {
	
	@RequestMapping("insertreview.do")
	public String insertReview() throws Exception {
		return "review/insertReview";
	}
	
	@RequestMapping("insertreviewpro.do")
	public String insertReviewPro() throws Exception {
		return "review/insertReviewPro";
	}
}

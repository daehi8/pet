package pet.model.bean;

import java.io.File;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pet.model.dto.CommentReviewDTO;
import pet.model.dto.DocInfoDTO;
import pet.model.dto.DocMyHospitalDTO;
import pet.model.dto.HospitalDTO;
import pet.model.dto.MemberDTO;
import pet.model.dto.PriceReviewDTO;
import pet.model.dto.RatingReviewDTO;
import pet.model.dto.ReviewDTO;
import pet.model.service.MemberServiceImpl;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	 // 회원 가입 폼 이동
	 @RequestMapping(value = "/register.do") 
	 public String memberJoinForm() throws Exception{ 
		 return "/member/register"; 
	}
	 
	
	// 이메일 중복 검사 (AJAX)
	 @ResponseBody
	@RequestMapping(value = "/check_email.do")
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception{
		service.check_email(email, response);
	}
	 
	// 닉네임 중복 검사
	@RequestMapping(value = "/create_penName.do")
	public void create_penName() throws Exception{
		service.create_penName();
	}
	
	
	
	// 회원가입
	@RequestMapping(value = "/join_member.do")
	public String join_member( MemberDTO register , Model model) throws Exception{
		int result= service.join_member(register);
		model.addAttribute("result",result);
		return "member/registerPro";  
	}
	// 회원 인증
	@RequestMapping(value = "/approval_member.do")
	public String approval_member(MemberDTO register, HttpServletResponse response) throws Exception{
		service.approval_member(register, response);
		return "member/login";
	}
	
	@RequestMapping("/main.do")
	public String main(MemberDTO register, Model model)throws Exception {
		model.addAttribute("member", service.select(register));
		return "member/main";
	}
	
	// 로그인 폼 이동
	@RequestMapping(value = "/login.do")
	public String login() throws Exception{
		return "member/login";
	}
		
	// 로그인
	@RequestMapping(value = "/login_member.do")
	public String login_member(MemberDTO register, HttpSession session, HttpServletResponse response) throws Exception{
		register = service.login_member(register, response);
		session.setAttribute("member", register);
		return "member/loginPro";
	}
	
	//--------------로그인 후 사용가능
	
	// 로그아웃
	@RequestMapping(value = "/logout.do")
	public void logout(HttpSession session, HttpServletResponse response) throws Exception{
		session.invalidate();
		//session.removeAttribute("member");
		service.logout(response);
	}
	
	// 마이페이지로 이동
	@RequestMapping(value = "/mypage.do")
	public String mypage(MemberDTO register, Model model) throws Exception{
		model.addAttribute("member", service.select(register));
		return "member/mypage";
	}

	
	// 나의 활동 페이지로 이동
	@RequestMapping(value = "/about_me.do")
	public String about_me(HttpSession session, Model model) throws Exception{
		MemberDTO dto = (MemberDTO)session.getAttribute("member");
		model.addAttribute("member", service.select(dto));
		return "member/about_me";
	}
	
	// 계정 설정 페이지로 이동
	@RequestMapping(value = "/member_info.do")
	public String member_info(Model model, HttpSession session) throws Exception{
		MemberDTO dto = (MemberDTO)session.getAttribute("member");
		model.addAttribute("member", service.select(dto));
		return "member/member_info";
	}
	
	// 랜덤닉네임 부여
	@RequestMapping(value= "/create_randomName")
	public String create_randomName() throws Exception{
		return "member/create_randomName";
	}
	
	// member_info로 이동
	@RequestMapping(value= "/update_profile.do")
	public String update_profile(MultipartHttpServletRequest request , MemberDTO register) throws Exception{
		
		MultipartFile mf = request.getFile("img");
		String save = request.getRealPath("save");
		String img = mf.getOriginalFilename();
		if(img != null && !(img.equals(""))) {
			register.setOrg_profile(img);
			File f = new File(save+"//"+img);
			mf.transferTo(f);
		}
		
		 service.update_profile(register);
		return "member/member_infoPro";
	}
	
	// 비밀번호 업데이트 수정
	@RequestMapping(value = "/update_pw.do")
	public String update_pw(MemberDTO register, @RequestParam("old_pw") String old_pw, HttpSession session, HttpServletResponse response) throws Exception{
		session.setAttribute("member", service.update_pw(register, old_pw, response));
		return "member/login";
	}
	
	@RequestMapping(value = "/find_pw_form.do")
	public String find_pw_form() throws Exception{
		return "/member/find_pw_form";
	}
	
	@RequestMapping(value = "/find_pw.do")
	public void find_pw(MemberDTO register, HttpServletResponse response) throws Exception{
		service.find_pw(response, register);
	}
	
	@RequestMapping(value = "/deleteForm.do")
	public String deleteForm() throws Exception {
		
		return "/member/deleteForm";
	}
	
	@RequestMapping(value = "/deletePro.do")
	public String deletePro(MemberDTO register, HttpSession session, Model model) throws Exception{
		
		int check = service.deleteMember(register);
		if(check == 1) {
			session.invalidate();
		}
		model.addAttribute("check", check);
		System.out.println(check);
		return "main/sc";
	}
	
	@RequestMapping(value = "/marketing.do")
	public String marketing(ServletResponse response) throws Exception{
		PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript' charset='UTF-8'>");
			out.println("alert('마케팅 정보가 변경되었습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		return "/member/marketing";
	}
	
	//-----------마이페이지 -----------
	@RequestMapping(value = "/my_reviews.do")
	public String my_reviews(Model model , HttpSession session) throws Exception{
		MemberDTO dto= (MemberDTO)session.getAttribute("member");
		
		int count = service.countReview(dto.getEmail());
		int count_like = service.countReview_like(dto.getEmail());
		String email = dto.getEmail();
		
		model.addAttribute("email",email);
		model.addAttribute("count",count);
		model.addAttribute("count_like", count_like);
		return "/mypage/my_reviews";
	}
	
	@RequestMapping(value = "/reviews_list.do")
	public String reviews_list(Model model, String email ) throws Exception{
		List<ReviewDTO> list = service.reviewList(email);
		model.addAttribute("list", list);

		return "/mypage/reviews_list";
	}
	@RequestMapping(value="/countReview.do")
	public String countReview(Model model) throws Exception{
		return "/mypage/countReview";
	}
	
	@RequestMapping(value="/checkCert.do")
	public String checkCert(MemberDTO register) throws Exception{
		service.checkCert(register);
		return "/member/member_infoPro";
	}
	
	@RequestMapping(value="/openReviews.do")
	public String openReviews(Model model , HttpSession session, int no, String email) throws Exception{
		MemberDTO dto= (MemberDTO)session.getAttribute("member");
		List<ReviewDTO> list = service.reviewList(email);
		List<PriceReviewDTO> price = service.select_subject(no);	
		List<CommentReviewDTO> comment = service.select_comment(no);
		List<RatingReviewDTO> ratings = service.select_rating(no);		
		
		RatingReviewDTO rating = ratings.get(0);
		
		System.out.println(price.size());
		System.out.println(comment.size());
		model.addAttribute("list", list);
		model.addAttribute("price", price);
		model.addAttribute("comment", comment);
		model.addAttribute("rating", rating);
		return "/member/openReviews";
	}


	
	
}
	




















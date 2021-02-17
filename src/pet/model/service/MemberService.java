package pet.model.service;

import java.util.List;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import pet.model.dto.CommentReviewDTO;
import pet.model.dto.DocInfoDTO;
import pet.model.dto.DocMyHospitalDTO;
import pet.model.dto.MemberDTO;
import pet.model.dto.PriceReviewDTO;
import pet.model.dto.RatingReviewDTO;
import pet.model.dto.ReviewDTO;

public interface MemberService {
	public void check_email(String email, HttpServletResponse response) throws Exception;
	public int join_member(MemberDTO register)throws Exception;
	public String create_penName() throws Exception;
	
	public String create_key() throws Exception;
	void send_mail(MemberDTO register) throws Exception;
	public int approval_member(MemberDTO register, ServletResponse response) throws Exception;
	
	public MemberDTO login_member(MemberDTO register, HttpServletResponse response) throws Exception;
	public void logout(HttpServletResponse response) throws Exception;
	public void update_profile(MemberDTO register) throws Exception;
	public MemberDTO update_pw(MemberDTO register, String old_pw, HttpServletResponse response) throws Exception;
	
	// 메인 페이지 select
	public Object select(MemberDTO register) throws Exception;
	
	public void send_mail(MemberDTO register, String div) throws Exception;
	public void find_pw(HttpServletResponse response, MemberDTO register) throws Exception;
	
	/* public int userCheck(MemberDTO register) throws Exception; */
	public int deleteMember(MemberDTO register) throws Exception;
	
	// -----마이페이지 ------
	public List<ReviewDTO> reviewList(String email) throws Exception;
	public int countReview(String email) throws Exception;
	public int countReview_like(String email) throws Exception;
	public int checkCert (MemberDTO register) throws Exception;
	public List<PriceReviewDTO> select_subject(int no) throws Exception;
	public List<CommentReviewDTO> select_comment(int no) throws Exception;
	public List<RatingReviewDTO> select_rating(int no) throws Exception;
}

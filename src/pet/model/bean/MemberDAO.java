package pet.model.bean;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import pet.model.dto.CommentReviewDTO;
import pet.model.dto.DocInfoDTO;
import pet.model.dto.DocMyHospitalDTO;
import pet.model.dto.MemberDTO;
import pet.model.dto.PriceReviewDTO;
import pet.model.dto.RatingReviewDTO;
import pet.model.dto.ReviewDTO;
import pet.model.dto.MemberDTO;

// @Repository 사용되면 DAO 역할을 의미한다.   @Controller / @Service
@Repository
public class MemberDAO {

	@Autowired
	SqlSession sqlsession = null;
	

	// 이메일 중복 검사
	public int check_email(String email) throws Exception{
		return sqlsession.selectOne("member.check_email", email);
	}
	
	// 닉네임 중복 검사
	public int create_penName(String pen_name) throws Exception{
		return sqlsession.selectOne("member.create_penName", pen_name);
	}
	
	
	// 회원가입
	@Transactional
	public int join_member(MemberDTO register) throws Exception{
		return sqlsession.insert("member.join_member", register);
	}
	// 이메일 인증
	@Transactional
	public int approval_member(MemberDTO register) throws Exception{
		return sqlsession.update("member.approval_member", register);
	}
	
	// 로그인 검사
	public MemberDTO login_member(String email) throws Exception{
		return sqlsession.selectOne("member.login_member", email);
	}
	
	// 로그인 접속일자 변경
	@Transactional
	public int update_log(String email) throws Exception{
		return sqlsession.update("member.update_log", email);
	}
	
	
	
	// update_profile
	@Transactional
	public int update_profile(MemberDTO register) throws Exception{
		return sqlsession.update("member.update_profile", register);
	}
	

	@Transactional
	public MemberDTO selectList(MemberDTO register) throws Exception {

		return sqlsession.selectOne("member.member", register);
	}
	
	// 비밀번호 업데이트
	@Transactional
	public int update_pw(MemberDTO register) throws Exception{
		return sqlsession.update("member.update_pw", register);
	}
	
	//회원 탈퇴
	public int deleteMember(MemberDTO register) throws Exception{
		return sqlsession.update("member.deleteMember", register);
	}
	
	public int selectOne(MemberDTO register) throws Exception{
		return sqlsession.selectOne("member.userCheck", register);
	}
	
	// 내가 쓴 리뷰 목록 조회
	public List<ReviewDTO> reviewList(String email){
		return sqlsession.selectList("member.reviewList", email);
	}
	//내가 쓴 리뷰 개수
	public int countReview(String email) throws Exception{
		return sqlsession.selectOne("member.countReview" , email);
	}
	
	public int countReview_like(String email) throws Exception{
		return sqlsession.selectOne("member.countReview_like", email);
	}
	
	public int checkCert(MemberDTO register) throws Exception{
		return sqlsession.update("member.checkCert", register);
	}

	public List<PriceReviewDTO> select_subject(int no){
		return sqlsession.selectList("member.select_subject", no);
	}
	public List<CommentReviewDTO> select_comment(int no){
		return sqlsession.selectList("member.select_subject", no);
	}
	public List<RatingReviewDTO> select_rating(int no){
		return sqlsession.selectList("member.select_rating", no);
	}
}

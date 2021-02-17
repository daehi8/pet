package pet.model.service;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;

import pet.model.bean.MemberDAO;
import pet.model.dto.CommentReviewDTO;
import pet.model.dto.DocInfoDTO;
import pet.model.dto.DocMyHospitalDTO;
import pet.model.dto.MemberDTO;
import pet.model.dto.PriceReviewDTO;
import pet.model.dto.RatingReviewDTO;
import pet.model.dto.ReviewDTO;

@Service
public class MemberServiceImpl implements MemberService{

	// Bean 객체 자동 주입
	@Inject
	private MemberDAO manager;
	
	// 이메일 중복 검사 (AJAX)
	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(manager.check_email(email));
		out.close();
		
	}

	// 회원 가입
	@Override
	public int join_member(MemberDTO register) throws Exception {
		int result = 0;
		if(manager.check_email(register.getEmail()) != 1) {
			// 인증키 set
			System.out.println(register.getEmail());
			register.setApproval_key(create_key());
			register.setPen_name(create_penName());
			manager.join_member(register);
			// 인증 메일 발송
			send_mail(register);
			result = 1;
		}
		return result;
	}

	
	// 닉네임 중복 검사
	@Override
	public String create_penName(){
		List<String> a = new ArrayList<String>();
		List<String> b = new ArrayList<String>();

        a.add("고양이");
        a.add("강아지");
        a.add("말");
        a.add("로빈");
        a.add("리트리버");
        a.add("기러기");
        a.add("햄스터");  
        a.add("조랑말");
        a.add("다람쥐");
        a.add("푸들");
        a.add("매");
        a.add("개미핥기");
        a.add("토끼");
        a.add("루돌프");  
        a.add("피터팬");
        a.add("날다람쥐");
        a.add("호랑이");// 동물 추가...
     
		String name="사용불가";
		int index = (int)(Math.random()*a.size());   
		String n = a.get(index);
		if(!b.contains(n)) {
		   name = a.get(index);
		   b.add(name);  // 사용가능한 닉네임.. b리스트에 추가 
		}
		return name;
	}
	
	

	// 인증키 생성
	@Override
	public String create_key() throws Exception {
		String key = "";
		Random rd = new Random();
		
		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}
	
	// 이메일 발송
	public void send_mail(MemberDTO register) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "global.final05@gmail.com";
		String hostSMTPpwd = "final005";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "global.final05@gmail.com";
		String fromName = "minimanimo";
		String subject = "이메일 발송 테스트";
		String msg = "";

		// 회원가입 메일 내용
		subject = "pet Homepage 회원가입 인증 메일입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += register.getEmail() + "님 회원가입을 환영합니다.</h3>";
		msg += "<div style='font-size: 130%'>";
		msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
		msg += "<form method='post' action='http://localhost:8080/pet/member/approval_member.do'>";
		msg += "<input type='hidden' name='approval_key' value='" + register.getApproval_key() + "'>";
		msg += "<input type='hidden' name='num' value='1'>";
		msg += "<input type='hidden' name='email' value='"+register.getEmail()+"'>";
		msg += "<input type='submit' value='인증'></form><br/></div>";

		// 받는 사람 E-Mail 주소
		String mail = register.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	// 회원 인증
	@Override
	public int approval_member(MemberDTO register, ServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		int num = 1;
		if(manager.approval_member(register) == 1) {
			out.println("<script type='text/javascript' charset='UTF-8'>");
			out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
			out.println("location.href='/pet/member/login.do';");
			out.println("</script>");
			out.close();
		}else {
			out.println("<script type='text/javascript' charset='UTF-8'>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		return num;
}
	
	
	
	

	// 로그인
	@Override
	public MemberDTO login_member(MemberDTO register, HttpServletResponse response) throws Exception{
	response.setContentType("text/html;charset=utf-8");
	PrintWriter out = response.getWriter();

	// 등록된 이메일이 없으면
	if(manager.check_email(register.getEmail()) == 0) {
		out.println("<script>");
		out.println("alert('등록된 아이디가 없습니다.');");
		out.println("location.href='/pet/member/login.do';");
		out.println("</script>");
		out.close();
		return null;
	} else {
		String pw = register.getPw();
		register = manager.login_member(register.getEmail());
		// 비밀번호가 다를 경우
		if(!register.getPw().equals(pw)) {
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다.');");
			out.println("location.href='/pet/member/login.do';");
			out.println("</script>");
			out.close();
			return null;
			
			// 이메일 인증을 하지 않은 경우
			}else if(register.getApproval_status().equals("0")) {
				out.println("<script>");
				out.println("alert('이메일 인증 후 로그인 하세요.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			
			}else if(register.getApproval_status().equals("-1")) {
				out.println("<script>");
				out.println("alert('탈퇴한 회원은 재가입이 불가능합니다...');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
				
	        // 로그인 일자 업데이트 및 회원정보 리턴			
			}else {
				manager.update_log(register.getEmail());
				return register;
			}
		}
	}
	// 로그아웃
	@Override
	public void logout(HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href=document.referrer;");
		out.println("</script>");
		out.close();
	}
	
	@Override
	public void update_profile(MemberDTO register) throws Exception{		
		manager.update_profile(register);
	} 

	@Override
	public MemberDTO select(MemberDTO register) throws Exception {
		return manager.selectList(register);
	}
	// 비밀번호 변경
	@Override
	public MemberDTO update_pw(MemberDTO register, String old_pw, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// old_pw랑 db pw 비교하는 코드 넣기 
	
		if(!old_pw.equals(manager.login_member(register.getEmail()).getPw())) {
			out.println("<script>");
			out.println("alert('기존 비밀번호가 다릅니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}else {
			manager.update_pw(register);
			out.println("<script>");
			out.println("alert('비밀번호가 변경되었습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return manager.login_member(register.getEmail());
		}
	}
	
	// 비밀번호 찾기 - 이메일 발송
	@Override
	public void send_mail(MemberDTO register, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "global.final05@gmail.com";
		String hostSMTPpwd = "final005";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "global.final05@gmail.com";
		String fromName = "minimanimo";
		String subject = "이메일 발송 테스트";
		String msg = "";
		
		if(div.contentEquals("join")) {
		// 회원가입 메일 내용
		subject = "Spring Homepage 회원가입 인증 메일입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += register.getEmail() + "님 회원가입을 환영합니다.</h3>";
		msg += "<div style='font-size: 130%'>";
		msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
		msg += "<form method='post' action='http://localhost:8080/pet/member/approval_member.do'>";
		msg += "<input type='hidden' name='approval_key' value='" + register.getApproval_key() + "'>";
		msg += "<input type='submit' value='인증'></form><br/></div>";
		}else if(div.contentEquals("find_pw")) {
			subject = "Pet Homepage 임시 비밀번호 입니다.";
			msg +="<div align='center' stype='border:1px solid black; font-family:verdana'>";
			msg +="<h3 styl='color': blue;'>";
			msg += register.getPen_name()+"님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += register.getPw() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = register.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	
	// 비밀번호 찾기
	@Override
	public void find_pw(HttpServletResponse response, MemberDTO register) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//가입에 사용한 이메일이 아니면
		if(manager.check_email(register.getEmail()) == 0) {
			out.print("이메일이 없습니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			register.setPw(pw);
			// 비밀번호 변경
			manager.update_pw(register);
			// 비밀번호 변경 메일 발송
			send_mail(register, "find_pw");
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}
	
	
	/*
	 * @Override public int userCheck(MemberDTO register) throws Exception { return
	 * manager.selectOne(register); }
	 */
	//회원 탈퇴
	@Override
	public int deleteMember(MemberDTO register) throws Exception {
		int check = manager.selectOne(register);
		if(check == 1) {
			manager.deleteMember(register);
		}
		System.out.println("check2"+check);
		System.out.println(register.getEmail());
		return check;
	}
	
	// 리뷰 리스트 조회
	@Override
	public List<ReviewDTO> reviewList(String email) throws Exception{
		return manager.reviewList(email);
	}
	
	// 리뷰 개수 
	@Override
	public int countReview(String email) throws Exception{
		return manager.countReview(email);
	}
	
	@Override
	public int countReview_like(String email) throws Exception{
		return manager.countReview_like(email);
	}

	@Override
	public int checkCert (MemberDTO register) throws Exception{
		return manager.checkCert(register); 
	}
	
	@Override
	public List<PriceReviewDTO> select_subject(int no) throws Exception{
		return manager.select_subject(no);
	}
	@Override
	public List<CommentReviewDTO> select_comment(int no) throws Exception{
		return manager.select_comment(no);
	}
	
	@Override
	public List<RatingReviewDTO> select_rating(int no) throws Exception{
		return manager.select_rating(no);
	}

	
	

}




























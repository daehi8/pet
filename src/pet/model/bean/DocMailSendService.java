package pet.model.bean;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;


@Service("mss")
public class DocMailSendService {

	@Autowired
	private JavaMailSenderImpl mailSender;
	private int size;
	
	
	// 인증키 생성
	private String getKey(int size) {
		this.size = size;
		return getAuthCode();
	}
	
	// 인증코드 난수 발생
	private String getAuthCode() {
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;
		
		while (buffer.length() < size) {
			num = random.nextInt(10);
			buffer.append(num);
		}
		return buffer.toString();
	}

	// 인증메일 보내기
	public String sendAuthMail(String email) {
		// 6자리 난수 인증번호 생성
		String authKey = getKey(6);
		
		// 인증메일 보내기
		try {
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("<pet 서비스 이메일 인증>");
			sendMail.setText(
					new StringBuffer().append("<h1> <메일 인증> </h1>")
					.append("<p> 아래 링크를 클릭 하시면 이메일 인증이 완료됩니다.</p>")
					.append("<a href='http://localhost:8080/pet/doctor/emailConfirm.do?doc_mail=")
					.append(email)
					.append("&authKey=")
					.append(authKey)
					.append("'target='_blenk'>이메일 인증 확인 </a>")
					.toString());
			sendMail.setFrom("22wwwwwoo@gmail.com", "pet관리자");
			sendMail.setTo(email);
			sendMail.send();
		}catch (MessagingException e ) {
			e.printStackTrace();
		}catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return authKey;
	}

	
	
}

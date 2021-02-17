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
	
	
	// ����Ű ����
	private String getKey(int size) {
		this.size = size;
		return getAuthCode();
	}
	
	// �����ڵ� ���� �߻�
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

	// �������� ������
	public String sendAuthMail(String email) {
		// 6�ڸ� ���� ������ȣ ����
		String authKey = getKey(6);
		
		// �������� ������
		try {
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("<pet ���� �̸��� ����>");
			sendMail.setText(
					new StringBuffer().append("<h1> <���� ����> </h1>")
					.append("<p> �Ʒ� ��ũ�� Ŭ�� �Ͻø� �̸��� ������ �Ϸ�˴ϴ�.</p>")
					.append("<a href='http://localhost:8080/pet/doctor/emailConfirm.do?doc_mail=")
					.append(email)
					.append("&authKey=")
					.append(authKey)
					.append("'target='_blenk'>�̸��� ���� Ȯ�� </a>")
					.toString());
			sendMail.setFrom("22wwwwwoo@gmail.com", "pet������");
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

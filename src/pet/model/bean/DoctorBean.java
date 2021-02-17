package pet.model.bean;

import java.io.File;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pet.model.dto.DocInfoDTO;
import pet.model.dto.DocMyHospitalDTO;
import pet.model.dto.DocPictureDTO;
import pet.model.dto.HospitalDTO;
import pet.model.service.DocDAOService;
import pet.model.service.DocDAOServiceImpl;

@Controller
@RequestMapping("/doctor/")// �����ּ� ��ο��� /member/���� ����
public class DoctorBean {
	
	@Autowired
	private DocDAOService docDao;
	
	@Autowired
	private DocMailSendService mss;
	
	// ���� ��
	@RequestMapping("docMailForm.do")
	public String docMailForm() {
		System.out.println("docMailForm.do ����");
		
		return "doctor/docMailForm";
	}
	
	// �����ߺ��˻�
	@RequestMapping("confirmMail.do")
	public String confirmMail(DocInfoDTO docInfoDto, Model model) throws Exception {
		System.out.println("confirmMail ����");
		System.out.println(docInfoDto.getDoc_mail());
		
		// ���������� �α���üũ�� �ߺ��˻� ����.
		int check = docDao.userCheck(docInfoDto);
		System.out.println(check);
//		String doc_mail = "";
//		doc_mail = docInfoDto.getDoc_mail();
		
		model.addAttribute("check",check);
		model.addAttribute("doc_mail", docInfoDto.getDoc_mail());
		
		return "doctor/confirmMail";
	}
	
	// ���� �� ����
	@RequestMapping("docMailPro.do")
	public void docMailPro(@ModelAttribute DocInfoDTO docInfoDto
									, DocPictureDTO docPictureDto
									, DocMyHospitalDTO docMyHospitalDto
									, Model model) throws Exception {
		System.out.println("docMailPro.do ����");
		if(docInfoDto.getDoc_mail() != null && docInfoDto.getDoc_pw() != null) {
			// DB �� �⺻���� insert - doc_no / doc_mail / doc_pw
			docDao.insertDoc(docInfoDto);
			docDao.insertHospital(docMyHospitalDto);
			System.out.println("insertDoc ����Ϸ�");
			
			
			// ������ authKey���� & ���� �߼�			(DTO�� �ǻ����)
			String authKey = mss.sendAuthMail(docInfoDto.getDoc_mail());
			docInfoDto.setAuthKey(authKey);
			
			System.out.println("����Ű�� �����糪?" + authKey);
			System.out.println(docInfoDto.getAuthKey());
			
			docDao.updateAuthKey(docInfoDto);
	//		docDao.updateAuthKey(docInfoDto.getDoc_no());
			System.out.println("updateAuthKey���� �Ϸ�");
			System.out.println("docPictureDTO �� doc_mail : " + docPictureDto.getDoc_mail());
		
			
			// ���������� '���� �� ������ Ȯ���� �ּ���'
			model.addAttribute("doc_mail", docInfoDto.getDoc_mail());
		}
		
	}// DB�� ��ȣ ���� ��� ����Ű ����. ���� ������Ϸ�

	
	// DB�� ����,����Ű Ȯ�� �� ���Ի��� ���� �ϱ�
	@RequestMapping("emailConfirm.do")
	public String emailConfirm(DocInfoDTO docInfoDto, Model model) {
		System.out.println("emailConfirm����");
		// mail , authKey ��ġ�ϴ��� Ȯ��
		try {
			List check = docDao.authKeyOK(docInfoDto);
			System.out.println("check ����Ʈ : " + check);
			String doc_mail = "";
			String authKey = "";
			if (check != null) {	// db�� ������ ����
				System.out.println("check�� ����");
				System.out.println(docInfoDto.getDoc_mail());
				System.out.println(docInfoDto.getAuthKey());
				doc_mail = docInfoDto.getDoc_mail();
				authKey = docInfoDto.getAuthKey();
			}else {
				check = Collections.EMPTY_LIST;
				System.out.println("check�� ����.");
			}
			model.addAttribute("check", check);
			model.addAttribute("doc_mail", doc_mail);
			model.addAttribute("authKey", authKey);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "doctor/emailConfirm";
	}

	// �������� �� ÷�����Ͼ��ε�
	@RequestMapping("emailOk.do")
	public String eamilOk(MultipartHttpServletRequest request
						 , DocPictureDTO docPictureDto
						 , DocInfoDTO docInfoDto) throws Exception {
		System.out.println("emailOk����.");
		// ���� ���� ���ε�
		// ���� name���ʷ� �˻� �� �ش����� ��� ���ε� �ݺ� ( license , registration, agreement )
		Iterator<String>fileTypeNames = request.getFileNames();
		while(fileTypeNames.hasNext() ) {
			String fileTypeName = fileTypeNames.next();	// ���ʷ� ������
			List<MultipartFile> mf = request.getFiles(fileTypeName); // ���������� ����Ʈ ���.
			for(int i = 0; i < mf.size(); i++) {
				if(mf.get(i).isEmpty()) {
					break;
				}
				String fileName = mf.get(i).getOriginalFilename();	// �������ϸ�.
				docPictureDto.setOrg_pic(fileName);	// �������ϸ� dto����.
				System.out.println("�������ϸ� " + docPictureDto.getOrg_pic());
				docDao.insertFile(docPictureDto);	// ���� �μ�Ʈ�ϱ�
				int pic_no = docDao.maxNo();	// ���� �μ�Ʈ�ϱ�
				System.out.println("�μ�Ʈ�� ����. // " + pic_no);
				
				// ���ϸ��� Ȯ���� ã��		��()�� ��ġ���� �ڸ���.		�����ϸ��� ������ (��.) ��ġ ã��
				String ext = fileName.substring(fileName.lastIndexOf("."));
				String save_pic = "file_"+ pic_no + ext;	//����� �̸�
				docPictureDto.setPic_no(pic_no); 	// ��ȣ set
				docPictureDto.setSave_pic(save_pic);	// �纻�̸� set
				System.out.println("�纻 �̸� " + docPictureDto.getSave_pic());
				
				
				//���� name -> type���� ����
				docPictureDto.setFile_type(fileTypeName); 	// ����Ÿ�� dto����
				System.out.println("����Ÿ�� " + docPictureDto.getFile_type());
				
				docDao.fileUpdate(docPictureDto);	// ���� ������Ʈ
//				String savePath = "D:\\dev\\";		// ���ε����� ������
//				File saveFile = new File(savePath+ save_pic);
				String savePath = request.getRealPath("save");	// ���� ������
				System.out.println(savePath);
				File saveFile = new File(savePath+"//"+ save_pic);
				try {
					mf.get(i).transferTo(saveFile); 	//���� ����
					System.out.println("�������� �Ϸ�.");
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		System.out.println(docInfoDto.getAuthKey());
		System.out.println(docInfoDto.getDoc_mail());
		// file_type �� license �� registration �� �ִ� ���� Ȯ��.
		String licenseType = docDao.selectLicense(docPictureDto);
		String registrationType = docDao.selectRegistration(docPictureDto);
		String agreeType = docDao.selectAgree(docPictureDto);
		System.out.println("license �����ִ� ���� " + licenseType);
		System.out.println("registration ���� �ִ� ���� " + registrationType);
		System.out.println("agreement ���� �ִ� ���� " + agreeType);
		
		if (licenseType != null && registrationType != null) {
			docInfoDto.setAuthstate(1);
			System.out.println("docInfoDto.getAuthstate ���� : " +docInfoDto.getAuthstate());
			docDao.updateAuthState(docInfoDto);
			System.out.println("authState ����.");
		}else {
			// null �̸� Ż��... close();? break;
			System.out.println("license , registration ����.");
		}
		if (agreeType != null) {
			docInfoDto.setAgree(1);
			docDao.updateAgree(docInfoDto);
			System.out.println("docInfoDto.getAgree : " +docInfoDto.getAgree());
			System.out.println("updateAgree���� ");
		}else {
			System.out.println("agreement ����.");
		}
		return "doctor/emailOk";
	}	
	
	// �����������Ǽ� �ٿ�.
	@RequestMapping("down.do")
	public ModelAndView down(HttpServletRequest request) {
		System.out.println("down.do ����");
		// ���Ǽ� �ٿ� 
//		String path = request.getRealPath("save")+"\\"+file;	// ���	
// ������ �����Ǿ� �ֱ� ������ ���� �����̸��� ������ ������ �ʿ� ����  ����path�� ��Ȯ�� ��θ� ������ �� ���� �ٿ� ������ �Ǵ� ��.
		String path = request.getRealPath("resources/etc")+"//"+"agreement.JPG";
		File f = new File(path);
		System.out.println(path);
		ModelAndView mv = new ModelAndView("download", "downloadFile", f);
										// bean id 	 , parameterName, value
		return mv;
	}
	
	//����
	@RequestMapping("main.do")
	public String main() {
		System.out.println("main.do ����");
		
		return "doctor/main";
	}
	
	// �α���
	@RequestMapping("loginForm.do")
	public String loginForm() {
		System.out.println("loginForm.do ����");
		return "doctor/loginForm";
	}
	// �α��ν���
	@RequestMapping("loginPro.do")
	public String loginPro(HttpSession session, Model model, DocInfoDTO docInfoDto) throws Exception {
		System.out.println("loginPro.do ����");
		System.out.println("doc_mail  : " + docInfoDto.getDoc_mail());
		String doc_mail = docInfoDto.getDoc_mail();
		DocInfoDTO doctor = docDao.getDoctor(doc_mail);
		System.out.println("docInfo��  doc_state ���� : " + doctor.getDoc_state());
		// �α��� üũ
		int check = docDao.userCheck(docInfoDto);
		if( check == 1 && doctor.getDoc_state() != -1) {	// doc_mail�� ���� ����
			session.setAttribute("doctorMail", docInfoDto.getDoc_mail());
		}
		System.out.println("check �� : " + check);
		model.addAttribute("check", check);
		model.addAttribute("doctor", doctor);
		return "doctor/loginPro";
	}
	// �α׾ƿ�
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		System.out.println("logout ����");
		// ���� ����
		session.invalidate();

		return "doctor/logout";
	}

	// ������ ����
	@RequestMapping("modify.do")
	public String modify(Model model, HttpSession session) throws Exception {
		System.out.println("modify.do ����");
		
		// �ǻ� ���� ������.
		String doc_mail = (String)session.getAttribute("doctorMail");
		String docAgree = "";
		DocInfoDTO doctor = docDao.getDoctor(doc_mail);
		System.out.println("doc_info �� hospital_no : " + doctor.getHospital_no());
		// doc_info�� hospital_no�� ������ hospitalDB�� no �� ���� �� �ִ°�.
		int no = doctor.getHospital_no();
		if(doctor.getAgree() == 1) {
			docAgree = "����";
		}else {
			docAgree = "�̵���";
		}
		// ���� �߰����� ������
		DocMyHospitalDTO hospital = docDao.getHospital(doc_mail);
		
		// �������� ������
		HospitalDTO hospitalDB = docDao.getHospitalDB(no);
		
		model.addAttribute("hospital", hospital);
		model.addAttribute("doctor", doctor);
		model.addAttribute("docAgree", docAgree);
		model.addAttribute("hospitalDB", hospitalDB);
		

		return "doctor/modify";
	}
	
	// ������ (�̸�, ���, �����ʻ���) ����.
	@RequestMapping("modifyUpdate.do")
	public String modifyUpdate(HttpSession session, Model model) {
		System.out.println("modifyUpdate.do ����");
		String doc_mail = (String)session.getAttribute("doctorMail");
		String docAgree = "";
		try {	// �ǻ� ���� ������.
			DocInfoDTO doctor = docDao.getDoctor(doc_mail);
			System.out.println("getDoctor�� agree���� : " + doctor.getAgree());
			
			if(doctor.getAgree() == 1) {
				docAgree = "����";
			}else {
				docAgree = "�̵���";
			}
			model.addAttribute("doctor", doctor);
			model.addAttribute("docAgree", docAgree);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "doctor/modifyUpdate";
	}
	@RequestMapping("modifyUpdatePro.do")
	public String modifyUpdatePro(DocInfoDTO docInfoDto
							, MultipartHttpServletRequest request
							, Model model
							, DocPictureDTO docPictureDto) throws Exception {
		System.out.println("modifyProBean ����");
		System.out.println("doc_mail : " + docInfoDto.getDoc_mail());
		
		//�Ķ���͹ޱ�, �����ϱ�.
		MultipartFile mf = request.getFile("org"); // ���� ��ü
		MultipartFile mfP = request.getFile("agreement");	// ���Ǽ����ϰ�ü
		String savePath = request.getRealPath("save");	// ���� ������
	    String doc_org = mf.getOriginalFilename(); 	// ���� ���ϸ�
	    if(doc_org !=  "" && doc_org != null) {
	    	String ext = doc_org.substring(doc_org.lastIndexOf("."));  //Ȯ���� ���� 
	         
	    	String fn = docInfoDto.getDoc_save();  // file_11.jpg �纻�̸� ������
	    	System.out.println("�纻���� ������ : " + docInfoDto.getDoc_save());
	    	if(fn == null || fn.equals("")) {
	    		fn = "file_"+docInfoDto.getDoc_no()+ext;	// ����� ���ϸ�
	    	}else {
	    		fn = fn.substring(0, fn.lastIndexOf("."))+"."+ext;
	     	}
	        System.out.println("����� ���ϸ� fn : " + fn);
	     	File f = new File(savePath+"//"+fn);
	        mf.transferTo(f);  // ���ε� ���� 
	        docInfoDto.setDoc_save(fn); // ���ε������̸��� DTO ���� 
	    }
	    if(mfP !=null ) {
	    	String org_pic = mfP.getOriginalFilename();	// ���Ǽ��������ϸ�
	    	if(org_pic !="" && org_pic != null) {	// ���Ǽ��� ÷���� ���
				docPictureDto.setOrg_pic(org_pic);	// �������ϸ� dto����.
				System.out.println("�������ϸ� " + docPictureDto.getOrg_pic());
				docDao.insertFile(docPictureDto);	// ���� �μ�Ʈ�ϱ�
				int pic_no = docDao.maxNo();	// ���� �μ�Ʈ�ϱ�
				System.out.println("�μ�Ʈ�� ����. // " + pic_no);
				
				// ���ϸ��� Ȯ���� ã��		��()�� ��ġ���� �ڸ���.		�����ϸ��� ������ (��.) ��ġ ã��
				String ext = org_pic.substring(org_pic.lastIndexOf("."));
				String save_pic = "file_"+ pic_no + ext;	//����� �̸�
				docPictureDto.setPic_no(pic_no); 	// ��ȣ set
				docPictureDto.setSave_pic(save_pic);	// �纻�̸� set
				System.out.println("�纻 �̸� " + docPictureDto.getSave_pic());
				
				//���� name -> type���� ����
				String fileTypeName = "agreement";
				docPictureDto.setFile_type(fileTypeName); 	// ����Ÿ�� dto����
				System.out.println("����Ÿ�� " + docPictureDto.getFile_type());
				
				docDao.fileUpdate(docPictureDto);	// ���� ������Ʈ
				File saveFile = new File(savePath+"//"+ save_pic);
				mfP.transferTo(saveFile);
				docPictureDto.setSave_pic(save_pic);
				
				// doc_info��  agree 1�� �����ϱ�.
				String agreeType = docDao.selectAgree(docPictureDto);
				System.out.println("agreement ���� �ִ� ���� " + agreeType);
				if (agreeType != null) {
					docInfoDto.setAgree(1);
					docDao.updateAgree(docInfoDto);
					System.out.println("docInfoDto.getAgree : " +docInfoDto.getAgree());
					System.out.println("updateAgree���� ");
				}else {
					System.out.println("agreement ����.");
				}
		    }
	    }
	    
	    
	    docInfoDto.setDoc_org(doc_org);
	    System.out.println("doc_save" + docInfoDto.getDoc_save());
	    System.out.println("doc_org " + docInfoDto.getDoc_org());
	    
	    System.out.println("doc_name�Ķ���� ����?" +docInfoDto.getDoc_name());
	    docDao.updateModify(docInfoDto);	
	    System.out.println("updateModify �Ϸ�");
	    model.addAttribute("doc_no",docInfoDto.getDoc_no());
	    
	    System.out.println("org_pic ���Ǽ� ���� : " + docPictureDto.getOrg_pic());
	    System.out.println("save_pic ���Ǽ� ���� : " + docPictureDto.getSave_pic());
	    
		return "doctor/modifyUpdatePro";
	}
	
	//��й�ȣ ����
	@RequestMapping("pwUpdate.do")
	public String pwUpdate(Model model, HttpSession session) throws Exception {
		System.out.println("pwUpdate.do ����");
		
		// �ǻ� ���� ������.
		String doc_mail = (String)session.getAttribute("doctorMail");
		DocInfoDTO doctor = docDao.getDoctor(doc_mail);
		model.addAttribute("doctor", doctor);
		
		return "doctor/pwUpdate";
	}
	@RequestMapping("pwPro.do")
	public String pwPro(Model model, DocInfoDTO docInfoDto
						, HttpSession session, String new_pw) throws Exception {
		System.out.println("pwPro.do ����");
		System.out.println("�Է��� ���� ��� " + docInfoDto.getDoc_pw());
		System.out.println("���ο� ��� " + new_pw);
		
		// �ǻ� ���� ������.
		String doc_mail = (String)session.getAttribute("doctorMail");
		DocInfoDTO doctor = docDao.getDoctor(doc_mail);	// DB ��� ������
		System.out.println("DB ���  : " +doctor.getDoc_pw());
		if(docInfoDto.getDoc_pw().equals(doctor.getDoc_pw())) { // DB�����  �Է��� ����� ���ٸ�
			docInfoDto.setDoc_pw(new_pw);
			System.out.println("�� ��� DTO�� ����: "+ docInfoDto.getDoc_pw());
			docDao.changePw(docInfoDto);	// ��� �ٲٱ�.
		}
		return "doctor/pwPro";
	}
	
	// �������� ����
	@RequestMapping("hospitalUpdate.do")
	public String hospitalUpdate(HttpSession session, Model model, DocInfoDTO docInfoDto
								, HospitalDTO hospitalDto, DocMyHospitalDTO docMyHospitalDto) throws Exception {
		System.out.println("hospitalUpdate����");
		String doc_mail = (String)session.getAttribute("doctorMail");
		// ���⼭�� �ǻ������� �������� ���������� ������ ��..
		System.out.println("doc_mail �� : " + doc_mail);
		DocInfoDTO doctor = docDao.getDoctor(doc_mail);
		System.out.println("doc_info �� hospital_no : " + doctor.getHospital_no());
		int no = doctor.getHospital_no();

		// ���� �߰����� ������
		DocMyHospitalDTO hospital = docDao.getHospital(doc_mail);
				
		// �������� ������
		HospitalDTO hospitalDB = docDao.getHospitalDB(no);
		System.out.println("homepage" + hospital.getHomepage());
		System.out.println("hospital_contents" + hospital.getHospital_contents());
		System.out.println("hospital_call" + hospital.getHospital_call());
		
		model.addAttribute("hospital", hospital);
		model.addAttribute("hospitalDB", hospitalDB);
		return "doctor/hospitalUpdate";
	}
	
	@RequestMapping("hospitalUpdatePro.do")
	public String hospitalUpdatePro(DocMyHospitalDTO docMyHospitalDto
									, MultipartHttpServletRequest request) throws Exception {
		System.out.println("hospitalUpdatePro����");
		System.out.println("doc_mail : " + docMyHospitalDto.getDoc_mail());
		System.out.println("add_no" + docMyHospitalDto.getAdd_no());
		// �Ķ���͹ް�, ����
		MultipartFile mf = request.getFile("hospital_org"); // ���� ��ü
		String savePath= request.getRealPath("save");	// ���� ���� ���
		String hospital_pic_org = mf.getOriginalFilename();		// ���� ���ϸ�
		if(hospital_pic_org != null && hospital_pic_org != "") {
			String ext = hospital_pic_org.substring(hospital_pic_org.lastIndexOf("."));	// Ȯ��������
			String fn = docMyHospitalDto.getHospital_pic_save();	// �纻 �̸� ������.
			System.out.println(" �纻���� ������ : " +docMyHospitalDto.getHospital_pic_save());
			if (fn == null || fn.equals("")) {
				fn = "hospital_" + docMyHospitalDto.getAdd_no()+ext;	//����� ���ϸ�
			}else {
				fn = fn.substring(0,fn.lastIndexOf("."))+"." + ext;
			}
			System.out.println("����� ���ϸ�  : " + fn);
			File f = new File(savePath+"//"+fn);
			mf.transferTo(f);	// ���ε� ����
			docMyHospitalDto.setHospital_pic_save(fn);	// ���ε������̸� DTO����.
			docMyHospitalDto.setHospital_pic_org(hospital_pic_org);
		}
		docDao.hospitalUpdate(docMyHospitalDto);
		
		return "doctor/hospitalUpdatePro";
	}
	
	@RequestMapping("deleteForm.do")
	public String deleteFrom() {
		return "doctor/deleteForm";
	}
	
	@RequestMapping("deletePro.do")
	public String deletePro(HttpSession session, DocInfoDTO docInfoDto, Model model) throws Exception {
		//id�� ���ǲ����� Ȯ�� �� passwdȮ�� �� Ż��, �α׾ƿ�.
		String doc_mail = (String)session.getAttribute("doctorMail");
		docInfoDto.setDoc_mail(doc_mail);
		System.out.println("delete�������� doc_mail �� : " + docInfoDto.getDoc_mail());
		System.out.println("doc_pw �� : " + docInfoDto.getDoc_pw());
		
		int userCheck = docDao.userCheck(docInfoDto);
		if ( userCheck == 1) {	// ����� �´ٸ�.	doc_state�� -1�� ����.
			int check = docDao.deleteDoctor(docInfoDto);
			System.out.println(" check ------- : " + check);
			if(check == 1) {	// userChceck �� 
				// ���� ����
				session.invalidate();
			}
			model.addAttribute("check", check);
		}else {
			System.out.println("userCheck ��  Ʋ��.");
		}
		
		
		return "doctor/deletePro";
	}
	
}


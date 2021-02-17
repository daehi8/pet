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
@RequestMapping("/doctor/")// 실행주소 경로에서 /member/생략 가능
public class DoctorBean {
	
	@Autowired
	private DocDAOService docDao;
	
	@Autowired
	private DocMailSendService mss;
	
	// 가입 폼
	@RequestMapping("docMailForm.do")
	public String docMailForm() {
		System.out.println("docMailForm.do 실행");
		
		return "doctor/docMailForm";
	}
	
	// 메일중복검사
	@RequestMapping("confirmMail.do")
	public String confirmMail(DocInfoDTO docInfoDto, Model model) throws Exception {
		System.out.println("confirmMail 실행");
		System.out.println(docInfoDto.getDoc_mail());
		
		// 동적쿼리로 로그인체크와 중복검사 가능.
		int check = docDao.userCheck(docInfoDto);
		System.out.println(check);
//		String doc_mail = "";
//		doc_mail = docInfoDto.getDoc_mail();
		
		model.addAttribute("check",check);
		model.addAttribute("doc_mail", docInfoDto.getDoc_mail());
		
		return "doctor/confirmMail";
	}
	
	// 가입 폼 실행
	@RequestMapping("docMailPro.do")
	public void docMailPro(@ModelAttribute DocInfoDTO docInfoDto
									, DocPictureDTO docPictureDto
									, DocMyHospitalDTO docMyHospitalDto
									, Model model) throws Exception {
		System.out.println("docMailPro.do 실행");
		if(docInfoDto.getDoc_mail() != null && docInfoDto.getDoc_pw() != null) {
			// DB 에 기본정보 insert - doc_no / doc_mail / doc_pw
			docDao.insertDoc(docInfoDto);
			docDao.insertHospital(docMyHospitalDto);
			System.out.println("insertDoc 실행완료");
			
			
			// 임의의 authKey생성 & 메일 발송			(DTO의 의사메일)
			String authKey = mss.sendAuthMail(docInfoDto.getDoc_mail());
			docInfoDto.setAuthKey(authKey);
			
			System.out.println("인증키가 생성됬나?" + authKey);
			System.out.println(docInfoDto.getAuthKey());
			
			docDao.updateAuthKey(docInfoDto);
	//		docDao.updateAuthKey(docInfoDto.getDoc_no());
			System.out.println("updateAuthKey실행 완료");
			System.out.println("docPictureDTO 의 doc_mail : " + docPictureDto.getDoc_mail());
		
			
			// 페이지에서 '메일 님 메일을 확인해 주세요'
			model.addAttribute("doc_mail", docInfoDto.getDoc_mail());
		}
		
	}// DB에 번호 메일 비번 인증키 삽입. 메일 보내기완료

	
	// DB와 메일,인증키 확인 후 가입상태 대기로 하기
	@RequestMapping("emailConfirm.do")
	public String emailConfirm(DocInfoDTO docInfoDto, Model model) {
		System.out.println("emailConfirm실행");
		// mail , authKey 일치하는지 확인
		try {
			List check = docDao.authKeyOK(docInfoDto);
			System.out.println("check 리스트 : " + check);
			String doc_mail = "";
			String authKey = "";
			if (check != null) {	// db에 데이터 있음
				System.out.println("check값 있음");
				System.out.println(docInfoDto.getDoc_mail());
				System.out.println(docInfoDto.getAuthKey());
				doc_mail = docInfoDto.getDoc_mail();
				authKey = docInfoDto.getAuthKey();
			}else {
				check = Collections.EMPTY_LIST;
				System.out.println("check값 없음.");
			}
			model.addAttribute("check", check);
			model.addAttribute("doc_mail", doc_mail);
			model.addAttribute("authKey", authKey);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "doctor/emailConfirm";
	}

	// 메일인증 후 첨부파일업로드
	@RequestMapping("emailOk.do")
	public String eamilOk(MultipartHttpServletRequest request
						 , DocPictureDTO docPictureDto
						 , DocInfoDTO docInfoDto) throws Exception {
		System.out.println("emailOk실행.");
		// 다중 파일 업로드
		// 파일 name차례로 검색 후 해당파일 모두 업로드 반복 ( license , registration, agreement )
		Iterator<String>fileTypeNames = request.getFileNames();
		while(fileTypeNames.hasNext() ) {
			String fileTypeName = fileTypeNames.next();	// 차례로 꺼내기
			List<MultipartFile> mf = request.getFiles(fileTypeName); // 여러파일은 리스트 사용.
			for(int i = 0; i < mf.size(); i++) {
				if(mf.get(i).isEmpty()) {
					break;
				}
				String fileName = mf.get(i).getOriginalFilename();	// 원본파일명.
				docPictureDto.setOrg_pic(fileName);	// 원본파일명 dto저장.
				System.out.println("원본파일명 " + docPictureDto.getOrg_pic());
				docDao.insertFile(docPictureDto);	// 파일 인서트하기
				int pic_no = docDao.maxNo();	// 파일 인서트하기
				System.out.println("인서트는 실행. // " + pic_no);
				
				// 파일명에서 확장자 찾기		↓()의 위치에서 자르기.		↓파일명에서 마지막 (점.) 위치 찾기
				String ext = fileName.substring(fileName.lastIndexOf("."));
				String save_pic = "file_"+ pic_no + ext;	//저장될 이름
				docPictureDto.setPic_no(pic_no); 	// 번호 set
				docPictureDto.setSave_pic(save_pic);	// 사본이름 set
				System.out.println("사본 이름 " + docPictureDto.getSave_pic());
				
				
				//파일 name -> type으로 저장
				docPictureDto.setFile_type(fileTypeName); 	// 파일타입 dto저장
				System.out.println("파일타입 " + docPictureDto.getFile_type());
				
				docDao.fileUpdate(docPictureDto);	// 파일 업데이트
//				String savePath = "D:\\dev\\";		// 업로드파일 저장경로
//				File saveFile = new File(savePath+ save_pic);
				String savePath = request.getRealPath("save");	// 파일 저장경로
				System.out.println(savePath);
				File saveFile = new File(savePath+"//"+ save_pic);
				try {
					mf.get(i).transferTo(saveFile); 	//파일 저장
					System.out.println("파일저장 완료.");
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		System.out.println(docInfoDto.getAuthKey());
		System.out.println(docInfoDto.getDoc_mail());
		// file_type 에 license 와 registration 이 있는 메일 확인.
		String licenseType = docDao.selectLicense(docPictureDto);
		String registrationType = docDao.selectRegistration(docPictureDto);
		String agreeType = docDao.selectAgree(docPictureDto);
		System.out.println("license 파일있는 메일 " + licenseType);
		System.out.println("registration 파일 있는 메일 " + registrationType);
		System.out.println("agreement 파일 있는 메일 " + agreeType);
		
		if (licenseType != null && registrationType != null) {
			docInfoDto.setAuthstate(1);
			System.out.println("docInfoDto.getAuthstate 상태 : " +docInfoDto.getAuthstate());
			docDao.updateAuthState(docInfoDto);
			System.out.println("authState 변경.");
		}else {
			// null 이면 탈출... close();? break;
			System.out.println("license , registration 없음.");
		}
		if (agreeType != null) {
			docInfoDto.setAgree(1);
			docDao.updateAgree(docInfoDto);
			System.out.println("docInfoDto.getAgree : " +docInfoDto.getAgree());
			System.out.println("updateAgree실행 ");
		}else {
			System.out.println("agreement 없음.");
		}
		return "doctor/emailOk";
	}	
	
	// 정보공개동의서 다운.
	@RequestMapping("down.do")
	public ModelAndView down(HttpServletRequest request) {
		System.out.println("down.do 실행");
		// 동의서 다운 
//		String path = request.getRealPath("save")+"\\"+file;	// 경로	
// 파일은 고정되어 있기 때문에 굳이 파일이름을 미지로 정해줄 필요 없고  리얼path로 정확한 경로를 지정한 후 파일 다운 받으면 되는 것.
		String path = request.getRealPath("resources/etc")+"//"+"agreement.JPG";
		File f = new File(path);
		System.out.println(path);
		ModelAndView mv = new ModelAndView("download", "downloadFile", f);
										// bean id 	 , parameterName, value
		return mv;
	}
	
	//메인
	@RequestMapping("main.do")
	public String main() {
		System.out.println("main.do 실행");
		
		return "doctor/main";
	}
	
	// 로그인
	@RequestMapping("loginForm.do")
	public String loginForm() {
		System.out.println("loginForm.do 실행");
		return "doctor/loginForm";
	}
	// 로그인실행
	@RequestMapping("loginPro.do")
	public String loginPro(HttpSession session, Model model, DocInfoDTO docInfoDto) throws Exception {
		System.out.println("loginPro.do 실행");
		System.out.println("doc_mail  : " + docInfoDto.getDoc_mail());
		String doc_mail = docInfoDto.getDoc_mail();
		DocInfoDTO doctor = docDao.getDoctor(doc_mail);
		System.out.println("docInfo의  doc_state 상태 : " + doctor.getDoc_state());
		// 로그인 체크
		int check = docDao.userCheck(docInfoDto);
		if( check == 1 && doctor.getDoc_state() != -1) {	// doc_mail에 세션 저장
			session.setAttribute("doctorMail", docInfoDto.getDoc_mail());
		}
		System.out.println("check 는 : " + check);
		model.addAttribute("check", check);
		model.addAttribute("doctor", doctor);
		return "doctor/loginPro";
	}
	// 로그아웃
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		System.out.println("logout 실행");
		// 세션 삭제
		session.invalidate();

		return "doctor/logout";
	}

	// 내정보 보기
	@RequestMapping("modify.do")
	public String modify(Model model, HttpSession session) throws Exception {
		System.out.println("modify.do 실행");
		
		// 의사 정보 꺼내기.
		String doc_mail = (String)session.getAttribute("doctorMail");
		String docAgree = "";
		DocInfoDTO doctor = docDao.getDoctor(doc_mail);
		System.out.println("doc_info 의 hospital_no : " + doctor.getHospital_no());
		// doc_info의 hospital_no가 있으니 hospitalDB의 no 를 꺼낼 수 있는것.
		int no = doctor.getHospital_no();
		if(doctor.getAgree() == 1) {
			docAgree = "동의";
		}else {
			docAgree = "미동의";
		}
		// 병원 추가정보 꺼내기
		DocMyHospitalDTO hospital = docDao.getHospital(doc_mail);
		
		// 병원정보 꺼내기
		HospitalDTO hospitalDB = docDao.getHospitalDB(no);
		
		model.addAttribute("hospital", hospital);
		model.addAttribute("doctor", doctor);
		model.addAttribute("docAgree", docAgree);
		model.addAttribute("hospitalDB", hospitalDB);
		

		return "doctor/modify";
	}
	
	// 내정보 (이름, 비번, 프로필사진) 수정.
	@RequestMapping("modifyUpdate.do")
	public String modifyUpdate(HttpSession session, Model model) {
		System.out.println("modifyUpdate.do 실행");
		String doc_mail = (String)session.getAttribute("doctorMail");
		String docAgree = "";
		try {	// 의사 정보 꺼내기.
			DocInfoDTO doctor = docDao.getDoctor(doc_mail);
			System.out.println("getDoctor의 agree상태 : " + doctor.getAgree());
			
			if(doctor.getAgree() == 1) {
				docAgree = "동의";
			}else {
				docAgree = "미동의";
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
		System.out.println("modifyProBean 실행");
		System.out.println("doc_mail : " + docInfoDto.getDoc_mail());
		
		//파라미터받기, 수정하기.
		MultipartFile mf = request.getFile("org"); // 파일 객체
		MultipartFile mfP = request.getFile("agreement");	// 동의서파일객체
		String savePath = request.getRealPath("save");	// 파일 저장경로
	    String doc_org = mf.getOriginalFilename(); 	// 원본 파일명
	    if(doc_org !=  "" && doc_org != null) {
	    	String ext = doc_org.substring(doc_org.lastIndexOf("."));  //확장자 추출 
	         
	    	String fn = docInfoDto.getDoc_save();  // file_11.jpg 사본이름 꺼내기
	    	System.out.println("사본파일 꺼내기 : " + docInfoDto.getDoc_save());
	    	if(fn == null || fn.equals("")) {
	    		fn = "file_"+docInfoDto.getDoc_no()+ext;	// 저장될 파일명
	    	}else {
	    		fn = fn.substring(0, fn.lastIndexOf("."))+"."+ext;
	     	}
	        System.out.println("저장될 파일명 fn : " + fn);
	     	File f = new File(savePath+"//"+fn);
	        mf.transferTo(f);  // 업로드 진행 
	        docInfoDto.setDoc_save(fn); // 업로드파일이름을 DTO 저장 
	    }
	    if(mfP !=null ) {
	    	String org_pic = mfP.getOriginalFilename();	// 동의서원본파일명
	    	if(org_pic !="" && org_pic != null) {	// 동의서를 첨부한 경우
				docPictureDto.setOrg_pic(org_pic);	// 원본파일명 dto저장.
				System.out.println("원본파일명 " + docPictureDto.getOrg_pic());
				docDao.insertFile(docPictureDto);	// 파일 인서트하기
				int pic_no = docDao.maxNo();	// 파일 인서트하기
				System.out.println("인서트는 실행. // " + pic_no);
				
				// 파일명에서 확장자 찾기		↓()의 위치에서 자르기.		↓파일명에서 마지막 (점.) 위치 찾기
				String ext = org_pic.substring(org_pic.lastIndexOf("."));
				String save_pic = "file_"+ pic_no + ext;	//저장될 이름
				docPictureDto.setPic_no(pic_no); 	// 번호 set
				docPictureDto.setSave_pic(save_pic);	// 사본이름 set
				System.out.println("사본 이름 " + docPictureDto.getSave_pic());
				
				//파일 name -> type으로 저장
				String fileTypeName = "agreement";
				docPictureDto.setFile_type(fileTypeName); 	// 파일타입 dto저장
				System.out.println("파일타입 " + docPictureDto.getFile_type());
				
				docDao.fileUpdate(docPictureDto);	// 파일 업데이트
				File saveFile = new File(savePath+"//"+ save_pic);
				mfP.transferTo(saveFile);
				docPictureDto.setSave_pic(save_pic);
				
				// doc_info의  agree 1로 변경하기.
				String agreeType = docDao.selectAgree(docPictureDto);
				System.out.println("agreement 파일 있는 메일 " + agreeType);
				if (agreeType != null) {
					docInfoDto.setAgree(1);
					docDao.updateAgree(docInfoDto);
					System.out.println("docInfoDto.getAgree : " +docInfoDto.getAgree());
					System.out.println("updateAgree실행 ");
				}else {
					System.out.println("agreement 없음.");
				}
		    }
	    }
	    
	    
	    docInfoDto.setDoc_org(doc_org);
	    System.out.println("doc_save" + docInfoDto.getDoc_save());
	    System.out.println("doc_org " + docInfoDto.getDoc_org());
	    
	    System.out.println("doc_name파라미터 받음?" +docInfoDto.getDoc_name());
	    docDao.updateModify(docInfoDto);	
	    System.out.println("updateModify 완료");
	    model.addAttribute("doc_no",docInfoDto.getDoc_no());
	    
	    System.out.println("org_pic 동의서 원본 : " + docPictureDto.getOrg_pic());
	    System.out.println("save_pic 동의서 원본 : " + docPictureDto.getSave_pic());
	    
		return "doctor/modifyUpdatePro";
	}
	
	//비밀번호 변경
	@RequestMapping("pwUpdate.do")
	public String pwUpdate(Model model, HttpSession session) throws Exception {
		System.out.println("pwUpdate.do 실행");
		
		// 의사 정보 꺼내기.
		String doc_mail = (String)session.getAttribute("doctorMail");
		DocInfoDTO doctor = docDao.getDoctor(doc_mail);
		model.addAttribute("doctor", doctor);
		
		return "doctor/pwUpdate";
	}
	@RequestMapping("pwPro.do")
	public String pwPro(Model model, DocInfoDTO docInfoDto
						, HttpSession session, String new_pw) throws Exception {
		System.out.println("pwPro.do 실행");
		System.out.println("입력한 기존 비번 " + docInfoDto.getDoc_pw());
		System.out.println("새로운 비번 " + new_pw);
		
		// 의사 정보 꺼내기.
		String doc_mail = (String)session.getAttribute("doctorMail");
		DocInfoDTO doctor = docDao.getDoctor(doc_mail);	// DB 비번 꺼내기
		System.out.println("DB 비번  : " +doctor.getDoc_pw());
		if(docInfoDto.getDoc_pw().equals(doctor.getDoc_pw())) { // DB비번과  입력한 비번이 같다면
			docInfoDto.setDoc_pw(new_pw);
			System.out.println("새 비번 DTO에 저장: "+ docInfoDto.getDoc_pw());
			docDao.changePw(docInfoDto);	// 비번 바꾸기.
		}
		return "doctor/pwPro";
	}
	
	// 병원정보 수정
	@RequestMapping("hospitalUpdate.do")
	public String hospitalUpdate(HttpSession session, Model model, DocInfoDTO docInfoDto
								, HospitalDTO hospitalDto, DocMyHospitalDTO docMyHospitalDto) throws Exception {
		System.out.println("hospitalUpdate실행");
		String doc_mail = (String)session.getAttribute("doctorMail");
		// 여기서도 의사정보를 꺼내놓고 병원정보를 꺼내면 됨..
		System.out.println("doc_mail 은 : " + doc_mail);
		DocInfoDTO doctor = docDao.getDoctor(doc_mail);
		System.out.println("doc_info 의 hospital_no : " + doctor.getHospital_no());
		int no = doctor.getHospital_no();

		// 병원 추가정보 꺼내기
		DocMyHospitalDTO hospital = docDao.getHospital(doc_mail);
				
		// 병원정보 꺼내기
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
		System.out.println("hospitalUpdatePro실행");
		System.out.println("doc_mail : " + docMyHospitalDto.getDoc_mail());
		System.out.println("add_no" + docMyHospitalDto.getAdd_no());
		// 파라미터받고, 수정
		MultipartFile mf = request.getFile("hospital_org"); // 파일 객체
		String savePath= request.getRealPath("save");	// 파일 저장 경로
		String hospital_pic_org = mf.getOriginalFilename();		// 원본 파일명
		if(hospital_pic_org != null && hospital_pic_org != "") {
			String ext = hospital_pic_org.substring(hospital_pic_org.lastIndexOf("."));	// 확장자추출
			String fn = docMyHospitalDto.getHospital_pic_save();	// 사본 이름 꺼내기.
			System.out.println(" 사본파일 꺼내기 : " +docMyHospitalDto.getHospital_pic_save());
			if (fn == null || fn.equals("")) {
				fn = "hospital_" + docMyHospitalDto.getAdd_no()+ext;	//저장될 파일명
			}else {
				fn = fn.substring(0,fn.lastIndexOf("."))+"." + ext;
			}
			System.out.println("저장될 파일명  : " + fn);
			File f = new File(savePath+"//"+fn);
			mf.transferTo(f);	// 업로드 진행
			docMyHospitalDto.setHospital_pic_save(fn);	// 업로드파일이름 DTO저장.
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
		//id를 세션꺼내서 확인 후 passwd확인 후 탈퇴, 로그아웃.
		String doc_mail = (String)session.getAttribute("doctorMail");
		docInfoDto.setDoc_mail(doc_mail);
		System.out.println("delete페이지의 doc_mail 은 : " + docInfoDto.getDoc_mail());
		System.out.println("doc_pw 는 : " + docInfoDto.getDoc_pw());
		
		int userCheck = docDao.userCheck(docInfoDto);
		if ( userCheck == 1) {	// 비번이 맞다면.	doc_state를 -1로 변경.
			int check = docDao.deleteDoctor(docInfoDto);
			System.out.println(" check ------- : " + check);
			if(check == 1) {	// userChceck 후 
				// 세션 삭제
				session.invalidate();
			}
			model.addAttribute("check", check);
		}else {
			System.out.println("userCheck 가  틀림.");
		}
		
		
		return "doctor/deletePro";
	}
	
}


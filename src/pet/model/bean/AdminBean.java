package pet.model.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import pet.model.dto.DocInfoDTO;
import pet.model.dto.DocPictureDTO;
import pet.model.dto.MemberDTO;
import pet.model.dto.PageDTO;
import pet.model.service.AdminService;

@RestController
@RequestMapping("/admin/")
public class AdminBean {

	@Autowired
	private AdminService adminService;
	
	// 관리자 메인페이지
	@RequestMapping("adminmain.do")
	public String adminMain() throws Exception{
		return "admin/main/adminMain";
	}
	
	// 회원관리
	@RequestMapping("memberlist.do")
	public String memeberList(PageDTO pageDTO,
			MemberDTO memberDTO,
			Model model,
			@RequestParam(defaultValue ="no") String searchType,
			@RequestParam(defaultValue ="1") int pageNum) throws Exception{
		
		// 페이징 처리
		if(pageNum == 0) {
			pageDTO.setPageNum("1");
		}else {
			pageDTO.setPageNum(Integer.toString(pageNum));
		}		
		int count = adminService.getCountMemberAll(searchType);
		pageDTO.setCount(count);
		pageDTO.paging(pageDTO.getPageNum(), count);
		int start = pageDTO.getStartRow();
		int end = pageDTO.getEndRow();
		
		List memberList = adminService.selectMemberAll(start, end, searchType);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageDTO", pageDTO);
		return "admin/member/adminMemberList";
	}
	
	// 의사회원 관리
	@RequestMapping("doclist.do")
	public String docList(PageDTO pageDTO,
			Model model,
			@RequestParam(defaultValue ="no") String searchType,
			@RequestParam(defaultValue ="1") int pageNum) throws Exception {

		// 페이징 처리
		if(pageNum == 0) {
			pageDTO.setPageNum("1");
		}else {
			pageDTO.setPageNum(Integer.toString(pageNum));
		}		
		int count = adminService.getCountDocAll(searchType);
		pageDTO.setCount(count);
		pageDTO.paging(pageDTO.getPageNum(), count);
		int start = pageDTO.getStartRow();
		int end = pageDTO.getEndRow();
		
		List docList = adminService.selectDocAll(start, end, searchType);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("docList", docList );
		model.addAttribute("pageDTO", pageDTO);
		return "admin/docter/adminDocList";
	}
	
	// 의사회원 정보 확인
	@RequestMapping("contentsdoc.do")
	public String docContents(DocPictureDTO docPictureDTO,
			DocInfoDTO docInfoDTO,
			Model model) throws Exception{
		docInfoDTO = adminService.getDocInfo(docInfoDTO.getDoc_no());
		List docPicturList = adminService.getDocPicture(docInfoDTO.getDoc_mail());
		
		model.addAttribute("docInfoDTO", docInfoDTO);
		model.addAttribute("docPicturList", docPicturList);
		return "admin/docter/adminContentsDoc";
	}
	
	// 의사회원 승인
	@RequestMapping("okdocauthcheck.do")
	public String okDocAuthCheck(String doc_mail) throws Exception{
		adminService.okDocAuthCheck(doc_mail);
		System.out.println(doc_mail);
		return "admin/docter/adminDocAuthCheck";
	}
	
	// 의사회원 미승인
	@RequestMapping("nodocauthcheck.do")
	public String noDocAuthCheck(String doc_mail) throws Exception{
		adminService.noDocAuthCheck(doc_mail);
		return "admin/docter/adminDocAuthCheck";
	}
	
	// 진료과목 태그 관리
	@RequestMapping("adminpricetag.do")
	public String priceTagAll(Model model)throws Exception{		
		List tagList = adminService.selectSubjectAll();
		model.addAttribute("tagList", tagList);
		return "admin/review/adminPriceTag";
	}
	
	// 진료과목 태그 추가
	@RequestMapping("insertpricetag.do")
	public String insertPriceTag(String subject)throws Exception{
		adminService.insertPriceTag(subject);
		
		return "admin/review/adminInsertTag";
	}
	
	// 진료과목태그 삭제
	@RequestMapping("deletepricetag.do")
	public String deletePriceTag(String subject)throws Exception{
		adminService.delSubject(subject);
		
		return "admin/review/adminInsertTag";
	}
}

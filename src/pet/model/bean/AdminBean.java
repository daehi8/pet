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
	
	@RequestMapping("adminmain.do")
	public String adminMain() throws Exception{
		return "admin/main/adminMain";
	}
	
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
	
	@RequestMapping("okdocauthcheck.do")
	public String okDocAuthCheck(String doc_mail) throws Exception{
		adminService.okDocAuthCheck(doc_mail);
		System.out.println(doc_mail);
		return "admin/docter/adminDocAuthCheck";
	}
	
	@RequestMapping("nodocauthcheck.do")
	public String noDocAuthCheck(String doc_mail) throws Exception{
		adminService.noDocAuthCheck(doc_mail);
		return "admin/docter/adminDocAuthCheck";
	}
	
	@RequestMapping("adminpricetag.do")
	public String priceTagAll(Model model)throws Exception{		
		List tagList = adminService.selectSubjectAll();
		model.addAttribute("tagList", tagList);
		return "admin/review/adminPriceTag";
	}
	
	@RequestMapping("insertpricetag.do")
	public String insertPriceTag(String subject)throws Exception{
		adminService.insertPriceTag(subject);
		
		return "admin/review/adminInsertTag";
	}

	@RequestMapping("deletepricetag.do")
	public String deletePriceTag(String subject)throws Exception{
		adminService.delSubject(subject);
		
		return "admin/review/adminInsertTag";
	}
}

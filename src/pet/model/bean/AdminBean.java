package pet.model.bean;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import pet.model.dto.DocInfoDTO;
import pet.model.dto.DocPictureDTO;
import pet.model.dto.MemberDTO;
import pet.model.dto.PageDTO;
import pet.model.dto.PageMaker;
import pet.model.dto.SearchCriteria;
import pet.model.service.AdminService;
import pet.model.service.BoardDaoService;
import pet.model.service.DictService;
import pet.model.service.FreeDaoService;

@RestController
@RequestMapping("/admin/")
public class AdminBean {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private BoardDaoService noticeInfoDAO;
	
	@Autowired
	private FreeDaoService noticefreeDAO;
	
	@Autowired
	private DictService Ddao;
	
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
	public String docContents(
			@RequestParam(defaultValue ="no") String searchType,
			@RequestParam(defaultValue ="1") int pageNum,
			DocPictureDTO docPictureDTO,
			DocInfoDTO docInfoDTO,
			Model model) throws Exception{
		docInfoDTO = adminService.getDocInfo(docInfoDTO.getDoc_no());
		List docPicturList = adminService.getDocPicture(docInfoDTO.getDoc_mail());
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchType", searchType);
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
	
	// 먹이사전 관리
	@RequestMapping("admindict.do")
	public String adminDict(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		
		model.addAttribute("list", Ddao.list(scri));
		PageMaker page = new PageMaker();
		page.setCri(scri);
		page.setTotalCount(Ddao.count(scri));

		model.addAttribute("pageMaker", page);
		
		return "admin/dict/adminDict";
	}
	
	@RequestMapping("adminboard.do")
	public String adminboard( @RequestParam(defaultValue="1") int pageNum , Model model)throws Exception {
		//DB 저장 !!
		List list = null;
		
		int pageSize = 10; //한 페이지의 글의 개수
        int currentPage = pageNum;
        int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호
        int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
        int count = 0;
        int number= 0;

        count = noticeInfoDAO.getArticleCount();//전체 글의 수 
        
        if (count > 0) {
            list = noticeInfoDAO.getArticles(startRow, endRow);//현재 페이지에 해당하는 글 목록
        } else {
            list = Collections.EMPTY_LIST;
        }

		number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호
        //해당 뷰에서 사용할 속성
		model.addAttribute("list",list);
        model.addAttribute("currentPage", new Integer(currentPage));
        model.addAttribute("startRow", new Integer(startRow));
        model.addAttribute("endRow", new Integer(endRow));
        model.addAttribute("count", new Integer(count));
        model.addAttribute("pageSize", new Integer(pageSize));
        model.addAttribute("number", new Integer(number));
		return "admin/board/adminBoard";
	}
	
	@RequestMapping("adminsearchboard.do")
	public String adminsearchboard(@RequestParam(defaultValue = "1")int pageNum, String col , String search,Model model ) throws Exception{
		List list = null;		
		
		int pageSize = 10; //한 페이지의 글의 개수
        int currentPage = pageNum;
        int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호
        int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
        int count = 0;
        int number=0;
        
        count = noticeInfoDAO.getsearchCount(col, search);
        
        if (count > 0) {
            list = noticeInfoDAO.searchList(col, search, startRow, endRow);//현재 페이지에 해당하는 글 목록
        } else {
            list = Collections.EMPTY_LIST;
        }

		number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호
        //해당 뷰에서 사용할 속성
		model.addAttribute("list",list);
        model.addAttribute("currentPage", new Integer(currentPage));
        model.addAttribute("startRow", new Integer(startRow));
        model.addAttribute("endRow", new Integer(endRow));
        model.addAttribute("count", new Integer(count));
        model.addAttribute("pageSize", new Integer(pageSize));
        model.addAttribute("number", new Integer(number));
        model.addAttribute("col",col);
        model.addAttribute("search",search);
        return "admin/board/adminBoard";
	}
	
	@RequestMapping("adminboardfree.do")
	public String adminboardfree( @RequestParam(defaultValue="1") int pageNum , Model model)throws Exception {
		//DB 저장 !!
		List list = null;
		
		int pageSize = 10; //한 페이지의 글의 개수
        int currentPage = pageNum;
        int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호
        int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
        int count = 0;
        int number= 0;

        count = noticefreeDAO.getArticleCount();//전체 글의 수 
        
        if (count > 0) {
            list = noticefreeDAO.getArticles(startRow, endRow);//현재 페이지에 해당하는 글 목록
        } else {
            list = Collections.EMPTY_LIST;
        }

		number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호
        //해당 뷰에서 사용할 속성
		model.addAttribute("list",list);
        model.addAttribute("currentPage", new Integer(currentPage));
        model.addAttribute("startRow", new Integer(startRow));
        model.addAttribute("endRow", new Integer(endRow));
        model.addAttribute("count", new Integer(count));
        model.addAttribute("pageSize", new Integer(pageSize));
        model.addAttribute("number", new Integer(number));
		return "admin/board/adminBoardFree";
	}
	
	@RequestMapping("delmember.do")
	public String delMember(
			int no)throws Exception{
		adminService.delMember(no);
		return "admin/member/adminDelMember";
	}
}

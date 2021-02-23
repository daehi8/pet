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

import pet.model.dto.CheckDTO;
import pet.model.dto.DocInfoDTO;
import pet.model.dto.DocMyHospitalDTO;
import pet.model.dto.DocPictureDTO;
import pet.model.dto.HospitalDTO;
import pet.model.dto.MemberDTO;
import pet.model.dto.PageDTO;
import pet.model.dto.PageMaker;
import pet.model.dto.SearchCriteria;
import pet.model.service.AdminService;
import pet.model.service.BoardDaoService;
import pet.model.service.CheckService;
import pet.model.service.DictService;
import pet.model.service.DocDAOService;
import pet.model.service.FreeDaoService;
import pet.model.service.ReviewService;

@RestController
@RequestMapping("/admin/")
public class AdminBean {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private ReviewService reviewService; 
	
	@Autowired
	private BoardDaoService noticeInfoDAO;
	
	@Autowired
	private FreeDaoService noticefreeDAO;
	
	@Autowired
	private DictService Ddao;
	
	@Autowired
	private DocDAOService docDao;
	
	@Autowired
	private CheckService Cdao;
	
	// 관리자 메인페이지
	@RequestMapping("adminmain.do")
	public String adminMain(Model model) throws Exception{
		String searchType = null;
		
		int docCount = adminService.getCountDocAll(searchType);
		int reviewCount = reviewService.getListAuthCheckReviewCount(searchType);
		
		List reviewList = adminService.selectAuthNoReviewList();
		List docList = adminService.selectAuthNoDocList();
		
		model.addAttribute("docCount", docCount);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("docList", docList);
		
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
	
	@RequestMapping("hospitalForm.do")
	   public String hospitalForm(DocPictureDTO docPictureDto
	                        ,DocInfoDTO docInfoDto, Model model
	                        , HospitalDTO hospitalDto, DocMyHospitalDTO docMyHospitalDto) throws Exception {
	      System.out.println("hospitalForm.do 실행");
	      System.out.println("doc_mail  : " + docPictureDto.getDoc_mail());
	      String doc_mail = docInfoDto.getDoc_mail();
	      DocInfoDTO doctor = docDao.getDoctor(doc_mail);
	      int no = doctor.getHospital_no();

	      // 병원 추가정보 꺼내기
	      DocMyHospitalDTO hospital = docDao.getHospital(doc_mail);
	                     
	      // 병원정보 꺼내기
	      HospitalDTO hospitalDB = docDao.getHospitalDB(no);
	      
	      List pictureList = adminService.getDocPicture(doc_mail);

	      model.addAttribute("pictureList", pictureList);
	      model.addAttribute("doc_mail", doc_mail);
	      model.addAttribute("hospital", hospital);
	      model.addAttribute("hospitalDB", hospitalDB);
	      
	      return "admin/hospitalForm";
	   }
	
	
	// hospital테이블에서 병원이름 검색.
	@RequestMapping("confirmName.do")
	public String confirmName(HospitalDTO hospitalDto, String hospital_name, Model model) throws Exception {
		System.out.println("confirmName 실행 ");
		System.out.println("hospital_name  : " + hospital_name);
		hospitalDto.setName(hospital_name);
		System.out.println("DTO name : " + hospitalDto.getName());
		
		List nameList = null;	// 중복이름목록
		int nameCount = adminService.getNameCount();	// 동일 이름 갯수 검색.
		if(nameCount > 0) { // 동일이름 있으면 List로 목록꺼내기
			nameList = adminService.nameList(hospitalDto);//현재 페이지에 해당하는 글 목록
		}else {
			nameList = Collections.EMPTY_LIST;
		}
		model.addAttribute("nameList", nameList);
		model.addAttribute("nameCount", new Integer(nameCount));
        
		return "admin/confirmName";
	}
	@RequestMapping("hospitalPro.do")
	public String hospitalPro(DocMyHospitalDTO docMyHospitalDto
								,DocInfoDTO docInfoDto) throws Exception {
		System.out.println("hospitalPro실행 ");
		// 파라미터 받아 병원추가정보입력.
		System.out.println(docMyHospitalDto.getDoc_mail());
		adminService.updateHospital(docMyHospitalDto);
		// doc_info에 병원 번호 , 의사이름 (hospital_no, doc_name ) 수정해주기.
		adminService.updateDoc_info(docInfoDto);
		
		return "admin/hospitalPro";
	}
	
	@RequestMapping("admincheck.do")
	public String admincheck(Model model) throws Exception{
		List checkList = Cdao.checkList();
		model.addAttribute("checkList", checkList);

		return "admin/check/adminCheck";
	}
	
	@RequestMapping("admincheckcontents.do")
	public String CheckContents(Model model, CheckDTO checkDTO) throws Exception{
		List<CheckDTO> list = Cdao.list(checkDTO.getCheck_no());
		model.addAttribute("list", list);
		
		return "admin/check/adminCheckContents";
	}
	
	@RequestMapping("admincheckdel.do")
	public String deleteList(Model model, CheckDTO checkDTO) throws Exception{
		Cdao.deleteList(checkDTO.getCheck_no());
		return "admin/check/adminDelCheck";
	}
}

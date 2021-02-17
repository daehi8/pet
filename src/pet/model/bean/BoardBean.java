package pet.model.bean;

import java.io.File;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import pet.model.service.BoardDaoService;
import pet.model.service.BoardReplyDTO;
import pet.model.service.NoticeInfoDTO;

@Controller
@RequestMapping("/board/")
public class BoardBean {

	
	@Autowired
	private BoardDaoService noticeInfoDAO = null;
	
	@RequestMapping("writeForm.do")
	public String writeForm()throws Exception {
		return "board/writeForm";
	}
	
	@RequestMapping("writePro.do")
	public String writePro(MultipartHttpServletRequest request, NoticeInfoDTO dto )throws Exception {
		noticeInfoDAO.insertArticle(dto);  // 업로드제외한 나머지 DB insert
		int maxNum = noticeInfoDAO.getMaxNum();
		String path = request.getRealPath("resource/noticeBoardFile");  // 업로드경로 
		// 파일 업로드 
		MultipartFile mf = request.getFile("img");
//		List  mfs = request.getFiles("boardimage");
		String org = mf.getOriginalFilename(); 
		if(org !=  "" && org == null) {
			String ext = org.substring(org.lastIndexOf("."));  //확장자 추출 
			//업로드 진행 
			String sysName = "file_"+maxNum+ext;
			File f = new File(path+"//"+sysName);
			mf.transferTo(f);  // 업로드 진행 
			dto.setBoardimage(sysName); // 업로드파일이름을 DTO 저장 
			dto.setNum(maxNum);  //글번호 저장
			noticeInfoDAO.fileUpdate(dto);
		}
		
		return "board/writePro";
	}
	
	@RequestMapping("list.do")
	public String list( @RequestParam(defaultValue="1") int pageNum , Model model)throws Exception {
		//DB 저장 !!
		List list = null;
		
		
		int pageSize = 10; //한 페이지의 글의 개수
        int currentPage = pageNum;
        int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호
        int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
        int count = 0;
        int number= 0;

        count = noticeInfoDAO.getArticleCount();//전체 글의 수 
        System.out.println(count);
        
        
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
		return "board/list";
	}
	
	@RequestMapping("content.do")
	public String content( int num  , Model model) throws Exception{
		// 조회수
		noticeInfoDAO.NoticeInfoCnt(num);
		// 글읽기
		NoticeInfoDTO dto = noticeInfoDAO.getArticle(num);
		// 댓글 
		List reply = noticeInfoDAO.reply(num);
		model.addAttribute("dto" , dto);
		model.addAttribute("reply" , reply);
		 
		
		
		return "board/content";
	}
	
	
		// 게시글 수정
	@RequestMapping("updateForm.do")
	public String update(int num, Model model) throws Exception {
		NoticeInfoDTO dto = noticeInfoDAO.getArticle(num);
		model.addAttribute("dto" , dto);
		return "board/updateForm";		 
	}
	
	@RequestMapping("updatePro.do")
	public String update(MultipartHttpServletRequest request, NoticeInfoDTO dto , Model model ) throws Exception {

		MultipartFile mf = request.getFile("img");
		String path = request.getRealPath("resource/noticeBoardFile");  // 업로드경로 
		String org = mf.getOriginalFilename(); 
		if(org !=  "" && org != null) {
			String ext = org.substring(org.lastIndexOf("."));  //확장자 추출 
			
			String fn = dto.getBoardimage();  // file_11.jpg

			if(fn == null || fn.equals("")) {
				fn = "file_"+dto.getNum()+ext;
			}else {
				fn = fn.substring(0, fn.lastIndexOf("."))+"."+ext;
			}
			
			File f = new File(path+"//"+fn);
			mf.transferTo(f);  // 업로드 진행 
			dto.setBoardimage(fn); // 업로드파일이름을 DTO 저장 
		}
		noticeInfoDAO.update(dto);
		model.addAttribute("num",dto.getNum());
		return "board/updatePro";
		 
	}
	
	
		// 게시글 삭제
	@RequestMapping("deleteForm.do")
	public String delete(int num , Model model) throws Exception{
		model.addAttribute("num",num);
		return "board/deleteForm";
		
	}
	
	@RequestMapping("deletePro.do")
	public String deletePro(int num) throws Exception{
		noticeInfoDAO.deleteArticle(num);
		return "board/deletePro";
	}
	//댓글 작성
	@RequestMapping("writeReplyPro.do")
	public String writeReplyPro(BoardReplyDTO dto, Model model) throws Exception{
		noticeInfoDAO.writReply(dto);
		model.addAttribute("dto",dto);
		return "board/writeReplyPro";
	}
	//댓글 삭제
	@RequestMapping("deleteReplyPro.do")
	public String deleteReplyPro(@RequestParam int rno, @RequestParam int num, Model model) throws Exception{
		noticeInfoDAO.deleteReply(rno);
		model.addAttribute("num",num);
		return "board/deleteReplyPro";
	}
	
	// 검색 
	@RequestMapping("searchList.do")
	public String searchList(@RequestParam(defaultValue = "1")int pageNum, String col , String search,Model model ) throws Exception{
		List list = null;		
		
		int pageSize = 10; //한 페이지의 글의 개수
        int currentPage = pageNum;
        int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호
        int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
        int count = 0;
        int number=0;
        
        count = noticeInfoDAO.getsearchCount(col, search);
        System.out.println(count);
        
        
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
		return "board/list";
	}	
}

























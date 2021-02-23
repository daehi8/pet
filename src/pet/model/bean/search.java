package pet.model.bean;

import java.util.Collections;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriComponentsBuilder;

import pet.model.service.SearchService;

@Controller
public class search {
	private int page;
	private int perPageNum;
	//속성 searchType, keyword 추가
	private String searchType;
	private String keyword;
	
	@Autowired
	private SearchService searchDAO = null;
	
	public search() {
		this.page = 1;
		this.perPageNum = 10;
        this.searchType = null;
		this.keyword = null;
		
	}
	public int getPageStart() {
		return (this.page - 1)*perPageNum;
	}
	
	@RequestMapping("sc.do")
	public String sc()throws Exception{
		return "main/sc";
	}
	
	@RequestMapping("test.do")
	public String test(@RequestParam(defaultValue="1")int pageNum , @RequestParam(defaultValue="강남")String search , Model model)throws Exception{
		
		int pageSize = 10;
		int currentPage = pageNum;
	    int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호
	    int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
	    int count = 0;
	    int number=0;
		
		List HospitalList = null;
		
		count = searchDAO.getHospitalListCount(search);
		
		if (count > 0) {
			HospitalList = searchDAO.getHospitalList(search,startRow, endRow);
		}else {
			HospitalList = Collections.EMPTY_LIST;
		}
		
		List cityList = searchDAO.getCity(search);
		
		number=count-(currentPage-1)*pageSize;
		
		model.addAttribute("currentPage", new Integer(currentPage));
        model.addAttribute("startRow", new Integer(startRow));
        model.addAttribute("endRow", new Integer(endRow));
        model.addAttribute("count", new Integer(count));
        model.addAttribute("pageSize", new Integer(pageSize));
        model.addAttribute("number", new Integer(number));
        model.addAttribute("HospitalList", HospitalList);
        model.addAttribute("search", search);
        model.addAttribute("cityList", cityList);
        
        
		List list = searchDAO.getSearch(search);
		model.addAttribute("list",list);
		List reviewlist = searchDAO.getTestReview(search);
		model.addAttribute("reviewlist", reviewlist);
		List hospitallist = searchDAO.getHospital(search);
		model.addAttribute("hospitallist", hospitallist);
		List docinfolist = searchDAO.getDocInfo(search);
		model.addAttribute("docinfolist", docinfolist);
		
		
		return "main/test";
	}
    
    //getter, setter
	
    
	//searchType, keyword 추가
	public String makeQuery() {
		UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", this.perPageNum);
				
		if (searchType!=null) {
			uriComponentsBuilder
					.queryParam("searchType", this.searchType)
					.queryParam("keyword", this.keyword);
		}
		return uriComponentsBuilder.build().encode().toString();
	}
	@Override
	public String toString() {
		return "search [page=" + page + ", perPageNum=" + perPageNum + ", searchType=" + searchType + ", keyword="
				+ keyword + "]";
	}
}
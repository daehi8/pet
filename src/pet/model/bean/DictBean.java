package pet.model.bean;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pet.model.dto.Criteria;
import pet.model.dto.DictDTO;
import pet.model.dto.PageMaker;
import pet.model.dto.SearchCriteria;
import pet.model.service.DictService;

@Controller
@RequestMapping("dict")
public class DictBean {
	
	@Autowired
	private DictService Ddao = null;
	
	// 목록 + 페이징 + 검색
	@RequestMapping(value = "dict", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		/* int sadasd(디폴트)) */
		
		model.addAttribute("list", Ddao.list(scri));
		PageMaker page = new PageMaker();
		page.setCri(scri);
		page.setTotalCount(Ddao.count(scri));

		model.addAttribute("pageMaker", page);
		
		return "dict/dict";
	}
	
	// 게시물 등록 (서버에서 사용자로 데이터 이동 	GET메서드)
	@RequestMapping(value = "dictAdd", method = RequestMethod.GET)
	public void getAdd() throws Exception {
  
	}
	
	// 게시물 등록 (사용자에서 서버로 데이터 이동	POST메서드)
	@RequestMapping(value= "dictAdd", method = RequestMethod.POST)
	public String postAdd(DictDTO dto, Model model) throws Exception {
		
		Ddao.write(dto);
	 	
		return "redirect:/admin/admindict.do";	
	}
	
	// 게시물 조회
	@RequestMapping(value="dictRead", method = RequestMethod.GET)
	public String getRead(DictDTO dto, Model model, 
				@ModelAttribute("scri") SearchCriteria scri) throws Exception {
		
		model.addAttribute("read", Ddao.read(dto.getDict_no()));
		model.addAttribute("scri", scri);
		
		return "dict/dictRead";

	}

	// 게시물 수정
	@RequestMapping(value="dictModify", method = RequestMethod.GET)
	public void getModify(@RequestParam("dict_no") int dict_no, 
			@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		
		DictDTO dto = Ddao.read(dict_no);
		
		model.addAttribute("modify", dto);
		model.addAttribute("scri",scri);
	}

	// 게시물 수정 POST
	 @RequestMapping(value = "dictModify", method = RequestMethod.POST)
	 public String postModify(DictDTO dto, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
	  
	  Ddao.update(dto);
	 	//RedirectAttributes rttr
	  //rttr.addAttribute("page",scri.getPage());
	  //rttr.addAttribute("perPageNum",scri.getPerPageNum());
	  //rttr.addAttribute("searchType",scri.getSearchType());
	  //rttr.addAttribute("keyword",scri.getKeyword());
	  
	  return "redirect:/admin/admindict.do";	
	  
	 }
	 
	// 게시물 삭제
		@RequestMapping(value="dictDelete", method = RequestMethod.GET)
		public void getDelete(@RequestParam("dict_no") int dict_no, Model model) throws Exception {
				
		model.addAttribute("delete", dict_no);
		
		}

	// 게시물 삭제
	@RequestMapping(value="dictDelete", method = RequestMethod.POST)
	public String postDelete(@RequestParam("dict_no") int dict_no,
			@ModelAttribute("scri") SearchCriteria scri) throws Exception {
			
	Ddao.delete(dict_no);	
	
	return "redirect:/admin/admindictt.do";	
	}
}
	

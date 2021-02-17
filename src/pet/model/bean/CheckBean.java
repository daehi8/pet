package pet.model.bean;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pet.model.dto.CheckDTO;
import pet.model.dto.DictDTO;
import pet.model.dto.SearchCriteria;
import pet.model.service.CheckService;

@Controller
@RequestMapping("check")
public class CheckBean {
	
	@Autowired
	private CheckService Cdao = null;
	
	@RequestMapping(value = "check", method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		List<CheckDTO> list;
		list = Cdao.list();
		model.addAttribute("list", list);
		
		return "check/check";
		}
	
	//  게시물 등록
	@RequestMapping(value="checkAdd", method = RequestMethod.GET)
	public void getAdd() throws Exception {
		  
	}
	
	// 게시물 등록 (사용자에서 서버로 데이터 이동	POST메서드)
	@RequestMapping(value= "checkAdd", method = RequestMethod.POST)
	public String postAdd(CheckDTO dto, Model model) throws Exception {
			
		Cdao.write(dto);
		 	
		return "redirect:/check/check.do";	
		}
	
	// 게시물 조회
	@RequestMapping(value="checkRead", method = RequestMethod.GET)
	public String getRead(CheckDTO dto, Model model) throws Exception {

		model.addAttribute("read", Cdao.read(dto.getNo()));
		return "check/checkRead";
	}
	
	// 게시물 수정 GET
	@RequestMapping(value="checkModify", method = RequestMethod.GET)
	public void getModify(@RequestParam("no") int no,
			Model model) throws Exception {

		CheckDTO dto = Cdao.read(no);
		model.addAttribute("modify", dto);
	}
	
	// 게시물 수정 POST
	@RequestMapping(value="checkModify", method = RequestMethod.POST)
	public String postModify(CheckDTO dto) throws Exception {

		Cdao.update(dto);
		
		return "redirect:/check/check.do";
	}
	
	// 게시물 삭제
	@RequestMapping(value="delete", method = RequestMethod.POST)
	public String delete(CheckDTO dto) throws Exception {

		Cdao.delete(dto.getNo());
		
		return "redirect:/check/check.do";
	}
	@RequestMapping(value = "checkPro", method = RequestMethod.POST)
	public String result(Model model, HttpServletRequest request)throws Exception{
			
			int count = Cdao.count();
			int score = 0;
			int total = 0;
			String level = "";
	
			
			
			for(int i=1; i < count+1 ; i++){
		         String ans = request.getParameter("answer"+i);
		         if(ans.equals("5")){score=5;}
		         else if(ans.equals("4")){score=4;}
		         else if(ans.equals("3")){score=3;}
		         else if(ans.equals("2")){score=2;}
		         else {score=1;}
		         System.out.println(ans);
		         
		         total += score;

		         if (total <8){
		             level = "스트레스가 없군요. 걱정하지 마세요.";
		          }
		          else if (total <13){
		             level = "스트레스를 받고 있으나 심하지 않네요. "
		             		+ "스트레스를 해소할 수 있는 방법을 본인 스스로 찾아보세요.";
		          }
		          else {
		             level = "스트레스를 심하게 받고 있습니다. 스트레스를 해소하기 위해 "
		             		+ "본인 스스로의 노력뿐 아니라 다른 사람의 도움도 필요합니다.";
		          }
		    
			model.addAttribute("score", score);
			model.addAttribute("total", total);
			model.addAttribute("level", level);
			}
			return "check/checkPro";
	}
	
	  	}

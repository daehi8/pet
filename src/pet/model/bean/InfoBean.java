package pet.model.bean;

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

import pet.model.dto.PriceReviewDTO;
import pet.model.dto.PageMaker;
import pet.model.dto.SearchCriteria;
import pet.model.service.InfoService;

@Controller
@RequestMapping("info")
public class InfoBean {

	@Autowired
	private InfoService Idao = null;	

	@RequestMapping(value = "info", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		model.addAttribute("list", Idao.list(scri));
		PageMaker page = new PageMaker();
		page.setCri(scri);
		page.setTotalCount(Idao.count(scri));

		model.addAttribute("pageMaker", page);
		
		return "info/info";
		}

	@RequestMapping(value= "infoRead", method= RequestMethod.GET)
	public String getRead(PriceReviewDTO dto, Model model, HttpServletRequest request) throws Exception {			
		String subject_info = request.getParameter("subject_info");
		
		model.addAttribute("subject_info", subject_info);
		System.out.println(subject_info);
		
		model.addAttribute("scount", Idao.scount(subject_info));
		model.addAttribute("max", Idao.max(subject_info));
		model.addAttribute("min", Idao.min(subject_info));
		model.addAttribute("avg", Idao.avg(subject_info));

		model.addAttribute("read", Idao.read(subject_info));
		
		model.addAttribute("join1", Idao.join(1, 10000, subject_info));
		model.addAttribute("join2", Idao.join(10000, 50000, subject_info));
		model.addAttribute("join3", Idao.join(50000, 100000, subject_info));
		model.addAttribute("join4", Idao.join(100000, 1000000, subject_info));
		
		System.out.println(Idao.read(subject_info));
		model.addAttribute("num1", Idao.getCount(1, 10000, subject_info));
		model.addAttribute("num2", Idao.getCount(10000, 50000, subject_info));
		model.addAttribute("num3", Idao.getCount(50000, 100000, subject_info));
		model.addAttribute("num4", Idao.getCount(100000, 10000000, subject_info));
		
		//for(int i = 1; i <= 4; ++i) {
		//int start = 1000 * i;
		//	int end = start + 5000;
		//	model.addAttribute("num_" + i, Idao.getCount(start, end, subject_info));}
		
		return "info/infoRead";
		
	}
}
	 




package pet.model.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pet.model.service.MapService;

@Controller
public class MapController {

	@Autowired
	private MapService mapDAO = null;
	
	@Autowired
	private MapService MapServiceImpl = null;
	
	@RequestMapping("map.do")
	public String map(Model model) throws Exception{
		model.addAttribute("map", mapDAO.selectAll());	
		return "/map";
	}
}

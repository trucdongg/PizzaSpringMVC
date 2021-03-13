package pizza.controller;

import javax.servlet.ServletContext;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/new")
public class NewConTroller {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;
	@RequestMapping("/newhome")
	public String newhome(ModelMap mm){
		mm.addAttribute("slider",true);
		return "newhome";
	}
	@RequestMapping("/newmenu")
	public String newmenu(ModelMap mm){
		mm.addAttribute("slider",false);
		return "newmenu";
	}
	@RequestMapping("/newdangky")
	public String newdangky(ModelMap mm){
		mm.addAttribute("slider",false);
		return "newdangky";
	}
	
}

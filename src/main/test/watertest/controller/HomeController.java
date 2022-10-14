package watertest.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import watertest.Dao.testdao;

@Controller
@RequestMapping("/")
public class HomeController {

	@Autowired
	testdao testdao;

	@Autowired
	HttpSession session;

	@GetMapping("LOGIN")
	public String home() {
//		testdao.getUser();
		return "petHomepage";
	}

	@GetMapping("test")
	@ResponseBody
	public String test(String userid) {
		System.out.println(userid);
		session.setAttribute("USERID", userid);
		return "TEST";
	}
}

package project.data.ro.board;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class C {

	@RequestMapping("/c.do")
	public String a3(@RequestParam Map map, Model model) {
		int no = Integer.parseInt(String.valueOf(map.get("no11")));
		
		System.out.println(Integer.parseInt((String) map.get("no11")));
		System.out.println(map.get("kk"));
		System.out.println(map.get("no11").getClass());
		System.out.println(map.get("no11").getClass().getName());
		return "c";
	}
}

package project.data.ro.map;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Controller
@RequestMapping("/map")
public class MapController {

	@Autowired
	MapMapper mapper;

	// 테스트용
	@RequestMapping("/map.do")
	public String map() {
		return "map/map";
	}

	@RequestMapping(value="/mapcourselist.do", produces = "application/text; charset=UTF-8" )
	@ResponseBody
	public String get(MapVO vo, Model model) throws JsonProcessingException {
		// board_no 받아서 조건 추가해야함 배열에 넣을때 순서 정확성 위해 course_no로 순서주기 
		List<MapVO> courseList = mapper.list(vo);
		
		//System.out.println(courseList);
		//model.addAttribute("courseList", courseList);

		String json = new ObjectMapper().writeValueAsString(courseList);
		return json;
	}
	
	@RequestMapping("/mapinsert.do")
	@ResponseBody
	public MapVO[] printc(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String json = req.getParameter("json");
		Gson gson = new Gson();
		MapVO[] list = gson.fromJson(json, MapVO[].class);

		for(int i=0; i<list.length; i++) {
			list[i].setCourse_no(i+1);
			mapper.insert(list[i]);
		}
		// 리턴필요없음. 나중에 void로 바꾸자.
		return list;
	}
}
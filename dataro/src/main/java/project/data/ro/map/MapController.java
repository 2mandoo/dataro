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

import com.google.gson.Gson;

import project.data.ro.board.BoardVO;

@Controller
@RequestMapping("/map")
public class MapController {
   
   @Autowired
   MapMapper mapper;
   
   @RequestMapping("/map.do")
   public String map() {
	   return "map/map";
   }
   
   @RequestMapping("/get.do")
   @ResponseBody
   public List<MapVO> get(Model model) {
      List<MapVO> courseList = mapper.list();
 
      model.addAttribute("courseList", courseList);
      return courseList;
   }
   
   
   @RequestMapping("/print.do")
   @ResponseBody
   public MapVO[] printc(HttpServletRequest req, HttpServletResponse res) throws IOException {
      String json = req.getParameter("json");
      Gson gson = new Gson();
      MapVO[] list = gson.fromJson(json, MapVO[].class);
      
      for(int i=0; i<list.length; i++) {
         int a= mapper.insert(list[i]);
         System.out.println(list[i]);
         System.out.println(a);
      }
      return list;
   }
}
package project.data.ro.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ReplyController {
	
	@Autowired
	ReplyService service;
	
	@GetMapping("/reply/list.do")
	public String list(ReplyVO vo, Model model) { 
		System.out.println(vo);
		model.addAttribute("reply", service.list2(vo));
		return "common/comment2";
	}

	@GetMapping("/reply/replyList.do")
	@ResponseBody
	public List replyList(ReplyVO vo, Model model) { 
		
		return service.replyList(vo);
	}
	
	@GetMapping("/reply/insert.do")
	@ResponseBody
	public String insert(ReplyVO vo, Model model){
		if(service.insert2(vo)) {
			return "success";
		} else {
			return "fail";
		}
	}
	@GetMapping("/reply/reply.do")
	@ResponseBody
	public String reply(ReplyVO vo, Model model){
		if(service.reply(vo)) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@GetMapping("/reply/delete.do")
	public String delete(ReplyVO vo, Model model) {
		if(service.delete(vo.getReply_no())) {
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "list.do");
			return "common/alert2";
		} else {
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			return "common/alert2";
		}
	}
	@GetMapping("/reply/update.do")
	public String update(ReplyVO vo, Model model) {
		if(service.update2(vo)) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "list.do");
			return "common/alert2";
		} else {
			model.addAttribute("msg", "수정에 실패하였습니다.");
			return "common/alert2";
		}
	}

}

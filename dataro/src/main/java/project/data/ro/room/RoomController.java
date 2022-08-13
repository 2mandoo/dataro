package project.data.ro.room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.data.ro.reply.ReplyService;
import project.data.ro.reply.ReplyVO;

@Controller
@RequestMapping("/room")
public class RoomController {
	@Autowired 
	RoomService rservice;
	@Autowired
	ReplyService rpservice;
	
	//모임방리스트(상세보기떄문에임시로만듬/삭제예정)
	@RequestMapping("/list")
	public String list(RoomVO vo,Model model) {
		model.addAttribute("list", rservice.list(vo));
		return "room/list";
	}
	//모임방상세보기
	@RequestMapping("/view")
	public String view(RoomVO vo,Model model) {
		model.addAttribute("view", rservice.view(vo.getRoom_no()));
		vo.setBoard_name("게시판"); 
		return "room/view";
	}
	//모임방채팅리스트
	@RequestMapping("/chatlist")
	public String chatlist(ReplyVO vo,Model model) {
		model.addAttribute("list",rpservice.list(vo));
		return "room/chat";
	}
	//모임방채팅글쓰기
	@RequestMapping("/chatWrite")
	public String chatWrite(ReplyVO vo,@RequestParam int room_no) {
		vo.setMember_no(5);
		rpservice.insert(vo);
		System.out.println("*************방번호"+room_no);
		return "redirect:/room/view?room_no="+room_no+"&member_no="+1;
	}
}

package project.data.ro.room;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import project.data.ro.member.MemberVO;
import project.data.ro.reply.ReplyService;
import project.data.ro.reply.ReplyVO;

@Controller
@RequestMapping("/room")
public class RoomController {
	@Autowired
	RoomService rservice;
	@Autowired
	ReplyService rpservice;

	// 모임방상세보기
	@RequestMapping("/view")
	public String view(RoomVO vo, Model model) {
		model.addAttribute("view", rservice.view(vo.getRoom_no()));
		vo.setBoard_name("게시판"); 
		return "room/room";
	}

	// 모임방채팅리스트
	@RequestMapping("/chatlist")
	public String chatlist(ReplyVO vo, Model model, MemberVO mvo) {
		model.addAttribute("list", rpservice.list(vo));
		return "room/chat";
	}

	// 모임방채팅글쓰기
	@RequestMapping("/chatWrite")
	public String chatWrite(ReplyVO vo) {
		rpservice.insert(vo);

		System.out.println("*************방번호" + vo.getRoom_no());

		return "redirect:/room/view?room_no=" + vo.getRoom_no() + "&member_no=" + 1;
	}

	//=================================정현===============================
	@PostMapping("/write.do")
	@ResponseBody
	public int writeRoom(RoomVO vo) {
		System.out.println(vo);
		System.out.println("방제목"+vo.getRoom_title());
		
		System.out.println("3333333333333333333333333333"+vo);
		System.out.println("3333333333333333333333333333"+vo);

		return rservice.makeRoom(vo);
	}

	@GetMapping("/room.do")
	public String enterRoom(RoomVO vo, HttpSession sess) {
		
		 MemberVO mvo = (MemberVO)sess.getAttribute("loginInfo");
		 vo.setRoom_participant_no(mvo.getMember_no());
		 System.out.println(vo.getRoom_participant_no());

		// no=[ ] 로 파라미터 넘어오니 받고 session에 있는 로그인 정보 를 이용해서 디비에 참여자 추가시켜야함.
		int r = rservice.checkRoom(vo);
		if (r == 0) {
			rservice.enterRoom(vo);
		}
		// if문으로 proom 디비로 로그인정보가 방넘버 만든이랑 같으면 proommember 디비에 넣지 말고 바로 리턴시켜주면 됨.
		return "room/room";
	}

//	 @PostMapping("/room.do")
//	 @ResponseBody 
//	 public Integer roomCheck(RoomVO vo, HttpSession sess) {
//	 
//	 MemberVO mvo = (MemberVO)sess.getAttribute("loginInfo");
//	 vo.setRoom_participant_no(mvo.getMember_no());
//	 
//	 // no=[ ] 로 파라미터 넘어오니 받고 session에 있는 로그인 정보 를이용해서 디비에 참여자 추가시켜야함. 
//	 int r = rservice.checkRoom(vo);
//	 
//	 return r; 
//	 }
//	 

	@GetMapping("/pwdForm.do")
	public String pwdForm(RoomVO vo) {
		return "room/pwdCheck";
	}

	@PostMapping("/pwdCheck.do")
	public String pwdCheck(RoomVO vo) {
		int r = rservice.pwdCheck(vo);
		if (r == 1) {
			return "redirect:/room/room.do?room_no=" + vo.getRoom_no();
		} else {
			return "redirect:/board/view.do";
		}

	}
	
	//=================================정현===============================

}

package project.data.ro.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import project.data.ro.map.MapMapper;
import project.data.ro.member.MemberService;
import project.data.ro.member.MemberVO;
import project.data.ro.message.MessageVO;
import project.data.ro.room.RoomVO;
import project.data.ro.util.CategoryMapper;
import project.data.ro.util.CategoryVO;
import project.data.ro.util.FileVO;
import project.data.ro.util.UtilService;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@Autowired
	MemberService mService;

	@Autowired
	UtilService uservice;
	
	@Autowired
	MapMapper mapper;
	
	////////////////////////////////진경시작////////////////////////////////////////
	//여행코스 글쓰기화면
	@GetMapping("/travelWrite.do")
	public String write(Model model) {
		model.addAttribute("category",uservice.writeCategory());
		return "travelboard/write";
	}
	
	// 여행코스 글쓰기 from 진콩
	@PostMapping("/insert.do")
	public String insert(BoardVO bvo,CategoryVO cvo,@RequestParam List<Integer> hashtag_no,
				FileVO fvo,@RequestParam MultipartFile[] filename, HttpServletRequest req) {
		service.insert(bvo);
		uservice.insert(cvo,bvo,hashtag_no);
		uservice.fileupload(fvo, filename, req,bvo);
		mapper.update(bvo);
		return "redirect:/board/travelWrite.do";
	}
	//여행코스 글쓰기 수정
	@RequestMapping("/update.do")
	public String update(BoardVO bvo) {
		
		return "travelboard/update";
	}
	
	@RequestMapping("/region_detail")
	@ResponseBody
	public Map regionDatail(String rs) {
		System.out.println("실험"+rs);
		System.out.println("결과"+uservice.regionDetail(rs));
		Map a = new HashMap();
		a.put("aaa", a);
		return a;
	}
	
	////////////////////////////////진경끝////////////////////////////////////////
	
	// 마이페이지 내가 쓴 게시물 상세보기
	@PostMapping("/view")
	public String view(BoardVO vo, Model model) {
		BoardVO data = service.view(vo.getBoard_no());
		model.addAttribute("data", data);
		return "board/view";
	}

	// 마이페이지 내가 좋아요 누른 게시물 상세보기
	@PostMapping("/view2")
	public String view2(BoardVO vo, Model model) {
		BoardVO data = service.view(vo.getBoard_no());
		model.addAttribute("data", data);
		return "board/view2";
	}
	
	// 마이페이지 내가 쓴 게시글 보기
	@RequestMapping("/myList1")
	public String mylist1(BoardVO vo, Model model, HttpSession sess) {
		MemberVO vo1 = (MemberVO) sess.getAttribute("loginInfo");
		int no = vo1.getMember_no();
		vo.setMember_no(no);
		model.addAttribute("data", service.myList1(vo));
		return "board/myList1";
	}
	
	// 마이페이지 내가 쓴 댓글 보기
	@PostMapping("/myList2")
	public String mylist2(BoardVO vo, Model model, HttpSession sess) {
		MemberVO vo1 = (MemberVO) sess.getAttribute("loginInfo");
		int no = vo1.getMember_no();
		vo.setMember_no(no);
		System.out.println(vo);
		model.addAttribute("data", service.myList2(vo));
		return "board/myList2";
	}
	
	// 마이페이지 내가 좋아요 누른 게시글 보기
	@PostMapping("/myList3")
	public String mylist3(BoardVO vo, Model model, HttpSession sess) {
		MemberVO vo1 = (MemberVO) sess.getAttribute("loginInfo");
		int no = vo1.getMember_no();
		vo.setMember_no(no);
		model.addAttribute("data", service.myList3(vo));
		return "board/myList3";
	}
	
	// 마이페이지 내가 받은 쪽지 보기
	@PostMapping("/myList4")
	public String mylist4(MessageVO vo, Model model, HttpSession sess) {
		MemberVO vo1 = (MemberVO) sess.getAttribute("loginInfo");
		int no = vo1.getMember_no();
		vo.setReceive_member_no(no);
		model.addAttribute("data", service.myList4(vo));
		return "board/myList4";
	}
	
	// 마이페이지 내가 보낸 쪽지 보기
	@PostMapping("/myList5")
	public String mylist5(MessageVO vo, Model model, HttpSession sess) {
		MemberVO vo1 = (MemberVO) sess.getAttribute("loginInfo");
		int no = vo1.getMember_no();
		vo.setSend_member_no(no);
		model.addAttribute("data", service.myList5(vo));
		return "board/myList5";
	}
	
	// 마이페이지 내가 참여한 채팅방 보기
	@PostMapping("/myList6")
	public String mylist6(RoomVO vo, Model model, HttpSession sess) {
		MemberVO vo1 = (MemberVO) sess.getAttribute("loginInfo");
		int no = vo1.getMember_no();
		vo.setRoom_participant_no(no);
		model.addAttribute("list", service.myList6(vo));
		return "board/myList6";
	}
	
	
	// main 
	@GetMapping("/main.do")
	public String mainGet(Model model, BoardVO vo, MessageVO mvo, HttpSession sess) {
		MemberVO vo1 = (MemberVO) sess.getAttribute("loginInfo");
		model.addAttribute("list",service.list(vo));
		if (vo1 != null) {
			int num = vo1.getMember_no();
			mvo.setReceive_member_no(num);
			int num2 = mService.alarmForMessage(mvo);
			String result = String.valueOf(num2); 
			model.addAttribute("UnreadMsgs", result);
			return "board/main";
		}
		return "board/main";
	}
	
	//정현
	@GetMapping("/view.do")
	public String view(BoardVO vo, RoomVO rvo, Model model) {
		int a =8;
		model.addAttribute("test222", a);
		
		vo.setBoard_name("main");
		vo.setBoard_no(987697);
		vo.setMember_no(a);
		Map map = new HashMap();
		map = service.view(vo);
		model.addAttribute("data", map);
		return "board/view3";
	}
	
	@PostMapping("/initBoardLike.do")
	@ResponseBody
	public Integer boardLike(BoardVO vo, Integer likeCheck) {
		//
		if(likeCheck==0) {
			service.clickBoardLike(vo);
			return 1;
		} else if(likeCheck > 0) {
			service.likeBack(vo);
			return 0;
		}
		return service.likeCheck(vo);
	}
	
	@PostMapping("/clickDislike.do")
	@ResponseBody
	public Integer boardDislike(BoardVO vo, Integer dislikeCheck) {
		if(dislikeCheck==0) {
			service.clickDislike(vo);
			return 1;
		} else if(dislikeCheck > 0) {
			service.dislikeBack(vo);
			return 0;
		}
		return service.dislikeCheck(vo);
	}
	
}

package project.data.ro.board;

import java.util.Arrays;
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

import project.data.ro.map.MapMapper;
import project.data.ro.map.MapVO;
import project.data.ro.member.MemberService;
import project.data.ro.member.MemberVO;
import project.data.ro.message.MessageVO;
import project.data.ro.room.RoomVO;
import project.data.ro.util.CategoryVO;
import project.data.ro.util.FileVO;
import project.data.ro.util.UtilService;

@Controller
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
	

	// +++진귀
	
	@RequestMapping("/getAllCourse.do")
	@ResponseBody  // board_no넘어옴
	public Map vview(BoardVO bvo) {
//		MemberVO mvo =(MemberVO)sess.getAttribute("loginInfo");
//		if(mvo != null) {  
//			// 로그인 안해도 view 에서 널포인트에러 안나게 바꿈
//			bvo.setMember_no(mvo.getMember_no());
//		}
		//System.out.println("진귀 확인:" + bvo);
		return service.updateView(bvo);
	}
	
	// 진귀++++++
	
	
	////////////////////////////////진경시작////////////////////////////////////////
	//여행코스 글쓰기화면
	@GetMapping("/travelWrite.do")
	public String write(Model model) {
		model.addAttribute("category",uservice.writeCategory());
		return "travelboard/write";
	}
	
	// 여행코스 글쓰기 from 진콩
	@PostMapping("/insert.do")
	public String insert(BoardVO bvo,CategoryVO cvo,FileVO fvo,@RequestParam MultipartFile[] filename, HttpServletRequest req) {
		service.insert(bvo);
		uservice.insert(cvo,bvo);
		uservice.fileupload(fvo, filename, req,bvo);
		uservice.regionInsert(cvo);
		int[] a =cvo.getHashtag_no_arr();
//		Arrays.toString(cvo)
		//System.out.println("0은뭘까"+cvo);
		return "redirect:/board/main.do";
	}
	//여행코스 글쓰기 수정화면  // board_no넘어옴
	@RequestMapping("/updateView.do")
	public String updateView(BoardVO bvo,HttpSession sess,Model model) {
		//System.out.println("타이틀확인"+bvo.getBoard_no());
		MemberVO mvo =(MemberVO)sess.getAttribute("loginInfo");
		bvo.setMember_no(mvo.getMember_no());
		model.addAttribute("category",uservice.writeCategory()); //카테고리전체 리스트 화면출력
		model.addAttribute("bvo",service.updateView(bvo));
		//model.addAttribute("file",uservice.fileUpdate(fvo));
		return "travelboard/update";
	}
	//여행코스 글쓰기 수정
	@RequestMapping("/edit.do")
	public String update(BoardVO bvo,CategoryVO cvo) {
		System.out.println("글번호 넘어오나"+bvo);
		System.out.println("글번호 넘어오나cvo"+cvo);
		service.titcouEdit(bvo);//타이틀,코스삭제후
		uservice.hashRegionEdit(cvo);//태그,지역삭제후
		uservice.regionInsert(cvo);//등록
		uservice.insert(cvo,bvo);//태그재등록
		return "redirect:/board/view.do?board_no="+bvo.getBoard_no();
	}
	//지역나오게
	@RequestMapping("/region_detail")
	@ResponseBody
	public Map regionDatail(String rs) {
		return uservice.regionDetail(rs);
	}
	
	////////////////////////////////진경끝////////////////////////////////////////
	
	
//	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 정길 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ	

	// 마이페이지 내가 쓴 게시글 보기
	@RequestMapping("/myList1")
	public String mylist1(BoardVO vo, Model model, HttpSession sess) {
		model.addAttribute("data", service.myList1(vo, sess));
		return "board/myList1";
	}
	
	// 마이페이지 내가 쓴 댓글 보기
	@PostMapping("/myList2")
	public String mylist2(BoardVO vo, Model model, HttpSession sess) {
		model.addAttribute("data", service.myList2(vo, sess));
		return "board/myList2";
	}
	
	// 마이페이지 내가 좋아요 누른 게시글 보기
	@PostMapping("/myList3")
	public String mylist3(BoardVO vo, Model model, HttpSession sess) {
		model.addAttribute("data", service.myList3(vo, sess));
		return "board/myList3";
	}
	
	// 마이페이지 내가 받은 쪽지 보기
	@PostMapping("/myList4")
	public String mylist4(MessageVO vo, Model model, HttpSession sess) {
		model.addAttribute("data", service.myList4(vo, sess));
		return "board/myList4";
	}
	
	// 마이페이지 내가 보낸 쪽지 보기
	@PostMapping("/myList5")
	public String mylist5(MessageVO vo, Model model, HttpSession sess) {
		model.addAttribute("data", service.myList5(vo, sess));
		return "board/myList5";
	}
	
	// 마이페이지 내가 참여한 채팅방 보기
	@PostMapping("/myList6")
	public String mylist6(RoomVO vo, Model model, HttpSession sess) {
		model.addAttribute("list", service.myList6(vo, sess));
		return "board/myList6";
	}
	
	
	
//	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 정길 끝 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ	
	
	
	// main + 정길 수정.
	@GetMapping("/main.do")
	public String mainGet(Model model, BoardVO vo, MessageVO mvo, HttpSession sess) {
		MemberVO vo1 = (MemberVO) sess.getAttribute("loginInfo");
		List<BoardVO> list = service.list(vo);
		for (int i=0; i<list.size(); i++) {
			list.get(i).setPlaceList(service.place(list.get(i).getBoard_no())); // 장소이름
			list.get(i).setHashtagList(service.hashtag(list.get(i).getBoard_no())); // 해쉬태그
			list.get(i).setGetTravPic(service.getTravPic(list.get(i).getBoard_no())); // 게시글 사진
		}
		model.addAttribute("list",list);
		if (vo1 != null) {
			int num = vo1.getMember_no();
			mvo.setReceive_member_no(num); 
			int num2 = mService.alarmForMessage(mvo); // 내가 읽지 않은 쪽지 불러오기.
			String result = String.valueOf(num2); 
			model.addAttribute("UnreadMsgs", result);
			return "board/main";
		}
		return "board/main";
	}
	
	//=================================정현===============================
	@GetMapping("/view.do")
	public String view(BoardVO vo, RoomVO rvo, Model model, HttpSession sess) {
		MemberVO mvo = (MemberVO)sess.getAttribute("loginInfo");
		//글 보고있는 사람(로그인 한 사람)
		if(mvo!= null) {
			vo.setLogin_member_no(mvo.getMember_no());
		}
		//System.out.println("=+=++++++++== "+vo);
		Map map = new HashMap();
		map = service.view(vo);
		model.addAttribute("data", map);
		return "board/view";
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
	
	@PostMapping("/viewDelete.do")
	public String viewDelete(BoardVO vo, Model model) {
		//System.out.println(vo);
		if(service.delete(vo)==1) {
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "/ro/board/main.do");
			return "common/alert2";
		} else {
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			return "common/alert2";
		}
	}
	//=================================정현===============================
}

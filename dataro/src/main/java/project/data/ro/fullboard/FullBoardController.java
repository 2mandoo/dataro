package project.data.ro.fullboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import project.data.ro.board.BoardVO;
import project.data.ro.comment.CommentVO;
import project.data.ro.member.MemberVO;
import project.data.ro.util.FileVO;
import project.data.ro.util.UtilService;


//@RequestMapping : get , post 둘다 가능
@Controller
public class FullBoardController {

	@Autowired
	FullBoardService service;
	
	
	// 자유게시판
	@RequestMapping("/fullboard/fullmain.do")
	public String mainfullboardGet(FullBoardVO vo, Model model) {
		System.out.println("****************************2");
		model.addAttribute("flist",service.index(vo));
		System.out.println("****************************3");
		return "fullboard/fullmain";
	}
		
	//글쓰기
	@GetMapping("/fullboard/write.do")
	public String write(Model model) {
		return "fullboard/write";
	}
	
	//상세
	@GetMapping("/fullboard/view.do")
	public String view(FullBoardVO vo, Model model,HttpSession sess ) {
		CommentVO cvo = (CommentVO) sess.getAttribute("commentInfo");
		if(cvo != null) {
			cvo.getReply_no();
			cvo.getBoard_no();
			vo.setReply_no(cvo.getReply_no());
			vo.setBoard_no(cvo.getBoard_no());
		}
		model.addAttribute("view",service.view(vo));
		return "fullboard/view";
	}
	
	//수정폼
	@RequestMapping("/fullboard/modify.do")
	public String modify(FullBoardVO vo, Model model) {
		model.addAttribute("modify",service.modify(vo));
		return "fullboard/modify";
	}
	
	// 글삭제
	@GetMapping("/fullboard/delete.do")
	public String delete(FullBoardVO vo, Model model) {
		if(service.remove(vo.getBoard_no())) {
			model.addAttribute("msg","삭제완료입니다!!");
			model.addAttribute("url", "fullmain.do");
			return "common/alert";
		} else {
			model.addAttribute("msg","삭제실패입니다ㅠㅠ");
			return "common/alert";
		}
	}
	//등록
	@RequestMapping("/fullboard/insert.do")
	public String insert(FullBoardVO vo,
		@RequestParam MultipartFile[] filename, HttpServletRequest re,HttpSession sess) {
		MemberVO avo = (MemberVO) sess.getAttribute("loginInfo");
		if(avo != null) {
			avo.getMember_no();
			avo.getId();
			vo.setMember_no(avo.getMember_no()); // 자유게시판에 회원번호 등록해서 불러오기
			vo.setId(avo.getId()); // 자유게시판에 회원ID 등록해서 불러오기
		} 
		service.insert(vo);
		service.fileUpload(vo, filename, re);
		return "redirect:/fullboard/fullmain.do";
	}
	//수정처리폼
	@RequestMapping("/fullboard/update.do")
		public String update(FullBoardVO vo, Model model) {
			if(service.update(vo)) {
				model.addAttribute("msg","정상적으로 수정되었습니다!!!");
				model.addAttribute("url","fullmain.do");
				return "common/alert";
			} else {
				model.addAttribute("msg","수정실패");
				return "common/alert";
			}
		}
	}
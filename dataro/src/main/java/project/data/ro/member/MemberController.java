package project.data.ro.member;

import java.io.File;
import java.util.Date;

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
import project.data.ro.board.BoardService;
import project.data.ro.board.BoardVO;
import project.data.ro.message.MessageVO;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@Autowired
	BoardService bService;

	@GetMapping("/register")
	public void insert() {}
	
	// 입력하지 않거나 틀린 정보를 입력 후, 회원가입을 클릭했을 때
	@PostMapping("/register")
	public String insert(MemberVO vo, Model model, 
			@RequestParam MultipartFile filename, 
			HttpServletRequest req) {
		
		String emailT = vo.getEmail() + '@'+ vo.getEmail2();
		vo.setEmail(emailT);
		
		// 중복아이디 가입불가
		int countI = service.checkId(vo);
		if (countI == 1) {
			model.addAttribute("msg", "동일한 아이디가 있어 회원가입이 불가능합니다.");
			return "common/alert";
		}
		
		// 두 패스워드가 다를 시 가입불가
		if (!vo.getPw1().equals(vo.getPwd())) {
			model.addAttribute("msg", "비밀번호가 같지 않아 회원가입이 불가능합니다.");
			return "common/alert";
		}
		
		// 중복이메일 가입불가
		int countE = service.checkEmail(vo);
		if(countE == 1) {
			model.addAttribute("msg", "동일한 이메일이 있어 회원가입이 불가능합니다.");
			return "common/alert";
		}
		
		if (vo.getId().equals("") || vo.getEmail().equals("") || vo.getEmail2().equals("") ) {
			model.addAttribute("msg", "입력하지 않은 회원정보가 있습니다.");
			return "common/alert";
		}
		
		// 파일등록.
		if (!filename.isEmpty()) {
			// 파일명 구하기
			String org = filename.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf(".")); // 확장자
			String real = new Date().getTime()+ext;
			// 파일저장
			String path = req.getRealPath("/img/");
			try {
			filename.transferTo(new File(path+real));
			} catch (Exception e) {}
			
			vo.setM_filename_org(org);
			vo.setM_filename_server(real);
		} else {
			vo.setM_filename_server("123.png");
		}
		
		if (service.register(vo)) {
			model.addAttribute("msg", "회원가입이 완료되었습니다.");
			model.addAttribute("url", "/ro/board/main.do");
			return "common/alert";
		} else {
			model.addAttribute("msg", "가입할 회원정보를 다시 한 번 확인해주세요.");
			return "common/alert";
		}
	}
	
	// 아이디 중복체크
	@PostMapping("/checkId")
	@ResponseBody
	public int count1(MemberVO vo, @RequestParam String id) {
		vo.setId(id);
		int count = service.checkId(vo);
		if(count == 1) {
			return count;
		} else {
			return 0;
		}
	}
	
	// 이메일 중복체크
	@PostMapping("/checkEmail")
	@ResponseBody
	public int count2(MemberVO vo, @RequestParam String email, @RequestParam String email2) {
		String emailT = email + '@'+ email2;
		vo.setEmail(emailT);
		int count = service.checkEmail(vo);
		if(count == 1) {
			return count;
		} else {
			return 0;
		}
	}
	
	@GetMapping("/main")
	public void main() {}
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String login(MemberVO vo, HttpSession sess, Model model, MessageVO mvo) {
		if(service.loginCheck(vo, sess)) {
			MemberVO vo1 = (MemberVO) sess.getAttribute("loginInfo");
			model.addAttribute("msg",  vo1.getNickname() + " 님 안녕하세요 : ) ");
			model.addAttribute("url", "/ro/board/main.do");
			return "common/alert";
		} else {
			model.addAttribute("msg", "아이디 혹은 비밀번호가 틀립니다.");
			return "common/alert";
		}
	}
	
	@GetMapping("/logout")
	public String logout(Model model, HttpServletRequest req) {
		HttpSession sess= req.getSession();
		sess.invalidate(); // 세션객체에 저장된 값 모두 초기화. 
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "/ro/board/main.do");
		log.info("로그아웃 처리됨");
		return "common/alert";
	}
	
	@GetMapping("/myInfo")
	public void myInfo() {}
	
	@PostMapping("/myInfo")
	public String myInfo1() {
		return "redirect:/member/myInfo";
	}
	
	@GetMapping("/editMemberInfo")
	public void editUserInfo() {}
	
	@PostMapping("/editUserInfo")
	public String editUserInfo(MemberVO vo, 
								HttpSession sess,
								Model model, 
								@RequestParam MultipartFile filename, 
								HttpServletRequest req){
		
		String emailT = vo.getEmail() + '@'+ vo.getEmail2();
		vo.setEmail(emailT);
		
		// 두 패스워드가 다를 시 가입불가
		if (!vo.getPw1().equals(vo.getPwd())) {
			model.addAttribute("msg", "비밀번호가 같지 않아 수정이 불가능합니다.");
			return "common/alert";
		}
		
		// 중복이메일 가입불가
		int countE = service.checkEmail(vo);
		if(countE == 1) {
			model.addAttribute("msg", "동일한 이메일이 있어 수정이 불가능합니다.");
			return "common/alert";
		}
		
		if (vo.getId().equals("") || vo.getEmail().equals("") || vo.getEmail2().equals("") ) {
			model.addAttribute("msg", "입력하지 않은 회원정보가 있습니다.");
			return "common/alert";
		}
		
		if (!filename.isEmpty()) {
			// 파일명 구하기
			String org = filename.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf(".")); // 확장자
			String real = new Date().getTime()+ext;
			// 파일저장
			String path = req.getRealPath("/img/");
			try {
			filename.transferTo(new File(path+real));
			} catch (Exception e) {}
			vo.setM_filename_org(org);
			vo.setM_filename_server(real);
		} else {
			vo.setM_filename_server("123.png");
		}
		String email = vo.getEmail()+'@'+vo.getEmail2();
		vo.setEmail(email);
		if (service.editUserInfo(vo)) {
			model.addAttribute("msg",  "회원정보 수정이 완료되었습니다.");
			model.addAttribute("url", "/ro/board/main.do");
			sess.setAttribute("loginInfo", vo); // 세션에 바뀐 값 덮어쓰기.
			return "common/alert";
		} else {
			model.addAttribute("msg", "회원정보를 확인해 주세요");
			return "common/alert";
		}
	}
	
	@GetMapping("/findId")
	public void findId(){};
	
	@PostMapping("/findId")
	public String findId(Model model, MemberVO vo) {
		MemberVO vo1 = service.findId(vo);
		if (vo1 != null) {
			model.addAttribute("result", vo1.getId());
		}
		return "common/result";
	}
	
	@GetMapping("/findPwd")
	public void findPwd(){};
	
	@PostMapping("/findPwd")
	public String findPwd(Model model, MemberVO vo) {
		MemberVO vo1 = service.findPwd(vo);
		if (vo1 != null) {
			model.addAttribute("result", vo1.getId());
		}
		return "common/result";
	}
	
	
	@GetMapping("/findIdPwd")
	public void findIdPwd(){};

		
	@PostMapping("/leave")
	public String leave(MemberVO vo, Model model, HttpSession sess) {
		MemberVO vo1 = (MemberVO)sess.getAttribute("loginInfo");
		String id1 = vo1.getId();
		vo.setId(id1);
		String pwd = vo.getPwd();
		if (service.loginCheck(vo, sess)) {
			service.deleteId(vo);
			model.addAttribute("msg",  "계정 삭제가 완료되었습니다.");
			model.addAttribute("url", "main");
			sess.invalidate();
			return "common/alert";
		} else {
			model.addAttribute("msg", "비밀번호가 맞지 않습니다.");
			return "common/alert";
		}
	}
	
	@GetMapping("/myPage")
	public void myPage() {}
	
	@PostMapping("/myBoard1")
	public String myBoard1(BoardVO vo, Model model) {
		model.addAttribute("data", bService.index(vo));
		return "board/index";
	}
	
	
	
	
}

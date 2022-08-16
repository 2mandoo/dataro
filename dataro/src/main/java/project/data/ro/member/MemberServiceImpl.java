package project.data.ro.member;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import project.data.ro.message.MessageVO;
import project.data.ro.util.SendMail;

@Slf4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private MemberMapper mapper;
	
	@Override
	public boolean register(MemberVO vo) {
		return mapper.insert(vo) > 0 ? true : false;
	}

	@Override
	public int checkId(MemberVO vo) {
		return mapper.checkId(vo);
	}
	
	@Override
	public int checkEmail(MemberVO vo) {
		return mapper.checkEmail(vo);
	}
	
	@Override
	public boolean loginCheck(MemberVO vo, HttpSession sess) {
		boolean r = false;
		MemberVO loginInfo = mapper.checkIdPw(vo);
		if (loginInfo != null) { // 로그인 가능한 상태. 
			r = true;
			sess.setAttribute("loginInfo", loginInfo);
		}
		return r; // 로그인 불가능한 상태. 
	}
	
	@Override
	public MemberVO myInfo(String id) {
		return mapper.myInfo(id);
	}

	@Override
	public boolean editUserInfo(MemberVO vo) {
		return mapper.editUserInfo(vo) > 0 ? true : false;
	}
	
	@Override
	public MemberVO findId(MemberVO vo) {
		return mapper.findId(vo);
	}

	@Override
	public MemberVO findPwd(MemberVO vo) {
		MemberVO vo1 = mapper.findPwd(vo);
		if (vo1 != null) {
			// 임시비밀번호 생성
			// 영문 두 자리, 숫자 두 자리
			String temp ="";
			for (int i=0; i < 2; i++) { 
				temp += (char)(Math.random()*26 + 65); // 26은 대문자만 나오게 하려고, 65부터 대문자 A
			}
			for (int i=0; i < 2; i++) { 
				temp += (int)(Math.random()*9);
			}
			vo1.setPwd(temp);
			mapper.updateTempPwd(vo1); 
			String email = vo1.getEmail();
			// email발송
			SendMail.sendMail("jeonggil5579@naver.com", email, "[Dataro]임시 비밀번호", "임시비밀번호는 "+ temp + " 입니다.");
			return vo1;
		} else {
			return null;
		}
	}

	@Override
	public int deleteId(MemberVO vo) {
		return mapper.deleteId(vo);
	}

	@Override
	public MemberVO myInfo2(int no) {
		return mapper.myInfo2(no);
	}

	@Override
	public int alarmForMessage(MessageVO vo) {
		return mapper.alarmForMessage(vo);
	}
	
}

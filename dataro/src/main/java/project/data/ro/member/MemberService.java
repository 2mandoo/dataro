package project.data.ro.member;

import javax.servlet.http.HttpSession;

public interface MemberService {
	boolean register(MemberVO vo);
	int checkId(MemberVO vo);
	int checkEmail(MemberVO vo);
	boolean loginCheck(MemberVO vo, HttpSession sess); 
	MemberVO myInfo(String id);
	MemberVO myInfo2(int no);
	boolean editUserInfo(MemberVO vo);
	MemberVO findId(MemberVO vo);
	MemberVO findPwd(MemberVO vo);
	int deleteId(MemberVO vo);

}

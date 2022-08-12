package project.data.ro.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	int insert(MemberVO vo);
	int checkId(MemberVO vo);
	int checkEmail(MemberVO vo);
	MemberVO checkIdPw(MemberVO vo); 
	MemberVO myInfo(String id);
	MemberVO myInfo2(int no);
	int editUserInfo(MemberVO vo);
	MemberVO findId(MemberVO vo);
	MemberVO findPwd(MemberVO vo);
	int updateTempPwd(MemberVO vo); 
	int deleteId(MemberVO vo);
}

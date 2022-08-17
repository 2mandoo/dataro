package project.data.ro.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project.data.ro.message.MessageVO;

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
	
	
	int alarmForMessage(MessageVO vo);
	List<MessageVO> unreadMsgContent(MessageVO vo);
	int readUpdate(MessageVO vo);
	
}

package project.data.ro.comment;

import java.util.List;
import java.util.Map;

import project.data.ro.reply.ReplyVO;

public interface CommentService {
	
	// 댓글 리스트
	Map index(CommentVO vo); 
	// 댓글 입력
	int insert(CommentVO vo);
	// 댓글 삭제
	int delete(int num);
	// 댓글 수정
	boolean modify(CommentVO vo);
	//답글 목록
	public List commentList(CommentVO vo);
	//답변등록
	boolean reply(CommentVO vo);
	
}

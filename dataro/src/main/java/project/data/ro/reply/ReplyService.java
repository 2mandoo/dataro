package project.data.ro.reply;

import java.util.List;

public interface ReplyService {
	int insert(ReplyVO vo);
	List<ReplyVO> list(ReplyVO vo);
	int update(ReplyVO vo);
}
	
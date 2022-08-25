package project.data.ro.comment;

import java.util.Map;

public interface CommentService {
	Map index(CommentVO vo);
	int insert(CommentVO vo);
	int delete(int num);
}

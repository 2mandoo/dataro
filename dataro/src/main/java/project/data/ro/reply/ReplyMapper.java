package project.data.ro.reply;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyMapper {
	int insert(ReplyVO vo);
	List<ReplyVO> list(ReplyVO vo);
	int update(ReplyVO vo);
}

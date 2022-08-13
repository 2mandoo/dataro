package project.data.ro.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.data.ro.room.RoomMapper;

@Service
public class ReplyServicempl implements ReplyService {
	@Autowired
	ReplyMapper rmapper;
	
	@Override
	public int insert(ReplyVO vo) {
		return rmapper.insert(vo);
	}
	@Override
	public List<ReplyVO> list(ReplyVO vo) {
		return rmapper.list(vo);
	}
	@Override
	public int update(ReplyVO vo) {
		return rmapper.update(vo);
	}

}

package project.data.ro.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class RoomServicempl implements RoomService {
	@Autowired
	RoomMapper rmapper;
	//모임방리스트(임시-삭제예정)
	@Override
	public List<RoomVO> list(RoomVO vo) {
		return rmapper.list(vo);
	}
	//모임방상세보기
	@Override
	public RoomVO view(int no) {
		return rmapper.view(no);
	}
}

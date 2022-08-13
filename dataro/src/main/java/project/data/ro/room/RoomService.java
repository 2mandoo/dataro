package project.data.ro.room;

import java.util.List;

import org.springframework.stereotype.Service;


public interface RoomService {
	List<RoomVO> list(RoomVO vo);//삭제예정-진경
	RoomVO view(int no);
}

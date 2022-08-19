package project.data.ro.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import project.data.ro.board.BoardVO;

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
	
	//=================================정현===============================
	//방 만들고 방장 방 입장
	@Override
	public int makeRoom(RoomVO vo) {
		System.out.println("3333333333333333333333333333"+vo);
		rmapper.makeRoom(vo);
		rmapper.enterRoom(vo);
		return 1;
	}
 
	@Override
	public List<RoomVO> list2(BoardVO vo) {
		return rmapper.list2(vo);
		
	}

	@Override
	public int pwdCheck(RoomVO vo) {
		return rmapper.pwdCheck(vo);
	}
	
	//방 참여
	@Override
	public int enterRoom(RoomVO vo) {
		return rmapper.enterRoom(vo);
	}

	@Override
	public int checkRoom(RoomVO vo) {
		return rmapper.checkRoom(vo);
	}
	//=================================정현===============================
}

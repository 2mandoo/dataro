package project.data.ro.room;

import java.util.List;

import org.springframework.stereotype.Service;

import project.data.ro.board.BoardVO;


public interface RoomService {
	RoomVO view(int no);
	
	//정현
	//방 새로 만들기
	public int makeRoom(RoomVO vo);
	
	public List<RoomVO> list2(BoardVO vo);
	
	public int pwdCheck(RoomVO vo);
	
	public int enterRoom(RoomVO vo);
	
	public int checkRoom(RoomVO vo);
}

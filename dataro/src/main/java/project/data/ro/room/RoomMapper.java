package project.data.ro.room;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project.data.ro.board.BoardVO;

@Mapper
public interface RoomMapper {
	List<RoomVO> list(RoomVO vo);//삭제예정-진경
	RoomVO view(int no);
	
	//=================================정현===============================
	public int makeRoom(RoomVO vo);
	
	public List<RoomVO> list2(BoardVO vo);
	
	public int pwdCheck(RoomVO vo);
	
	public int enterRoom(RoomVO vo);
	
	public int checkRoom(RoomVO vo);
	//=================================정현===============================
}

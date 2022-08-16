package project.data.ro.board;

import java.util.List;
import java.util.Map;

import project.data.ro.message.MessageVO;
import project.data.ro.room.RoomVO;


public interface BoardService {
	
	boolean update(BoardVO vo); 
	boolean delete(int no); 
	Map index(BoardVO vo); 
	BoardVO view(int no); 
	BoardVO edit(int no); 
	Map myList1(BoardVO vo);
	Map myList2(BoardVO vo);
	Map myList3(BoardVO vo);
	Map myList4(MessageVO vo);
	Map myList5(MessageVO vo);
	List<RoomVO> myList6(RoomVO vo);
	
	
	// main
	List<BoardVO> list(BoardVO vo);

	// write
	boolean insert(BoardVO bvo);
	
	

	


}

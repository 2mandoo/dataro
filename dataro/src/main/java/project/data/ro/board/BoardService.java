package project.data.ro.board;

import java.util.List;
import java.util.Map;

import project.data.ro.message.MessageVO;
import project.data.ro.room.RoomVO;
import project.data.ro.util.HashTagVO;


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
	List<HashTagVO> hash();
	
	
	//정현
	//상세
	Map view(BoardVO vo);
	//게시글 좋아요
	int clickBoardLike(BoardVO vo);
	//게시글 싫어요
	void clickDislike(BoardVO vo);
	//댓글 좋아요
	void clickReplyLike(BoardVO vo);
	int likeCheck(BoardVO vo);
	int dislikeCheck(BoardVO vo);
	void likeBack(BoardVO vo);
	void dislikeBack(BoardVO vo);


}

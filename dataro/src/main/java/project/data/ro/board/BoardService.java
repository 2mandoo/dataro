package project.data.ro.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import project.data.ro.message.MessageVO;
import project.data.ro.room.RoomVO;
import project.data.ro.util.HashTagVO;


public interface BoardService {
	
	boolean update(BoardVO vo); 
	boolean delete(int no); 
	Map index(BoardVO vo); 
	BoardVO view(int no); 
	BoardVO edit(int no); 
	// 마이페이지 관련 게시물 6개.
	Map myList1(BoardVO vo,  HttpSession sess);
	Map myList2(BoardVO vo, HttpSession sess);
	Map myList3(BoardVO vo, HttpSession sess);
	Map myList4(MessageVO vo, HttpSession sess);
	Map myList5(MessageVO vo, HttpSession sess);
	List<RoomVO> myList6(RoomVO vo, HttpSession sess);
	
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

package project.data.ro.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project.data.ro.message.MessageVO;
import project.data.ro.room.RoomVO;
import project.data.ro.util.CategoryVO;
import project.data.ro.util.HashTagVO;

@Mapper
public interface BoardMapper {
	
	int count(BoardVO vo); // 얘도 없는데 지워도 될까요? 정길.
	BoardVO view(int no);
	int updateViewcount(int no);
	int update(BoardVO vo);
	//? delete boardmapper.xml 엔 없던데 머임요? 
	int delete(int no);
	
	// 마이페이지 관련
	int count1(BoardVO vo);
	int count2(BoardVO vo);
	int count3(BoardVO vo);
	int count4(MessageVO vo);
	int count5(MessageVO vo);
	List<BoardVO> myList1(BoardVO vo);
	List<BoardVO> myList2(BoardVO vo);
	List<BoardVO> myList3(BoardVO vo);
	List<MessageVO> myList4(MessageVO vo);
	List<MessageVO> myList5(MessageVO vo);
	List<RoomVO> myList6(RoomVO vo);
	// 마이페이지 끝 --
	
	// main 
	List<BoardVO> list(BoardVO vo);
	
	
	// write
	int insert(BoardVO vo);
	int insertCourse(BoardVO vo);
	List<HashTagVO> hash();
	
	//정현
	public BoardVO view2(BoardVO vo); 
	public void updateViewcount2(BoardVO vo);
	public List<CategoryVO> categoryList(BoardVO vo);
	//게시글 삭제
	public int delete(BoardVO vo);
	//게시글 좋아요
	public int clickBoardLike(BoardVO vo);
	//게시글 싫어요
	public void clickDislike(BoardVO vo);
	//댓글 좋아요
	public void clickReplyLike(BoardVO vo);
	//로그인한 member_no가 좋아요 눌렀는지 체크
	public int likeCheck(BoardVO vo);
	//로그인한 member_no가 싫어요 눌렀는지 체크
	public int dislikeCheck(BoardVO vo);
	//좋아요 취소
	public int likeBack(BoardVO vo);
	//싫어요 취소
	public int dislikeBack(BoardVO vo);
	
}

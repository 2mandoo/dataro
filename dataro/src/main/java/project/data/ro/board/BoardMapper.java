package project.data.ro.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project.data.ro.message.MessageVO;
import project.data.ro.room.RoomVO;
import project.data.ro.util.HashTagVO;

@Mapper
public interface BoardMapper {
	
	int count(BoardVO vo);
	int count1(BoardVO vo);
	int count2(BoardVO vo);
	int count3(BoardVO vo);
	int count4(MessageVO vo);
	int count5(MessageVO vo);
	BoardVO view(int no);
	int updateViewcount(int no);
	int update(BoardVO vo);
	int delete(int no);
	List<BoardVO> myList1(BoardVO vo);
	List<BoardVO> myList2(BoardVO vo);
	List<BoardVO> myList3(BoardVO vo);
	List<MessageVO> myList4(MessageVO vo);
	List<MessageVO> myList5(MessageVO vo);
	List<RoomVO> myList6(RoomVO vo);
	
	
	// main 
	List<BoardVO> list(BoardVO vo);
	
	
	// write
	int insert(BoardVO vo);
	int insertCourse(BoardVO vo);
	List<HashTagVO> hash();

}

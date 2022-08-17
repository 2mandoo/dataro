package project.data.ro.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import project.data.ro.message.MessageVO;
import project.data.ro.room.RoomMapper;
import project.data.ro.room.RoomVO;
import project.data.ro.util.HashTagVO;

@Slf4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	BoardMapper mapper;
	
	RoomMapper rmapper;
	
	//여행코스글쓰기(for문-코스등록)
	@Override
	public boolean insert(BoardVO bvo) {
		mapper.insert(bvo);
		for(int i=0; i<bvo.getContents().length; i++) {
			bvo.setContent(bvo.getContents()[i]);
			bvo.setCourse_no(i+1);
			mapper.insertCourse(bvo);
		}
		return true;
	}
	//여행코스글수정
	@Override
	public boolean update(BoardVO vo) {
		return mapper.update(vo) > 0 ? true : false;
	}
	//여행코스글삭제
	@Override
	public boolean delete(int no) {
		return mapper.delete(no) > 0 ? true : false;
	}

	@Override
	public Map index(BoardVO vo) {
		int totalCount = mapper.count(vo);
		int totalPage = totalCount / vo.getPageRow();
		if(totalCount % vo.getPageRow() > 0) totalCount++;
		int startIdx = (vo.getPage()-1) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<BoardVO> list = mapper.list(vo);
		int endPage = (int)(Math.ceil(vo.getPage()/10.0)*5);
		int startPage = endPage - 4;
		if (endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true: false;
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("prev", prev);
		map.put("next", next);
		map.put("list", list);
		return map;
	}
	
	@Override
	public BoardVO view(int no) {
		mapper.updateViewcount(no);
		return mapper.view(no);
	}

	@Override
	public BoardVO edit(int no) {
		return mapper.view(no);
	}

	@Override
	public Map myList1(BoardVO vo) {
		int totalCount = mapper.count1(vo);
		int totalPage = totalCount / vo.getPageRow();
		if(totalCount % vo.getPageRow() > 0) totalPage++;
		int startIdx = (vo.getPage()-1) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<BoardVO> list = mapper.myList1(vo);
		int endPage = (int)(Math.ceil(vo.getPage()/5.0)*5);
		int startPage = endPage - 4;
		if (endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true: false;
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("prev", prev);
		map.put("next", next);
		map.put("list", list);
		return map;
	}

	@Override
	public Map myList2(BoardVO vo) {
		int totalCount = mapper.count2(vo);
		int totalPage = totalCount / vo.getPageRow();
		if(totalCount % vo.getPageRow() > 0) totalPage++;
		int startIdx = (vo.getPage()-1) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<BoardVO> list = mapper.myList2(vo);
		int endPage = (int)(Math.ceil(vo.getPage()/5.0)*5);
		int startPage = endPage - 4;
		if (endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true: false;
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("prev", prev);
		map.put("next", next);
		map.put("list", list);
		return map;
	}
	
	@Override
	public Map myList3(BoardVO vo) {
		int totalCount = mapper.count3(vo);
		int totalPage = totalCount / vo.getPageRow();
		if(totalCount % vo.getPageRow() > 0) totalPage++;
		int startIdx = (vo.getPage()-1) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<BoardVO> list = mapper.myList3(vo);
		int endPage = (int)(Math.ceil(vo.getPage()/5.0)*5);
		int startPage = endPage - 4;
		if (endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true: false;
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("prev", prev);
		map.put("next", next);
		map.put("list", list);
		return map;
	}

	@Override
	public Map myList4(MessageVO vo) {
		int totalCount = mapper.count4(vo);
		int totalPage = totalCount / vo.getPageRow();
		if(totalCount % vo.getPageRow() > 0) totalPage++;
		int startIdx = (vo.getPage()-1) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<MessageVO> list = mapper.myList4(vo);
		int endPage = (int)(Math.ceil(vo.getPage()/5.0)*5);
		int startPage = endPage - 4;
		if (endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true: false;
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("prev", prev);
		map.put("next", next);
		map.put("list", list);
		return map;
	}
	
	@Override
	public Map myList5(MessageVO vo) {
		int totalCount = mapper.count5(vo);
		int totalPage = totalCount / vo.getPageRow();
		if(totalCount % vo.getPageRow() > 0) totalPage++;
		int startIdx = (vo.getPage()-1) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<MessageVO> list = mapper.myList5(vo);
		int endPage = (int)(Math.ceil(vo.getPage()/5.0)*5);
		int startPage = endPage - 4;
		if (endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true: false;
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("prev", prev);
		map.put("next", next);
		map.put("list", list);
		return map;
	}

	@Override
	public List<RoomVO> myList6(RoomVO vo) {
		return mapper.myList6(vo);
	}

	@Override
	public List<BoardVO> list(BoardVO vo) {
		return mapper.list(vo);
	}

	@Override
	public List<HashTagVO> hash() {
		return mapper.hash();
	}
	
	//정현
	//게시글 상세보기
	@Override
	public Map view(BoardVO vo) {
		Map map = new HashMap();
		
		mapper.updateViewcount2(vo); //조회수 증가 후
		vo.setLogin_member_no(5);
		map.put("roomList", rmapper.list2(vo));
		map.put("categoryList", mapper.categoryList(vo));
		map.put("board", mapper.view2(vo));
		return map;
	}

	@Override
	public int clickBoardLike(BoardVO vo) {
		return mapper.clickBoardLike(vo);
		
	}

	@Override
	public void clickDislike(BoardVO vo) {
		mapper.clickDislike(vo);
	}

	@Override
	public void clickReplyLike(BoardVO vo) {
		mapper.clickReplyLike(vo);
	}

	@Override
	public int likeCheck(BoardVO vo) {
		return mapper.likeCheck(vo);
	}

	@Override
	public void likeBack(BoardVO vo) {
		mapper.likeBack(vo);
	}

	@Override
	public int dislikeCheck(BoardVO vo) {
		return mapper.dislikeCheck(vo);
	}

	@Override
	public void dislikeBack(BoardVO vo) {
		mapper.dislikeBack(vo);
	}

}

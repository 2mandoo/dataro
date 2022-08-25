package project.data.ro.util;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project.data.ro.board.BoardVO;

@Mapper
public interface FileMapper {
	//여행코스글쓰기 사진등록
	int fileupload(FileVO fvo);
	//여행코스글쓰기 수정화면 사진출력
	List<FileVO> fileUpdate(BoardVO bvo);
}

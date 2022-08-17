package project.data.ro.fullboard;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;


public interface FullBoardService {
	
	
	Map index(FullBoardVO vo); //목록
	
	int insert(FullBoardVO vo); //등록
	
	FullBoardVO view(FullBoardVO vo); //상세게시판
	
	FullBoardVO modify(FullBoardVO vo); // 수정폼
	
	boolean remove(int num); //삭제
	
	boolean update(FullBoardVO vo); //수정기능
	
	boolean fileUpload(FullBoardVO vo, MultipartFile[] filename, HttpServletRequest req); // 파일등록

	
}

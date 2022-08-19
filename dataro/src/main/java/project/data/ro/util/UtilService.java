package project.data.ro.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import project.data.ro.board.BoardVO;

public interface UtilService {
	//해시태그 등록/진경
	boolean insert(CategoryVO cvo,BoardVO bvo,@RequestParam List<Integer> hashtag_no);
	//글쓰기 사진등록/진경
	boolean fileupload(FileVO fvo,@RequestParam MultipartFile[] filename, HttpServletRequest re,BoardVO bvo);
	//해시태그,지역정보 출력/진경
	Map writeCategory();
	//지역 대분류 db에 넘겨 소분류가지고오기
	Map regionDetail(String rs);
	
}

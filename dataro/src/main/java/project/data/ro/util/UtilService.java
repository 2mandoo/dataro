package project.data.ro.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import project.data.ro.board.BoardVO;

public interface UtilService {
	boolean insert(CategoryVO cvo,BoardVO bvo,@RequestParam List<Integer> hashtag_no);
	boolean fileupload(FileVO fvo,@RequestParam MultipartFile[] filename, HttpServletRequest re,BoardVO bvo);
}

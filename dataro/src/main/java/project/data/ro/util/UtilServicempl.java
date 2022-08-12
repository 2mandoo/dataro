package project.data.ro.util;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import project.data.ro.board.BoardVO;

@Service
public class UtilServicempl implements UtilService {
	@Autowired
	CategoryMapper cmapper;
	@Autowired
	FileMapper fmapper;
//	@Autowired
//	BoardVO bvo;
	
	@Override
	public boolean insert(CategoryVO cvo,BoardVO bvo,@RequestParam List<Integer> hashtag_no) {
		for(int hashtag:hashtag_no) {
			cvo.setBoard_no(bvo.getBoard_no());
			cvo.setHashtag_no(hashtag);
			cmapper.insert(cvo);
		}
		return true;
	}
	
	@Override
	public boolean fileupload(FileVO fvo, @RequestParam MultipartFile[] filename, HttpServletRequest req,BoardVO bvo) {
		int a = 1;
		for(MultipartFile files :filename) {
			a++;
			if(!files.isEmpty()) {
				
				String org = files.getOriginalFilename();
				String ext=org.substring(org.lastIndexOf('.'));
				String sever = new Date().getTime()+ext;
				
				String pate = req.getRealPath("/upload/");
				try {
					files.transferTo(new File(pate+sever));
				}catch(Exception e) {}
					fvo.setCourse_no(a/2);
					fvo.setFilename_org(org);
					fvo.setFilename_server(sever);
					fvo.setBoard_no(bvo.getBoard_no());
					fmapper.fileupload(fvo);
			}
		}

		return true;
	}

}

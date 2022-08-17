package project.data.ro.fullboard;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FullBoardServiceImple implements FullBoardService {
	
	@Autowired
	FullBoardMapper mapper;
	
	@Override
	public int insert(FullBoardVO vo) {
		return mapper.insert(vo);
		
	}

	@Override
	public FullBoardVO view(FullBoardVO vo) {
		mapper.viewcountupdate(vo);
		return mapper.view(vo);
	}

	@Override
	public boolean remove(int num) {
		
		return mapper.delete(num) == 1;
		
	}
	
	@Override
	public FullBoardVO modify(FullBoardVO vo) {
		
		return mapper.view(vo);
	}
	
	@Override
	public boolean update(FullBoardVO vo) {
		
		return mapper.update(vo) > 0;
	}

	@Override
	public Map index(FullBoardVO vo) {
		
		// 총게시물 수
		int totalCount = mapper.count(vo);
		
		//총페이지 수
		int totalPage = totalCount / vo.getPageRow();
		
		if (totalCount % vo.getPageRow() > 0) totalPage++;
		
		// 시작인덱스
		int startIdx = (vo.getPage()-1) * vo.getPage();
		vo.setStartIdx(startIdx);
		
		List<FullBoardVO> list = mapper.list(vo);

		
		//페이징처리
		int endPage = (int) (Math.ceil(vo.getPage()/10.0)*10);
		int startPage = endPage-9;
		if (endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true : false;
		
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
	public boolean fileUpload(FullBoardVO vo, @RequestParam MultipartFile[] filename, HttpServletRequest req) {
		int a = 1;
		for(MultipartFile files :filename) {
			a++;
			if(!files.isEmpty()) {
				String org = files.getOriginalFilename();
				String ext=org.substring(org.lastIndexOf('.'));
				String sever = new Date().getTime()+ext;
				
				String path = req.getRealPath("/upload/");
				try {
					files.transferTo(new File(path+sever));
				}catch(Exception e) {}
					vo.setFilename_org(org);
					vo.setFilename_server(sever);
					vo.setBoard_no(vo.getBoard_no());
					mapper.fileUpload(vo);
			}
		}
		return true;
	}
}
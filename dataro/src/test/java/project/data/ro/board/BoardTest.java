package project.data.ro.board;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import project.data.ro.util.FileMapper;
import project.data.ro.util.FileVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardTest {
	
	@Autowired
	BoardMapper mapper;
	
	@Autowired
	FileMapper fm;
	

	//@Test
	public void register() {
		
		for(int i = 0; i < 70; i ++) {
			BoardVO vo = new BoardVO();
			vo.setBoard_name("자유게시판");
			vo.setTitle("for문 제목" + i);
			vo.setViewcount(i);
			mapper.insert(vo);
		}
		
		
	}
	
	

	

	
	
	
	
	
	
	
	
	
	
}

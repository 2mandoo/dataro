package project.data.ro.fullboard;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface FullBoardMapper {

	int insert(FullBoardVO vo);
	
	List<FullBoardVO> list(FullBoardVO vo);
	
	FullBoardVO view(FullBoardVO vo);
	
	int count(FullBoardVO vo);
	
	int viewcountupdate(FullBoardVO vo);
	
	int delete(int num);
	
	int update(FullBoardVO vo);
	
	int fileUpload(FullBoardVO vo);


}

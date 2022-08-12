package project.data.ro.util;

//글등록
//글수정
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {
	int insert(CategoryVO vo);
}

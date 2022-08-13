package project.data.ro.util;

import org.apache.ibatis.annotations.Mapper;

//글등록
@Mapper
public interface CategoryMapper {
	int insert(CategoryVO vo);
}

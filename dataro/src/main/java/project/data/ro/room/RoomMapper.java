package project.data.ro.room;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoomMapper {
	List<RoomVO> list(RoomVO vo);//삭제예정-진경
	RoomVO view(int no);
}

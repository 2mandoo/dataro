package project.data.ro.map;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MapMapper {
   public int insert(MapVO vo);
   public List<MapVO> list();
}

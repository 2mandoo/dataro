package project.data.ro.map;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project.data.ro.board.BoardVO;

@Mapper
public interface MapMapper {
   public int insert(MapVO vo);
   public List<MapVO> list();
   public int update(BoardVO vo);
   public String place(BoardVO vo);
}

package project.data.ro.board;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;
import project.data.ro.map.MapVO;
import project.data.ro.util.CategoryVO;

@Data
public class BoardVO {
	
	private String board_name; 
	private int board_no; 
	private String id; 
	private int member_no; 
	private String title;
	private int viewcount; 
	private Timestamp writedate; 
	private Timestamp updatedate; 
	private String stype;
	private String sword;
	private String stag;
	private int startIdx;
	private int pageRow;
	private int page;
	private Timestamp reply_writedate; 
	
	public BoardVO (int page, int pageRow){
		this.page=page;
		this.pageRow=pageRow;
	}
	public BoardVO (){
		this(1,5);
	}
	
	private String content; 
	private int likecount;
	private int replycount;
	private int dislikecount;
	private int hashtag_no;
	private String hashtag_name; 
	
	// 내용여러개
	private List<MapVO> placeList;
	private List<CategoryVO> hashtagList; 
	private String[] contents;
	private int course_no;
	private int login_member_no;
}

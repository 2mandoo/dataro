package project.data.ro.fullboard;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString //@data로도 가능
public class FullBoardVO {
	int board_no;
	String board_name;
	String id;
	String title;
	String content;
	int viewcount;
	Timestamp writedate;
	Timestamp updatedate;
	//int course_no;
	int member_no;
	
	//-------------------
	
	private String filename_org;
	private String filename_server;
	private int course_no;
	
	//-------------------
	int likecount;
	int dislikecount;
	
	//-------------------
	int hashtag_no;
	String hashtag_name; // 중요 다시보기
	//-------------------
	String stype;
	String sword;
	//------------------- 페이징 처리
	int startIdx;
	int pageRow;
	int page;
	
	

	public FullBoardVO() {
		this(1,10);
	}
	public FullBoardVO(int page, int pageRow) {
		this.page = page;
		this.pageRow = pageRow;
	}
}

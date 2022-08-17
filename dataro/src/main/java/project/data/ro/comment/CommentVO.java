package project.data.ro.comment;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentVO {
	
	String content;
	int member_no;
	int board_no;
	int reply_no;
	String board_name;
	Timestamp reply_writedate;
	Timestamp regdate;
	Timestamp writedate;
	//private String member_name;
	String member_name;
	int startIdx;
	int pageRow;
	int page;
	
	public CommentVO() {
		this.pageRow = 10;
		this.page = 1;
	}
}

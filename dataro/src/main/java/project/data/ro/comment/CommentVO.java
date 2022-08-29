package project.data.ro.comment;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentVO {
	
	String content;
	int member_no;
	String id;
	int board_no;
	int reply_no;
	String member_id;
	String board_name;
	Timestamp reply_writedate;
	Timestamp reply_updatedate;
	Timestamp regdate;
	Timestamp writedate;
	int gno;
	int ono;
	int room_no;
	private int commentcount;
	//private String member_name;
	String member_name;
	int startIdx;
	int pageRow;
	int page;
	String nickname;
	
	public CommentVO() {
		this.pageRow = 10;
		this.page = 1;
	}
}

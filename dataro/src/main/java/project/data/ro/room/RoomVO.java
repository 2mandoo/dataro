package project.data.ro.room;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RoomVO {
   
	private String board_name;
	private int board_no;
	private int room_no;
	private String roommaker_id;
	private String room_title;
	private String room_content;
	private Timestamp room_startdate;
	private Timestamp room_enddate;
	private int room_participant_no;
	private int member_no;
  
}
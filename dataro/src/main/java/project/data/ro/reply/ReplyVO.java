package project.data.ro.reply;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReplyVO {
   private String board_name;
   private int board_no;
   private int room_no;
   private int reply_no;
   private String member_id;
   private String content;
   private int member_no;
   private int reply_likecount;
   private Timestamp reply_writedate;
   private Timestamp reply_updatedate;
   private int gno;
   private int ono;
   private int page;
   private int startIdx;
   private int pageRow;
   private String title;

   public ReplyVO() {
      this.pageRow = 10;
      this.page = 1;
   }
   
}
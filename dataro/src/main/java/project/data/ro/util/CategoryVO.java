package project.data.ro.util;

import lombok.Data;

@Data
public class CategoryVO { 
	private int region_no;
	private int hashtag_no;
	private int[] hashtag_no_arr;
	private String board_name;
	private int board_no;
}

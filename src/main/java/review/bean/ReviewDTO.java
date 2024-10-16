package review.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class ReviewDTO {
	private int rcode;       // 리뷰 코드
    private int rdishcode;   // 음식 코드
    private String ruserid;      // 리뷰 아이디
    private float rscore;        // 리뷰 평점
    private Date rdate; // 리뷰 작성일시
    private String rcontent;     // 리뷰 내용
}

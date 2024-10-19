package dish.bean;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component
public class DishDTO {
	private int dcode;			// 음식 코드
	private String dimage;		// 음식 사진 파일명
	private String dimageUUID;	// 음식 사진 UUID 
	private String dname;		// 음식 이름 
	private String dintro;		// 음식 소개글
	private String drecipe;		// 음식 레시피
	private float dscore;		// 음식 평균 평점
}

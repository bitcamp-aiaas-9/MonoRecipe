package favorite.bean;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component
public class FavoriteDTO {
	private int fcode;          // 즐겨찾기 코드
    private String fuserid;     // 사용자 코드
    private int fdishcode;      // 요리 코드 (dish_tb 외래키)
}

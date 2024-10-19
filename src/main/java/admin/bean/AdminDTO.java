package admin.bean;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;

@Repository
@Getter
@Setter
public class AdminDTO {
	
	private int acode;
	private String aname;
	private String aid;
	private String apwd;

}

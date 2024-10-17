package user.bean;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;

@Repository
@Getter
@Setter
public class UserDTO {
	private int ucode;
	private String uname;
	private String uid;
	private String upwd;
	private String uemail;
}

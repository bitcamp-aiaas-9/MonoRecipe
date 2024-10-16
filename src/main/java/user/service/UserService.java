package user.service;

import user.bean.UserDTO;

public interface UserService {

	String getExistId(String uid);

	void write(UserDTO userDTO);



}

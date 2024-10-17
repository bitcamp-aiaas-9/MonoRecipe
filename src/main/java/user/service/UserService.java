package user.service;

import user.bean.UserDTO;

public interface UserService {

	String getExistId(String uid);

	void write(UserDTO userDTO);

	UserDTO login(UserDTO userDTO);

	UserDTO getMember(String uemail);

	void update(UserDTO userDTO);

	void delete(UserDTO userDTO);



}

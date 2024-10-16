package user.dao;

import org.apache.ibatis.annotations.Mapper;

import user.bean.UserDTO;

@Mapper
public interface UserDAO {

	UserDTO getExistId(String id);

	void write(UserDTO userDTO);

	UserDTO login(UserDTO userDTO);

}

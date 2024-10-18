package user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import user.bean.UserDTO;

@Mapper
public interface UserDAO {

	UserDTO getExistId(String id);

	void write(UserDTO userDTO);

	UserDTO login(UserDTO userDTO);

	UserDTO getMember(String uemail);

	void update(UserDTO userDTO);

	void delete(UserDTO userDTO);

	List<UserDTO> list(Map<String, Integer> map);

	int getTotalA();

	UserDTO naverLogin(String uid, String uname, String uemail);

	UserDTO naverLogin(Map<String, Object> map);

}

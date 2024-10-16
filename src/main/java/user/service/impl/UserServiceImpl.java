package user.service.impl;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;


import user.bean.UserDTO;
import user.dao.UserDAO;
import user.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	

	 
	@Override
	public String getExistId(String uid) {
		UserDTO userDTO = userDAO.getExistId(uid);
		
		if(userDTO == null)
			return "non_exist";
		else
			return "exist";
	}



	@Override
	public void write(UserDTO userDTO) {
		userDAO.write(userDTO);
		
	}



}

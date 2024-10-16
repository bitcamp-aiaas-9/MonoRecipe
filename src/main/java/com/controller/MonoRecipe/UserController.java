package com.controller.MonoRecipe;


import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import user.bean.UserDTO;
import user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	JavaMailSender mailSender;
	
	@RequestMapping(value="/user/signUp", method = RequestMethod.GET)
	public String userSignUp() {
		return "/user/userSignUp";
	}
	
	@RequestMapping(value="/user/signIn", method = RequestMethod.GET)
	public String userSignIn() {
		return "/user/userSignIn";
	}
	
	@RequestMapping(value="/user/getExistId", method = RequestMethod.POST)
	@ResponseBody
	public String getExistId(String uid) {
		return userService.getExistId(uid); //단순 문자열이 아니라 JSP 파일명으로 인식
	}
	
    
	@RequestMapping(value="/user/write", method = RequestMethod.POST)
	@ResponseBody
	public void write(@ModelAttribute UserDTO userDTO) {
		userService.write(userDTO);
	}
	
	//이메일 인증
	  @RequestMapping(value = "/user/emailAuth", method = RequestMethod.POST)
	    @ResponseBody
	    public int emailAuth(String uemail) {	  		
		        Random random = new Random();
		        int checkNum = random.nextInt(888888) + 111111;
		        String setFrom = "lunasc@naver.com"; // 보내는 이메일 주소
		        String toMail = uemail; // 수신자 이메일 주소
		        String title = "회원가입 인증 이메일입니다."; // 이메일 제목
		        String content = "인증 코드는 " + checkNum + "입니다." ;
		        try {
		            MimeMessage message = mailSender.createMimeMessage(); // Spring에서 제공하는 mail API
		            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		            helper.setFrom(setFrom);
		            helper.setTo(toMail);
		            helper.setSubject(title);
		            helper.setText(content, true);
		            mailSender.send(message); // 이메일 전송
		        } catch (Exception e) {
		            e.printStackTrace();
		            return -1; // 이메일 전송 실패 시 -1 반환
		        }
		        return checkNum; // 인증 코드 반환
			}


	

}

package com.controller.MonoRecipe;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dish.bean.DishDTO;
import dish.service.DishService;
import favorite.bean.FavoriteDTO;
import favorite.service.FavoriteService;
import user.bean.UserDTO;
import user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private FavoriteDTO favoriteDTO;
   
	@Autowired
	private UserDTO userDTO;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	private DishService dishService;
	
	@Autowired
	private FavoriteService favoriteService;
	
	@RequestMapping(value="/user/signUp", method = RequestMethod.GET)
	public String userSignUp() {
		return "/user/userSignUp";
	}
	
	@RequestMapping(value="/user/signIn", method = RequestMethod.GET)
	public String userSignIn() {
		return "/user/userSignIn";
	}
	
	@RequestMapping(value="/user/userUpdate", method = RequestMethod.GET)
	public String userUpdate()  {
		return "/user/userUpdate";
	}
	
	@RequestMapping(value="/user/update", method = RequestMethod.POST)
	@ResponseBody
	public void userUpdate(@ModelAttribute UserDTO userDTO,HttpSession session)  {
		userService.update(userDTO);
		session.removeAttribute("userDTO");
		
	    userDTO = userService.login(userDTO);
	    session.setAttribute("userDTO", userDTO);
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
	
	@RequestMapping(value="/user/login")
	public String login(@ModelAttribute UserDTO userDTO, Model model,HttpSession session) {
		
	    List<DishDTO> dishList = dishService.getDishIndexList();
	    model.addAttribute("dishList", dishList != null ? dishList : List.of());
		
		
	    userDTO = userService.login(userDTO);
	    
	    if (userDTO == null) {
	        model.addAttribute("error", "로그인 실패! 이메일 또는 비밀번호가 잘못되었습니다.");
	        return "/user/userSignIn"; 
	    }
	    session.setAttribute("userDTO", userDTO);

	    return "redirect:/";// /WEB-INF/index.jsp
	}
	
	@RequestMapping(value="/user/userLogout", method = RequestMethod.GET)
	public String userLogout(HttpSession session)  {	
		session.removeAttribute("userDTO");	
		return "redirect:/";
	}
	
	@RequestMapping(value="/user/userDelete", method = RequestMethod.GET)
	public String userDelete()  {
		return "/user/userDelete";
	}
	
	@RequestMapping(value="/user/delete", method = RequestMethod.POST)
	@ResponseBody
	public void delete(@ModelAttribute UserDTO userDTO,HttpSession session) {
		userService.delete(userDTO);
		session.removeAttribute("userDTO");	
	}
	
	@RequestMapping(value="/user/userList", method = RequestMethod.GET)
	public String list(@RequestParam(required = false, defaultValue = "1") String pg, Model model) {
		Map<String, Object> map2 = userService.list(pg);
		
		map2.put("pg", pg);
		
		model.addAttribute("map2", map2);
		
		//model.addAttribute("list", map2.get("list"));
		//model.addAttribute("userPaging", map2.get("userPaging"));
		return "/user/userList"; //=> /WEB-INF/user/list.jsp
	}
	
	@RequestMapping(value="/user/callback", method = RequestMethod.GET)
	public String userCallback()  {
		return "/user/callback";
	}
	
	@ResponseBody
	@RequestMapping("/user/naverLogin")
	public int naverLogin(@RequestParam("uid") String uid, 
	                      @RequestParam("uname") String uname, 
	                      @RequestParam("uemail") String uemail,
	                      HttpSession session) {
		
			
	    if (userService.getExistId(uemail) != "non_exist") {
	    	Map<String, Object> map = new HashMap<>();
	    	map.put("uemail", uemail);
	    	map.put("uid", uemail);
	    	map.put("uname", uname+"naver");
	        userDTO = userService.naverLogin(map);

	    } else {
	        userDTO = new UserDTO();
	        userDTO.setUid(uemail);  
	        userDTO.setUpwd(uemail + uname + uid);  
	        userDTO.setUemail(uemail); 
	        userDTO.setUname(uname+"naver"); 
	        userService.write(userDTO); 
	        userDTO = userService.login(userDTO);
	    }
	    session.setAttribute("userDTO", userDTO);
	    return 1; 
	}
	
	
	
	//이메일 인증
	  @RequestMapping(value = "/user/emailAuth", method = RequestMethod.POST)
	    @ResponseBody
	    public int emailAuth(String uemail , int randomNum) {	  		
		        int checkNum = randomNum;
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

	  
	   
	   // My Page 즐겨찾기 목록
	     @RequestMapping(value="/user/userMyPage")
	     public String userMyPage(Model model, HttpSession session) {
	        UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
	        session.setAttribute("userDTO", userDTO);
	        
	        if (userDTO != null) {
	             String uid = userDTO.getUid();
	             System.out.println("로그인 사용자 아이디 : " + uid);
	             List<DishDTO> favoriteList = favoriteService.getFavoriteList(uid);
	             model.addAttribute("favoriteList", favoriteList);
	         } else {
	             System.out.println("userDTO is null");
	             model.addAttribute("favoriteList", List.of()); // 빈 리스트 처리
	         }

	        
	        session.setAttribute("userDTO", userDTO);
	        return "/user/userMyPage"; 
	     }
	  

}

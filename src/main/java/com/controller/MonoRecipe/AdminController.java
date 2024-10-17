package com.controller.MonoRecipe;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.bean.AdminDTO;
import admin.service.AdminService;
import dish.bean.DishDTO;
import dish.service.DishService;
import user.bean.UserDTO;

@Controller
public class AdminController {
	
	@Autowired
	private DishService dishService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private AdminDTO adminDTO;

	@RequestMapping(value="/admin/adminSignIn", method = RequestMethod.GET)
	public String userSignIn() {
		return "/admin/adminSignIn";
	}
	
	@RequestMapping(value="/admin/adminLogin")
	public String login(@ModelAttribute AdminDTO adminDTO, Model model,HttpSession session) {
		
	    List<DishDTO> dishList = dishService.getDishIndexList();
	    model.addAttribute("dishList", dishList != null ? dishList : List.of());
	
	    adminDTO = adminService.login(adminDTO);
	    
	    if (adminDTO == null) {
	        model.addAttribute("error", "로그인 실패! 아이디 또는 비밀번호가 잘못되었습니다.");
	        return "/admin/adminSignIn"; 
	    }
	    session.setAttribute("adminDTO", adminDTO);

	    return "redirect:/";// /WEB-INF/index.jsp
	}
	
	@RequestMapping(value="/admin/adminLogout", method = RequestMethod.GET)
	public String userLogout(HttpSession session)  {	
		session.removeAttribute("adminDTO");	
		return "redirect:/";
	}
	
	

	
}

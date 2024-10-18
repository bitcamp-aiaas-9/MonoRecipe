package com.controller.MonoRecipe;


import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import admin.bean.AdminDTO;
import dish.bean.DishDTO;
import dish.service.DishService;


// String dimage; 수업 userupload 테이블의 imageOriginalFileName
// String dimageUUID; 수업 userupload 테이블의 imageFileName

@Controller

@RequestMapping(value = "/dish")
public class DishController {

	@Autowired
	private DishService dishService;
	
	@Autowired
	private AdminDTO adminDTO;
	
	
	@RequestMapping(value="/dishList")
	public String dishList(@RequestParam(required = false, defaultValue = "1") String pg, Model model, HttpSession session) {
	    
	    AdminDTO adminDTO = (AdminDTO) session.getAttribute("adminDTO");
		
		Map<String, Object> dishPageMap = dishService.getDishList(pg);
		String searchKey = (String) session.getAttribute("searchKey");
	    if (searchKey != null && !searchKey.isEmpty()) {
	        // 검색어가 있다면, 검색어를 사용한 리스트를 가져오도록 수정
	        dishPageMap = dishService.getdishListSearch(pg, searchKey);
	    }
		dishPageMap.put("pg", pg);
		model.addAttribute("dishPageMap", dishPageMap);
		session.setAttribute("adminDTO", adminDTO);

		return "/dish/dishList"; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/dishListDelete", method = RequestMethod.POST, produces="text/html; charset=UTF-8")
	public void uploadDelete(@RequestParam("check") String[] check) {
		for (String dcode: check) {
		}
		dishService.dishListDelete(check);
	}		
	
	
	
	//메인페이지 검색
	@RequestMapping(value="/indxSearch", method = RequestMethod.POST)
	public String indxSearch(@RequestParam String SearhKey, HttpSession session) {
	    System.out.println("Received search key: " + SearhKey);
	    session.setAttribute("searchKey", SearhKey); // 세션에 검색어 저장
	    return "redirect:/dish/dishList"; // 리스트 페이지로 리다이렉트
	}
	//새로고침세션 삭제
	@RequestMapping(value="/clearSearchSession", method = RequestMethod.POST)
	@ResponseBody
	public void clearSearchSession(HttpSession session) {
	    if (session.getAttribute("searchKey") != null) {
	        session.removeAttribute("searchKey");
	        System.out.println("Search session cleared.");
	    }
	}
	
	//리스트 검색
	@RequestMapping(value="/dishListSearch",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> dishListSearch(@RequestParam(required = false, defaultValue = "1")
											String pg, String SearhKey,Model model,HttpSession session) {
		
		 if (session.getAttribute("searchKey") != null) {
		        session.removeAttribute("searchKey");
		        System.out.println("Search session cleared.");
		    }
		Map<String, Object> dishPageMap = dishService.getdishListSearch(pg,SearhKey);
		dishPageMap.put("pg", pg);
		model.addAttribute("dishPageMap", dishPageMap);
		
		return dishPageMap; 
	}
	
	
	@RequestMapping(value="/dishView")
	public String dishView(@RequestParam String dcode,Model model) {
	   
		DishDTO dishDTO=dishService.getDishDTO(dcode);
		model.addAttribute("dishDTO", dishDTO);
		return "/dish/dishView"; 
	}
	
	
	
	@RequestMapping(value="/dishWrite")
	public String dishWrite() {
	   return "/dish/dishWrite"; 
	}
	
	@RequestMapping(value = "/dishWriteUpload", method = RequestMethod.POST)
	@ResponseBody
	public String dishWriteUpload(@ModelAttribute DishDTO dishDTO,
	                     @RequestParam("image") MultipartFile img) {
	    
		
		System.out.println("dto = "+dishDTO);
	    // DB 저장 로직
	    dishService.dishWrite(dishDTO ,img); 

	   
	    return "이미지 저장";
	    
	}
	
	@RequestMapping(value="/dishUpdate")
	public String dishUpdate(@RequestParam String dcode,Model model) {
		DishDTO dishDTO=dishService.getDishDTO(dcode);
		model.addAttribute("dishDTO", dishDTO);
	   return "/dish/dishUpdate"; 
	}
	
	
	@RequestMapping(value = "/dishUpdateUpload", method = RequestMethod.POST)
	@ResponseBody
	public String dishUpdateUpload(@ModelAttribute DishDTO dishDTO,
	                     @RequestParam("image") MultipartFile img) {
	    
		
		System.out.println("dto = "+dishDTO);
	    // DB 저장 로직
	    dishService.dishupdate(dishDTO ,img); 

	   
	    return "이미지 수정";
	    
	}
	
	@RequestMapping(value="/dishDelete")
	@ResponseBody
	public String dishDelete(@RequestParam String dcode,Model model) {
		dishService.dishDelete(dcode);
		
	   return "삭제 완료"; 
	}	

}

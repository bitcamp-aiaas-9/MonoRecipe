package com.controller.MonoRecipe;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dish.bean.DishDTO;
import dish.service.DishService;


// String dimage; 수업 userupload 테이블의 imageOriginalFileName
// String dimageUUID; 수업 userupload 테이블의 imageFileName

@Controller

@RequestMapping(value = "/dish")
public class DishController {

	@Autowired
	private DishService dishService;
	
	/** ObjectStorageService 작업은 DishServiceImpl.java 에서 수행 */
	
	
	
	
	/** 채연 */
	// MonoRecipe/src/main/java/com/controller/MonoRecipe/DishController.java
	@RequestMapping(value="/dishList")
	public String dishList(@RequestParam(required = false, defaultValue = "1") String pg, Model model) {
		Map<String, Object> dishPageMap = dishService.getDishList(pg);
		dishPageMap.put("pg", pg);
		model.addAttribute("dishPageMap", dishPageMap);
		System.out.println(dishPageMap); // 디버깅용

		return "/dish/dishList"; 
	}
	
	
	
	
	
	
	
	
	
	/** 민선 */
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

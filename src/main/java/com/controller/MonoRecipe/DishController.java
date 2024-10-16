package com.controller.MonoRecipe;






import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

	
	
	
	
	
	
	
	
	
	
	
	
	
	/** 민선 */
	@RequestMapping(value="/dishWrite")
	public String dishWrite() {
	   return "/dish/dishWrite"; 
	}
	
	@RequestMapping(value = "/dishWriteUpload", method = RequestMethod.POST)
	@ResponseBody
	public String dishWriteUpload(@ModelAttribute DishDTO dishDTO,
	                     @RequestParam("dimage") MultipartFile img) {
	    

	    // DB 저장 로직
	    dishService.dishWrite(dishDTO ,img); 

	   
	    return "이미지 저장";
	    
	}
	
	@RequestMapping(value="/dishUpdate")
	public String dishUpdate() {
	   return "/dish/dishUpdate"; 
	}
	
	
		

}

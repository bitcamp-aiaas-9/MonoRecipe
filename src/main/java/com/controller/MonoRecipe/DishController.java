package com.controller.MonoRecipe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dish.service.DishService;
import dish.service.ObjectStorageService;

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
	public String index() {
	   return "/dish/dishWrite"; // /WEB-INF/index.jsp
	}
	
	
		

}

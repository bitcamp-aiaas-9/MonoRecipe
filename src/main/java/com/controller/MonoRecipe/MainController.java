// MonoRecipe/src/main/java/com/controller/MonoRecipe/MainController.java
package com.controller.MonoRecipe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dish.bean.DishDTO;
import dish.service.DishService;

@Controller
public class MainController {
	@Autowired
	private DishService dishService;
	
	@RequestMapping(value="/")
	public String index(Model model) {
	    List<DishDTO> dishList = dishService.getDishIndexList();
	    model.addAttribute("dishList", dishList != null ? dishList : List.of());

	    return "/index"; // /WEB-INF/index.jsp
	}
	
   
	@RequestMapping(value = "/common/header", method = RequestMethod.GET)
	public String header() {
	    return "/common/header"; // /WEB-INF/common/header.jsp
	}

	@RequestMapping(value = "/common/footer", method = RequestMethod.GET)
	public String footer() {
	    return "/common/footer"; // /WEB-INF/common/footer.jsp
	}
}

// MonoRecipe/src/main/java/com/controller/MonoRecipe/MainController.java
package com.controller.MonoRecipe;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
   
	@RequestMapping(value="/")
	public String index() {
	   return "/index"; // /WEB-INF/index.jsp
	}
   
	@RequestMapping(value = "/common/header", method = RequestMethod.GET)
	public String header() {
	    return "/common/header"; // /WEB-INF/common/header.jsp
	}

}

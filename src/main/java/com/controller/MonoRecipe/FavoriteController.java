package com.controller.MonoRecipe;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dish.bean.DishDTO;
import favorite.bean.FavoriteDTO;
import favorite.service.FavoriteService;
import user.bean.UserDTO;

@Controller


public class FavoriteController {
   
	@Autowired
	private FavoriteDTO favoriteDTO;
   
	@Autowired
	private UserDTO userDTO;
   
	@Autowired
	private FavoriteService favoriteService;

   //체크
   @RequestMapping(value = "/favorite/favoriteCheck", method = RequestMethod.POST, produces="text/html; charset=UTF-8")
   @ResponseBody
   public String favoriteCheck(@RequestBody Map<String, String> requestData) {
       String dcode = requestData.get("dcode"); 
        String uid = requestData.get("uid");
        System.out.println(dcode+uid);
      
      String color=favoriteService.favoriteCheck(uid,dcode);
      
      return color;
   }   

   
   //저장
   @ResponseBody
   @RequestMapping(value = "favorite/favoritePuls", method = RequestMethod.POST, produces="text/html; charset=UTF-8")
   public String favoritePuls(@RequestBody Map<String, String> requestData) {
      //유저 아이디 가져오기 
      String dcode = requestData.get("dcode"); 
        String uid = requestData.get("uid");
      
      favoriteService.favoritePuls(uid,dcode);
      return "저장 완료";
   }   
   

   @ResponseBody
   @RequestMapping(value = "favorite/favoriteDelete", method = RequestMethod.POST, produces="text/html; charset=UTF-8")
   public String favoriteDelete(@RequestBody Map<String, String> requestData) {
       String dcode = requestData.get("dcode"); 
       String uid = requestData.get("uid");

       favoriteService.removeFavorite(uid, dcode); // 즐겨찾기 삭제
       return "삭제 완료"; // 성공 메시지
   }
   
// MonoRecipe/src/main/java/com/controller/MonoRecipe/FavoriteController.java
	/** MyPage 에서 즐겨찾기 목록 삭제 */
	@ResponseBody
	@RequestMapping(value = "favorite/favoriteListDelete", method = RequestMethod.POST, produces="text/html; charset=UTF-8")
	public void uploadDelete(@RequestParam("check") String[] check) {
		 favoriteService.favoriteListDelete(check);
	}   
   
	
	
}

package com.controller.MonoRecipe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dish.bean.DishDTO;
import review.bean.ReviewDTO;
import review.service.ReviewService;

@Controller

@RequestMapping(value = "/dish")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="/reviewWrite", method = RequestMethod.POST)
	@ResponseBody
	public String reviewWrite(@RequestBody ReviewDTO reviewDTO) {
	    System.out.println(reviewDTO.getRscore());
	    reviewService.reviewWrite(reviewDTO);
	    return "작성 완료"; 
	}
	@RequestMapping(value="/reviewList", method = RequestMethod.POST)
	@ResponseBody
	public List<ReviewDTO> reviewList(@RequestBody String dcode) {
		dcode = dcode.replace("\"", "");
		System.out.println("Received dcode: " + dcode);
		
	    return reviewService.getReviewList(dcode);
		   
	}
	@RequestMapping(value="/reviewUpdate", method = RequestMethod.POST)
	@ResponseBody
	public String reviewUpdate(@RequestBody ReviewDTO reviewDTO) {
		System.out.println(reviewDTO.getRcode());
		//내용 별점 날짜만 변경해야함
		reviewService.reviewUpdate(reviewDTO);
		return "업뎃 완료"; 
	}
	
	@RequestMapping(value="/reviewDelete", method = RequestMethod.POST)
	@ResponseBody
	public String reviewDelete(@RequestParam String rcode) {
	    System.out.println(rcode);
	    // 내용 별점 날짜만 변경해야함
	    reviewService.reviewDelete(rcode);
	    return "삭제 완료"; 
	}
	
	
}

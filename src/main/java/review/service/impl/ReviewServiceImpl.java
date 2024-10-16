package review.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import review.bean.ReviewDTO;
import review.dao.ReviewDAO;
import review.service.ReviewService;
@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;
	
		
	@Override
	public void reviewWrite(ReviewDTO reviewDTO ) {
		reviewDAO.reviewWrite(reviewDTO);
		
	}


	@Override
	public List<ReviewDTO> getReviewList(String dcode) {
		
		System.out.println(Integer.parseInt(dcode));
		List<ReviewDTO> list = reviewDAO.getReviewList(Integer.parseInt(dcode));
	    System.out.println("Retrieved reviews: " + list);
		return list;
	}

}

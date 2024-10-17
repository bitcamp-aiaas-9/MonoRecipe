package review.service;

import java.util.List;

import review.bean.ReviewDTO;

public interface ReviewService {

	void reviewWrite(ReviewDTO reviewDTO);

	List<ReviewDTO> getReviewList(String dcode);

	void reviewUpdate(ReviewDTO reviewDTO);

	void reviewDelete(String rcode);

}

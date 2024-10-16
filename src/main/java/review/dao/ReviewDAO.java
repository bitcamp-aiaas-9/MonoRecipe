package review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import review.bean.ReviewDTO;

@Mapper
public interface ReviewDAO {

	void reviewWrite(ReviewDTO reviewDTO);

	List<ReviewDTO> getReviewList(String dcode);

	List<ReviewDTO> getReviewList(int rdishcode);

}

package dish.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import dish.bean.DishDTO;

public interface DishService {
	
	
	
	/** 채연 */

	public List<DishDTO> getDishList();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/** 민선 
	 * @param img */
	
	
	
	public void dishWrite(DishDTO dishDTO, MultipartFile img);

	public DishDTO getDishDTO(String seq);

	public void dishupdate(DishDTO dishDTO, MultipartFile img);

	public void dishDelete(String seq);
	
	
}

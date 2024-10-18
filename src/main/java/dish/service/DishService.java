package dish.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import dish.bean.DishDTO;

public interface DishService {
	
	public List<DishDTO> getDishIndexList();
	
	public Map<String, Object> getDishList(String pg);
	
	public void dishListDelete(String[] check);
	
	public void dishWrite(DishDTO dishDTO, MultipartFile img);

	public DishDTO getDishDTO(String seq);

	public void dishupdate(DishDTO dishDTO, MultipartFile img);

	public void dishDelete(String seq);

	public Map<String, Object> getdishListSearch(String pg, String searhKey);
	
}

// MonoRecipe/src/main/java/dish/dao/DishDAO.java
package dish.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import dish.bean.DishDTO;

@Mapper
public interface DishDAO {
	
	/** 채연 */
	public List<DishDTO> getDishIndexList();
	
	public List<DishDTO> getDishList(Map<String, Integer> map);
	
	public int getTotalA();
	
	// MonoRecipe/src/main/java/dish/dao/DishDAO.java
	public String getDimageUUID(int dcode);

	public void dishListDelete(List<String> list);
	
	
	
	
	
	
	/** 민선 */
	
	void dishWrite(DishDTO dishDTO);

	DishDTO getDishDTO(String seq);

	String getImageFileName(int dcode);

	void dishUpdate(DishDTO dishDTO);

	void dishDelete(String seq);

	String getimageOriginalFileName(int dcode);

	public List<DishDTO> getdishListSearch(Map<String, Object> map);

	public int getTotalASearch(String searchKey);
	
	
	
	
}

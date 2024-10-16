// MonoRecipe/src/main/java/dish/dao/DishDAO.java
package dish.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dish.bean.DishDTO;

@Mapper
public interface DishDAO {
	
	/** 채연 */
	
	public List<DishDTO> getDishIndexList();
	
	
	
	
	
	
	
	
	
	
	
	
	
	/** 민선 */
	
	void dishWrite(DishDTO dishDTO);

	DishDTO getDishDTO(String seq);

	String getImageFileName(int dcode);

	void dishUpdate(DishDTO dishDTO);

	void dishDelete(String seq);

	String getimageOriginalFileName(int dcode);
	
	
	
	
}

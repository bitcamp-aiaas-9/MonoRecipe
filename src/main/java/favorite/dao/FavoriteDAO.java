package favorite.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import dish.bean.DishDTO;

@Mapper
public interface FavoriteDAO {

	public Integer  getFavoriteFcode(Map<String, String> params);

	public void favoritePuls(Map<String, String> params);

	public void removeFavorite(Map<String, String> params);

	public List<DishDTO> getFavoriteList(String uid);

	public void favoriteListDelete(List<Integer> list);

}

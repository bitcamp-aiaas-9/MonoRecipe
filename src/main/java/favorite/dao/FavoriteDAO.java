package favorite.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FavoriteDAO {

	Integer  getFavoriteFcode(Map<String, String> params);

	void favoritePuls(Map<String, String> params);

	void removeFavorite(Map<String, String> params);

}

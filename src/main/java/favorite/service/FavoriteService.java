// favorite/service/FavoriteService.java
package favorite.service;

import java.util.List;

import dish.bean.DishDTO;

public interface FavoriteService {

	public void favoritePuls(String fuserid, String dcode);

	public String favoriteCheck(String uid, String dcode);

	public void removeFavorite(String uid, String dcode);

	public List<DishDTO> getFavoriteList(String uid);

	public void favoriteListDelete(String[] check);

}

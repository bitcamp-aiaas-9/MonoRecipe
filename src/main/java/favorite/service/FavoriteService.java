package favorite.service;

public interface FavoriteService {

	void favoritePuls(String fuserid, String dcode);

	String favoriteCheck(String uid, String dcode);

	void removeFavorite(String uid, String dcode);

}

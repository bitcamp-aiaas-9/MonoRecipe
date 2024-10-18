package favorite.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import favorite.dao.FavoriteDAO;
import favorite.service.FavoriteService;

@Service
public class FavoriteServiceImpl implements FavoriteService{
	
	@Autowired
	private FavoriteDAO favoriteDAO;

	
	@Override
	public String favoriteCheck(String uid, String dcode) {
	    String color = "";
	    Map<String, String> params = new HashMap<>();
	    params.put("fuserid", uid);
	    params.put("fdishcode", dcode);
	    
	    Integer fcode = favoriteDAO.getFavoriteFcode(params); // Map을 전달
	    System.out.println("fcode"+fcode);
	    if (fcode != null && fcode > 0) {
	        color = "red";
	    } else {
	        color = "black";
	    }
	    return color;
	}
	
	@Override
	public void favoritePuls(String fuserid, String dcode) {
		
		
		Map<String, String> params = new HashMap<>();
	    params.put("fuserid", fuserid);
	    params.put("fdishcode", dcode);
		
	    favoriteDAO.favoritePuls(params);
	}

	@Override
	public void removeFavorite(String uid, String dcode) {
		Map<String, String> params = new HashMap<>();
	    params.put("fuserid", uid);
	    params.put("fdishcode", dcode);
	    
	    favoriteDAO.removeFavorite(params);
		
	}

	

}

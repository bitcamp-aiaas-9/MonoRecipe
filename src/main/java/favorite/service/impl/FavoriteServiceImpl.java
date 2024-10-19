// favorite/service/impl/FavoriteServiceImpl.java
package favorite.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dish.bean.DishDTO;
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

	@Override
	public List<DishDTO> getFavoriteList(String uid) {
		List<DishDTO> favoriteList = favoriteDAO.getFavoriteList(uid);
		return favoriteList;
	}

	/** My Page 즐겨찾기 목록 삭제 */
	@Override
	public void favoriteListDelete(String[] check) {
		List<Integer> list = new ArrayList<>();
		for (String dcode : check) {
			int fdishcode = Integer.parseInt(dcode);
			list.add(fdishcode);
		}
		favoriteDAO.favoriteListDelete(list);
	}

	

}

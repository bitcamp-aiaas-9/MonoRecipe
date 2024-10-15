package dish.service.impl;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dish.bean.DishDTO;
import dish.bean.DishPaging;
import dish.dao.DishDAO;
import dish.service.DishService;
import dish.service.ObjectStorageService;
@Service
public class DishServiceImpl implements DishService {
	
	@Autowired
	private DishDAO dishDAO;
	
	@Autowired
	private DishPaging dishPaging;
	
	
	@Autowired
	private ObjectStorageService objectStorageService;
	
	private String bucketName = "monorecipe-9th-bucket";	
	@Autowired
	private HttpSession session;
	
	
	
	
	
	/** 채연 */

	
	
	
	
	
	
	
	
	
	
	
	
	
	/** 민선 */
	@Override
	public void dishwrite(DishDTO dishDTO) {
		
	     

		
	}	
	
	
		
}

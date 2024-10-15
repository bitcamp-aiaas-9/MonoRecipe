package dish.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	public void dishWrite(DishDTO dishDTO, MultipartFile img) {
		
		// 파일 저장 경로 설정
	    String filePath = session.getServletContext().getRealPath("WEB-INF/storage");
	    System.out.println("실제폴더 =" + filePath);

	    // 이미지 파일 이름
	    String imageOriginalFileName = img.getOriginalFilename();
	    File file = new File(filePath, imageOriginalFileName);

	    String imageFileName = objectStorageService.uploadFile(bucketName, "storage/", img);
	    
	    
	    try {
	        // 파일 저장
	        img.transferTo(file);
	    } catch (IllegalStateException | IOException e) {
	        e.printStackTrace();
	        throw new RuntimeException("파일 업로드 실패: " + e.getMessage());
	    }

	    dishDTO.setDimage(imageFileName);
	    dishDTO.setDimageUUID(imageOriginalFileName);

	    // DB에 저장
	    dishDAO.dishWrite(dishDTO);
		
	}
	
	
		
}

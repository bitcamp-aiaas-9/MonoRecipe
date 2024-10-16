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
	// 음식 레시피 저장
	@Override
	public void dishWrite(DishDTO dishDTO, MultipartFile img) {
		
		// 파일 저장 경로 설정
	    String filePath = session.getServletContext().getRealPath("WEB-INF/storage");
	    System.out.println("실제폴더 =" + filePath);

	    // 이미지 파일 이름
	    
		
	    
	    
	    String imageFileName = objectStorageService.uploadFile(bucketName, "storage/", img);
	    String imageOriginalFileName=img.getOriginalFilename();
	     File file =new File(filePath,imageOriginalFileName);

	    
	    
	    try {
			img.transferTo(file);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	    dishDTO.setDimageUUID(imageFileName);
	    dishDTO.setDimage(imageOriginalFileName);
	    
	    System.out.println(dishDTO.getDimage()+"/"+dishDTO.getDimageUUID()+"/"+dishDTO.getDintro()+"/"+dishDTO.getDname()+"/"+dishDTO.getDrecipe());
	    
	    // DB에 저장
	    dishDAO.dishWrite(dishDTO);
		
	}




	//음식 레시피 불러오기
	@Override
	public DishDTO getDishDTO(String seq) {
		
		return dishDAO.getDishDTO(seq);
	}




	//음식 레시피 수정하기
	@Override
	public void dishupdate(DishDTO dishDTO, MultipartFile img) {
		String filePath = session.getServletContext().getRealPath("WEB-INF/storage");
		
		System.out.println("실제폴더 =" +filePath);
		
		//object Storage(NCP)는 이미지를 어어쓰지않은다
		//db에서 seq에 해당하는 이미지 파일이름을 꺼내와 삭제하고 집어넣어 새로운 이미지로 수정
		
		String imageFileName=dishDAO.getImageFileName(dishDTO.getDcode());
		System.out.println("imageFileName=" + imageFileName);
		//이미지 삭제
		objectStorageService.deleteFile(bucketName, "storage/", imageFileName);
	    System.out.println("기존 이미지 삭제 완료: " + imageFileName);
	     
	     
		//새로운 이미지 올리기
	     imageFileName = objectStorageService.uploadFile(bucketName, "storage/", img);
	     String imageOriginalFileName=img.getOriginalFilename();
	     File file =new File(filePath,imageOriginalFileName);
	     
	     try {
			img.transferTo(file);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	     dishDTO.setDimageUUID(imageFileName);
		 dishDTO.setDimage(imageOriginalFileName);

	//DB
		 dishDAO.dishUpdate(dishDTO);
	}




	@Override
	public void dishDelete(String seq) {
		DishDTO dishDTO=dishDAO.getDishDTO(seq);
		String imageFileName=dishDTO.getDimageUUID();
		System.out.println("imageFileName=" + imageFileName);
		//이미지 삭제
		objectStorageService.deleteFile(bucketName, "storage/", imageFileName);
	    System.out.println("기존 이미지 삭제 완료: " + imageFileName);
	    //db
	    dishDAO.dishDelete(seq);
	}
	
	
		
}

// MonoRecipe/src/main/java/dish/service/impl/DishServiceImpl.java
package dish.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	// MonoRecipe/src/main/java/dish/service/impl/DishServiceImpl.java
	@Override
	public List<DishDTO> getDishIndexList() {
	    List<DishDTO> dishList = dishDAO.getDishIndexList();
	    return dishList;
	}
	
	@Override
	public Map<String, Object> getDishList(String pg) {
		// 한페이지 당 12개씩
		int endNum = 12;
		int startNum = (Integer.parseInt(pg)) * endNum - endNum;
		
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);		
		
		// 2. DB
		List<DishDTO> list = dishDAO.getDishList(map);	
		
		// 3. 페이징 처리
				int totalA = dishDAO.getTotalA();
				
		        dishPaging.setCurrentPage(Integer.parseInt(pg));
		        dishPaging.setPageBlock(3);
		        dishPaging.setPageSize(12);
		        dishPaging.setTotalA(totalA);
		        dishPaging.makePagingHTML();	
				
		        Map<String, Object> dishPageMap = new HashMap<>();
		        dishPageMap.put("list", list);
		        dishPageMap.put("dishPaging", dishPaging);
		        
				return dishPageMap;
	}
	
	
	@Override
	public void dishListDelete(String[] check) {
		// dishMapper.xml 에서 forEach 사용하려면 데이터를 List 에 담아야 함
		List<String> list = new ArrayList<>();
		
		
		// Object Storage 에 있는 이미지도 삭제해야함 >> dimageUUID 을 list 에 담기
		for (String dcode : check) {
			String dimageUUID = dishDAO.getDimageUUID(Integer.parseInt(dcode));
			list.add(dimageUUID);
		}
		objectStorageService.deleteFile(bucketName, "storage/", list);
		
		
		// DB 삭제
		dishDAO.dishListDelete(list);
	}	
	
	
	
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
	public DishDTO getDishDTO(String dcode) {
		
		return dishDAO.getDishDTO(dcode);
	}




	//음식 레시피 수정하기
	@Override
	public void dishupdate(DishDTO dishDTO, MultipartFile img) {
		String filePath = session.getServletContext().getRealPath("WEB-INF/storage");
		System.out.println("받은값"+dishDTO.getDimage());
		System.out.println("실제폴더 =" +filePath);
		String orginimageFileName=dishDAO.getImageFileName(dishDTO.getDcode()); 
		System.out.println("imageFileName=" + orginimageFileName);
		//object Storage(NCP)는 이미지를 어어쓰지않은다
		//db에서 dcode에 해당하는 이미지 파일이름을 꺼내와 삭제하고 집어넣어 새로운 이미지로 수정
		if (img != null && !img.isEmpty()) {
	        // 기존 이미지 삭제
	        objectStorageService.deleteFile(bucketName, "storage/", orginimageFileName);
	        System.out.println("기존 이미지 삭제 완료: " + orginimageFileName);
	     // 새로운 이미지 업로드
	        orginimageFileName = objectStorageService.uploadFile(bucketName, "storage/", img);
	        
	        String imageOriginalFileName = img.getOriginalFilename();
	        File file = new File(filePath, imageOriginalFileName);
	        // 파일 경로 설정
	        
	        
	        try {
	            img.transferTo(file);
	        } catch (IllegalStateException | IOException e) {
	            e.printStackTrace();
	            return; // 오류 발생 시 메소드 종료
	        }
	        
	        dishDTO.setDimageUUID(orginimageFileName);
	        dishDTO.setDimage(imageOriginalFileName);
	     	System.out.println(orginimageFileName+"/"+imageOriginalFileName);
	 	   
	    } else {
	    	String imageOriginalFileName=dishDAO.getimageOriginalFileName(dishDTO.getDcode());
	    	dishDTO.setDimage(imageOriginalFileName);
	    	 dishDTO.setDimageUUID(orginimageFileName);
	    	System.out.println(orginimageFileName);
	    }
	//DB
		 dishDAO.dishUpdate(dishDTO);
	}




	@Override
	public void dishDelete(String dcode) {
		DishDTO dishDTO=dishDAO.getDishDTO(dcode);
		String imageFileName=dishDTO.getDimageUUID();
		System.out.println("imageFileName=" + imageFileName);
		//이미지 삭제
		objectStorageService.deleteFile(bucketName, "storage/", imageFileName);
	    System.out.println("기존 이미지 삭제 완료: " + imageFileName);
	    //db
	    dishDAO.dishDelete(dcode);
	}
	
	
		
}

package admin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.bean.AdminDTO;
import admin.dao.AdminDAO;
import admin.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public AdminDTO login(AdminDTO adminDTO) {
		return adminDAO.login(adminDTO);
	}

}

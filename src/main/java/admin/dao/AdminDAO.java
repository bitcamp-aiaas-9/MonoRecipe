package admin.dao;

import org.apache.ibatis.annotations.Mapper;

import admin.bean.AdminDTO;

@Mapper
public interface AdminDAO {

	AdminDTO login(AdminDTO adminDTO);

}

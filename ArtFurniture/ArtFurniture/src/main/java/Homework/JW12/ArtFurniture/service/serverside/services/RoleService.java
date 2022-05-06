package Homework.JW12.ArtFurniture.service.serverside.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.mysql.cj.Query;

import Homework.JW12.ArtFurniture.service.serverside.dto.CategoryModel;
import Homework.JW12.ArtFurniture.service.serverside.dto.RoleModel;
import Homework.JW12.ArtFurniture.service.serverside.entities.Category;
import Homework.JW12.ArtFurniture.service.serverside.entities.Role;

@Service
public class RoleService extends BaseService<Role> {

	@PersistenceContext // là tập các thể hiện của entity được quản lý, tồn tại trong một kho dữ liệu.
	EntityManager entityManager;// Entity Manager là đối tượng quản lý các entity.

	@Override
	protected EntityManager em() {
		// TODO Auto-generated method stub
		return entityManager;
	}

	@Override
	protected Class<Role> clazz() {
		// TODO Auto-generated method stub
		return Role.class;
	}

	public List<Role> search(RoleModel searchModel) {
		String sql = "select * from tbl_roles c where 1=1";// thu thuat de noi cau lechj
		if (searchModel != null) {
			if (searchModel.getId() > 0) {
				sql = sql + " and c.id" + searchModel.getId();
			}
			if (searchModel.getName() != null && !searchModel.getName().isEmpty()) {
				sql = sql + " and c.name like '%" + searchModel.getName() + "'%";
			}
		}

		return this.executeNativeSql(sql);
	}

	public Role getRoleByName(String role) {
		String sql = "select * from tbl_roles r where r.name ='Khach'";// " + role + "
		List<Role> listRole = this.executeNativeSql(sql);
		if (listRole == null || listRole.size() <= 0) {
			return null;
		} else {
			return listRole.get(0);
		}
	}

}

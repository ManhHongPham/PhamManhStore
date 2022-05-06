package Homework.JW12.ArtFurniture.service.serverside.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;

import Homework.JW12.ArtFurniture.service.serverside.dto.ProductModel;
import Homework.JW12.ArtFurniture.service.serverside.dto.UserModel;
import Homework.JW12.ArtFurniture.service.serverside.entities.Product;
import Homework.JW12.ArtFurniture.service.serverside.entities.Role;
import Homework.JW12.ArtFurniture.service.serverside.entities.User;

@Service
public class UserService extends BaseService<User> {
	@PersistenceContext
	EntityManager entityManager;

	@Override
	protected EntityManager em() {
		// TODO Auto-generated method stub
		return entityManager;
	}

	@Override
	protected Class<User> clazz() {
		// TODO Auto-generated method stub
		return User.class;
	}

	public List<User> search(UserModel seachModel) {
		String sql = "select *from tbl_products c where 1=1";
		if (seachModel != null) {
			if (seachModel.getId() > 0) {
				sql = sql + "and c.id" + seachModel.getId();
			}
			if (seachModel.getNameUser() != null && !seachModel.getNameUser().isEmpty()) {
				sql = sql + "and c.title like '%" + seachModel.getNameUser() + "'%";
			}
		}
		return this.executeNativeSql(sql);
	}

	public User loadUserByUsername(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "'";
		List<User> users = this.executeNativeSql(sql);
		if (users == null || users.size() <= 0)
			return null;
		return users.get(0);
	}
}

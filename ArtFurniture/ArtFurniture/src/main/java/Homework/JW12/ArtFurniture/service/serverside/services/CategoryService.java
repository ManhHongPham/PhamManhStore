package Homework.JW12.ArtFurniture.service.serverside.services;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import Homework.JW12.ArtFurniture.service.serverside.dto.CategoryModel;
import Homework.JW12.ArtFurniture.service.serverside.entities.Category;

@Service // connect to database
public class CategoryService extends BaseService<Category> {

	@Override
	protected EntityManager em() {

		return entityManager;
	}

	@Override
	protected Class<Category> clazz() {
		// TODO Auto-generated method stub
		return Category.class;
	}

	@PersistenceContext // là tập các thể hiện của entity được quản lý, tồn tại trong một kho dữ liệu.
	EntityManager entityManager;// Entity Manager là đối tượng quản lý các entity.

	// @SuppressWarnings("unchecked")

	public Category edit(Category category) throws Exception {
		try {
			Category categoryOnDb = super.getById(category.getId());

			Category saved = super.saveOrUpdate(category);
			return saved;
		} catch (Exception e) {
			throw e;
		}

	}

	public Category save(Category category) throws Exception {
		try {
			Category saved = super.saveOrUpdate(category);
			return saved;
		} catch (Exception e) {
			throw e;
		}

	}

	/**
	 * tra ve danh sach Menu cha.
	 * 
	 * @return
	 */
	public List<Category> getAllParents() {
		String sql = "select * from tbl_category tc where tc.parent_id is null";
		return this.executeNativeSql(sql);
	}

	/**
	 * tim kiem danh sach categories.
	 * 
	 * @param searchModel
	 * @return
	 */
	public List<Category> search(CategoryModel searchModel) {
		String sql = "SELECT * FROM tbl_category c WHERE 1=1"; // thu thuat de noi cau lechj

		if (searchModel != null) {
			if (searchModel.getId() > 0) {
				sql = sql + " AND c.id = " + searchModel.getId();
			}
			if (searchModel.getName() != null && !searchModel.getName().isEmpty()) {
				sql = sql + " AND c.name like '%" + searchModel.getId() + "%'";
			}
		}

		return this.executeNativeSql(sql);
	}

	public Page<Category> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

}

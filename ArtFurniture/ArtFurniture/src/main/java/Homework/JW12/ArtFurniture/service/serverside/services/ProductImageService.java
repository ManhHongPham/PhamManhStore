package Homework.JW12.ArtFurniture.service.serverside.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;

import Homework.JW12.ArtFurniture.service.serverside.dto.ContactModel;
import Homework.JW12.ArtFurniture.service.serverside.dto.ProductModel;
import Homework.JW12.ArtFurniture.service.serverside.entities.Contact;
import Homework.JW12.ArtFurniture.service.serverside.entities.ProductImage;

@Service
public class ProductImageService extends BaseService<ProductImage> {

	@PersistenceContext
	EntityManager entityManager;

	@Override
	protected EntityManager em() {
		// TODO Auto-generated method stub
		return entityManager;
	}

	@Override
	protected Class<ProductImage> clazz() {
		// TODO Auto-generated method stub
		return ProductImage.class;
	}

	public List<ProductImage> search(ProductModel seachModel) {
		String sql = "select *from tbl_contact c where 1=1";
		if (seachModel != null) {
			if (seachModel.getId() > 0) {
				sql = sql + "and c.id" + seachModel.getId();
			}
			if (seachModel.getTitle() != null && !seachModel.getTitle().isEmpty()) {
				sql = sql + "and c.title like '%" + seachModel.getTitle() + "'%";
			}
		}
		return this.executeNativeSql(sql);
	}

}

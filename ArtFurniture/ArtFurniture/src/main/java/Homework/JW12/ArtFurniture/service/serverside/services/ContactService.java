package Homework.JW12.ArtFurniture.service.serverside.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;

import Homework.JW12.ArtFurniture.service.serverside.dto.ContactModel;
import Homework.JW12.ArtFurniture.service.serverside.dto.ProductModel;
import Homework.JW12.ArtFurniture.service.serverside.entities.Contact;
import Homework.JW12.ArtFurniture.service.serverside.entities.Product;

@Service
public class ContactService extends BaseService<Contact> {

	@PersistenceContext
	EntityManager entityManager;

	public List<Contact> search(ContactModel seachModel) {
		String sql = "select *from tbl_contact c where 1=1";
		if (seachModel != null) {
			if (seachModel.getId() > 0) {
				sql = sql + "and c.id" + seachModel.getId();
			}
			if (seachModel.getMessage() != null && !seachModel.getMessage().isEmpty()) {
				sql = sql + "and c.title like '%" + seachModel.getMessage() + "'%";
			}
		}
		return this.executeNativeSql(sql);
	}

	@Override
	protected EntityManager em() {

		return entityManager;
	}

	@Override
	protected Class<Contact> clazz() {
		// TODO Auto-generated method stub
		return Contact.class;
	}

}

package Homework.JW12.ArtFurniture.service.serverside.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import Homework.JW12.ArtFurniture.service.serverside.dto.UserModel;
import Homework.JW12.ArtFurniture.service.serverside.entities.Role;
import Homework.JW12.ArtFurniture.service.serverside.entities.SaleOrder;
import Homework.JW12.ArtFurniture.service.serverside.entities.SaleOrderProduct;
import Homework.JW12.ArtFurniture.service.serverside.entities.User;

@Service
public class SaleOrderService extends BaseService<SaleOrder> {

	@PersistenceContext
	EntityManager entityManager;

	@Override
	protected EntityManager em() {
		// TODO Auto-generated method stub
		return entityManager;
	}

	@Override
	protected Class<SaleOrder> clazz() {
		// TODO Auto-generated method stub
		return SaleOrder.class;
	}

	@Transactional(rollbackOn = Exception.class)
	public SaleOrder save(SaleOrder saleOrder) throws Exception {
		try {

			// SaleOrderProduct.setSeo(new Slugify().slugify(saleOrderProduct.get));

			// save to db
			SaleOrder saved = super.saveOrUpdate(saleOrder);
			return saved;
		} catch (Exception e) {
			throw e;
		}
	}

	public List<SaleOrder> search(SaleOrder seachModel) {
		String sql = "select *from tbl_saleorder c where 1=1";
		if (seachModel != null) {
			if (seachModel.getId() > 0) {
				sql = sql + "and c.id" + seachModel.getId();
			}
			if (seachModel.getCustomerName() != null && !seachModel.getCustomerName().isEmpty()) {
				sql = sql + "and c.title like '%" + seachModel.getCustomerName() + "'%";
			}
		}
		return this.executeNativeSql(sql);
	}

	public SaleOrder getTotal() {
		String sql = "select count(*) from tbl_saleorder ";// " + role + "
		List<SaleOrder> listRole = this.executeNativeSql(sql);
		
		if (listRole == null || listRole.size() <= 0) {
			return null;
		} else {
			return listRole.get(0);
		}
	}

}

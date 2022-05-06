package Homework.JW12.ArtFurniture.service.serverside.services;

import java.io.File;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.github.slugify.Slugify;

import Homework.JW12.ArtFurniture.service.serverside.conf.MVCConf;
import Homework.JW12.ArtFurniture.service.serverside.entities.Product;
import Homework.JW12.ArtFurniture.service.serverside.entities.ProductImage;
import Homework.JW12.ArtFurniture.service.serverside.entities.SaleOrderProduct;

@Service
public class SaleOrderProductService extends BaseService<SaleOrderProduct> {

	@PersistenceContext
	EntityManager entityManager;

	@Override
	protected EntityManager em() {
		// TODO Auto-generated method stub
		return entityManager;
	}

	@Override
	protected Class<SaleOrderProduct> clazz() {
		// TODO Auto-generated method stub
		return SaleOrderProduct.class;
	}

	
	@Transactional(rollbackOn = Exception.class)
	public SaleOrderProduct save(SaleOrderProduct saleOrderProduct) throws Exception {
		try {
			
			

			//SaleOrderProduct.setSeo(new Slugify().slugify(saleOrderProduct.get));

			// save to db
			SaleOrderProduct saved = super.saveOrUpdate(saleOrderProduct);
			return saved;
		} catch (Exception e) {
			throw e;
		}
	}

}

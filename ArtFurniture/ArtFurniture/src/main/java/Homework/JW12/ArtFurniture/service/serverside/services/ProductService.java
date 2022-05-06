package Homework.JW12.ArtFurniture.service.serverside.services;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.github.slugify.Slugify;

import org.springframework.util.StringUtils;

import Homework.JW12.ArtFurniture.service.serverside.conf.MVCConf;
import Homework.JW12.ArtFurniture.service.serverside.dto.ProductModel;
import Homework.JW12.ArtFurniture.service.serverside.dto.ProductSearchModel;
import Homework.JW12.ArtFurniture.service.serverside.entities.Product;
import Homework.JW12.ArtFurniture.service.serverside.entities.ProductImage;

@Service
public class ProductService extends BaseService<Product> {
	@Override
	protected EntityManager em() {
		return entityManager;
	}

	@Autowired
	ProductImageService productImageService;

	@Override
	protected Class<Product> clazz() {
		// TODO Auto-generated method stub
		return Product.class;
	}

	@PersistenceContext
	EntityManager entityManager;

	// ------------------------check co upload file khong

	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}

	// --------------------------end check

	@Transactional(rollbackOn = Exception.class) // dam bao tinh nhat quan neu 1 trong cac cong viec ben duoi sai thi se
													// k thuc hien
	public Product edit(Product product, MultipartFile avatar, MultipartFile[] pictures) throws Exception {
		try {
			// lay thong tin san pham trong db.
			Product productOnDb = super.getById(product.getId());

			// avatar
			if (!isEmptyUploadFile(avatar)) {
				// xoa avatar cu di
				new File(MVCConf.ROOT_UPLOAD_PATH + productOnDb.getAvatar()).delete();

				// add avartar moi
				avatar.transferTo(new File(MVCConf.ROOT_UPLOAD_PATH + "avatar/" + avatar.getOriginalFilename()));
				product.setAvatar("avatar/" + avatar.getOriginalFilename());
			} else {
				// su dung lai avatar cu
				product.setAvatar(productOnDb.getAvatar());
			}

			// product images
			if (!isEmptyUploadFile(pictures)) {
				// xoa danh sach anh cu di
				List<ProductImage> productImagesOnDb = productOnDb.getProductImages();
				for (ProductImage pic : productImagesOnDb) {
					new File(MVCConf.ROOT_UPLOAD_PATH + pic.getPath()).delete();
//					product.deleteProductImages(pic);
					productImageService.delete(pic);
				}

				// update danh sach anh moi
				for (MultipartFile pic : pictures) {
					pic.transferTo(new File(MVCConf.ROOT_UPLOAD_PATH + "image/" + pic.getOriginalFilename()));

					ProductImage pi = new ProductImage();
					pi.setPath("image/" + pic.getOriginalFilename());
					pi.setTitle(pic.getOriginalFilename());
					product.addProductImages(pi);
				}
			}

			// auto set seoproduct when upload or edit
			product.setSeo(new Slugify().slugify(product.getTitle()));

			// save to db
			Product saved = super.saveOrUpdate(product);
			return saved;
		} catch (Exception e) {
			throw e;
		}
	}

	@Transactional(rollbackOn = Exception.class)
	public Product save(Product product, MultipartFile avatar, MultipartFile[] pictures) throws Exception {
		try {
			// avatar
			if (!isEmptyUploadFile(avatar)) {
				avatar.transferTo(new File(MVCConf.ROOT_UPLOAD_PATH + "avatar/" + avatar.getOriginalFilename()));
				product.setAvatar("avatar/" + avatar.getOriginalFilename());
			}

			// product images
			if (!isEmptyUploadFile(pictures)) {
				for (MultipartFile pic : pictures) {
					pic.transferTo(new File(MVCConf.ROOT_UPLOAD_PATH + "image/" + pic.getOriginalFilename()));

					ProductImage pi = new ProductImage();
					pi.setPath("image/" + pic.getOriginalFilename());
					pi.setTitle(pic.getOriginalFilename());
					product.addProductImages(pi);
				}
			}

			product.setSeo(new Slugify().slugify(product.getTitle()));

			// save to db
			Product saved = super.saveOrUpdate(product);
			return saved;
		} catch (Exception e) {
			throw e;
		}
	}

	public List<Product> search(ProductSearchModel searchModel) {
		String sql = "SELECT * FROM tbl_products p WHERE 1=1";

		// tim kiem san pham theo categoryId
		if (searchModel.getCategoryId() > 0) {
			sql += " and p.category_id = " + searchModel.getCategoryId();
		}

		// tim kiem san pham theo productSeo
		if (!StringUtils.isEmpty(searchModel.getProductSeo())) {
			sql += " and p.seo ='" + searchModel.getProductSeo() + "'";
		}
		// tim kiem san pham theo categorySeo
		if (!StringUtils.isEmpty(searchModel.getCategorySeo())) {
			sql += " and p.category_id in (select id from tbl_category c where c.seo = '" + searchModel.getCategorySeo()
					+ "')";
		}

		// tim kiem san pham theo seachText
		if (!StringUtils.isEmpty(searchModel.getSearchText())) {
			sql += " and (p.title like '%" + searchModel.getSearchText() + "%'" + " or p.detail_description like '%"
					+ searchModel.getSearchText() + "%'" + " or p.short_description like '%"
					+ searchModel.getSearchText() + "%')";
		}

		return executeNativeSql(sql);
	}

//	public Page<Product> listAll(int pageNum){
//        int pageSize = 2;
//        PageRequest page = PageRequest.of(pageNum - 1, pageSize);
//        return ProductService.findAll(page);
//    }
}

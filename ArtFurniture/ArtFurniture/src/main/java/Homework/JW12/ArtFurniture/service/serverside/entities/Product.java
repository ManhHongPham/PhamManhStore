package Homework.JW12.ArtFurniture.service.serverside.entities;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import Homework.JW12.ArtFurniture.service.serverside.dto.SaleOrderProductModel;

@Entity
@Table(name = "tbl_products")
public class Product extends BaseEntity {

	// ---------declare colum--------
	@Column(name = "title", length = 1000, nullable = false)
	private String title;

	@Column(name = "price", precision = 13, scale = 1, nullable = false)
	private BigDecimal price;

	@Column(name = "price_sale", precision = 13, scale = 1, nullable = true)
	private BigDecimal price_sale;

	@Column(name = "short_description", length = 1000, nullable = false)
	private String short_description;

	@Column(name = "avatar", length = 200, nullable = true)
	private String avatar;

	@Lob
	@Column(name = "detail_description", nullable = false, columnDefinition = "LONGTEXT")
	private String detail_description;

	@Column(name = "is_hot", nullable = true)
	private Boolean hot = Boolean.FALSE;

	@Column(name = "status", nullable = true)
	private Boolean status = Boolean.TRUE;

	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;

	// ---------------RELATIONSHIP with CATEGORY-------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Category categories1;

	// --------------RELATIONSHIP with PRODUCTIMAGES---
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "product", fetch = FetchType.EAGER)
	private List<ProductImage> productImages = new ArrayList<ProductImage>();

	// relationship with sale_order_product
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "saleOrders", fetch = FetchType.LAZY)
	private List<SaleOrderProduct> productsale = new ArrayList<SaleOrderProduct>();

	// sale
	public void addProductSale(SaleOrderProduct orderProduct) {
		orderProduct.setProduct(this);
		productsale.add(orderProduct);
	}

	public void deleteProductSale(SaleOrderProduct orderProduct) {
		orderProduct.setProduct(null);
		productsale.remove(orderProduct);
	}

	// img
	public void addProductImages(ProductImage _productImages) {
		_productImages.setProduct(this);
		productImages.add(_productImages);
	}

	public void deleteProductImages(ProductImage _productImages) {
		_productImages.setProduct(null);
		productImages.remove(_productImages);
	}

	// ----end-----

	public String getAvatar() {
		return avatar;
	}

	public List<ProductImage> getProductImages() {
		return productImages;
	}

	public void setProductImages(List<ProductImage> productImages) {
		this.productImages = productImages;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Category getCategories1() {
		return categories1;
	}

	public void setCategories1(Category categories1) {
		this.categories1 = categories1;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getPrice_sale() {
		return price_sale;
	}

	public void setPrice_sale(BigDecimal price_sale) {
		this.price_sale = price_sale;
	}

	public String getShort_description() {
		return short_description;
	}

	public void setShort_description(String short_description) {
		this.short_description = short_description;
	}

	public String getDetail_description() {
		return detail_description;
	}

	public void setDetail_description(String detail_description) {
		this.detail_description = detail_description;
	}

	public Boolean getHot() {
		return hot;
	}

	public void setHot(Boolean hot) {
		this.hot = hot;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

}

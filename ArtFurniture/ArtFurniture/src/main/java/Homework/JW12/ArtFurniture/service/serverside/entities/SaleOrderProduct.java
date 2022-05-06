package Homework.JW12.ArtFurniture.service.serverside.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(name = "tbl_saleorder_products")
public class SaleOrderProduct extends BaseEntity {
	
//	@Column(name = "product_id", nullable = false)
//	private int productID;
	
	@Column(name = "quality", nullable = false)
	private int quality;
	
	
	//------------RELATIONSHIP with salseOrderS-----------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "saleorder_id")
	private SaleOrder saleOrders;

	//-------------end---
	
	//RELATIONSHIP WITH PRODUCT
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private Product product;
	
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public SaleOrder getSaleOrders() {
		return saleOrders;
	}

	public void setSaleOrders(SaleOrder saleOrders) {
		this.saleOrders = saleOrders;
	}

//	public int getProductID() {
//		return productID;
//	}
//
//	public void setProductID(int productID) {
//		this.productID = productID;
//	}

	public int getQuality() {
		return quality;
	}

	public void setQuality(int quality) {
		this.quality = quality;
	}
}

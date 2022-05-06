package Homework.JW12.ArtFurniture.service.serverside.entities;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_saleorder")
public class SaleOrder extends BaseEntity {

	@Column(name = "code", length = 45, nullable = false)
	private String code;

	@Column(name = "user_id", nullable = true)
	private int userId;

	@Column(name = "total", precision = 13, scale = 2, nullable = true)
	private BigDecimal total;

	@Column(name = "total_price", precision = 13, scale = 1, nullable = true)
	private BigDecimal total_price;
	
	@Column(name = "customer_name", length = 100, nullable = true)
	private String customerName;

	@Column(name = "customer_address", length = 100, nullable = true)
	private String customerAddress;

	@Column(name = "customer_phone", length = 100, nullable = true)
	private String customerPhone;

	@Column(name = "customer_email", length = 100, nullable = true)
	private String customerEmail;

	@Column(name = "seo", length = 200, nullable = true)
	private String seo;

	
	// -------------------RELATIONSHIP with saleorderproduct-----------------
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "saleOrders", fetch = FetchType.EAGER)
	private List<SaleOrderProduct> Products = new ArrayList<SaleOrderProduct>();

	public void addSaleOrderProduct(SaleOrderProduct saleOrderProducts) {
		Products.add(saleOrderProducts);
		saleOrderProducts.setSaleOrders(this);
	}

	public List<SaleOrderProduct> getProducts() {
		return Products;
	}

	public void setProducts(List<SaleOrderProduct> products) {
		Products = products;
	}

	public void delSaleOrderProduct(SaleOrderProduct saleOrderProducts) {
		Products.remove(saleOrderProducts);
		saleOrderProducts.setSaleOrders(null);
	}

	// -----------------------end-------------------------
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public BigDecimal getTotal_price() {
		return total_price;
	}

	public void setTotal_price(BigDecimal total_price) {
		this.total_price = total_price;
	}
	
}

package Homework.JW12.ArtFurniture.service.serverside.entities;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_category")
public class Category extends BaseEntity {

	// ---------declare colum--------
	@Column(name = "name", length = 100, nullable = false)
	private String nameCategory;

	@Column(name = "description", length = 100, nullable = false)
	private String description;

	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;

	// ----------------------RELATIONSHIP with product--------------

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "categories1", fetch = FetchType.EAGER)

	private Set<Product> products = new HashSet<Product>();

	// when define onetomany alaway define 2 method manage list

	public void addProduct(Product product) {
		products.add(product);
		product.setCategories1(this);
	}

	public void deleteProduct(Product product) {
		products.remove(product);
		product.setCategories1(null);
	}

	// ----------------RELATIONSHIP with itself----------------

	// way 1
//	@OneToMany(fetch = FetchType.EAGER) // because 1 category's child have a little caterory
//	@JoinColumn(name = "parent_id")

	// way 2
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parent_id")
	private Category parent;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "parent")
	private Set<Category> childCategory = new HashSet<Category>();

	//

	public Set<Product> getProducts() {
		return products;
	}

	public Set<Category> getChildCategory() {
		return childCategory;
	}

	public void setChildCategory(Set<Category> childCategory) {
		this.childCategory = childCategory;
	}

	public Category getParent() {
		return parent;
	}

	public void setParent(Category parent) {
		this.parent = parent;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	public String getName() {
		return nameCategory;
	}

	public void setName(String name) {
		this.nameCategory = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public String getNameCategory() {
		return nameCategory;
	}

	public void setNameCategory(String nameCategory) {
		this.nameCategory = nameCategory;
	}
}

package Homework.JW12.ArtFurniture.service.serverside.dto;

public class ProductModel {
	private int id;
	private String title;
	private int price;
	private int priceSale;
	private String shortDescription;
	private String detailDescription;
//	private Category categories;
	private boolean hot;
	private String seo;
	

//	public Category getCategories() {
//		return categories;
//	}
//
//	public void setCategories(Category categories) {
//		this.categories = categories;
//	}

	public int getId() {
		return id;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public boolean isHot() {
		return hot;
	}

	public void setHot(boolean hot) {
		this.hot = hot;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPriceSale() {
		return priceSale;
	}

	public void setPriceSale(int priceSale) {
		this.priceSale = priceSale;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getDetailDescription() {
		return detailDescription;
	}

	public void setDetailDescription(String detailDescription) {
		this.detailDescription = detailDescription;
	}

}

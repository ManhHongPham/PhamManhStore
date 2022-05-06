package Homework.JW12.ArtFurniture.service.serverside.dto;

public class ProductSearchModel {
	private int categoryId;

	private String categorySeo;

	private String searchText;
	
	private String productSeo;

	public String getProductSeo() {
		return productSeo;
	}

	public void setProductSeo(String productSeo) {
		this.productSeo = productSeo;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategorySeo() {
		return categorySeo;
	}

	public void setCategorySeo(String categorySeo) {
		this.categorySeo = categorySeo;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
}

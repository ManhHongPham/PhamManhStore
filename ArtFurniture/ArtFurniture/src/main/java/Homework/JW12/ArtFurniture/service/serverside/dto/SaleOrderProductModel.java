package Homework.JW12.ArtFurniture.service.serverside.dto;

public class SaleOrderProductModel {
	private int id;
	private int saleOrderID;
	private int productID;
	private int quality;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSaleOrderID() {
		return saleOrderID;
	}

	public void setSaleOrderID(int saleOrderID) {
		this.saleOrderID = saleOrderID;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public int getQuality() {
		return quality;
	}

	public void setQuality(int quality) {
		this.quality = quality;
	}

}

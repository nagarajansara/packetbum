package com.truck.domain;

public class ProductSearch {
	private String productName;
	private int categoryId;
	private int id;
	private String quality;
	private boolean certified;
	private float minPrice;
	private float maxPrice;
	private int sellerId;
	private int quantity;

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getQuality() {
		return quality;
	}

	public void setQuality(String quality) {
		this.quality = quality;
	}

	public float getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(float minPrice) {
		this.minPrice = minPrice;
	}

	public float getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(float maxPrice) {
		this.maxPrice = maxPrice;
	}

	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}

	public boolean isCertified() {
		return certified;
	}

	public void setCertified(boolean certified) {
		this.certified = certified;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ProductSearch [productName=");
		builder.append(productName);
		builder.append(", categoryId=");
		builder.append(categoryId);
		builder.append(", id=");
		builder.append(id);
		builder.append(", quality=");
		builder.append(quality);
		builder.append(", certified=");
		builder.append(certified);
		builder.append(", minPrice=");
		builder.append(minPrice);
		builder.append(", maxPrice=");
		builder.append(maxPrice);
		builder.append(", sellerId=");
		builder.append(sellerId);
		builder.append(", quantity=");
		builder.append(quantity);
		builder.append("]");
		return builder.toString();
	}

}

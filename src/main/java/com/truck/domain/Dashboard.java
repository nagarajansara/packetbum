package com.truck.domain;

public class Dashboard {

	private String product;
	private int availableQty;
	private float sellerMinPrice;
	private float sellerMaxPrice;
	private float buyerMinPrice;
	private float buyerMaxPrice;
	private int buyerQty;

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public int getAvailableQty() {
		return availableQty;
	}

	public void setAvailableQty(int availableQty) {
		this.availableQty = availableQty;
	}

	public float getSellerMinPrice() {
		return sellerMinPrice;
	}

	public void setSellerMinPrice(float sellerMinPrice) {
		this.sellerMinPrice = sellerMinPrice;
	}

	public float getSellerMaxPrice() {
		return sellerMaxPrice;
	}

	public void setSellerMaxPrice(float sellerMaxPrice) {
		this.sellerMaxPrice = sellerMaxPrice;
	}

	public float getBuyerMinPrice() {
		return buyerMinPrice;
	}

	public void setBuyerMinPrice(float buyerMinPrice) {
		this.buyerMinPrice = buyerMinPrice;
	}

	public float getBuyerMaxPrice() {
		return buyerMaxPrice;
	}

	public void setBuyerMaxPrice(float buyerMaxPrice) {
		this.buyerMaxPrice = buyerMaxPrice;
	}

	public int getBuyerQty() {
		return buyerQty;
	}

	public void setBuyerQty(int buyerQty) {
		this.buyerQty = buyerQty;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Dashboard [product=");
		builder.append(product);
		builder.append(", availableQty=");
		builder.append(availableQty);
		builder.append(", sellerMinPrice=");
		builder.append(sellerMinPrice);
		builder.append(", sellerMaxPrice=");
		builder.append(sellerMaxPrice);
		builder.append(", buyerMinPrice=");
		builder.append(buyerMinPrice);
		builder.append(", buyerMaxPrice=");
		builder.append(buyerMaxPrice);
		builder.append(", buyerQty=");
		builder.append(buyerQty);
		builder.append("]");
		return builder.toString();
	}

}

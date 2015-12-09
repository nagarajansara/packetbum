package com.truck.domain;

import java.util.Date;

public class Product {
	private int productId;
	private String product;
	private int saleId;
	private String category;
	private float quantity;
	private String unit;
	private int unitId;
	private float unitprice;
	private String seller;
	private boolean certified;
	private String quality;
	private Date updatedTs;
	private int subcategory;
	
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public float getQuantity() {
		return quantity;
	}

	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public float getUnitprice() {
		return unitprice;
	}

	public void setUnitprice(float unitprice) {
		this.unitprice = unitprice;
	}

	public Date getUpdatedTs() {
		return updatedTs;
	}

	public void setUpdatedTs(Date updatedTs) {
		this.updatedTs = updatedTs;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public boolean isCertified() {
		return certified;
	}

	public void setCertified(boolean certified) {
		this.certified = certified;
	}

	public String getQuality() {
		return quality;
	}

	public void setQuality(String quality) {
		this.quality = quality;
	}

	public int getSubcategory() {
		return subcategory;
	}

	public void setSubcategory(int subcategory) {
		this.subcategory = subcategory;
	}

	public int getSaleId() {
		return saleId;
	}

	public void setSaleId(int saleId) {
		this.saleId = saleId;
	}

	public int getUnitId() {
		return unitId;
	}

	public void setUnitId(int unitId) {
		this.unitId = unitId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Product [productId=");
		builder.append(productId);
		builder.append(", product=");
		builder.append(product);
		builder.append(", saleId=");
		builder.append(saleId);
		builder.append(", category=");
		builder.append(category);
		builder.append(", quantity=");
		builder.append(quantity);
		builder.append(", unit=");
		builder.append(unit);
		builder.append(", unitId=");
		builder.append(unitId);
		builder.append(", unitprice=");
		builder.append(unitprice);
		builder.append(", seller=");
		builder.append(seller);
		builder.append(", certified=");
		builder.append(certified);
		builder.append(", quality=");
		builder.append(quality);
		builder.append(", updatedTs=");
		builder.append(updatedTs);
		builder.append(", subcategory=");
		builder.append(subcategory);
		builder.append("]");
		return builder.toString();
	}

}

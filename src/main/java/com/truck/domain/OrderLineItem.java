package com.truck.domain;

import java.util.Date;

public class OrderLineItem {
	private String orderId;
	private int customerId;
	private String buyerName;
	private int productId;
	private int orderQuantity; // OrderQuantity
	private float orderPrice;
	private float finalPrice;
	private int finalQty;
	private String status;
	private Date createTimestamp;
	private Date updatedTimestamp;

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreateTimestamp() {
		return createTimestamp;
	}

	public void setCreateTimestamp(Date createTimestamp) {
		this.createTimestamp = createTimestamp;
	}

	public Date getUpdatedTimestamp() {
		return updatedTimestamp;
	}

	public void setUpdatedTimestamp(Date updatedTimestamp) {
		this.updatedTimestamp = updatedTimestamp;
	}

	public float getFinalPrice() {
		return finalPrice;
	}

	public void setFinalPrice(float finalPrice) {
		this.finalPrice = finalPrice;
	}

	public float getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(float orderPrice) {
		this.orderPrice = orderPrice;
	}

	public int getFinalQty() {
		return finalQty;
	}

	public void setFinalQty(int finalQty) {
		this.finalQty = finalQty;
	}


	public int getOrderQuantity() {
		return orderQuantity;
	}

	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OrderLineItem [orderId=");
		builder.append(orderId);
		builder.append(", customerId=");
		builder.append(customerId);
		builder.append(", buyerName=");
		builder.append(buyerName);
		builder.append(", productId=");
		builder.append(productId);
		builder.append(", orderQuantity=");
		builder.append(orderQuantity);
		builder.append(", orderPrice=");
		builder.append(orderPrice);
		builder.append(", finalPrice=");
		builder.append(finalPrice);
		builder.append(", finalQty=");
		builder.append(finalQty);
		builder.append(", status=");
		builder.append(status);
		builder.append(", createTimestamp=");
		builder.append(createTimestamp);
		builder.append(", updatedTimestamp=");
		builder.append(updatedTimestamp);
		builder.append("]");
		return builder.toString();
	}
}

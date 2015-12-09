package com.truck.domain;

public class OrderDetail {
	private OrderLineItem order;
	private Product product;

	public OrderDetail(OrderLineItem order, Product product) {
		super();
		this.order = order;
		this.product = product;
	}
	
	public OrderDetail() {
	}

	public OrderLineItem getOrder() {
		return order;
	}

	public void setOrder(OrderLineItem order) {
		this.order = order;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OrderDetail [order=");
		builder.append(order);
		builder.append(", product=");
		builder.append(product);
		builder.append("]");
		return builder.toString();
	}

}

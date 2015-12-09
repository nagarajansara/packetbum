package com.truck.mapper;



public class OrderDetailMapper  {

/*	@Override
	public OrderDetail mapRow(ResultSet rs, int rowNum) throws SQLException {

		OrderLineItem order = new OrderLineItem();
		order.setOrderId(rs.getString("orderId"));
		order.setCustomerId(rs.getInt("customerId"));
		order.setProductId(rs.getInt("productId"));
		order.setOrderQuantity(rs.getInt("orderqty"));
		order.setOrderPrice(rs.getFloat("orderprice"));
		order.setFinalPrice(rs.getFloat("finalprice"));
		order.setStatus(rs.getString("status"));
		if (rs.getTimestamp("createts") != null) {
			order.setCreateTimestamp(new Date(rs.getTimestamp("createts").getTime()));
		}
		if (rs.getTimestamp("updatets") != null) {
			order.setUpdatedTimestamp(new Date(rs.getTimestamp("updatets").getTime()));
		}
		order.setBuyerName(rs.getString("buyer"));
		Product product = new Product();
		product.setProduct(rs.getString("product"));

		return new OrderDetail(order, product);
	}*/

}

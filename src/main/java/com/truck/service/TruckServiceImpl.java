package com.truck.service;

import java.util.List;

import javax.ws.rs.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.truck.dao.ProductDAO;
import com.truck.dao.WebDAO;
import com.truck.domain.Category;
import com.truck.domain.Countries;
import com.truck.domain.Items;
import com.truck.domain.Starrating;
import com.truck.domain.Subcategory;

@Transactional(readOnly = true)
public class TruckServiceImpl implements TruckService, TruckRestService {
	@Autowired
	private WebDAO webdao;

	@Autowired
	private ProductDAO prodao;

	@Autowired
	private WebDAO admindao;

	@Override
	public List<Countries> retrieveCountries() {
		// TODO Auto-generated method stub
		return webdao.retrieveCountries();
	}

	@Override
	public List<Items> retrieveItems() {
		// TODO Auto-generated method stub
		// return null;

		return webdao.retriveItems(0, 1);
	}

	@Override
	public List<Category> retrieveCategory() {
		// TODO Auto-generated method stub
		return webdao.retriveCategory();
	}

	@Override
	public List<Subcategory> retrieveSubCategory(int id) {
		// TODO Auto-generated method stub
		return webdao.retriveSubCategoryByCategoryID(id);
	}

	@Override
	public void updateReadMsg(int id) {
		// TODO Auto-generated method stub
		webdao.updateMessageReadByID(id);

		// System.out.println();

	}

	@Override
	public void updateFeedback(int quoteid, int numstar, String comments) {
		// TODO Auto-generated method stub
		System.out.println(numstar + quoteid + comments);
		Starrating star = new Starrating();
		star.setQuoteid(quoteid);
		star.setNumstar(numstar);
		star.setComments(comments);

		webdao.addStarrating(star);

	}

	@Override
	public void updateItemRemoved(int id) {
		prodao.deleteItem(id);

	}

	@Override
	public void updateItemUpgrade(int id) {
		// TODO Auto-generated method stub
		prodao.UpGradeItem(id);

	}

	@Override
	public void updateItemDetails(int id, String delAddress, String colAddress) {
		prodao.updateItemDetails(colAddress, delAddress, id);
	}

	public void updateItemAddress(int id, String colPostalCode,
			String delPostalCode) {
		prodao.updateItemAddress(id, colPostalCode, delPostalCode);
	}

	public List<Items> getItemDetailsBasedId(int id) {
		return prodao.getItemDetailsBasedId(id);
	}

}

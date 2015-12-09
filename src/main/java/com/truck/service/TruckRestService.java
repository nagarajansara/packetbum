package com.truck.service;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.truck.domain.Category;
import com.truck.domain.Countries;
import com.truck.domain.Items;
import com.truck.domain.Subcategory;

@Consumes({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
@Produces({ MediaType.APPLICATION_JSON })
public interface TruckRestService {

	@GET
	@Path("retrieveCountries")
	List<Countries> retrieveCountries();
	
	@GET
	@Path("retrieveItems")
	List<Items> retrieveItems();
	
	
	
	@GET
	@Path("retrieveCategory")
	@Consumes("multipart/mixed")
	List<Category> retrieveCategory();
	
	
	@GET
	@Path("retrieveSubCategory/{id}")
	List<Subcategory> retrieveSubCategory(@PathParam("id") int id);
	
	@GET
	@Path("updateReadMsg/{id}")
	void updateReadMsg(@PathParam("id") int id);
	
	@GET
	@Path("updateFeedback/{quoteid}/{numstar}/{comments}")
	void updateFeedback(@PathParam("quoteid") int quoteid,@PathParam("numstar") int numstar,@PathParam("comments") String comments);
	
	
	@GET
	@Path("updateItemRemoved/{id}")
	void updateItemRemoved(@PathParam("id") int id);
	
	@GET
	@Path("updateItemUpgrade/{id}")
	void updateItemUpgrade(@PathParam("id") int id);
	
	@GET
	@Path("updateItemDetails/{id}/{delAddress}/{colAddress}")
	void updateItemDetails(@PathParam("id") int id, @PathParam("delAddress") String delAddress, @PathParam("colAddress") String colAddress);
	
	@GET
	@Path("updateItemAddress/{id}/{colPostalCode}/{delPostalCode}")
	void updateItemAddress(@PathParam("id") int id, @PathParam("colPostalCode") String colPostalCode, @PathParam("delPostalCode") String delPostalCode);
	
	@GET
	@Path("getItemDetailsBasedId/{id}")
	List<Items> getItemDetailsBasedId(@PathParam("id") int id);
	
	
}

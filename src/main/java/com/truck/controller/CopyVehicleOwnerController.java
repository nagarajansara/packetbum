package com.truck.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.truck.dao.ProductDAO;
import com.truck.dao.VehicleDAO;
import com.truck.dao.WebDAO;
import com.truck.domain.Items;
import com.truck.domain.Messages;
import com.truck.domain.Quote;

public class CopyVehicleOwnerController
{

	private static final Logger LOGGER = Logger
			.getLogger(VehicleOwnerController.class);

	@Autowired
	private WebDAO webdao;

	@Autowired
	private ProductDAO productdao;

	@Autowired
	private VehicleDAO vehicledao;

	private final SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
	Date date = new Date();

	@RequestMapping(value = { "/vcl/index" }, method = RequestMethod.GET)
	public ModelAndView vclindexpage(@ModelAttribute("model") ModelMap model,
			Integer login_error, Integer login, HttpServletRequest request)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		responseMap.put("retrieveItems", webdao.retriveItems());
		// LOGGER.info("datas"+dao.retriveItems());
		LOGGER.info("isAthenticate -:"
				+ SecurityContextHolder.getContext().getAuthentication());
		LOGGER.info("isAthenticat id-:"
				+ SecurityContextHolder.getContext().getAuthentication()
						.getName());
		long userid = productdao.checkUserExits(SecurityContextHolder
				.getContext().getAuthentication().getName());

		responseMap.put("username", (int) userid);

		request.getSession().setAttribute(
				"username",
				SecurityContextHolder.getContext().getAuthentication()
						.getName());

		responseMap.put("retrieveQuoteIsAccept",
				vehicledao.retriveAcceptQuoteByUserID((int) userid));

		LOGGER.info("retrieveQuoteIsAccept -:"
				+ vehicledao.retriveAcceptQuoteByUserID((int) userid));

		responseMap.put("retrieveMessages",
				webdao.retriveMessageByVCLID((int) userid));
		return new ModelAndView("/vcl/index", "model", responseMap);

	}

	@RequestMapping(value = { "/vcl/vclitemdetail" }, method = RequestMethod.GET)
	public ModelAndView vclitemdetailpage(
			@ModelAttribute("model") ModelMap model, Integer id)
	{

		Map<String, Object> responseMap = new HashMap<String, Object>();

		LOGGER.info("id:" + id);
		responseMap.put("retrieveItem", webdao.getItem(id));
		LOGGER.info("item:" + webdao.getItem(id));

		responseMap.put("retrieveQuote", vehicledao.retriveQuoteByItemID(id));

		LOGGER.info("retrieveQuote:" + vehicledao.retriveQuoteByItemID(id));

		// responseMap.put("lowestPrice",vehicledao.getQuoteLowestPriceByItemID(id));

		// responseMap.put("lowestPrice","dsfsd");

		// Items ite=(Items) dao.getItem(id);
		int ItemID = 0;
		int ItemTypeID = 0;

		for (Items item : webdao.getItem(id))
		{
			// System.out.println("item id: "+item.getItemtypeid());
			ItemID = item.getId();
			ItemTypeID = item.getItemtypeid();
		}

		System.out.println("Item Value:" + ItemTypeID);

		if (ItemTypeID == 1)
		{
			responseMap.put("retrieveItemsDetail",
					webdao.getFurnitureByItemID(ItemID));
			responseMap.put("itemtype", "furniture");

		}
		else if (ItemTypeID == 2)
		{
			responseMap.put("retrieveItemsDetail",
					webdao.getGeneralByItemID(ItemID));
			responseMap.put("itemtype", "general");

		}
		else if (ItemTypeID == 3)
		{
			responseMap.put("retrieveItemsDetail",
					webdao.getCarByItemID(ItemID));
			responseMap.put("itemtype", "car");
			LOGGER.info("item type car");
		}
		responseMap.put("retrieveItemsImages",
				webdao.retriveItemImagesByItemID(ItemID));

		responseMap.put(
				"username",
				webdao.getShortnameByMailID(SecurityContextHolder.getContext()
						.getAuthentication().getName()));

		responseMap.put("itemid", id);
		long userid = productdao.checkUserExits(SecurityContextHolder
				.getContext().getAuthentication().getName());
		responseMap.put("userid", (int) userid);

		responseMap.put("retrieveMessages", webdao.retriveMessageByItemID(id));

		return new ModelAndView("vcl/vclitemdetail", "model", responseMap);
	}

	@RequestMapping(value = { "/vcl/vclitemdetail" }, method = RequestMethod.POST)
	public ModelAndView addQuotepage(@ModelAttribute("quoteform") Quote quote)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		if (quote.getColfromdate() == "")
		{
			quote.setColfromdate("00/00/000");
		}
		if (quote.getColtodate() == "")
		{
			quote.setColtodate("00/00/000");
		}

		if (quote.getDelfromdate() == "")
		{
			quote.setDelfromdate("00/00/000");
		}
		if (quote.getDeltodate() == "")
		{
			quote.setDeltodate("00/00/000");
		}

		long val = vehicledao.addQuote(quote);

		if (val > 0)
		{
			System.out.println("add successfully");

		}
		else
		{
			System.out.println("add faild...");
		}

		return new ModelAndView("vcl/vclitemdetail", "model", responseMap);
	}

	@RequestMapping(value = { "/vcl/myaccount" }, method = RequestMethod.GET)
	public ModelAndView vclmyaccountpage(@ModelAttribute("model") ModelMap model)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		// vehicledao

		int getUserid;
		responseMap.put("username", SecurityContextHolder.getContext()
				.getAuthentication().getName());
		getUserid = productdao.checkUserExits(SecurityContextHolder
				.getContext().getAuthentication().getName());

		System.out.print("getUserid" + getUserid);

		responseMap.put("retrieveQuote",
				vehicledao.retriveQuoteByVCLUserID(getUserid));

		return new ModelAndView("vcl/myaccount", "model", responseMap);
	}

	/*
	 * @RequestMapping(value = { "/vcl/myaccount" }, method =
	 * RequestMethod.POST) public ModelAndView
	 * vcladdmyaccountpage(@ModelAttribute("model") ModelMap model,Integer
	 * quoteid) { Map<String, Object> responseMap = new HashMap<String,
	 * Object>();
	 * 
	 * int getUserid; try{
	 * getUserid=productdao.checkUserExits(SecurityContextHolder
	 * .getContext().getAuthentication().getName());
	 * }catch(EmptyResultDataAccessException e){
	 * LOGGER.info("empty:"+e.getMessage()); getUserid=0; }
	 * System.out.print("quoteid"+quoteid);
	 * productdao.updateQuoteIsAccept(quoteid,getUserid);
	 * responseMap.put("retrieveQuote"
	 * ,vehicledao.retriveQuoteByUserID(getUserid));
	 * 
	 * return new ModelAndView("vcl/myaccount", "model", responseMap); }
	 */

	@RequestMapping(value = { "/vcl/reply" }, method = RequestMethod.GET)
	public ModelAndView message(@ModelAttribute("model") ModelMap model,
			String messageid, String messageuid)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		responseMap.put("retrieveMessages",
				webdao.getMessageByMessageID(Integer.parseInt(messageuid)));

		responseMap.put("messageid", messageid);
		responseMap.put("messageuid", messageuid);

		return new ModelAndView("vcl/reply", "model", responseMap);

	}

	@RequestMapping(value = { "/vcl/reply" }, method = RequestMethod.POST)
	public ModelAndView messageReply(
			@ModelAttribute("messageReplyForm") Messages messages,
			@ModelAttribute("model") ModelMap model)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		System.out.println("message" + messages.getMessage());
		responseMap.put("retrieveMessages", webdao
				.getMessageByMessageID(Integer.parseInt(messages
						.getMessageuid())));
		int getUserid;
		getUserid = productdao.checkUserExits(SecurityContextHolder
				.getContext().getAuthentication().getName());
		messages.setUserid(String.valueOf(getUserid));
		webdao.addMessageDetails(messages);
		responseMap.put("messageid", messages.getMessageid());
		responseMap.put("messageuid", messages.getMessageuid());

		return new ModelAndView("vcl/reply", "model", responseMap);
	}

	@RequestMapping(value = { "/vcl/askquestion" }, method = RequestMethod.GET)
	public ModelAndView askquestion(@ModelAttribute("model") ModelMap model,
			String messageid, String messageuid)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		responseMap.put("retrieveMessages",
				webdao.getMessageByMessageID(Integer.parseInt(messageuid)));

		responseMap.put("messageid", messageid);
		responseMap.put("messageuid", messageuid);
		responseMap.put(
				"username",
				webdao.getShortnameByMailID(SecurityContextHolder.getContext()
						.getAuthentication().getName()));

		return new ModelAndView("vcl/askquestion", "model", responseMap);

	}

}
